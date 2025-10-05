package orm

import (
	"fmt"

	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

var Db *gorm.DB

func InitDB() {
	dsn := "root:Fentug114@@tcp(127.0.0.1:3306)/mY_nECTFLOW_DATA?charset=utf8mb4&parseTime=True&loc=Local"
	db, err := gorm.Open(mysql.Open(dsn), &gorm.Config{})
	if err != nil {
		panic("Failed to connect to database: " + err.Error())
	}
	Db = db
	fmt.Println("DB connected successfully!")
}
