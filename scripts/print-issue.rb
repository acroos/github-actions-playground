require 'yaml'

issue_body = ARGV[0]
puts "Raw issue body:\n#{issue_body}"

issue_content = YAML.load(issue_body)
puts "Parsed issue body:\n#{issue_content}"

email = issue_content['email']
role = issue_content['role']

puts "Email: #{email}"
puts "Role: #{role}"
