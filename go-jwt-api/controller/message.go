package controller

import (
	"golang/nectflow-api/orm"
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
)

// ส่งข้อความ
func SendMessage(c *gin.Context) {
	var input struct {
		SenderID   string `json:"sender"`
		ReceiverID string `json:"receiver"`
		Message    string `json:"message"`
	}

	if err := c.ShouldBindJSON(&input); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	msg := orm.Message{
		SenderID:   input.SenderID,
		ReceiverID: input.ReceiverID,
		Message:    input.Message,
		CreatedAt:  time.Now(),
	}

	if err := orm.Db.Create(&msg).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, gin.H{"message": "Message sent"})
}

// ดึงข้อความทั้งหมดระหว่างผู้ใช้ 2 คน
func GetMessages(c *gin.Context) {
	user := c.Query("user")
	partner := c.Query("partner")

	var msgs []orm.Message
	if err := orm.Db.
		Where("(SenderID = ? AND ReceiverID = ?) OR (SenderID = ? AND ReceiverID = ?)", user, partner, partner, user).
		Order("CreatedAt asc").
		Find(&msgs).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, msgs)
}
