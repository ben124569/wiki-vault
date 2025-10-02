---
{}
---
# Prompt Generation Templates

## Platform-Specific Templates

### ChatGPT Prompts - Visual & Technical Analysis

#### Image Analysis Template
```markdown
# Visual Analysis Request

I need your help analyzing [number] images of [subject]. These images show [brief context].

## Your Task:
Please examine each image and identify:
1. What specific issue or condition is visible
2. The likely cause of what you're seeing
3. Severity assessment (minor/moderate/serious)
4. What this might indicate about overall condition

## For Each Issue Found:
- Describe exactly what you see
- Explain what this typically means
- Note any risks or concerns
- Suggest what to investigate further

## Important:
- Be specific about what's visible vs what you're inferring
- Flag anything that could indicate larger problems
- Note if image quality limits your assessment
- I'll be taking your findings to a research coordinator for further investigation

Please analyze each image separately, then provide an overall assessment.
```

#### Technical Assessment Template
```markdown
# Technical Evaluation Request

I need assessment of [technical subject]. Context: [1-2 sentences of situation].

## Please Evaluate:
1. Current condition/status
2. Likely degradation timeline
3. Safety or functionality concerns
4. Repair vs replacement considerations

## Provide:
- Technical explanation in layman's terms
- Risk factors to monitor
- Typical costs for similar issues (if known)
- What a professional would check next

This assessment will inform further research into costs and solutions.
```

### Perplexity Prompts - Research & Data Gathering

#### Cost Research Template
```markdown
# Cost Research Request

I need current pricing information for [specific service/item] in [location].

## Research Requirements:
1. Average cost range in [location/market]
2. Factors that affect pricing
3. Difference between budget/standard/premium options
4. Hidden costs often not included in quotes

## Please Find:
- Recent examples (within last 12 months)
- Multiple source quotes
- Industry standard pricing
- Red flags for overpricing

## Include:
- Source links for all pricing data
- Date of information
- Any regional variations
- Typical payment terms

This data will be used for budget planning and decision-making.
```

#### Market Research Template
```markdown
# Market Analysis Request

Research [specific topic] in [location/industry] for [purpose].

## Key Questions:
1. Current market conditions
2. Recent trends (last 6-12 months)  
3. Typical ranges/standards
4. Common problems or issues

## Data Needed:
- Recent comparable examples
- Expert opinions or industry reports
- Regulatory or compliance factors
- Future outlook/predictions

## Sources:
- Prioritize recent, local information
- Include industry publications
- Government or official data
- Professional associations

Please cite all sources with dates. This research supports a [decision type] decision.
```

#### Comparative Analysis Template
```markdown
# Comparison Research Request

Compare [Option A] vs [Option B] vs [Option C] for [specific use case].

## Comparison Factors:
1. Cost (initial and ongoing)
2. Quality/reliability ratings
3. Common issues reported
4. Long-term value

## Research Needs:
- User reviews and experiences
- Professional evaluations
- Cost-benefit analyses
- Market positioning

## Format:
- Side-by-side comparison
- Pros/cons for each
- Best for specific scenarios
- Red flags or warnings

Include source links and dates. This comparison will inform a selection decision.
```

### Claude Prompts - Analysis & Synthesis

#### Strategic Analysis Template
```markdown
# Strategic Analysis Request

I need analysis of [situation] to inform [decision type].

## Context:
[Provide all relevant background]

## Data Available:
[Summarize research findings so far]

## Analysis Needed:
1. Implications of findings
2. Risk assessment
3. Strategic options
4. Recommended approach

## Consider:
- Short-term vs long-term impacts
- Best case/worst case scenarios
- Alternative strategies
- Decision criteria priorities

Please provide structured analysis with clear reasoning and actionable recommendations.
```

#### Synthesis Template
```markdown
# Research Synthesis Request

I need you to synthesize findings from multiple research phases into actionable insights.

## Research Completed:
Phase 1: [Summary of findings]
Phase 2: [Summary of findings]
Phase 3: [Summary of findings]

## Synthesis Goals:
1. Identify patterns across findings
2. Resolve any conflicting information
3. Assess overall risk/opportunity
4. Generate recommendations

## Deliverable:
- Executive summary
- Key insights with confidence levels
- Risk assessment
- Clear recommendations
- Next steps if proceeding

This synthesis will be presented to [stakeholders] for [decision type].
```

## Prompt Combination Patterns

### Pattern A: Problem Investigation Flow
```
1. ChatGPT: "Analyze these images to identify specific problems..."
2. Perplexity: "Research repair costs for [problems identified]..."
3. Perplexity: "Find specialists who handle [specific issue]..."
4. Claude: "Synthesize findings and assess total risk..."
```

### Pattern B: Market Opportunity Flow
```
1. Perplexity: "Research market size and growth for [industry]..."
2. Perplexity: "Identify top 10 competitors and their positioning..."
3. ChatGPT: "Analyze competitor weaknesses from their reviews..."
4. Claude: "Identify best market entry strategy based on findings..."
```

### Pattern C: Due Diligence Flow
```
1. Perplexity: "Research public records and news about [subject]..."
2. ChatGPT: "Analyze documentation for red flags..."
3. Perplexity: "Find similar cases and their outcomes..."
4. Claude: "Assess total risk and recommend proceed/halt..."
```

## Prompt Optimization Tips

### Make Prompts Self-Contained
- Include necessary context
- Don't assume knowledge from previous prompts
- Specify output format needed
- Indicate how results will be used

### Platform-Specific Optimization

**ChatGPT Optimization:**
- Be explicit about what to look for
- Ask for confidence levels
- Request specific vs general observations
- Use "step by step" for complex analysis

**Perplexity Optimization:**
- Include location/time parameters
- Ask for multiple sources
- Request recent information
- Specify credible source types

**Claude Optimization:**
- Provide comprehensive context
- Ask for reasoning process
- Request alternative perspectives
- Include decision criteria

### Progressive Prompting

**Level 1 - Discovery:**
"What are the main [topics] I should investigate regarding [subject]?"

**Level 2 - Investigation:**
"Research [specific topic] focusing on [particular aspects]..."

**Level 3 - Deep Dive:**
"Investigate why [specific finding] and what it means for [decision]..."

**Level 4 - Synthesis:**
"Given [all findings], what's the best path forward?"

## Quality Control Checklist

Before sending any prompt, verify:

- [ ] Clear, specific task defined
- [ ] Context provided but concise
- [ ] Output format specified
- [ ] Platform appropriate for task
- [ ] Indicates how results will be used
- [ ] Requests sources/confidence where appropriate
- [ ] Self-contained (doesn't need external context)
- [ ] Reasonable scope for single prompt

## Prompt Versioning

When refining prompts based on results:

### Version 1 (Broad Discovery):
"Research options for [general topic]..."

### Version 2 (Targeted Follow-up):
"Focus on [specific option] and investigate [particular concerns]..."

### Version 3 (Final Verification):
"Verify that [specific solution] addresses [confirmed requirements]..."

## Remember

- Each prompt should be copy-paste ready
- Include enough context to stand alone
- Specify how findings will be used
- Match platform strengths to task needs
- Keep prompts focused and actionable