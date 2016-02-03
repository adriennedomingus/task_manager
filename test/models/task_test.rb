require_relative '../test_helper'

class TaskTest < Minitest::Test

  def test_task_attributes_assigned_correctly
    data = {
      "id" => 1,
      "title" => "my task",
      "description" => "a description"
    }

    task = Task.new(data)
    assert_equal 1, task.id
    assert_equal "my task", task.title
    assert_equal "a description", task.description 
  end
end
