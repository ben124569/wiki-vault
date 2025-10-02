---
created: 2025-09-02
modified: 2025-09-14
note-type:
aliases: []
cssclasses: doc
tags: []
title: Claude Code Research Perplexity Automation Prompt
---
# Claude Code Research Perplexity Automation Prompt

>  **Workflow**:
---
# Claude Code Research Automation Task
## Your Mission
You need to automate research on Claude Code advanced features using Playwright MCP to interact with Perplexity. You'll read prompts from a file, open multiple research tabs, wait for results, and save everything to a designated folder.

## Prerequisites
- Playwright MCP must be configured and working
- User should be logged into Perplexity.ai
- A file called `prompts.md` should exist in your working directory
- Create a folder called `research_results` to save all outputs

## Task Steps
### Step 1: Initial Setup
1. Look for the file `prompts.md` in the current directory (or ask user for location)
2. Read and parse the prompts file to extract the 5 research prompts
3. Create a folder called `research_results` if it doesn't exist
4. Use Playwright MCP to navigate to <https://www.perplexity.ai>
5. Take a snapshot to confirm the page loaded
6. Verify the user is logged in (look for account avatar/menu)

### Step 2: Parse the Prompts File
The prompts file contains sections for:
- **Sub-Agent Context Sharing Research**
- **Hook Payload Schemas Research**
- **MCP Custom Development Guide**
- **Complete Environment Variables**
- **Advanced Output Streaming** (or similar streaming topic)

Extract the prompt text from each section (look for content between triple backticks in the "Targeted Deep-Dive Prompts" section).

### Step 3: Process Each Research Topic
For EACH of the 5 prompts you extracted:
1. Open a new tab (or use current for first one)
2. Navigate to <https://www.perplexity.ai>
3. Click on "Research" mode (radio button)
4. Input the research prompt you extracted
5. Press Enter to submit
6. Wait for research to begin processing (look for loading indicators)
7. Note the URL of the research
8. Move to next topic

### Step 4: Wait for Results
1. After submitting all 5 prompts in separate tabs
2. Wait approximately 5-10 minutes for research to complete
3. Cycle through tabs every 2 minutes to check status
4. Look for completion indicators:
   - No loading spinners
   - Full content visible
   - "Sources" section populated
   - No "generating" messages

### Step 5: Save Results
For each completed research tab:
1. Take a full page screenshot and save to `research_results/` folder:
   - `1_subagents_screenshot.png`
   - `2_hooks_screenshot.png`
   - `3_mcp_screenshot.png`
   - `4_config_screenshot.png`
   - `5_streaming_screenshot.png`

2. Try to extract and save the text content:
   - Use browser evaluation to get the main content
   - Save as markdown files:
	 - `1_subagents_results.md`
	 - `2_hooks_results.md`
	 - `3_mcp_results.md`
	 - `4_config_results.md`
	 - `5_streaming_results.md`

3. Save the page as HTML if possible:
   - `1_subagents.html`
   - `2_hooks.html`
   - `3_mcp.html`
   - `4_config.html`
   - `5_streaming.html`

### Step 6: Create Summary Report
Create `research_results/summary.md` containing:

```markdown
# Claude Code Research Automation Results
Generated: [timestamp]

## Research Topics Submitted
1. Sub-Agent Context Sharing - [URL]
2. Hook Payload Schemas - [URL]
3. MCP Custom Development - [URL]
4. Complete Environment Variables - [URL]
5. Advanced Output Streaming - [URL]

## Files Saved
- Screenshots: [list files]
- Markdown extracts: [list files]
- HTML saves: [list files]

## Status
- Total prompts submitted: 5
- Successfully completed: [number]
- Errors encountered: [list any]

## Notes
[Any issues or observations]
```

## Important Notes
- Read prompts from the `prompts.md` file - don't hardcode them
- Save everything to `research_results/` folder for organization
- If Perplexity shows CAPTCHA, alert the user and wait
- If Research mode isn't available, use regular search mode
- Take screenshots even if text extraction fails
- Continue with other tabs if one fails

## File Organization

```
research_results/
├── summary.md
├── 1_subagents_screenshot.png
├── 1_subagents_results.md
├── 1_subagents.html
├── 2_hooks_screenshot.png
├── 2_hooks_results.md
├── 2_hooks.html
├── 3_mcp_screenshot.png
├── 3_mcp_results.md
├── 3_mcp.html
├── 4_config_screenshot.png
├── 4_config_results.md
├── 4_config.html
├── 5_streaming_screenshot.png
├── 5_streaming_results.md
└── 5_streaming.html
```

## Success Criteria
- All 5 research prompts from file submitted to Perplexity
- Results saved to `research_results/` folder
- Summary report created
- User can zip the folder and provide back to original conversation

## Error Handling
- If prompts file not found: Ask user for correct path
- If login required: Alert user and pause
- If rate limited: Wait 60 seconds and retry
- If tab crashes: Note in summary and continue
- If extraction fails: Rely on screenshots

---

**Start by** reading the prompts file and confirming you can extract all 5 research prompts. Show the user what you found before proceeding.
