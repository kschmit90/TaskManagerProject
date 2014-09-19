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
  
  it "should not create a new instance if @deadline is not a valid date" do
    a = Project.create({name: "Test", deadline: "apple"})
    expect(a.id).to eq(nil)
  end
  
  it "should set slug param equal to a downcase, no spaces version of the name" do
    a = Project.create({name: "Test", deadline: "2014-09-09"})
    expect(a.to_param).to eq("test")
  end
  
  it "should set the slug equal to a downcase, no spaces version of the name" do
    a = Project.create({name: "Test", deadline: "2014-09-09"})
    expect(a.slug).to eq("test")
  end
end