# Basic test requires
require 'minitest/autorun'
require 'minitest/untz'
# require 'rubygems'
# require 'bundler/setup'

# Include the app itself
require '../application'

# Dependenices
# require 'active_record'
# require 'pry'

# Program Things
require '../issueone'
require '../issuetwo'
# require './db_connection.rb'


# Get a file from an HTTP server that requires user and password:
 # curl -u $GITHUB_USER:$GITHUB_PASSWORD

class ApplicationTest < Minitest::Test

# Testing is going to be tricky on this one. You should mock the API responses so
# that you don't need to hit the API every time you run your tests. You should also
# be able to explain WHY this is good.

# create instances of each class when you have parameters to make a call
# to that endpoint
# Test 1:
  def test_instance_of_issues_exist
    # sample_instance = Issueone.new
    assert Issueone
    assert Issuetwo
  end

# can i get state and talk to github?
  def test_issue_can_list_issues
    api = Issueone.new
    assert_equal 2, api.list_issue.size
  end

  def test_issues_keys_can_be_accessed
    api = Issueone.new
    # binding.pry
    assert_equal "body", api.list_issue[0].keys.last
  end

  def test_issues_values_can_be_accessed
    api = Issueone.new
    assert_equal "https://api.github.com/repos/stevefake/2016.03.28/issues/1", api.list_issue[1].values.first
    assert_equal "https://api.github.com/repos/stevefake/2016.03.28/issues/2", api.list_issue[0].values.first
  end

  ### display a list of current issues,
  ### and prompt the user to close one of these issues.


end
