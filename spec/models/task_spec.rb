require 'rails_helper'

RSpec.describe Task, :type => :model do
  
  it "should return 'complete' if @complete is true" do
    a = Task.create({name: "Test", deadline: "2014-09-09", complete: true})
    expect(a.completed).to eq("complete")
  end

  it "should return 'not complete' if @complete is false" do
    a = Task.create({name: "Test", deadline: "2014-09-09", complete: false})
    expect(a.completed).to eq("not complete")
  end
end