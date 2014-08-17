require 'rails_helper'

RSpec.describe "task_lists/edit", :type => :view do
  before(:each) do
    @task_list = assign(:task_list, TaskList.create!(
      :name => "MyString",
      :user => nil
    ))
  end

  it "renders the edit task_list form" do
    render

    assert_select "form[action=?][method=?]", task_list_path(@task_list), "post" do

      assert_select "input#task_list_name[name=?]", "task_list[name]"

      assert_select "input#task_list_user_id[name=?]", "task_list[user_id]"
    end
  end
end
