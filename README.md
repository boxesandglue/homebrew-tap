# Homebrew Tap for boxesandglue

This tap contains Homebrew formulas for:

- **glu** - Markdown, HTML and Lua to PDF with boxes and glue
- **xts** - XML-based PDF typesetting system
- **hobby** - Lua scripting tool for SVG vector graphics using Hobby-Knuth curves
- **goxslt** - XSLT 3.0 processor written in Go

## Installation

```bash
brew tap boxesandglue/tap
brew install glu
```

Or install directly:

```bash
brew install boxesandglue/tap/glu
brew install boxesandglue/tap/xts
brew install boxesandglue/tap/hobby
brew install boxesandglue/tap/goxslt
```

## Updating formulas

`rake release` in the glu, xts, hobby and goxslt repositories updates the formula: it writes the new `version` and the SHA256 sums of the release archives into `Formula/<name>.rb`. `rake update_formula[VERSION]` does the same step alone. Commit and push the formula to this repository afterwards.
