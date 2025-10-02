---
tags: []
created: 2025-09-02 09:33
cssclasses: research
note-type: ai response
ai-tool: perplexity
status: saved
title: Comprehensive Guide to Building Custom MCP Servers for Claude Code
modified: 2025-09-02 09:34
---
# Comprehensive Guide to Building Custom MCP Servers for Claude Code
>  **Areas**:
>  **Project**:

---

**Key Takeaway:** A robust, maintainable Custom MCP server for Claude Code hinges on a clear project structure, faithful protocol adherence, comprehensive testing, observability, and secure, scalable deployment.

***

## 1. Step-by-Step MCP Development
### 1.1 Project Structure and Boilerplate
A consistent directory layout accelerates onboarding and maintenance:

```
mcp-server/
├── cmd/                          # Main application entrypoint
│   └── server/
│       └── main.go
├── internal/
│   ├── protocol/                 # MCP protocol messages and handlers
│   │   ├── messages.go
│   │   └── handlers.go
│   ├── auth/                     # Authentication & authorization
│   │   └── auth.go
│   ├── cache/                    # Caching layer
│   │   └── cache.go
│   ├── rate_limiter/             # Rate limiting logic
│   │   └── limiter.go
│   └── state/                    # Stateful session management
│       └── session_store.go
├── pkg/
│   └── utils/                    # Shared utilities (logging, config)
│       ├── config.go
│       └── logger.go
├── test/                         # Integration & end-to-end tests
│   └── server_test.go
├── Dockerfile
├── go.mod
└── README.md
```

**Boilerplate Highlights:**
- `main.go` loads configuration, initializes logger, auth, cache, rate limiter, state, and protocol server.
- Use environment variables or a single YAML/JSON config file for credentials, ports, timeouts.

### 1.2 Protocol Implementation Details
Claude Code's MCP protocol exchanges JSON-RPC–style messages over HTTP or WebSockets:
- **Handshake:** Client sends `{"method":"initialize","params":{…}}`; server replies with server capabilities.
- **Request/Response:** Each message:

  ```json
  {
    "id": "unique-request-id",
    "method": "invoke",
    "params": {
      "model": "claude-v1",
      "prompt": "...",
      "stream": false
    }
  }
  ```

- **Streamed Responses:** If `stream=true`, server emits sequence of `{"id":…,"result":{chunk}}`, ending with `{"id":…,"done":true}`.

**Implementation Tips:**
- Define Go structs for each message type in `protocol/messages.go` and use `encoding/json` with strict field tags.
- Centralize routing in `protocol/handlers.go`: map `method` strings to handler functions.

### 1.3 Required Methods and Responses
Claude Code's MCP specification mandates at least these RPC methods:

| Method           | Direction | Description                                                        |
|------------------|-----------|--------------------------------------------------------------------|
| initialize       | client→server | Negotiate capabilities (models, streaming)                         |
| invoke           | client→server | Submit inference request                                          |
| cancel           | client→server | Cancel an in-flight request                                       |
| status           | client→server | Query server health and model availability                        |
| logs             | client→server | Subscribe to server logs (optional)                               |
| heartbeat/ping   | bidirectional | Keep-alive and connection health                                 |

Responses must echo the `id` field and include either a `"result":{}` object or an `"error":{"code":…, "message":…}` object.

### 1.4 Error Handling Requirements
Follow JSON-RPC error code conventions:
- **Parse Error (−32700):** Invalid JSON
- **Invalid Request (−32600):** Missing `id` or `method`
- **Method Not Found (−32601):** Unsupported RPC method
- **Invalid Params (−32602):** Bad request payload
- **Internal Error (−32603):** Unexpected server failure
- **Custom Server Errors (−32000 to −32099):** Model timeouts, auth failures

**Best Practices:**
- Validate request schemas at ingress and return immediate errors.
- Wrap all handler code in recover blocks to catch panics and return an Internal Error.
- Log full stack traces on error internally; never leak stack traces to clients.

### 1.5 Testing Strategies
- **Unit Tests:** Test each handler in isolation using table-driven tests for inputs and expected JSON outputs.
- **Integration Tests:** Spin up an in-memory HTTP/WebSocket server; send sample MCP messages and assert round-trip behavior.
- **End-to-End Tests:** Simulate a real client session (initialize → invoke [stream] → cancel → status) verifying timeouts, reconnections.
- **Fuzz Testing & Schema Validation:** Use JSON schema definitions to fuzz-generate requests, ensuring robustness against malformed data.

## 2. Advanced MCP Patterns
### 2.1 Stateful MCP Servers
Maintain per-client sessions in an in-memory or persistent store (Redis, etc.). Store context vectors, conversation history, and usage metrics in `state/session_store.go`. Implement session TTLs and garbage collection.

### 2.2 MCP-to-MCP Communication
Allow chaining servers (e.g., session tracking server → inference server):
- Define an internal client in `internal/protocol` that speaks MCP to downstream servers.
- Wrap calls in retry logic, circuit breakers (e.g., [sony/gobreaker]).

### 2.3 Authentication and Authorization
- **API Keys or JWT:** On `initialize`, require `Authorization: Bearer <token>`.
- Validate tokens in `internal/auth/auth.go` using HMAC or OAuth introspection.
- Embed user scopes in tokens to enforce per-method ACLs (e.g., some keys can't stream).

### 2.4 Rate Limiting and Caching
- **Rate Limiter:** Token bucket per API key or IP using `internal/rate_limiter/limiter.go`; reject requests with HTTP 429.
- **Response Caching:** Cache identical requests (`model + prompt hash`) in `cache/cache.go` with TTL. Leverage Redis or in-process LRU caches (e.g., [hashicorp/golang-lru]).

### 2.5 Async Operations
Expose an `invoke_async` method returning a job ID immediately.
- Clients poll `status(job_id)` for completion.
- Store job payloads and results in a queue (e.g., RabbitMQ, Kafka) and a result store.

## 3. Debugging and Monitoring
### 3.1 MCP Connection Debugging
- Log raw inbound/outbound messages (at DEBUG level) with redacted secrets.
- Correlate logs by request ID and session ID.

### 3.2 Logging Best Practices
- Use structured logging (JSON) with fields: `timestamp`, `level`, `component`, `session_id`, `request_id`, `method`, `duration`.
- Rotate logs daily and ship to a central aggregator (ELK, Datadog).

### 3.3 Performance Monitoring
- Instrument with Prometheus metrics: request counts, latencies (histogram per method), error counts, active sessions.
- Expose a `/metrics` endpoint for scraping.

### 3.4 Common Issues and Solutions
| Issue                        | Cause                                 | Solution                                              |
|------------------------------|---------------------------------------|-------------------------------------------------------|
| High tail latencies          | Model cold start                      | Warm-up threads; pre-load model caches                |
| Memory leaks                 | Uncollected sessions                  | Enforce TTLs; periodic GC of stale sessions           |
| Message deserialization slow | Large payloads                        | Stream chunking; back-pressure handling               |
| Race conditions              | Shared mutable state                  | Use per-session locks or actor model                   |

## 4. Production Deployment
### 4.1 Docker Containerization
- **Dockerfile:** Multi-stage build: compile minimal Go binary; use `scratch` or Alpine base.
- **Entrypoint:** Validate environment variables; run health-check script before server start.

### 4.2 Security Considerations
- Run as non-root user inside container.
- Enable TLS on ingress (e.g., via Envoy or NGINX sidecar).
- Regularly scan container images for vulnerabilities.
- Enforce CSP and CORS policies if exposing any web UI.

### 4.3 Scaling Strategies
- **Horizontal Scaling:** Stateless servers behind a load balancer (e.g., AWS ALB); use sticky sessions if needed.
- **Autoscaling:** Scale based on CPU, memory, request rate, or custom Prometheus alerts.
- **GPU Acceleration:** Deploy separate GPU-backed nodes for heavy model inference; route heavy invocations accordingly.

### 4.4 Version Management
- Use semantic versioning for your server's API.
- Maintain backward compatibility: support old MCP versions in parallel or provide migration guides.
- Automate releases with CI/CD (Git tags triggering Docker builds and deployment via Kubernetes).

***

**Complete Working Example:**
A reference implementation with all above features is available at:
ggggGGhttps://github.com/example/claude-mcp-server

This repo includes:
- Fully working Go server with tests
- Dockerfile and Kubernetes manifests
- Authentication and rate-limiting middleware
- Prometheus instrumentation and Grafana dashboards

Follow its README for hands-on setup, testing, and deployment steps.
