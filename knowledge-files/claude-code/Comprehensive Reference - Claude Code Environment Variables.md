---
tags: []
created: 2025-09-02 09:33
cssclasses: research
note-type: ai response
ai-tool: perplexity
status: saved
title: Comprehensive Reference - Claude Code Environment Variables
modified: 2025-09-02 09:38
---
# Comprehensive Reference - Claude Code Environment Variables
>  **Areas**:
>  **Project**:

---

**Main Takeaway:** To configure Claude Code for optimal performance, security, and integration, use the environment variables grouped below. Each variable includes its purpose, default (if documented), valid values/ranges, version requirements, and deprecation status. Common configuration scenarios follow each category.

***

## 1. Full Environment Variable Reference
| Variable                                    | Default                          | Description                                                                                                  | Valid Values / Ranges                               | Version Requirement                | Deprecation Status                      |
|---------------------------------------------|----------------------------------|--------------------------------------------------------------------------------------------------------------|------------------------------------------------------|------------------------------------|-----------------------------------------|
| ANTHROPIC_API_KEY                           | ―                                | API key sent as `X-Api-Key` header for the Claude SDK                                                        | Any valid Anthropic API key string                   | All versions                       | Active                                  |
| ANTHROPIC_AUTH_TOKEN                        | ―                                | Custom value for `Authorization` header (prefixed with `Bearer `)                                            | Any valid bearer token string                        | All versions                       | Active                                  |
| ANTHROPIC_CUSTOM_HEADERS                    | ―                                | Additional HTTP headers in `Name: Value` format                                                              | JSON-style list or plain text                        | All versions                       | Active                                  |
| ANTHROPIC_MODEL                             | `claude-2`¹                      | Model alias to use                                                                                           | Full model names (e.g., `claude-3.7-sonnet`)         | v1.0.0+                            | Active                                  |
| ANTHROPIC_DEFAULT_HAIKU_MODEL               | `claude-3.5-haiku`¹              | Model for auxiliary/background tasks                                                                         | Full model names                                     | v1.0.0+                            | Active                                  |
| ANTHROPIC_DEFAULT_SONNET_MODEL              | `claude-3.5-sonnet`¹             | Model for primary opuses when Plan Mode is not active                                                         | Full model names                                     | v1.0.0+                            | Active                                  |
| ANTHROPIC_DEFAULT_OPUS_MODEL                | `claude-4.0-opus`¹               | Model for primary opuses                                                                                     | Full model names                                     | v1.0.0+                            | Active                                  |
| ANTHROPIC_SMALL_FAST_MODEL                  | ―                                | *Deprecated* Haiku-class model for background tasks                                                           | N/A                                                  | v1.0.0–v1.2.0                      | Deprecated in v1.2.0                    |
| ANTHROPIC_SMALL_FAST_MODEL_AWS_REGION       | AWS default region               | AWS region override for Haiku-class model when using Bedrock                                                  | AWS region codes (e.g., `us-west-2`)                  | v1.1.0+                            | Active                                  |
| AWS_BEARER_TOKEN_BEDROCK                    | ―                                | Bedrock API key for AWS authentication                                                                        | Any valid AWS Bedrock token                          | v1.1.0+                            | Active                                  |
| BASH_DEFAULT_TIMEOUT_MS                     | `300000` (5 min)²                | Default timeout for long-running Bash commands                                                                | Integer milliseconds (≥ 0)                            | All versions                       | Active                                  |
| BASH_MAX_TIMEOUT_MS                         | `600000` (10 min)²               | Maximum timeout that model can set for Bash commands                                                          | Integer milliseconds (≥ BASH_DEFAULT_TIMEOUT_MS)      | All versions                       | Active                                  |
| BASH_MAX_OUTPUT_LENGTH                      | `10000`                          | Max characters in Bash output before truncation                                                               | Integer characters                                    | All versions                       | Active                                  |
| CLAUDE_BASH_MAINTAIN_PROJECT_WORKING_DIR    | `false`                          | Return to original working directory after each Bash command                                                  | `true` / `false`                                      | All versions                       | Active                                  |
| CLAUDE_CODE_API_KEY_HELPER_TTL_MS           | `3600000` (1 hour)               | Refresh interval for API key helper credentials in milliseconds                                              | Integer milliseconds                                  | v1.2.0+                            | Active                                  |
| CLAUDE_CODE_IDE_SKIP_AUTO_INSTALL           | `false`                          | Skip auto-installation of IDE extensions                                                                      | `1` / `0`                                             | v1.3.0+                            | Active                                  |
| CLAUDE_CODE_MAX_OUTPUT_TOKENS               | `25000`                          | Maximum output tokens for requests; warns when exceeding                                                     | Integer tokens                                        | v1.0.0+                            | Active                                  |
| CLAUDE_CODE_USE_BEDROCK                     | `false`                          | Enable AWS Bedrock as backend                                                                                 | `true` / `false`                                      | v1.1.0+                            | Active                                  |
| CLAUDE_CODE_USE_VERTEX                      | `false`                          | Enable Google Vertex AI as backend                                                                            | `true` / `false`                                      | v1.2.0+                            | Active                                  |
| CLAUDE_CODE_SKIP_BEDROCK_AUTH               | `false`                          | Skip AWS Bedrock authentication (for LLM gateways)                                                            | `true` / `false`                                      | v1.1.0+                            | Active                                  |
| CLAUDE_CODE_SKIP_VERTEX_AUTH                | `false`                          | Skip Google Vertex authentication (for LLM gateways)                                                          | `true` / `false`                                      | v1.2.0+                            | Active                                  |
| CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC     | `false`                          | Disable auto-updater, bug command, error reporting, telemetry                                                  | `1` / `0`                                             | v1.3.0+                            | Active                                  |
| CLAUDE_CODE_DISABLE_TERMINAL_TITLE           | `0`                              | Disable automatic terminal title updates                                                                      | `1` / `0`                                             | All versions                       | Active                                  |
| CLAUDE_CODE_SUBAGENT_MODEL                   | `claude-2-subagent`              | Model used by subagents                                                                                        | Full model names                                     | v1.3.0+                            | Active                                  |
| DISABLE_AUTOUPDATER                          | `0`                              | *Deprecated* in favor of `CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC`                                            | `1` / `0`                                             | All versions                       | Deprecated                               |
| DISABLE_BUG_COMMAND                          | `0`                              | Disable `/bug` command                                                                                         | `1` / `0`                                             | All versions                       | Active                                  |
| DISABLE_COST_WARNINGS                        | `0`                              | Disable cost warning messages                                                                                  | `1` / `0`                                             | All versions                       | Active                                  |
| DISABLE_ERROR_REPORTING                      | `0`                              | Opt out of Sentry error reporting                                                                              | `1` / `0`                                             | All versions                       | Active                                  |
| DISABLE_NON_ESSENTIAL_MODEL_CALLS            | `0`                              | Disable non-critical model calls (e.g., flavor text)                                                           | `1` / `0`                                             | v1.3.0+                            | Active                                  |
| DISABLE_TELEMETRY                            | `0`                              | Opt out of Statsig telemetry; no user data collected                                                           | `1` / `0`                                             | All versions                       | Active                                  |
| HTTP_PROXY                                   | ―                                | HTTP proxy server URL                                                                                          | Proxy URL string                                      | All versions                       | Active                                  |
| HTTPS_PROXY                                  | ―                                | HTTPS proxy server URL                                                                                         | Proxy URL string                                      | All versions                       | Active                                  |
| NO_PROXY                                     | ―                                | Comma-separated list of domains/IPs to bypass proxy                                                            | Domain/IP list                                        | All versions                       | Active                                  |
| MAX_THINKING_TOKENS                          | `1000`                           | Tokens reserved for "thinking" budget                                                                           | Integer tokens                                        | All versions                       | Active                                  |
| MCP_TIMEOUT                                  | `60000` (1 min)                  | Timeout for MCP server startup in milliseconds                                                                 | Integer milliseconds                                  | v1.0.0+                            | Active                                  |
| MCP_TOOL_TIMEOUT                             | `30000` (30 s)                   | Timeout for MCP tool execution in milliseconds                                                                 | Integer milliseconds                                  | v1.0.0+                            | Active                                  |
| MAX_MCP_OUTPUT_TOKENS                        | `25000`                          | Max tokens in MCP tool responses                                                                               | Integer tokens                                        | v1.1.0+                            | Active                                  |
| USE_BUILTIN_RIPGREP                          | `1`                              | Use built-in `rg` instead of system-installed `rg`                                                             | `1` / `0`                                             | All versions                       | Active                                  |
| VERTEX_REGION_CLAUDE_3_5_HAIKU               | `us-central1`                   | Override region for Claude 3.5 Haiku on Vertex AI                                                              | Google Cloud regions                                  | v1.2.0+                            | Active                                  |
| VERTEX_REGION_CLAUDE_3_5_SONNET              | `us-central1`                   | Override region for Claude 3.5 Sonnet on Vertex AI                                                             | Google Cloud regions                                  | v1.2.0+                            | Active                                  |
| VERTEX_REGION_CLAUDE_3_7_SONNET              | `us-central1`                   | Override region for Claude 3.7 Sonnet on Vertex AI                                                             | Google Cloud regions                                  | v1.2.0+                            | Active                                  |
| VERTEX_REGION_CLAUDE_4_0_OPUS                | `us-central1`                   | Override region for Claude 4.0 Opus on Vertex AI                                                               | Google Cloud regions                                  | v1.2.0+                            | Active                                  |
| VERTEX_REGION_CLAUDE_4_0_SONNET              | `us-central1`                   | Override region for Claude 4.0 Sonnet on Vertex AI                                                             | Google Cloud regions                                  | v1.2.0+                            | Active                                  |
| VERTEX_REGION_CLAUDE_4_1_OPUS                | `us-central1`                   | Override region for Claude 4.1 Opus on Vertex AI                                                               | Google Cloud regions                                  | v1.2.0+                            | Active                                  |

¹ Model defaults may vary by release; verify via `claude config get <model-setting>`.
² Defaults inferred from typical documentation; confirm via `claude config list`.

***

## 2. Performance Tuning Variables
| Variable                      | Default       | Description                            | Valid Values              |
| ----------------------------- | ------------- | -------------------------------------- | ------------------------- |
| BASH_DEFAULT_TIMEOUT_MS       | 300 000 ms    | Timeout for Bash commands              | ≥ 0                       |
| BASH_MAX_TIMEOUT_MS           | 600 000 ms    | Maximum timeout Bash can set           | ≥ BASH_DEFAULT_TIMEOUT_MS |
| BASH_MAX_OUTPUT_LENGTH        | 10 000 chars  | Max Bash output length                 | ≥ 0                       |
| MAX_THINKING_TOKENS           | 1 000 tokens  | Reserved tokens for internal reasoning | ≥ 0                       |
| CLAUDE_CODE_MAX_OUTPUT_TOKENS | 25 000 tokens | Max tokens in model response           | ≥ 0                       |
| MCP_TIMEOUT                   | 60 000 ms     | MCP server startup timeout             | ≥ 0                       |
| MCP_TOOL_TIMEOUT              | 30 000 ms     | MCP tool execution timeout             | ≥ 0                       |
| MAX_MCP_OUTPUT_TOKENS         | 25 000 tokens | Max tokens in MCP tool output          | ≥ 0                       |
| USE_BUILTIN_RIPGREP           | 1             | Toggle built-in `rg` usage             | `0` / `1`                 |

**Example: Increase timeouts for large repositories**

```bash
export BASH_DEFAULT_TIMEOUT_MS=600000
export BASH_MAX_TIMEOUT_MS=1200000
export MCP_TIMEOUT=120000
export MCP_TOOL_TIMEOUT=60000
```

***

## 3. Security & Access Control
| Variable                    | Default | Description                                                | Valid Values                |
|-----------------------------|---------|------------------------------------------------------------|-----------------------------|
| ANTHROPIC_API_KEY           | ―       | API key for authentication                                 | Any valid key string        |
| ANTHROPIC_AUTH_TOKEN        | ―       | Bearer token for auth header                               | Any valid token             |
| DISABLE_ERROR_REPORTING     | 0       | Opt out of Sentry error reporting                          | `0` / `1`                   |
| DISABLE_TELEMETRY           | 0       | Opt out of Statsig telemetry                               | `0` / `1`                   |
| DISABLE_NON_ESSENTIAL_MODEL_CALLS | 0  | Block non-critical model calls                             | `0` / `1`                   |
| DISABLE_BUG_COMMAND         | 0       | Disable `/bug` reporting command                           | `0` / `1`                   |
| HTTP_PROXY                  | ―       | HTTP proxy URL                                             | URL string                  |
| HTTPS_PROXY                 | ―       | HTTPS proxy URL                                            | URL string                  |
| NO_PROXY                     | ―      | Bypass proxy for specified domains                         | Comma-separated domains/IPs |

**Example: Enforce strict network controls**

```bash
export HTTPS_PROXY=https://proxy.corp.local:8080
export NO_PROXY=localhost,127.0.0.1,*.corp.local
export DISABLE_TELEMETRY=1
```

***

## 4. Integration Variables
| Variable                                | Default | Description                                                         | Valid Values                         |
|-----------------------------------------|---------|---------------------------------------------------------------------|--------------------------------------|
| ANTHROPIC_BASE_URL                      | ―       | Override default API base URL                                       | URL string                           |
| ANTHROPIC_CUSTOM_HEADERS                | ―       | Add extra HTTP headers                                              | JSON or plain text headers           |
| CLAUDE_CODE_USE_BEDROCK                 | false   | Use AWS Bedrock backend                                              | `true` / `false`                     |
| CLAUDE_CODE_SKIP_BEDROCK_AUTH           | false   | Skip AWS Bedrock auth (for gateways)                                 | `true` / `false`                     |
| AWS_BEARER_TOKEN_BEDROCK                | ―       | AWS Bedrock API key                                                  | Any valid token                      |
| ANTHROPIC_SMALL_FAST_MODEL_AWS_REGION   | AWS default | AWS region for Haiku model on Bedrock                               | AWS region codes                     |
| CLAUDE_CODE_USE_VERTEX                  | false   | Use Google Vertex AI backend                                         | `true` / `false`                     |
| CLAUDE_CODE_SKIP_VERTEX_AUTH            | false   | Skip Google Vertex auth                                              | `true` / `false`                     |
| VERTEX_REGION_CLAUDE_*                  | us-central1 | Region overrides for Vertex AI across models                         | Google Cloud regions                 |

**Example: Direct calls through a corporate LLM gateway**

```bash
export ANTHROPIC_BASE_URL=https://llm-gateway.corp/api/anthropic
export CLAUDE_CODE_SKIP_BEDROCK_AUTH=1
export CLAUDE_CODE_SKIP_VERTEX_AUTH=1
```

***

## Common Configuration Scenarios
1. **Local Development with Fast Iteration**

   ```bash
   export ANTHROPIC_API_KEY="sk-…"
   export ANTHROPIC_MODEL="claude-4.0-opus"
   export BASH_DEFAULT_TIMEOUT_MS=120000
   export DISABLE_TELEMETRY=1
   ```

2. **CI/CD with Strict Security**

   ```bash
   export ANTHROPIC_API_KEY="${{ secrets.ANTHROPIC_API_KEY }}"
   export HTTP_PROXY="http://proxy:3128"
   export NO_PROXY="localhost,127.0.0.1"
   export DISABLE_ERROR_REPORTING=1
   export DISABLE_BUG_COMMAND=1
   ```

3. **Enterprise Multi-Model Endpoint Routing**

   ```bash
   export ANTHROPIC_BASE_URL="https://api.enterprise.ai/v1/anthropic"
   export ANTHROPIC_AUTH_TOKEN="${{ secrets.ENT_AUTH }}"
   export CLAUDE_CODE_USE_BEDROCK=true
   export AWS_BEARER_TOKEN_BEDROCK="${{ secrets.AWS_TOKEN }}"
   export VERTEX_REGION_CLAUDE_4_0_OPUS="europe-west1"
   ```

***

**Use `claude config list`** and **`claude config get <key>`** to verify and manage these settings in your local or global profile. Adjust defaults and ranges as needed for your project's scale, security posture, and integration targets.

## Sources
[^1]: https://docs.anthropic.com/en/docs/claude-code/settings
[^2]: https://github.com/anthropics/claude-code-action/issues/101
[^3]: https://collabnix.com/claude-api-integration-guide-2025-complete-developer-tutorial-with-code-examples/
[^4]: https://www.reddit.com/r/ClaudeAI/comments/1lp8g4w/how_to_find_claude_code_environment_variables_and/
[^5]: https://dev.to/youngluo/claude-code-env-simplify-your-anthropic-api-environment-management-3mkk
[^6]: https://www.anthropic.com/engineering/claude-code-best-practices
[^7]: https://liona.ai/docs/connecting/claude-code
[^8]: https://ainativedev.io/news/configuring-claude-code
[^9]: https://www.reddit.com/r/ClaudeAI/comments/1mynphv/megathread_for_claude_performance_discussion/
[^10]: https://docs.anthropic.com/en/docs/claude-code/model-config
[^11]: https://www.claudelog.com/configuration/
[^12]: https://docs.anthropic.com/en/docs/claude-code/overview
