package controller

import (
	"golang/nectflow-api/orm"
	"net/http"
	"time"

	"github.com/gin-gonic/gin"
)

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

func GetMessages(c *gin.Context) {
	user := c.Query("user")
	partner := c.Query("partner")

	var msgs []orm.Message
	if err := orm.Db.
		Where("(sender = ? AND receiver = ?) OR (sender = ? AND receiver = ?)", user, partner, partner, user).
		Order("time asc").
		Find(&msgs).Error; err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": err.Error()})
		return
	}

	c.JSON(http.StatusOK, msgs)
}
