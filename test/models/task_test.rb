require 'test_helper'

class TaskTest < ActiveSupport::TestCase
  test "title must not be empty" do
    task = Task.new
    assert task.invalid?
    assert task.errors[:title].any?
  end
end
