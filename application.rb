require 'net/http'
require 'json'
require 'pry'

# Program Things
require '../issueone'
require '../issuetwo'


# Create a Ruby application which will
### query multiple API endpoints from Github,
### display a list of current issues,
### and prompt the user to close one of these issues.

# Your code must be written in classes and be spread across multiple files. It is
# suggested that you build one class for each API endpoint which you access, and
# then you create instances of each class when you have parameters to make a call
# to that endpoint. If you can think of a better way that still involves classes, though, go for it.

# instance_1 = Issueone.new(argument)
instance_2 = Issuetwo.new


# class Gists
#   attr_reader :user
#   def initialize(user)
#     @user = user
#   end

  def list_issue(issue)
    payload = JSON.generate(gist_issue_1)
    uri = URI("https://github.com/stevefake/2016.03.28/issues/1")
    req = Net::HTTP::Post.new(uri, {'Content-Type' =>'application/json'})
    req.basic_auth ENV['GITHUB_USER'], ENV['GITHUB_PASSWORD']
    req.body = payload
    http = Net::HTTP.new(uri.hostname, uri.port)
    http.use_ssl = true
    http.start
    response = http.request(req)
    return response
  end



#   def list
#     uri = URI("https://github.com/stevefake/2016.03.28/issues/1#{user}/gists")
#     response = Net::HTTP.get(uri)
#     return JSON.parse(response)
#   end
# end
#
# new_gist = {
#   "description" => "the description for this gist",
#   "public" => true,
#   "files" => {
#     "file1.txt" => {
#       "content" => "String file contents"
#     }
#   }
# }

# a = Gists.new("rposborne")
# binding.pry
# puts "hello"
