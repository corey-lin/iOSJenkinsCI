# PR is a work in progress and shouldn't be merged yet
warn "PR is classed as Work in Progress" if github.pr_title.include? "[WIP]"

# Mainly to encourage writing up some reasoning about the PR, rather than
# just leaving a title
if github.pr_body.length < 5
  fail "Please provide a summary in the Pull Request description"
end

# Warn when there is a big PR
warn("Big PR") if git.lines_of_code > 500

# Warn when no jira ticket attached
if !github.pr_body.include?("https://jira.grab.com/browse/DRVIOS-")
  warn("Please provide related jira ticket links")
end

# Fail when PRs target to release branch
fail("Don't target PRs to `release` branch") if github.branch_for_base == "release"

# Warn when some files shouldn't change often
warn("The `Driver.xcscheme` was updated") if git.modified_files.include?("Driver.xcscheme")

# swiftlint plugin
swiftlint.config_file = '.swiftlint.yml'
swiftlint.lint_files inline_mode: true

# commits message format check

## format check helper function
def format_check(contents, patterns)
  is_break = contents.any? { |content|
    is_conform = patterns.any? { |pattern|
      content =~ pattern
    }
    !is_conform
  }
end

commit_titles = ["feat", "fix", "docs", "style", "refactor", "perf", "test", "chore"]
title_patterns = commit_titles.map { |title| /^#{title}\(.*\)/ }
messages = git.commits.map { |c| c.message }
is_break_title = format_check(messages, title_patterns)
if is_break_title
  warn("commit message doesn't follow the guideline")
end

# branch name format check
branch_prefixes = ["feature_", "fix_", "refactor_", "merge_"]
prefix_patterns = branch_prefixes.map { |prefix| /^#{prefix}/ }
is_break_name = format_check([github.branch_for_head], prefix_patterns)
if is_break_name
  warn("branch name doesn't follow the guideline")
end
