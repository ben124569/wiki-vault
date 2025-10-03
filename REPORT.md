# Knowledge Base + MCP — Current Situation Report

Date: 2025-10-03
Owner: Benjamin Merritt
Repo: /Users/benjaminmerritt/wiki-vault

## Overview
- Multi‑profile RAG system with CLI, MCP tools (Claude), and optional web API.
- Profiles:
  - Agent Vault (source notes): configs/agent.yaml — INGESTED (9,029 docs; ~72k items)
  - Hormozi Transcripts (.md): configs/hormozi-transcripts.yaml — Ready (ingest as needed)
  - Jay Transcripts (.txt/.md): configs/jay-transcripts.yaml — Ready (re‑ingest after adding files)
- Transcript‑first tools (Ask Hormozi / Ask Jay) provide deep, synthesized answers with citations.

## Key Changes
- Config + indexing:
  - scripts/full_notes.py tolerant to missing transcripts; .txt supported; ignores non‑content dirs (venv, site‑packages, __pycache__, chroma_db, .git, etc.).
  - lib/processor.py processes .md + .txt; skips ignored dirs.
- Query:
  - scripts/query.py: automatic fallback to local embeddings if OpenAI fails; clearer collection‑missing error; same embedding function as ingest.
- Ask Expert / Ask Hormozi / Ask Jay:
  - scripts/ask_expert.py: always appends Sources; configurable tokens; uses search.top_k_final.
  - scripts/ask_hormozi.py: interactive mode; broader retrieval → keyword re‑rank → diversity by source; longer, specific answers; Sources appended.
- MCP server (scripts/mcp_server.py):
  - Transcript tools: ask_hormozi, ask_jay (alias), video_search, source_search, read_document, summarize_document, extract_timestamps, extract_quotes, chapters, similar_videos, synthesize_topic, about.
  - Previews: sentence‑aware truncation; enriched metadata previews for source_search.
  - Counts + dedup: returned/requested; unique_sources; dedup by source for video_search.
  - Response knobs: response_style (concise | detailed | comprehensive); confidence; related suggestions.
- CLI helpers (new): video_search.py, read_video.py, summarize_video.py, synthesize_topic.py, ask_hormozi.py.
- Web API (optional): scripts/web_api.py (FastAPI) + Dockerfile; deploy profile configs/jay-transcripts-deploy.yaml.

## Profiles
- configs/agent.yaml — Data: /Users/…/agent-vault-old; DB: /Users/…/agent-vault-old/chroma_db — Ingested
- configs/hormozi-transcripts.yaml — Transcripts: /Users/…/hormozi-vault/00-raw-transcripts; DB: /Users/…/hormozi-vault/chroma_db — Ready
- configs/jay-transcripts.yaml — Transcripts: /Users/…/raw-transcripts/PMM/pmm-transcripts; DB: /Users/…/raw-transcripts/PMM/chroma_db — Ready
- configs/jay-transcripts-deploy.yaml — For Docker/web API: transcripts at /app/data/transcripts; DB at /data/chroma_db

## MCP Providers (Claude)
- Add entries to ~/Library/Application Support/Claude/mcp.json.
- Critical: command and PATH must point to the same venv; restart Claude after edits.

Examples:
- wiki-vault:
  - command: /Users/…/wiki-vault/venv/bin/python
  - args: ["/Users/…/wiki-vault/scripts/mcp_server.py"]
  - env: { OPENAI_API_KEY?, PATH }
- agent-vault:
  - env adds: WIKI_VAULT_CONFIG=/Users/…/configs/agent.yaml, WIKI_VAULT_SILENT=1
- hormozi-vault:
  - env adds: WIKI_VAULT_CONFIG=/Users/…/configs/hormozi-transcripts.yaml, WIKI_VAULT_MCP_NAME=hormozi-vault
- ask-jay:
  - command: /Users/…/raw-transcripts/PMM/venv/bin/python (or pmm-transcripts/venv/bin/python)
  - args: ["/Users/…/wiki-vault/scripts/mcp_server.py"]
  - env: { WIKI_VAULT_CONFIG=/Users/…/configs/jay-transcripts.yaml, WIKI_VAULT_MCP_NAME=ask-jay, WIKI_VAULT_SILENT=1, PATH=<same venv as command>:…, OPENAI_API_KEY? }

## MCP Tools (Transcript‑first)
- ask_jay(question, top_k?, max_tokens?, user_context?, response_style?) → { answer, sources, confidence, related }
- video_search(query, top_k?) → { results, returned, requested, unique_sources, collection_total }
- source_search(term, top_k?) → improved content preview
- read_document(title|index, doc_type?) → full content
- summarize_document(title|index, doc_type?, length?) → summary + sources
- extract_timestamps, extract_quotes, chapters, similar_videos → utilities
- synthesize_topic(topic, top_k?, per_doc_length?, final_length?) → cross‑video brief + sources
- about() → description + recommended tools

## CLI Usage
Set profile: export WIKI_VAULT_CONFIG="/Users/…/configs/<profile>.yaml"
- Ingest:           python scripts/ingest.py
- System test:      python scripts/test_system.py
- Search:           python scripts/video_search.py "term" --top-k 5
- Read:             python scripts/read_video.py --title "partial or exact"
- Summarize:        python scripts/summarize_video.py --title "…" --length medium
- Synthesize topic: python scripts/synthesize_topic.py "topic" --top-k 5
- Ask (interactive): python scripts/ask_hormozi.py
  - One‑shot: python scripts/ask_hormozi.py "question" --top-k 18 --max-tokens 3000

## Web API (Optional Hosting)
- FastAPI server: scripts/web_api.py
- Local: uvicorn scripts.web_api:app --host 0.0.0.0 --port 8000
- Endpoints: /health, /ask-jay (POST), /video-search, /source-search, /read, /summarize
- Docker: Dockerfile; use configs/jay-transcripts-deploy.yaml
  - Mount transcripts at /app/data/transcripts; chroma_db at /data/chroma_db
  - Env: WIKI_VAULT_CONFIG=/app/configs/jay-transcripts-deploy.yaml

## Knobs & Tuning
- Retrieval breadth: config search.top_k_final; tool top_k param
- Answer length: config generation.max_tokens; tool max_tokens param; response_style (concise | detailed | comprehensive)
- Tailoring: ask_jay.user_context (e.g., “video service in Adelaide; async; ADHD constraints”)
- Chunking: notes_chunk_size/overlap; transcript_chunk_minutes/overlap
- Performance: embeddings.batch_size (256–512 ok if RAM allows)

## Known Issues / Next Iteration
- Add module/lesson parsing for cleaner Source/result labels (derive from paths)
- total_matches: expose approximate totals if needed; currently show collection_total + unique_sources
- Dedup: monitor for duplicate previews; tightened in video_search
- Add API auth + rate limiting to web API
- CLI ask_hormozi: add --response-style flag (MCP supports this already)
- Optional metadata: date/duration from filenames; confidence display in clients

## Next Steps
- Jay: re‑ingest after adding new .txt files (ignore list prevents venv contamination)
- Confirm ask-jay MCP provider paths (command + PATH align) and restart Claude
- Decide hosting path (VM vs Docker/Fly). If Docker: mount transcripts + chroma_db; set WIKI_VAULT_CONFIG to deploy profile; add token auth
- Implement module/lesson label parsing

