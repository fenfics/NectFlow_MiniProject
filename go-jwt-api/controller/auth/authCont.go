package auth

import (
	"fmt"
	"golang/nectflow-api/orm"
	"net/http"
	"strconv"
	"strings"
	"sync"
	"time"

	"github.com/gin-gonic/gin"
	"golang.org/x/crypto/bcrypt"
	"gorm.io/gorm"
)

var (
	userCount int64
	once      sync.Once
)

func initUserCount() {
	var lastUser orm.User
	if err := orm.Db.Order("UserID DESC").First(&lastUser).Error; err == nil {
		if numStr := strings.TrimPrefix(lastUser.UserID, "US"); numStr != "" {
			if num, err := strconv.ParseInt(numStr, 10, 64); err == nil {
				userCount = num
			}
		}
	}
}

func generateUserID() string {
	once.Do(initUserCount)
	userCount++
	return fmt.Sprintf("US%04d", userCount)
}

type RegisterBody struct {
	DisplayName string `json:"display_name" binding:"required"`
	FirstName   string `json:"first_name" binding:"required"`
	LastName    string `json:"last_name" binding:"required"`
	Email       string `json:"email" binding:"required,email"`
	PhoneNumber string `json:"phone_number"`
	Password    string `json:"password" binding:"required,min=6"`
	ProfilePath string `json:"profile_path"`
	RoleID      string `json:"role_id" binding:"required"`
}

type LoginBody struct {
	Email    string `json:"email" binding:"required,email"`
	Password string `json:"password" binding:"required,min=6"`
	RoleID   string `json:"role_id" binding:"required"`
}

func Register(c *gin.Context) {
	var input RegisterBody
	if err := c.ShouldBindJSON(&input); err != nil {
		fmt.Println("Binding error:", err)
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	if orm.Db == nil {
		fmt.Println("Database connection is nil")
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Database connection failed"})
		return
	}

	var existingUser orm.User
	err := orm.Db.Where("Email = ?", input.Email).Take(&existingUser).Error
	if err == nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Email already exists"})
		return
	}
	if err != nil && err != gorm.ErrRecordNotFound {
		fmt.Println("Database error:", err)
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	hashedPassword, err := bcrypt.GenerateFromPassword([]byte(input.Password), bcrypt.DefaultCost)
	if err != nil {
		fmt.Println("Hashing error:", err)
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to hash password"})
		return
	}

	user := orm.User{
		UserID:      generateUserID(),
		RoleID:      input.RoleID,
		DisplayName: input.DisplayName,
		FirstName:   input.FirstName,
		LastName:    input.LastName,
		Email:       input.Email,
		PhoneNumber: input.PhoneNumber,
		Password:    string(hashedPassword),
		CreatedDate: time.Now(),
		ProfilePath: input.ProfilePath,
	}

	if result := orm.Db.Create(&user); result.Error != nil {
		fmt.Println("Database create error:", result.Error)
		c.JSON(http.StatusInternalServerError, gin.H{"error": result.Error.Error()})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"message": "Registered successfully",
		"user": gin.H{
			"user_id":      user.UserID,
			"role_id":      user.RoleID,
			"display_name": user.DisplayName,
			"first_name":   user.FirstName,
			"last_name":    user.LastName,
			"email":        user.Email,
			"phone_number": user.PhoneNumber,
			"created_date": user.CreatedDate,
			"profile_path": user.ProfilePath,
		},
	})
}

func Login(c *gin.Context) {
	var input LoginBody
	if err := c.ShouldBindJSON(&input); err != nil {
		fmt.Println("Binding error:", err)
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	var user orm.User
	err := orm.Db.Where("Email = ?", input.Email).Take(&user).Error
	if err != nil {
		if err == gorm.ErrRecordNotFound {
			c.JSON(http.StatusUnauthorized, gin.H{"error": "Invalid email or password"})
			return
		}
		fmt.Println("Database error:", err)
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	err = bcrypt.CompareHashAndPassword([]byte(user.Password), []byte(input.Password))
	if err != nil {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Invalid email or password"})
		return
	}

	c.JSON(http.StatusOK, gin.H{
		"message": "Login successful",
		"user": gin.H{
			"user_id":      user.UserID,
			"role_id":      user.RoleID,
			"display_name": user.DisplayName,
			"first_name":   user.FirstName,
			"last_name":    user.LastName,
			"email":        user.Email,
			"phone_number": user.PhoneNumber,
			"profile_path": user.ProfilePath,
		},
	})
}
