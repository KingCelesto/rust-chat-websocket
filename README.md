# Rust Chat WebSocket

A real-time chat application built with Rust, featuring a WebSocket-based backend and a modern web frontend.

## 🚀 Features

- **Real-time messaging** - Instant message delivery via WebSocket connections
- **User management** - Dynamic username changes and user list updates
- **Modern UI** - Clean, responsive interface built with Yew (Rust frontend framework)
- **System notifications** - Automatic notifications for user events (username changes, etc.)
- **Scalable architecture** - Modular design with separate backend, frontend, and common libraries

## 🏗️ Architecture

This project is organized as a Rust workspace with three main components:

### Backend (`backend/`)
- **Framework**: Rocket with WebSocket support
- **Features**: 
  - WebSocket connection management
  - Real-time message broadcasting
  - User session handling
  - System notifications

### Frontend (`frontend/`)
- **Framework**: Yew (Rust frontend framework)
- **Features**:
  - Real-time message display
  - User list management
  - Username change functionality
  - Responsive Bootstrap-based UI

### Common (`common/`)
- **Purpose**: Shared data structures and types
- **Features**:
  - WebSocket message definitions
  - Chat message structures
  - Serialization/deserialization types

## 📋 Prerequisites

- Rust 1.70+ (latest stable version recommended)
- Cargo (comes with Rust)
- Web browser with WebSocket support

## 🛠️ Installation & Setup

1. **Clone the repository**
   ```bash
   git clone https://github.com/philodi-dev/rust-chat-websocket
   cd rust-chat-websocket
   ```

2. **Build the project**
   ```bash
   cargo build
   ```

3. **Run the backend server**
   ```bash
   cargo run -p backend
   ```
   The server will start on `http://127.0.0.1:8000`

4. **Run the frontend** (in a separate terminal)
   ```bash
   cargo run -p frontend
   ```
   The frontend will be available at the URL shown in the terminal (typically `http://127.0.0.1:8000`)

## 🎯 Usage

1. **Connect to the chat** - Open your browser and navigate to the frontend URL
2. **Send messages** - Type your message in the input field and press Enter
3. **Change username** - Use the username field to set your display name
4. **View users** - See the current list of connected users in the sidebar

## 🔧 Development

### Project Structure
```
rust-chat/
├── backend/          # WebSocket server implementation
├── frontend/         # Yew-based web frontend
├── common/           # Shared types and structures
├── Cargo.toml        # Workspace configuration
└── README.md         # This file
```

### Key Dependencies

**Backend:**
- `rocket` - Web framework
- `rocket_ws` - WebSocket support
- `serde` - Serialization
- `chrono` - Date/time handling

**Frontend:**
- `yew` - Rust frontend framework
- `yew-hooks` - React-like hooks for Yew
- `web-sys` - Web API bindings

**Common:**
- `serde` - Serialization
- `chrono` - Date/time handling

### Building Individual Components

```bash
# Build backend only
cargo build -p backend

# Build frontend only
cargo build -p frontend

# Build common library only
cargo build -p common
```

### Running Tests

```bash
# Run all tests
cargo test

# Run tests for specific component
cargo test -p backend
cargo test -p frontend
cargo test -p common
```

## 🌟 Features in Detail

### Real-time Messaging
- Messages are instantly broadcast to all connected users
- System notifications for user events
- Persistent message history during session

### User Management
- Dynamic username changes
- Real-time user list updates
- Automatic user assignment on connection

### WebSocket Protocol
The application uses a custom WebSocket message protocol:

```rust
#[derive(Serialize, Deserialize)]
pub enum WebSocketMessageType {
    NewMessage,      // Chat message
    UsersList,       // Updated user list
    UsernameChange,  // Username change request
}
```

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👨‍💻 Author

**Philodi**
- Email: me@philodi.com
- Website: https://philodi.com

## 🙏 Acknowledgments

- Built with [Rocket](https://rocket.rs/) web framework
- Frontend powered by [Yew](https://yew.rs/) Rust framework
- Real-time communication via WebSocket protocol

---

**Note**: This is a demonstration project showcasing Rust's capabilities for building full-stack web applications with real-time features. 