package orm

import "time"

type Message struct {
	ID         uint      `gorm:"primaryKey;column:id"`
	SenderID   string    `gorm:"column:sender"`
	ReceiverID string    `gorm:"column:receiver"`
	Message    string    `gorm:"column:message"`
	CreatedAt  time.Time `gorm:"column:time"`
}

func (Message) TableName() string {
	return "messages"
}
