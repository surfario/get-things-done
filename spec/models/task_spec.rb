require 'rails_helper'

describe Task do
  describe "task methods" do
    
    before do
      @task = sample_task
      @task.save
    end  

    describe "#due_date" do
      it "returns the date a task is due" do
        expect( @task.due_date ).to eq( (@task.created_at + 7.days).to_date )
      end  
    end  

    describe "#title" do
      it "returns the title of a task" do
        expect( @task.title ).to eq( "Task title" )
      end  
    end
      
  end  

  def sample_task
    task = Task.new(title: "Task title", body: "Tasks are hard work")
  end
    
end
