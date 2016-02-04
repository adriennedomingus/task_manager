require_relative '../test_helper'

class UserCreatesTaskTest < Minitest::Test
  include Capybara::DSL
  include TestHelpers

  def create_task
    data = {
      title: "some title",
      description: "some description"
    }

    task_manager.create(data)
    @task = task_manager.all.last
  end

  def test_with_valid_attributes
    create_task
    #As a user
    #When I visit the index page
    visit "/tasks/#{@task.id}/edit"
    #And I update the title field
    fill_in('task[title]', with: "I updated the title")
    #And I update the description field
    fill_in('task[description]', with: "I updated the description too")
    #And I click the submit button
    click_button('Submit')
    #Then my task should have the new values
    assert_equal '/tasks', current_path
    within("#tasks") do
      assert page.has_content?("I updated the title")
    end
  end
end
