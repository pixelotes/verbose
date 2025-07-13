from fastapi import APIRouter
from app.models.chat_request import ChatRequest
from app.services.openai_proxy import get_response

router = APIRouter()

@router.post("/chat")
async def chat_endpoint(payload: ChatRequest):
    user_message = payload.message
    reply = await get_response(user_message)
    return {
        "reply": reply,
        "error": reply.startswith("[Error]")
    }

