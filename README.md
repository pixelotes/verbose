# Verbose - Stage 2

**Verbose** is a lightweight, self-hosted chat UI that mimics the style of ChatGPT. It is built using **Flutter Web** for the frontend and **FastAPI** (Python) for the backend. In Stage 2, the aim is to add support for OpenAI-compatible APIs. Also, instead of being hardcoded, it will read the endpoint and API keys from environment (and in later stages it will be configurable from the options screen).

---

Current features:
- Basic chat UI with Whatsapp-like styling
- Messages now have roles (user and assistant)
- New messages automatically trigger a scroll to bottom
- Messages now show the time of creation
- Enter key sends a message (in addition to the send icon)
- The backend now uses a dotenv for the llm configuration values
- The backend is now wired to Ollama
- Errors are somewhat gracefully handled

---

Planned for next stage:
- Further UI enhancements:
  * Add multiline support
  * Select the chat textbox after sending a message
- Prepare the UI for streaming responses
- Add markdown rendering

---

Made with 🎯 and 🐍 by Pixelotes — Welcome to **Verbose**!

