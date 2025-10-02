# 🚀 Universal YouTube Knowledge Base System

Transform any YouTube creator's content into a searchable AI knowledge base with OpenAI's best embeddings.

## ✨ Features

- **Works with ANY YouTube channel** - Business, tech, education, creative, anything
- **Dual content support** - Process structured notes AND/OR raw transcripts
- **Best-in-class embeddings** - OpenAI's `text-embedding-3-large` for superior search
- **Smart chunking** - Preserves context and meaning
- **Multiple search modes** - Semantic, concepts, quotes, metadata
- **100% reusable** - Just copy, configure, and run

## 📋 Prerequisites

- Python 3.8+
- OpenAI API key (for best results)
- Your YouTube content as markdown files

## 🎯 Quick Start (3 Commands)

```bash
# 1. Add your content
cp -r /path/to/your/notes/* source-notes/
cp -r /path/to/your/transcripts/* md-transcripts/

# 2. Configure (edit config.yaml with your creator info)
nano config.yaml

# 3. Run setup
./setup.sh
```

That's it! Your knowledge base is ready.

## 📁 Folder Structure

```
knowledge-color-base/           # Or rename to your-topic-base/
├── source-notes/               # Your structured notes go here
├── md-transcripts/             # Your transcripts go here
├── config.yaml                 # Main configuration
├── .env                        # API keys (create from .env.example)
├── setup.sh                    # One-click setup
├── requirements.txt            # Python dependencies
│
├── scripts/                    # User-facing tools
│   ├── ingest.py              # Process content into database
│   ├── query.py               # Search the knowledge base
│   ├── ask_expert.py          # Natural language Q&A
│   ├── full_notes.py          # Read complete notes
│   └── test_system.py         # Verify everything works
│
├── lib/                        # Core library (don't modify)
│   ├── processor.py           # Document processing
│   ├── chunker.py             # Smart chunking
│   ├── embedder.py            # Embedding creation
│   └── retriever.py           # Search functionality
│
└── chroma_db/                  # Vector database (auto-created)
```

## 🔧 Detailed Setup

### Step 1: Prepare Your Content

**The system accepts ANY markdown files with YAML frontmatter!** No specific format required.

**Minimum Requirements:**
- Markdown file (.md extension)
- YAML frontmatter with at least a `title`
- Some content after the frontmatter

**Example Source Note** (`source-notes/*.md`):
```markdown
---
title: "How to Color Grade Like a Pro"
channel: "Color Grading Pro"
---

Any format you want! Structured notes, bullet points, paragraphs, etc.
The system will intelligently extract concepts, quotes, and key points.
```

**Example Transcript** (`md-transcripts/*.md`):
```markdown
---
title: "Film Emulation Tutorial"
channel: "Cullen Kelly"
video_url: "https://youtube.com/watch?v=abc123"
---

## Transcript
Just paste your entire transcript here. Can be one massive line or formatted with timestamps - the system handles both!
```

**Real-World Example (Your Format Works!):**
```markdown
---
title: "Grade School: Film & Film Emulation"
channel: "Cullen Kelly"
video_url: "https://www.youtube.com/watch?v=1gvSq1asezU"
video_id: "1gvSq1asezU"
duration_seconds: 4260
---

## Transcript

and we're live for a very special christmas eve edition... [entire transcript as single line]
```

**The system automatically handles:**
- ✅ Any YAML fields (uses what's available, ignores what's not)
- ✅ Structured sections OR raw text
- ✅ Single-line massive transcripts
- ✅ Timestamped transcripts `[MM:SS]` or plain text
- ✅ Notes with or without specific sections
- ✅ Mixed formats in the same folder

### Step 2: Configure Your Knowledge Base

Edit `config.yaml`:

```yaml
knowledge_base:
  name: "Color Grading Expert"        # Your KB name
  creator: "Qazi"                     # Creator's name
  topic: "color grading"               # Main topic
  description: "Professional color grading techniques"

# Rest of config has sensible defaults
```

### Step 3: Set Up OpenAI API Key

```bash
# Option 1: Add to .env file
cp .env.example .env
echo "OPENAI_API_KEY=sk-your-key-here" >> .env

# Option 2: Copy from another project
cp ~/other-project/.env .env
```

### Step 4: Run Setup

```bash
./setup.sh
```

This will:
1. Check Python version
2. Create virtual environment
3. Install dependencies
4. Process all your content
5. Create embeddings with OpenAI
6. Build the searchable database

## 💻 Usage

### Search Your Knowledge Base

```bash
# Activate virtual environment
source venv/bin/activate

# Interactive search
python scripts/query.py

# Example queries:
> color theory basics
> how to match skin tones
> best LUTs for outdoor scenes
```

### Query Examples

**For Color Grading:**
```python
python scripts/query.py "how to create cinematic look"
python scripts/query.py "color grading for skin tones"
python scripts/query.py "day for night technique"
```

**For Business Content:**
```python
python scripts/query.py "how to price services"
python scripts/query.py "customer acquisition strategies"
python scripts/query.py "scaling to 7 figures"
```

### Advanced Features

**List All Concepts:**
```bash
python scripts/query.py
> concepts
```

**Find Specific Video:**
```bash
python scripts/query.py
> video Color Theory Tutorial
```

**Batch Queries:**
```bash
python scripts/query.py "LUTs" "color wheels" "skin tones"
```

## 🎨 Customization

### For Different Topics

Just change `config.yaml`:

**For Business Content:**
```yaml
knowledge_base:
  name: "Business Strategy Expert"
  creator: "Alex Hormozi"
  topic: "business growth"
```

**For Cooking:**
```yaml
knowledge_base:
  name: "Culinary Expert"
  creator: "Gordon Ramsay"
  topic: "professional cooking"
```

**For Programming:**
```yaml
knowledge_base:
  name: "Python Expert"
  creator: "Corey Schafer"
  topic: "Python programming"
```

### Embedding Options

**Best Quality (OpenAI):**
```yaml
embeddings:
  provider: "openai"
  model: "text-embedding-3-large"  # Best
  dimensions: 3072
```

**Free Local Option:**
```yaml
embeddings:
  provider: "local"
  model: "all-MiniLM-L6-v2"  # Good enough
```

## 📊 What You Get

After ingestion, your knowledge base will have:

- **Searchable chunks** - All content split intelligently
- **Concept index** - Every concept/framework tracked
- **Quote database** - Notable quotes with timestamps
- **Video metadata** - Summaries and key points
- **Semantic search** - Find content by meaning, not just keywords

## 🚀 Advanced Usage

### Use Multiple Knowledge Bases

```bash
# Copy entire folder for new topic
cp -r knowledge-color-base knowledge-cooking-base
cd knowledge-cooking-base

# Add new content
rm -rf source-notes/* md-transcripts/*
cp -r ~/cooking-notes/* source-notes/

# Update config
nano config.yaml  # Change to cooking creator

# Run setup
./setup.sh
```

### Export Results

```python
# In python scripts/query.py
results = query_tool.search("your query")
# Results are JSON-serializable
```

## 🔧 Manual Setup Instructions

If the automated setup script isn't working, follow these manual steps:

### Step 1: Create Virtual Environment
```bash
# Create virtual environment
python3 -m venv venv

# Activate it (Mac/Linux)
source venv/bin/activate

# Activate it (Windows)
# venv\Scripts\activate
```

### Step 2: Install Dependencies
```bash
# Upgrade pip first
pip install --upgrade pip

# Install all requirements
pip install -r requirements.txt

# If you get errors, install core packages first:
pip install chromadb==0.5.20
pip install openai==1.58.1
pip install tiktoken==0.8.0
pip install pyyaml==6.0.2
pip install python-frontmatter==1.1.0
pip install python-dotenv==1.0.1
pip install tqdm==4.67.1
pip install rich==13.9.4
pip install sentence-transformers==3.3.1
```

### Step 3: Set Up OpenAI API Key
```bash
# Option 1: Create .env file
cp .env.example .env
# Then edit .env and add your key:
# OPENAI_API_KEY=sk-your-actual-key-here

# Option 2: Export directly (temporary)
export OPENAI_API_KEY="sk-your-actual-key-here"

# Option 3: Copy from another project
cp ~/path/to/other/project/.env .env
```

### Step 4: Add Your Content
```bash
# Create directories if they don't exist
mkdir -p source-notes md-transcripts

# Copy your markdown files
cp -r /path/to/your/notes/*.md source-notes/
cp -r /path/to/your/transcripts/*.md md-transcripts/

# Verify files are there
ls source-notes/
ls md-transcripts/
```

### Step 5: Configure for Your Creator
Edit `config.yaml`:
```yaml
knowledge_base:
  name: "Your Knowledge Base Name"
  creator: "Creator Name"
  topic: "main topic"
```

### Step 6: Run Ingestion Manually
```bash
# Make sure you're in the virtual environment
source venv/bin/activate

# Run the ingestion script
python scripts/ingest.py

# This will:
# 1. Process all markdown files
# 2. Extract concepts and quotes
# 3. Create smart chunks
# 4. Generate embeddings
# 5. Store in Chroma database
```

### Step 7: Test the System
```bash
# Test that everything works
python scripts/test_system.py

# Try a search
python scripts/query.py
# Then type: test
```

### Common Issues and Fixes

#### "ModuleNotFoundError: No module named 'lib.retriever'"
This is already fixed. If you see it again:
```bash
# The lib/__init__.py file had a wrong import
# It's been corrected to not import retriever
```

#### "No module named 'chromadb'"
```bash
# Make sure you're in the virtual environment
source venv/bin/activate
# Then install
pip install chromadb==0.5.20
```

#### "OPENAI_API_KEY not found"
```bash
# Check if .env exists and has your key
cat .env
# Should show: OPENAI_API_KEY=sk-...

# Or export it directly
export OPENAI_API_KEY="sk-your-key"
```

#### "No documents found"
```bash
# Check your content directories
ls source-notes/*.md
ls md-transcripts/*.md

# Files must be .md with YAML frontmatter:
---
title: "Video Title"
video_id: "abc123"
---
Content here...
```

#### "Permission denied"
```bash
# Make scripts executable
chmod +x setup.sh
chmod +x scripts/*.py
```

## 🐛 Troubleshooting

### "No OpenAI API key found"
- Create `.env` file with `OPENAI_API_KEY=sk-...`
- Or use local embeddings (lower quality)

### "No documents found"
- Ensure markdown files are in `source-notes/` or `md-transcripts/`
- Check file extensions are `.md`

### "Import error"
```bash
source venv/bin/activate  # Always activate venv first
pip install -r requirements.txt  # Reinstall if needed
```

## 💰 Cost Estimate

With OpenAI embeddings:
- **Initial ingestion**: ~$2-5 for 500 videos
- **Queries**: ~$0.0001 each
- **Worth it** for 10x better search quality

## 🎯 Tips for Best Results

1. **Use both sources** - Source notes for structure, transcripts for exact quotes
2. **Clean your data** - Remove duplicate content before ingesting
3. **Configure personality** - Adjust `config.yaml` for your creator's style
4. **Batch similar content** - Group related videos for better concept extraction

## 📚 Example Queries by Topic

**Color Grading:**
- "How to match footage from different cameras"
- "Best practices for HDR grading"
- "Creating consistent look across scenes"

**Business:**
- "Strategies for increasing customer LTV"
- "How to structure high-ticket offers"
- "Scaling operations efficiently"

**Cooking:**
- "Knife skills for vegetables"
- "Temperature control for perfect steak"
- "Balancing flavors in sauces"

## 🤝 Support

1. Check this README first
2. Run `python scripts/test_system.py` to diagnose issues
3. Ensure your markdown follows the format shown above

## 📄 License

MIT - Use this for any YouTube creator's content!

---

**Built to be universal** - Works with any YouTube channel, any topic, any creator. Just add your content and go! 🚀