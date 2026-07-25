# NectFlow

NectFlow is a cross-platform mobile application developed using Flutter and Go, based on the **DormConnect** concept of creating a connected and collaborative living environment for dormitories and apartment communities.

The application provides a centralized platform that enables residents and administrators to communicate efficiently through real-time messaging, announcements, maintenance requests, and other community services. By integrating RESTful APIs with WebSocket communication, NectFlow aims to enhance everyday residential management and improve the overall user experience.

---

## Features

- User authentication with JWT
- Resident profile management
- Real-time messaging
- Community announcements
- Maintenance and issue reporting
- REST API integration
- WebSocket communication
- Cross-platform support

---

## Technology Stack

### Frontend

- Flutter
- Dart

### Backend

- Go (Golang)
- REST API
- JWT Authentication
- WebSocket

### Development Tools

- Git
- GitHub
- Visual Studio Code

---

## Project Structure

```text
NectFlow_MiniProject
├── lib/                Flutter application source code
├── assets/             Static assets
├── go-jwt-api/         Backend REST API
├── socket_server/      WebSocket server
├── android/
├── ios/
├── web/
├── windows/
├── linux/
└── macos/
```

---

## Getting Started

### Prerequisites

- Flutter SDK
- Go SDK
- Git

### Installation

Clone the repository.

```bash
git clone https://github.com/fenfics/NectFlow_MiniProject.git
cd NectFlow_MiniProject
```

Install Flutter dependencies.

```bash
flutter pub get
```

Run the application.

```bash
flutter run
```

Start the backend API.

```bash
cd go-jwt-api
go mod tidy
go run main.go
```

Start the WebSocket server.

```bash
cd socket_server
go mod tidy
go run main.go
```

---

## Project Concept

NectFlow is inspired by the DormConnect concept, which focuses on strengthening communication between residents and administrators while supporting a more connected, organized, and engaging residential community.

---

## License

This project was developed for educational purposes.
