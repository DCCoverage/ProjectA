require 'test_helper'
require 'example'

class ExampleTest < Test::Unit::TestCase
  def test_example
    assert_equal(Project::Example::VERSION, '0.1.0')
  end
end
