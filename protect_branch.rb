#!/usr/bin/env ruby

require 'Octokit'

client = Octokit::Client.new(:access_token => "b64c5c029dba728128dbc0b6d9a9e0382644cac9")

#branches = client.branches('corey-lin/iOSJenkinsCI', :accept => 'application/vnd.github.loki-preview+json')
branches = client.branches('corey-lin/iOSJenkinsCI')
puts branches.inspect
branches.each do |b|
  puts b.name unless b.protected
  unless b.protected
    client.protect_branch('corey-lin/iOSJenkinsCI', b.name, required_status_checks: { :strict => false, :contexts => ['danger/danger'] }, :enforce_admins => false)
    response = Octokit.last_response
    puts response.inspect
    break
  end
end

