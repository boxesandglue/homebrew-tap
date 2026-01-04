#!/usr/bin/env ruby
# Usage: ./update-formula.rb [formula]
# Without arguments: checks all formulas and updates those with new releases
# With argument: updates only the specified formula
#
# This script checks GitHub for new releases and updates formulas automatically.

require 'open-uri'
require 'digest'
require 'json'

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

def get_local_version(formula_name)
  formula_path = File.join(__dir__, 'Formula', "#{formula_name}.rb")
  return nil unless File.exist?(formula_path)

  content = File.read(formula_path)
  match = content.match(/version "([^"]+)"/)
  match ? match[1] : nil
end

def get_latest_release(repo)
  url = "https://api.github.com/repos/#{repo}/releases/latest"
  begin
    response = URI.open(url, "Accept" => "application/vnd.github.v3+json").read
    data = JSON.parse(response)
    # Remove 'v' prefix if present
    data['tag_name']&.sub(/^v/, '')
  rescue OpenURI::HTTPError => e
    puts "  Error fetching release info: #{e.message}"
    nil
  end
end

def download_shas(formula_name, repo, version)
  shas = {}
  PLATFORMS.each do |platform|
    url = "https://github.com/#{repo}/releases/download/v#{version}/#{formula_name}-#{platform}.tar.gz"
    puts "  Downloading #{platform}..."

    begin
      content = URI.open(url).read
      sha = Digest::SHA256.hexdigest(content)
      shas[platform] = sha
      puts "    SHA256: #{sha}"
    rescue OpenURI::HTTPError => e
      puts "    Error: #{e.message}"
      return nil
    end
  end
  shas
end

def update_formula(formula_name, version, shas)
  formula_path = File.join(__dir__, 'Formula', "#{formula_name}.rb")
  content = File.read(formula_path)

  # Update version
  content.gsub!(/version "[^"]+"/, %Q{version "#{version}"})

  # Update SHA256 values by matching the platform context
  platforms_map = {
    'darwin-arm64' => /(\s+url\s+"[^"]*darwin-arm64[^"]*"\s+sha256\s+")[^"]+(")/,
    'darwin-amd64' => /(\s+url\s+"[^"]*darwin-amd64[^"]*"\s+sha256\s+")[^"]+(")/,
    'linux-arm64'  => /(\s+url\s+"[^"]*linux-arm64[^"]*"\s+sha256\s+")[^"]+(")/,
    'linux-amd64'  => /(\s+url\s+"[^"]*linux-amd64[^"]*"\s+sha256\s+")[^"]+(")/
  }

  platforms_map.each do |platform, regex|
    content.gsub!(regex, "\\1#{shas[platform]}\\2")
  end

  File.write(formula_path, content)
  puts "  Updated #{formula_path}"
end

def check_and_update(formula_name, config, force_version: nil)
  puts "\nChecking #{formula_name}..."

  local_version = get_local_version(formula_name)
  puts "  Local version: #{local_version || 'not found'}"

  if force_version
    latest_version = force_version
    puts "  Forcing version: #{latest_version}"
  else
    latest_version = get_latest_release(config[:repo])
    puts "  Latest release: #{latest_version || 'not found'}"
  end

  return false unless latest_version

  if local_version == latest_version && !force_version
    puts "  Already up to date."
    return false
  end

  puts "  Updating to #{latest_version}..."
  shas = download_shas(formula_name, config[:repo], latest_version)
  return false unless shas

  update_formula(formula_name, latest_version, shas)
  true
end

def main
  formula_filter = ARGV[0]
  force_version = ARGV[1]

  if formula_filter && !FORMULAS.key?(formula_filter)
    puts "Unknown formula: #{formula_filter}"
    puts "Available: #{FORMULAS.keys.join(', ')}"
    exit 1
  end

  updated = []

  formulas_to_check = formula_filter ? { formula_filter => FORMULAS[formula_filter] } : FORMULAS

  formulas_to_check.each do |name, config|
    if check_and_update(name, config, force_version: formula_filter ? force_version : nil)
      updated << name
    end
  end

  puts "\n" + "=" * 50
  if updated.empty?
    puts "All formulas are up to date."
  else
    puts "Updated: #{updated.join(', ')}"
    puts "Don't forget to commit and push!"
  end
end

main
