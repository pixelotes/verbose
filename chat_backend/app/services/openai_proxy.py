# app/services/openai_proxy.py
async def get_response(user_message: str) -> str:
    # In phase 2, this is a stub. We’ll wire up actual LLM call later.
    return f"Echo: {user_message}"
