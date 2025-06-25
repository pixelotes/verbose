# Verbose - Stage 1

**Verbose** is a lightweight, self-hosted chat UI that mimics the style of ChatGPT. It is built using **Flutter Web** for the frontend and **FastAPI** (Python) for the backend. In Stage 1, it provides the core infrastructure for sending a message from the user interface to the backend, and receiving a dummy response.

---

## 🚧 Project Structure and Components

```
verbose/
├── chat_backend/                     # FastAPI backend
│   ├── app/
│   │   ├── main.py                   # FastAPI app entrypoint
│   │   └── routes/chat.py            # Chat route logic
│   ├── Dockerfile
│   └── requirements.txt
│
├── chat_ui_flutter/                  # Flutter frontend
│   ├── lib/
│   │   ├── main.dart                 # App entrypoint and layout
│   │   ├── screens/chat_screen.dart  # Chat UI screen
│   │   ├── models/chat_message.dart  # Chat message data class
│   │   └── services/api_service.dart # Sends messages to backend
│   ├── web/
│   │   ├── index.html                # Web entrypoint
│   │   ├── manifest.json             # PWA metadata
│   │   └── icons/                    # App icons (Icon-192, Icon-512)
│   ├── pubspec.yaml                  # Flutter dependencies
│   └── Dockerfile                    # For building & serving via nginx
│
├── docker-compose.yml                # Launches frontend, backend, and Ollama (future)
└── README.md                         # This file
```

---

## 🧩 Components Overview

### 🔙 Backend - FastAPI

- **Language**: Python 3.11+
- **Purpose**: Accepts chat messages and returns dummy (or future LLM-based) responses.
- **Libraries Used**:
  - `fastapi`: API framework
  - `uvicorn[standard]`: ASGI server
  - `httpx`: For future async LLM calls
  - `pydantic`: Data validation and models
  - `python-dotenv`: Loads environment variables

**Current State**:

- `/chat` POST endpoint accepts a message and returns a hardcoded response: `{ "reply": "This is a dummy response." }`
- Ready to be extended with actual LLM integration (e.g., Ollama or OpenAI)

### 🌐 Frontend - Flutter Web

- **Language**: Dart 3+
- **Purpose**: Provides a user-friendly web UI to send messages and display responses
- **Libraries Used**:
  - `http`: For REST calls to backend
  - `flutter/material.dart`: UI components

**Current State**:

- Text input and send button implemented
- On send, calls backend `/chat`, receives dummy response, and displays it in the UI
- Fully responsive layout using Material Design

---

## 🔗 Frontend–Backend Interaction

1. User types a message and presses "Send"
2. Flutter frontend sends a POST request to `http://localhost:8000/chat` with JSON:
   ```json
   { "message": "Hello, backend!" }
   ```
3. Backend responds with a JSON object:
   ```json
   { "reply": "This is a dummy response." }
   ```
4. Flutter displays the reply in the chat window

---

## 📦 Dependencies

### Backend (chat\_backend/requirements.txt)

```
fastapi
uvicorn[standard]
httpx
python-dotenv
```

### Frontend (chat\_ui\_flutter/pubspec.yaml)

```yaml
dependencies:
  flutter:
    sdk: flutter
  http: ^0.13.5
```

---

## 🚀 Getting Started (Development)

### 1. Backend

```bash
cd chat_backend
python3 -m venv venv
source venv/bin/activate
pip install -r requirements.txt
uvicorn app.main:app --reload
```

Access at: [http://localhost:8000](http://localhost:8000)

### 2. Frontend

```bash
cd chat_ui_flutter
flutter pub get
flutter run -d chrome
```

Access at: [http://localhost\:xxxx](http://localhost\:xxxx) (will be printed by Flutter)

---

## 🐳 Running with Docker Compose

1. Make sure Docker is installed
2. From root folder:

```bash
docker-compose up --build
```

- Backend: [http://localhost:8000](http://localhost:8000)
- Frontend: [http://localhost:8080](http://localhost:8080)

---

## ✅ Next Goals (Stage 2+)

- Connect to real LLMs (Ollama / OpenAI)
- Stream responses (SSE)
- Add options screen for model and prompt configuration
- Chat history, Markdown rendering, themes

---

Made with 🧠 and 🐍 by [You] — Welcome to **Verbose**!

