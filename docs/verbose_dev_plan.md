# 💬 Verbose - Development Plan

## Elevator Pitch
**Verbose** is a modern, self-hosted AI chat interface designed to feel like ChatGPT — but running on your own hardware. Built with **Flutter Web** and **FastAPI**, it's a sleek, fast, and modular app you can pair with any OpenAI-compatible backend, like **Ollama** or **OpenRouter**. Verbose offers an intuitive, open, and customizable experience.

## Motivation
As a matter of fact it's mainly for learning, as I'm exploring the use of new libraries. I've also never used Flutter before and I wanted to try.

---

## Why These Technologies?

### Python (Backend)
- **FastAPI** is fast to write, async-native, and ideal for building REST APIs.
- The Python ecosystem (e.g. `httpx`, `pydantic`) makes LLM interaction smooth.
- Easy to integrate with Ollama, OpenAI, and custom endpoints.
- Enables flexible middleware, logging, and observability.

### Flutter (Frontend)
- **One codebase** → cleanly compiles to modern web.
- Beautiful, Material-based UI with native-feeling performance.
- Fast development cycle with hot reload.
- Scales well if we later want to build native apps for mobile or desktop.

---

## Development Timeline (which I'll probably miss)

| Phase | Duration     | Summary                                              |
|-------|--------------|------------------------------------------------------|
| 1     | ✅ Complete   | Static message UI + backend with dummy reply        |
| 2     | 1–2 days     | Connect backend to OpenAI-compatible endpoints       |
| 3     | 2–3 days     | Add streaming responses (SSE) and message roles     |
| 4     | 1–2 days     | Add model and system prompt options screen          |
| 5     | 2–3 days     | Add Markdown rendering and message styling          |
| 6     | 3–5 days     | Add chat history (in-memory, then persistent)       |
| 7     | TBD          | Multi-chat interface, folders, export, settings     |

---

## Phase Summary

### **Phase 1: Core Architecture**
- Backend: FastAPI, `/chat` endpoint, returns dummy response
- Frontend: Flutter chat UI, sends POST request to backend
- Dockerized backend + frontend
- CI setup for both frontend and backend

### **Phase 2: Real LLM Connection**
- Add support for OpenAI-compatible APIs (e.g., Ollama)
- Read endpoint and API key from environment or options screen

### **Phase 3: Streaming**
- Implement Server-Sent Events (SSE)
- Show partial tokens as they're received

### **Phase 4: Options Screen**
- Allow selection of model and system prompt
- Persistent frontend state with local storage

### **Phase 5: Markdown and Formatting**
- Use a markdown renderer
- Style messages based on role (user, assistant, system)

### **Phase 6: Chat History**
- Keep message history in memory (initial)
- Add persistence (localStorage, then backend DB)

### **Phase 7+: Enhancements**
- Multi-chat support
- Chat export/import
- Theme switcher, accessibility improvements
- Mobile/responsive polish

---

## Final Notes
- Verbose is modular and OpenAI-compatible by design
- You can host it on your machine, internal network, or cloud
- Built with maintainability and flexibility in mind

> Verbose is your privacy-friendly, customizable, and blazing-fast ChatGPT clone — made for developers and self-hosting enthusiasts.

