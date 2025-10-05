package main

import (
	"fmt"
	"net/http"
	"time"

	"github.com/gin-contrib/cors"
	"golang.org/x/crypto/bcrypt"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"

	"github.com/gin-gonic/gin"
)

type Register struct {
	UserID      string    `db:"UserID" json:"user_id"`
	RoleID      string    `db:"RoleID" json:"role_id"`
	DisplayName string    `db:"DisplayName" json:"display_name" binding:"required"`
	FirstName   string    `db:"FirstName" json:"first_name" binding:"required"`
	LastName    string    `db:"LastName" json:"last_name" binding:"required"`
	Email       string    `db:"Email" json:"email" binding:"required"`
	PhoneNumber string    `db:"PhoneNumber" json:"phone_number"`
	Password    string    `db:"Password" json:"password" binding:"required"`
	CreatedDate time.Time `db:"CreatedDate" json:"created_date"`
	ProfilePath string    `db:"ProfilePath" json:"profile_path"`
}

type User struct {
	gorm.Model
	UserID      string
	RoleID      string
	DisplayName string
	FirstName   string
	LastName    string
	Email       string
	PhoneNumber string
	Password    string
	ProfilePath string
	CreatedDate time.Time
}

func getRoleID(roleName string) string {
	switch roleName {
	case "Admin":
		return "RO0001"
	case "Resident":
		return "RO0002"
	case "Manager":
		return "RO0003"
	default:
		return "RO0002"
	}
}

var userCount = 10

func generateUserID() string {
	userCount++
	return fmt.Sprintf("US%04d", userCount)
}

func main() {

	dsn := "root:Fentug114@@tcp(127.0.0.1:3306)/my_nectflow_data?charset=utf8mb4&parseTime=True&loc=Local"
	db, err := gorm.Open(mysql.Open(dsn), &gorm.Config{})
	if err != nil {
		fmt.Println("DB connection error:", err)
		return
	}
	fmt.Println("DB connected successfully!")

	db.AutoMigrate(&User{})

	gin.SetMode(gin.ReleaseMode)
	r := gin.Default()

	config := cors.DefaultConfig()
	config.AllowOrigins = []string{"http://google.com", "http://localhost:3000"}
	config.AllowHeaders = []string{"Origin", "Content-Type", "Authorization"}
	config.AllowMethods = []string{"GET", "POST"}
	r.Use(cors.New(config))

	r.POST("/register", func(c *gin.Context) {
		var input Register
		if err := c.ShouldBindJSON(&input); err != nil {
			c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
			return
		}

		input.UserID = generateUserID()
		input.RoleID = getRoleID(input.DisplayName)
		input.CreatedDate = time.Now()

		hashedPassword, err := bcrypt.GenerateFromPassword([]byte(input.Password), 10)
		if err != nil {
			c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to encrypt password"})
			return
		}

		user := User{
			UserID:      input.UserID,
			RoleID:      input.RoleID,
			DisplayName: input.DisplayName,
			FirstName:   input.FirstName,
			LastName:    input.LastName,
			Email:       input.Email,
			PhoneNumber: input.PhoneNumber,
			Password:    string(hashedPassword),
			CreatedDate: input.CreatedDate,
			ProfilePath: input.ProfilePath,
		}

		if result := db.Create(&user); result.Error != nil {
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
	})

	r.Run(":8080")
}
