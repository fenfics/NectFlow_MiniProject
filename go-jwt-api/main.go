package main

import (
	"fmt"
	MessageController "golang/nectflow-api/controller"
	AuthController "golang/nectflow-api/controller/auth"
	"golang/nectflow-api/orm"
	"time"

	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
)

func main() {
	orm.InitDB()

	gin.SetMode(gin.ReleaseMode)
	r := gin.Default()

	r.Use(cors.New(cors.Config{
		AllowOrigins:     []string{"*"},
		AllowMethods:     []string{"GET", "POST", "PUT", "DELETE", "OPTIONS"},
		AllowHeaders:     []string{"Origin", "Content-Type", "Authorization"},
		ExposeHeaders:    []string{"Content-Length"},
		AllowCredentials: true,
		MaxAge:           12 * time.Hour,
	}))

	r.POST("/register", AuthController.Register)
	r.POST("/login", AuthController.Login)
	r.POST("/send-message", MessageController.SendMessage)
	r.GET("/messages", MessageController.GetMessages)

	fmt.Println("Server running on :8080")
	r.Run(":8080")
}
