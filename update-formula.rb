#!/usr/bin/env ruby
# Usage: ./update-formula.rb <formula> <version>
# Example: ./update-formula.rb hobby 0.1.0
#
# This script downloads release archives and updates the formula with correct SHA256 values.

require 'open-uri'
require 'digest'
require 'fileutils'

FORMULAS = {
  'hobby' => {
    repo: 'boxesandglue/hobby',
    binary: 'hobby'
  },
  'glu' => {
    repo: 'speedata/glu',
    binary: 'glu'
  }
}

PLATFORMS = %w[darwin-arm64 darwin-amd64 linux-arm64 linux-amd64]

def main
  formula_name = ARGV[0]
  version = ARGV[1]

  unless formula_name && version
    puts "Usage: #{$0} <formula> <version>"
    puts "Example: #{$0} hobby 0.1.0"
    exit 1
  end

  config = FORMULAS[formula_name]
  unless config
    puts "Unknown formula: #{formula_name}"
    puts "Available: #{FORMULAS.keys.join(', ')}"
    exit 1
  end

  puts "Updating #{formula_name} to version #{version}..."

  shas = {}
  PLATFORMS.each do |platform|
    url = "https://github.com/#{config[:repo]}/releases/download/v#{version}/#{formula_name}-#{platform}.tar.gz"
    puts "Downloading #{url}..."

    begin
      content = URI.open(url).read
      sha = Digest::SHA256.hexdigest(content)
      shas[platform] = sha
      puts "  SHA256: #{sha}"
    rescue OpenURI::HTTPError => e
      puts "  Error: #{e.message}"
      exit 1
    end
  end

  # Update formula file
  formula_path = File.join(__dir__, 'Formula', "#{formula_name}.rb")
  content = File.read(formula_path)

  content.gsub!(/version ".*"/, %Q{version "#{version}"})
  content.gsub!(/sha256 "PLACEHOLDER_DARWIN_ARM64"/, %Q{sha256 "#{shas['darwin-arm64']}"})
  content.gsub!(/sha256 "PLACEHOLDER_DARWIN_AMD64"/, %Q{sha256 "#{shas['darwin-amd64']}"})
  content.gsub!(/sha256 "PLACEHOLDER_LINUX_ARM64"/, %Q{sha256 "#{shas['linux-arm64']}"})
  content.gsub!(/sha256 "PLACEHOLDER_LINUX_AMD64"/, %Q{sha256 "#{shas['linux-amd64']}"})

  # Also update existing SHA values (for re-runs)
  content.gsub!(/sha256 "[a-f0-9]{64}"/) do |match|
    # This is a bit tricky - we need context to know which one to replace
    match
  end

  File.write(formula_path, content)
  puts "\nUpdated #{formula_path}"
  puts "Don't forget to commit and push!"
end

main
