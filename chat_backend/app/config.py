# config.py
import os
from dotenv import load_dotenv

load_dotenv()  # Load from .env

LLM_API_URL = os.getenv("LLM_API_URL", "http://localhost:11434/api/chat")
LLM_API_KEY = os.getenv("LLM_API_KEY", "")
LLM_MODEL = os.getenv("LLM_MODEL", "mistral")
