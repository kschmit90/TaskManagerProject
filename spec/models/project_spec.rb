require 'rails_helper'
require '../spec_helper.rb'

RSpec.describe Project, :type => :model do
  
  it "should return 'complete' if @complete is true" do
    a = Project.create({complete: true})
    expect(a.completed).to eq("complete")
  end
  
  it "should return 'not complete' if @complete is false" do
    a = Project.create({complete: false})
    expect(a.completed).to eq("not complete")
  end
end