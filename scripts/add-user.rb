require 'yaml'

def parse_issue(issue_body)
  YAML.safe_load(issue_body)
rescue => e
  puts "Error parsing issue body: #{e.message}"
  raise
end

def update_test_json(issue_content)
  test_json = File.read('test.json')
  test_json_hash = JSON.parse(test_json)
  test_json_hash['users'].push(issue_content)
  File.write('test.json', JSON.pretty_generate(test_json_hash))
rescue => e
  puts "Error updating test.json: #{e.message}"
  raise
end

issue_content = parse_issue(ARGV[0])
update_test_json(issue_content)
puts 'done.'
