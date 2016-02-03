require_relative '../test_helper'

class TaskManagagerTest < MiniTest::Test
  include TestHelpers

  def test_can_creat_a_task
    data = {
      title: "some title",
      description: "some description"
    }

    task_manager.create(data)
    task = task_manager.all.last

    assert task.id
    assert_equal "some title", task.title
    assert_equal  "some description", task.description
  end

  def test_it_can_find_all_tasks
    data1 = {
      id: 1,
      title: "some title",
      description: "some description"
    }

    data2 = {
      id: 2,
      title: "another title",
      description: "another description"
    }

    assert_equal 0, task_manager.all.length

    task_manager.create(data1)
    task_manager.create(data2)

    assert_equal 2, task_manager.all.length
    assert_equal "another title", task_manager.all.last.title
  end

  def test_it_can_update_a_task
    data = {
      id: 1,
      title: "some title",
      description: "some description"
    }

    task_manager.create(data)

    assert_equal "some title", task_manager.all.last.title

    updated_data = {
      "title" => "some updated title",
      "description" => "some updated description"
    }

    task_manager.update(updated_data, 1)

    assert_equal "some updated title", task_manager.all.last.title
  end

  def test_it_can_delete_a_task

    data = {
      id: 1,
      title: "some title",
      description: "some description"
    }
    data2 = {
      id: 2,
      title: "another title",
      description: "another description"
    }

    task_manager.create(data)
    task_manager.create(data2)

    assert_equal "another title", task_manager.all.last.title
    assert_equal 2, task_manager.all.length

    task_manager.delete(1)

    assert_equal 1, task_manager.all.length
    assert_equal "another description", task_manager.all.last.description
  end

  def test_it_can_find_a_task
    data = {
      id: 1,
      title: "some title",
      description: "some description"
    }
    data2 = {
      id: 2,
      title: "another title",
      description: "another description"
    }

    task_manager.create(data)
    task_manager.create(data2)

    task = task_manager.find(1)
    task2 = task_manager.find(2)

    assert_equal "some title", task.title
    assert_equal "another description", task2.description
  end
end
