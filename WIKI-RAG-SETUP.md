# Wiki-Vault RAG System - Usage Guide

## 🎯 What This Is
A complete RAG (Retrieval-Augmented Generation) system that makes your personal wiki searchable using AI. Built from the Universal YouTube Knowledge Base system and adapted for Obsidian vault content.

## 📊 Current Setup Stats
- **59 documents** from your wiki-vault
- **237 total items** indexed with OpenAI embeddings
- **160 content chunks** (optimized for search)
- **19 concepts** extracted and indexed
- **High-quality semantic search** using `text-embedding-3-large`

## 🚀 How to Use

### Basic Search
```bash
cd ~/wiki-vault
source venv/bin/activate
python scripts/query.py "your search query"
```

**Examples:**
```bash
python scripts/query.py "Claude Code hooks"
python scripts/query.py "MCP servers" 
python scripts/query.py "content creation strategies"
python scripts/query.py "prompt engineering"
```

### AI-Powered Q&A
```bash
python scripts/ask_expert.py
```
Then ask natural language questions. This uses your search results + OpenAI for conversational answers.

### Interactive Mode
```bash
python scripts/query.py
# Then try these commands:
concepts           # Browse all extracted concepts
video "MCP"        # Find content about specific topics
top 10            # Get top results for last search
```

## 📁 What Content is Indexed

Your RAG system includes all markdown files from:
- `md-vault/knowledge-files/claude-code/` - Claude Code guides
- `md-vault/knowledge-files/content-creation/` - Social media frameworks  
- `md-vault/knowledge-files/prompt-writing/` - Prompt engineering guides
- `md-vault/knowledge-files/perplexity/` - Research automation
- `md-vault/custom-instructions/` - AI instructions
- `md-vault/prompts/` - Prompt templates
- Any other `.md` files in `md-vault/`

## 🔧 System Architecture

### Files Structure
```
~/wiki-vault/
├── md-vault/           # Your Obsidian content (source)
├── chroma_db/          # Vector database (gitignored)
├── scripts/            # Query and ingestion tools
├── lib/                # RAG engine
├── config.yaml         # System configuration
├── .env               # OpenAI API key
└── venv/              # Python environment
```

### Key Components
- **Document Processor** - Reads all markdown recursively
- **Smart Chunker** - Creates searchable chunks preserving context
- **OpenAI Embeddings** - Uses `text-embedding-3-large` for best quality
- **ChromaDB** - Vector database for similarity search
- **Query Engine** - Semantic search with relevance scoring

## 🔄 Re-ingesting Content

When you add new content to your wiki:

```bash
cd ~/wiki-vault
source venv/bin/activate
rm -rf chroma_db        # Clear old database
python scripts/ingest.py   # Re-process everything
```

**Ingestion Process:**
1. Scans all `.md` files in `md-vault/`
2. Extracts concepts, quotes, and sections  
3. Creates smart chunks (1500 tokens with 300 overlap)
4. Generates OpenAI embeddings
5. Stores in ChromaDB for fast retrieval

## ⚙️ Configuration

### OpenAI Settings (config.yaml)
```yaml
embeddings:
  provider: "openai"
  model: "text-embedding-3-large"  # Best quality
  dimensions: 3072
```

### Chunking Settings
```yaml
chunking:
  notes_chunk_size: 1500      # Good for documentation
  notes_chunk_overlap: 300    # Preserve context
  preserve_sections: true     # Keep headers intact
```

## 🐛 Troubleshooting

### "Collection does not exist" Error
```bash
# Database not created yet - run ingestion first
python scripts/ingest.py
```

### "No OpenAI API Key" Error  
```bash
# Check your .env file has:
echo "OPENAI_API_KEY=sk-proj-..." >> .env
```

### Import Errors
```bash
# Always activate virtual environment first
source venv/bin/activate
```

## 💡 Tips for Better Search

### Good Search Queries
- **Specific topics**: "MCP server development"
- **How-to questions**: "how to write hooks"
- **Concepts**: "content strategy frameworks"

### Search Results Interpretation
- **50%+ relevance**: Very relevant match
- **40-50%**: Moderately relevant
- **<40%**: May be tangentially related

## 🔮 Future Enhancements

### Potential Improvements
1. **MCP Server Integration** - Make it available to Claude Desktop
2. **Better Output Formatting** - Custom response templates
3. **Tag-based Filtering** - Search within specific categories
4. **Auto-sync** - Watch for file changes and re-index
5. **Web Interface** - Gradio UI for easier searching

### Adding MCP Integration
To make this available in Claude Desktop, uncomment the MCP section in `config.yaml` and add to your Claude Desktop config.

## 📝 Built From
- Universal YouTube Knowledge Base System
- ChromaDB for vector storage
- OpenAI embeddings for semantic search
- Smart chunking for context preservation
- Recursive markdown processing for Obsidian vaults

---

**Your personal AI-powered knowledge assistant is ready!** 🧠✨