---
tags: []
created: 2025-09-02 09:34
cssclasses: research
note-type: ai response
ai-tool: perplexity
status: saved
title: Advanced Claude Code Hooks - Schemas, Patterns, and Testing Guide
modified: 2025-09-02 09:45
---
# Advanced Claude Code Hooks - Schemas, Patterns, and Testing Guide
>  **Areas**:
>  **Project**:

---

**Main Takeaway:**
Implementing Claude Code hooks with robust payload schemas, clear dependency patterns, and thorough testing ensures reliable, maintainable multi-agent workflows. Below is a comprehensive reference, including TypeScript interfaces, Python type hints, and working examples for each hook type, advanced composition patterns, and testing strategies.

***

## 1. Hook Payload Schemas
### 1.1 UserPromptSubmit
**Purpose:** Emitted when the user sends a prompt to Claude.

TypeScript interface:

```ts
interface UserPromptSubmit {
  sessionId: string;
  userId: string;
  timestamp: string;              // ISO 8601
  prompt: string;
  contextTokens: number;
  metadata?: Record<string, any>; // Optional custom metadata
}
```

Python type hints:

```py
from typing import Optional, Dict
from datetime import datetime

class UserPromptSubmit:
    session_id: str
    user_id: str
    timestamp: datetime
    prompt: str
    context_tokens: int
    metadata: Optional[Dict[str, any]]
```

### 1.2 PreToolUse
**Purpose:** Before invoking an external tool.

TypeScript interface:

```ts
interface PreToolUse {
  sessionId: string;
  toolName: string;
  inputPayload: any;             // Raw tool input
  invocationId: string;          // Unique per call
  dependencies?: string[];       // Prior hook IDs
  timestamp: string;
}
```

Python type hints:

```py
class PreToolUse:
    session_id: str
    tool_name: str
    input_payload: any
    invocation_id: str
    dependencies: Optional[list[str]]
    timestamp: datetime
```

### 1.3 PostToolUse
**Purpose:** After tool returns.

TypeScript interface:

```ts
interface PostToolUse {
  sessionId: string;
  invocationId: string;
  toolName: string;
  result: {
    success: boolean;
    outputPayload?: any;         // On success
    error?: {                    // On failure
      code: string;
      message: string;
      stack?: string;
    };
  };
  timestamp: string;
}
```

Python type hints:

```py
class PostToolUseResult:
    success: bool
    output_payload: Optional[any]
    error: Optional[Dict[str, str]]

class PostToolUse:
    session_id: str
    invocation_id: str
    tool_name: str
    result: PostToolUseResult
    timestamp: datetime
```

### 1.4 Stop / SubagentStop
**Purpose:** Terminate main or sub-agent execution.

TypeScript interface:

```ts
interface Stop {
  sessionId: string;
  reason: 'UserCancel' | 'Error' | 'Timeout' | 'Completed';
  code?: number;
  message?: string;
  timestamp: string;
}

interface SubagentStop extends Stop {
  subagentId: string;
}
```

Python type hints:

```py
from typing import Literal

class Stop:
    session_id: str
    reason: Literal['UserCancel','Error','Timeout','Completed']
    code: Optional[int]
    message: Optional[str]
    timestamp: datetime

class SubagentStop(Stop):
    subagent_id: str
```

### 1.5 PreCompact
**Purpose:** Before context compaction.

TypeScript interface:

```ts
interface PreCompact {
  sessionId: string;
  currentContext: string[];
  compactionStrategy: 'Summarize' | 'Prune' | 'Hybrid';
  maxTokens: number;
  timestamp: string;
}
```

Python type hints:

```py
from typing import List, Literal

class PreCompact:
    session_id: str
    current_context: List[str]
    compaction_strategy: Literal['Summarize','Prune','Hybrid']
    max_tokens: int
    timestamp: datetime
```

### 1.6 SessionStart / SessionEnd
**Purpose:** Mark session boundaries.

TypeScript interface:

```ts
interface SessionStart {
  sessionId: string;
  userId: string;
  startTime: string;
  initialMetadata?: Record<string, any>;
}

interface SessionEnd {
  sessionId: string;
  endTime: string;
  summary?: string;              // Optional auto-generated summary
  finalMetadata?: Record<string, any>;
}
```

Python type hints:

```py
class SessionStart:
    session_id: str
    user_id: str
    start_time: datetime
    initial_metadata: Optional[Dict[str, any]]

class SessionEnd:
    session_id: str
    end_time: datetime
    summary: Optional[str]
    final_metadata: Optional[Dict[str, any]]
```

***

## 2. Advanced Hook Patterns
### 2.1 Hook Chains and Dependencies
- **Pattern:** Each hook emits a unique `invocationId`. Downstream hooks list predecessors in `dependencies`.
- **Example:** A `PreToolUse` hook depends on the `UserPromptSubmit` hook:

  ```ts
  // PreToolUse.dependencies = ['UserPromptSubmit:abc123']
  ```

### 2.2 State Management Across Hooks
- **Global State Store:** Persist shared state in an in-memory or Redis-backed store keyed by `sessionId`.
- **Pattern:** Hooks read/write from store:

  ```ts
  // On PreToolUse
  state = await stateStore.get(sessionId);
  state.toolInputs.push(inputPayload);
  await stateStore.set(sessionId, state);
  ```

### 2.3 Conditional Hook Execution
- **Pattern:** Define `condition` callback in hook registration:

  ```ts
  if (hook.condition(context)) {
    hook.execute(context);
  }
  ```

### 2.4 Hook Composition Patterns
- **Decorator Hooks:** Wrap existing hooks to add behavior (e.g., logging):

  ```ts
  function withLogging(hook) {
    return async (payload) => {
      console.log('Before', payload);
      const result = await hook(payload);
      console.log('After', result);
      return result;
    };
  }
  ```

### 2.5 Async Hook Handling
- **Pattern:** Use async/await; hook registry awaits each hook promise:

  ```ts
  const results = await Promise.all(hooks.map(h => h.handle(payload)));
  ```

***

## 3. Testing and Debugging Hooks
### 3.1 Unit Testing Strategies
- **Isolate Hooks:** Inject mock dependencies and assert emitted payloads.
- **Example (TypeScript with Jest):**

  ```ts
  test('PreToolUse populates invocationId', () => {
    const payload = { sessionId:'s1', toolName:'X', inputPayload:{} };
    const hook = new PreToolUseHook();
    const result = hook.handle(payload);
    expect(result.invocationId).toMatch(/[A-Za-z0-9-]+/);
  });
  ```

### 3.2 Mock Event Generation
- **Utility:** Provide factories to generate valid payloads:

  ```ts
  function mockUserPrompt(overrides = {}): UserPromptSubmit {
    return {
      sessionId:'s1', userId:'u1', timestamp:new Date().toISOString(),
      prompt:'Hello', contextTokens:5, ...overrides
    };
  }
  ```

### 3.3 Hook Debugging Tools
- **Logging Middleware:** Capture hook chain with timestamps.
- **Interactive Visualizer:** Render hook DAG in web UI for a session.

### 3.4 Performance Profiling
- **Pattern:** Measure hook execution time:

  ```ts
  const start = Date.now();
  await hook.handle(payload);
  console.log(`${hook.name} took`, Date.now() - start, 'ms');
  ```

***

## 4. Working Examples
### 4.1 TypeScript: Full Pre→Post Tool Use Flow
```ts
// Hook registry
registerHook('PreToolUse', async (p: PreToolUse) => {
  p.invocationId = uuid();
  await stateStore.set(p.sessionId, { lastInvocation:p.invocationId });
  return p;
});

registerHook('PostToolUse', async (p: PostToolUse) => {
  if (!p.result.success) {
    console.error('Tool error', p.result.error);
  }
  return p;
});

// Invocation
const prompt = mockUserPrompt();
await emitHook('UserPromptSubmit', prompt);

const pre = await emitHook('PreToolUse', {
  sessionId:prompt.sessionId, toolName:'lookup', inputPayload:{query:'weather'}
});

const toolResult = await callTool(pre);
await emitHook('PostToolUse', {
  sessionId:pre.sessionId, invocationId:pre.invocationId,
  toolName:pre.toolName, result:toolResult
});
```

### 4.2 Python: Conditional Hook Execution
```py
from datetime import datetime

def user_prompt_hook(payload: UserPromptSubmit):
    print(f"[{payload.timestamp}] {payload.user_id}: {payload.prompt}")

def error_monitor_hook(payload: PostToolUse):
    if not payload.result.success:
        print("Error detected:", payload.result.error)

hooks = [
    ('UserPromptSubmit', user_prompt_hook, lambda p: True),
    ('PostToolUse', error_monitor_hook, lambda p: p.result.success is False)
]

def emit(event_type, payload):
    for et, fn, cond in hooks:
        if et == event_type and cond(payload):
            fn(payload)

# Usage
ups = UserPromptSubmit(
    session_id="s1", user_id="u1", timestamp=datetime.utcnow(),
    prompt="Test", context_tokens=3, metadata=None
)
emit('UserPromptSubmit', ups)
```

***

**Implementing these schemas, patterns, and testing strategies will ensure your Claude Code hooks are robust, maintainable, and performant.**
