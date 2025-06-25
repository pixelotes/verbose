#!/bin/bash
curl -X POST http://localhost:8000/chat -H "Content-type: application/json" -d '{"message": "Hello, backend!"}'