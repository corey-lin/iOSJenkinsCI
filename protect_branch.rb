#!/usr/bin/env ruby

require 'Octokit'

if ARGV.length != 1 
  puts "Usage: #{$PROGRAM_NAME} github_access_token"
  exit
end

client = Octokit::Client.new(:access_token => ARGV[0])

branches = client.branches('corey-lin/iOSJenkinsCI')
branches.each do |b|
  puts b.name unless b.protected
  unless b.protected
    client.protect_branch('corey-lin/iOSJenkinsCI', b.name, required_status_checks: { :strict => false, :contexts => ['danger/danger'] }, :enforce_admins => false)
  end
end

