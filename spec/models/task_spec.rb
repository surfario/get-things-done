require 'rails_helper'

describe Task do
  describe "task methods" do
    
    before do
      @task = sample_task
      @task.create


    describe "#time_remaining" do
      it "returns the days remaining to complete a task" do
        expect( @task.days_remaining ).to eq(7)
      end  
    end  

    # additional tests: 
    # complete or not? returns false
    # has title, body

  

  end  
end
