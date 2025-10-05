package orm

import (
	"time"
)

type User struct {
	UserID      string    `gorm:"column:UserID;primaryKey"`
	RoleID      string    `gorm:"column:RoleID"`
	DisplayName string    `gorm:"column:DisplayName"`
	FirstName   string    `gorm:"column:FirstName"`
	LastName    string    `gorm:"column:LastName"`
	Email       string    `gorm:"column:Email;uniqueIndex"`
	PhoneNumber string    `gorm:"column:PhoneNumber"`
	Password    string    `gorm:"column:Password" json:"-"`
	ProfilePath string    `gorm:"column:ProfilePath"`
	CreatedDate time.Time `gorm:"column:CreatedDate"`
}

func (User) TableName() string {
	return "UserAccount"
}
