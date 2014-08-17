require 'rails_helper'

RSpec.describe "task_lists/index", :type => :view do
  before(:each) do
    assign(:task_lists, [
      TaskList.create!(
        :name => "Name",
        :user => nil
      ),
      TaskList.create!(
        :name => "Name",
        :user => nil
      )
    ])
  end

  it "renders a list of task_lists" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
