# Homebrew Tap for boxesandglue

This tap contains Homebrew formulas for:

- **hobby** - Lua scripting tool for SVG vector graphics using Hobby-Knuth curves
- **glu** - Lua-based PDF creation tool using boxes and glue

## Installation

```bash
brew tap boxesandglue/tap
brew install hobby
brew install glu
```

Or install directly:

```bash
brew install boxesandglue/tap/hobby
brew install boxesandglue/tap/glu
```

## Updating formulas

After creating a new release, update the formula:

1. Download the release archives and compute SHA256:
   ```bash
   shasum -a 256 hobby-darwin-arm64.tar.gz
   ```

2. Update `version` and `sha256` values in `Formula/hobby.rb` or `Formula/glu.rb`

3. Commit and push to this repository
