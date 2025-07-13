import httpx
from app import config

async def get_response(user_message: str) -> str:
    payload = {
        "model": config.LLM_MODEL,
        "messages": [{"role": "user", "content": user_message}]
    }

    headers = {
        "Content-Type": "application/json"
    }

    if config.LLM_API_KEY:
        headers["Authorization"] = f"Bearer {config.LLM_API_KEY}"

    try:
        async with httpx.AsyncClient(timeout=30.0) as client:
            response = await client.post(
                config.LLM_API_URL,
                headers=headers,
                json=payload
            )
            response.raise_for_status()

            data = response.json()

            # Validate response shape
            if "choices" not in data or not data["choices"]:
                return "[Error] LLM response malformed: no choices found."

            return data["choices"][0]["message"]["content"]

    except httpx.TimeoutException:
        return "[Error] LLM backend timeout."

    except httpx.RequestError as e:
        return f"[Error] Request failed: {str(e)}"

    except httpx.HTTPStatusError as e:
        return f"[Error] LLM backend returned error: {e.response.status_code} - {e.response.text}"

    except Exception as e:
        return f"[Error] Unexpected backend error: {str(e)}"
