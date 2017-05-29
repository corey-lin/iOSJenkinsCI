
# swiftlint plugin
#swiftlint.lint_files inline_mode: true

# commits message format check

# format check helper function
def format_check(contents, patterns)
  is_break = contents.any? { |content|
    is_conform = patterns.any? { |pattern|
      content =~ pattern
    }
    !is_conform
  }
end
puts "start checking commit messages"
commit_titles = ["feat","feature", "fix", "docs", "style", "refactor", "perf", "test", "chore"]
title_patterns = commit_titles.map { |title| /^#{title}\(.*\)/ }
messages = git.commits.map { |c| c.message }
is_break_title = format_check(messages, title_patterns)
if is_break_title
  warn("commit message doesn't follow the guideline")
end

#puts "start checking branch names"
## branch name format check
#branch_prefixes = ["feature_", "fix_", "refactor_", "merge_"]
#prefix_patterns = branch_prefixes.map { |prefix| /^#{prefix}/ }
#is_break_name = format_check([github.branch_for_head], prefix_patterns)
#if is_break_name && !github.pr_json["fork"]
#  warn("branch name doesn't follow the guideline")
#end

github.pr_json.each do |key, value|
  puts "#{key}:#{value.to_s}"
end
