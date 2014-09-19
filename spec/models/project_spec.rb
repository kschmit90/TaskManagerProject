require 'rails_helper'

RSpec.describe Project, :type => :model do
  
  it "should return 'complete' if @complete is true" do
    a = Project.create({name: "Test", deadline: "2014-09-09", complete: true})
    expect(a.completed).to eq("complete")
  end
  
  it "should return 'not complete' if @complete is false" do
    a = Project.create({name: "Test", deadline: "2014-09-09", complete: false})
    expect(a.completed).to eq("not complete")
  end
end