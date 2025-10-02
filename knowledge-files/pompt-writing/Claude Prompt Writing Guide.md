---
created: 2025-09-02
modified: 2025-09-14
aliases:
  - Prompt Writing Guide
linter-yaml-title-alias: Prompt Writing Guide
title: Prompt Writing Guide
---
# Prompt Writing Guide

>  **Index, Project or Workflow**: [[MCP]]
---
## Core Philosophy
The quality of your prompt directly correlates with the quality of the AI's output. Think of AI as a highly capable expert with amnesia - they need explicit instructions and context to perform optimally. Good prompting can improve response quality by up to 40% compared to basic approaches.
## Universal Principles for Effective Prompts
### 1. Be Clear and Direct
**Specificity is paramount.** Vague requests get vague responses.

Instead of: "Help me with a presentation" Use: "I need help creating a 10-slide presentation. for our quarterly sales meeting covering Q2 performance, top-selling products, and Q3 targets. Please provide an outline with key points for each slide."

Key elements of clarity:

- **Clear task definition** - State exactly what you want accomplished
- **Context provision** - Explain why this matters and provide relevant background
- **Constraint specification** - Define limitations, requirements, and boundaries
- **Audience identification** - Specify who will use the output and their knowledge level
- **Scope definition** - What to include and what to exclude

### 2. Structure Your Prompts Systematically
Break complex prompts into clear sections rather than walls of text:

```
Role: [If helpful, specify expertise needed]

Context: [Background and situation]

Task: [What you need done]

Requirements:
- [Specific requirement 1]
- [Specific requirement 2]
- [Format preferences]. 
Output Format: [How results should be structured]
```

### 3. Provide Rich Examples
Examples are your most powerful tool. Including 2-3 diverse, relevant examples dramatically improves accuracy and consistency.

**Effective examples should be:**

- **Relevant** - Mirror your actual use case
- **Diverse** - Cover different scenarios and edge cases
- **Clear** - Show both input and desired output
- **Comprehensive** - Demonstrate format, style, and depth needed

**Example structure:**

```
Here's an example of what I'm looking for:

Input: [Sample input]
Output: [Exactly what you want back]

Another example:
Input: [Different scenario]
Output: [Appropriate response for that scenario]
```

### 4. Encourage Step-by-Step Thinking
For complex tasks, explicitly ask for systematic reasoning:

**Basic approach:** "Think through this step-by-step before providing your answer."

**Guided approach:**

```
Please approach this systematically:
1. First, analyze the key factors
2. Then, consider potential solutions
3. Evaluate pros and cons of each
4. Finally, recommend the best approach with reasoning
```

**For analysis tasks:**

```
Break this down into components:
- Identify the main issues
- Analyze each separately
- Show how they connect
- Synthesize into conclusions
```

### 5. Assign Specific Roles When Helpful
Role assignment transforms general responses into expert-level output:

"Act as a seasoned data scientist with 10 years of experience in customer analytics…" "You are an expert financial analyst specializing in small business insights…" "Respond as a professional editor who specializes in making technical content accessible…"

The more specific the role, the better tailored the expertise and communication style.

### 6. Define Output Requirements Explicitly
Never assume the AI knows your preferred format:

**Specify:**

- Length (word count, number of points, pages)
- Format (paragraphs, bullets, numbered lists, tables)
- Style (formal, conversational, technical, simple)
- Structure (sections, headers, order of information)
- Level of detail (overview vs comprehensive, technical depth)

**Example:** "Provide your response as:

- Executive summary (2-3 sentences)
- Key findings (3-5 bullet points)
- Detailed analysis (2-3 paragraphs)
- Recommendations (numbered list with rationale)"

### 7. Start with Data, End with Instructions
For prompts involving documents or data:

1. First provide all context and data
2. Then give clear instructions
3. Finally specify output requirements

This order helps AI process information before determining what to do with it.

## Advanced Prompting Techniques
### Prompt Chaining
Break complex tasks into sequential prompts:

1. **Research phase**: "Analyze this data and identify key patterns"
2. **Synthesis phase**: "Based on those patterns, what are the implications?"
3. **Recommendation phase**: "Given these implications, what actions should we take?"
4. **Format phase**: "Structure this into an executive presentation"

Each step builds on the previous, maintaining focus and accuracy.

### Iterative Refinement
First prompt: Get the basic structure right Follow-up: "Good start. Now make it more [specific/detailed/concise]" Further refinement: "Add examples for points 2 and 4" Final polish: "Adjust the tone to be more [formal/casual/technical]"

### Prefilling Patterns
Guide the response format by starting it: "Based on my analysis, the three key factors are:

1. [AI continues from here]"

This skips preambles and ensures consistent formatting.

### Conditional Instructions
"If [condition], then [specific approach]" "If [condition], then [different approach]"

Example: "If the data shows positive trends, focus on growth strategies. If negative, emphasize mitigation tactics."

## Research-Specific Prompt Patterns
### Discovery Pattern

```
Research [topic] and identify:
1. Key components or factors
2. Current best practices
3. Common challenges
4. Recent developments

Focus on information from the last [timeframe].
Include sources where possible.
```

### Analysis Pattern

```
Analyze [subject/data] to determine:
- Main patterns or trends
- Significant anomalies
- Underlying causes
- Implications for [specific context]

Provide confidence levels for your assessments.
Note any limitations in the analysis.
```

### Comparison Pattern

```
Compare [Option A] vs [Option B] vs [Option C] considering:

Criteria to evaluate:
- [Criterion 1 - e.g., cost]
- [Criterion 2 - e.g., effectiveness]
- [Criterion 3 - e.g., implementation difficulty]

For each option provide:
- Strengths
- Weaknesses
- Best use cases
- Overall assessment

Conclude with a recommendation based on [specific priorities].
```

### Synthesis Pattern

```
I have gathered the following information:
[Information from Source 1]
[Information from Source 2]
[Information from Source 3]

Please synthesize this into:
1. Common themes across sources
2. Points of disagreement or contradiction
3. Gaps in the information
4. Overall conclusions
5. Confidence level in conclusions
```

## Quality Control Techniques
### Encourage Appropriate Uncertainty
"If you're not certain about something, please indicate your confidence level rather than guessing." "Flag any assumptions you're making." "Note where more information would be helpful."

### Request Self-Verification
"After providing your answer, double-check it for:

- Logical consistency
- Factual accuracy
- Completeness
- Alignment with requirements"

### Build in Error Handling
"If any part of my request is unclear, please ask for clarification." "If the task can't be completed as specified, explain why and suggest alternatives."

## Common Patterns and Anti-Patterns
### Effective Patterns ✓
**TAP Framework**: Always define Task, Audience, and Purpose **Progressive Disclosure**: Start simple, add complexity gradually **Explicit Formatting**: Show exactly how output should look **Reasoning Space**: Give room for thinking before conclusions **Success Criteria**: Define what good output looks like

### Anti-Patterns to Avoid ✗
- **Vague instructions**: "Make it better" - Better how?
- **Assumed context**: AI doesn't know your implicit knowledge
- **Mixed instructions**: Combining multiple tasks without clear separation
- **Format ambiguity**: Unclear about desired output structure
- **Overloading**: Too many requirements in one prompt
- **Contradictions**: Conflicting instructions within the prompt

## Testing and Iteration Framework
### Define Success Before Prompting
- What specific outcome do you need?
- How will you know if the response is good?
- What would make a response unacceptable?
- What level of detail is appropriate?

### Systematic Testing Approach
1. Start with basic prompt following best practices
2. Test with 2-3 real examples
3. Identify gaps or issues
4. Add specific instructions to address problems
5. Test again with new examples
6. Save successful prompts for reuse

### Common Refinements
- "Be more specific about…"
- "Include more examples of…"
- "Focus less on… and more on…"
- "Adjust the technical level for…"
- "Add sources/citations for…"

## Platform-Specific Considerations
### Primary Platforms
**Web Research Tasks (Perplexity)**

- Your go-to for any web research need
- Always specify timeframe (e.g., "last 12 months")
- Include geographic scope when relevant
- Explicitly request source citations
- Ask for multiple perspectives
- Specify credibility requirements for sources
- Use for pricing, market data, industry research

**Complex Analysis Tasks (Claude)**

- Your primary thinking and synthesis tool
- Leverages ability to handle long context
- Use role assignment for domain expertise
- Encourage systematic multi-step reasoning
- Best for synthesis across multiple sources
- Effective for nuanced strategic thinking
- Use for logic, analysis, and deep reasoning

### Secondary Platform
**Visual Analysis Tasks (ChatGPT)**

- Only use when you have images or photos to analyze
- Be specific about what to examine in images
- Ask for confidence levels on visual assessments
- Request distinction between visible vs inferred
- Ask for systematic examination of each element

### General Platform Matching
- **Research/Current Data**: Perplexity always
- **Complex Reasoning/Synthesis**: Claude always
- **Visual/Images**: ChatGPT only when needed
- **Strategic Analysis**: Claude
- **Market/Pricing Research**: Perplexity
- **Deep Thinking**: Claude
- **Photo Analysis**: ChatGPT

## Quick Reference Checklist
Before sending any prompt:

- [ ] Is the task crystal clear?
- [ ] Have I provided sufficient context?
- [ ] Are requirements explicit and complete?
- [ ] Is the scope well-defined?
- [ ] Have I specified output format?
- [ ] Will this work as a standalone prompt?
- [ ] Have I included examples if helpful?
- [ ] Is there room for step-by-step thinking?
- [ ] Have I avoided ambiguity?
- [ ] Can success be clearly measured?

## Remember
- **Clarity beats brevity** - Better to over-explain than leave ambiguity
- **Examples are powerful** - Show, don't just tell
- **Structure helps** - Organized prompts get organized responses
- **Iteration is normal** - Refine based on results
- **Platform matters** - Match task to tool strengths
- **Context is king** - More relevant context = better output
- **Test and save** - Keep prompts that work well
