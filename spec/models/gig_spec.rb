require 'rails_helper'

RSpec.describe Gig, type: :model do
  it 'validates all attributes' do
    gig = Gig.new(:cost => 15, :start_time => nil, :end_time => nil, :name => "Date Night", :description => "Bedtimes at 8pm, try not to give too many snacks!", :parent_id => 1, :sitter_id => 1)
    expect(gig).to have_attributes(:cost => 15, :start_time => nil, :end_time => nil, :name => "Date Night", :description => "Bedtimes at 8pm, try not to give too many snacks!", :parent_id => 1, :sitter_id => 1)
  end

  it 'is not valid without cost' do
    gig = Gig.new
    gig.cost = 15
    expect(gig.cost).to_not be_nil
  end

  it 'has a positive number as cost' do
    gig = Gig.new
    gig.cost = 15
    expect(gig.cost).to be > 0
  end

  it 'has a different start time and end time' do
    gig = Gig.new
    gig.start_time = Time.now
    gig.end_time = Time.now + 1.hours
    expect(gig.start_time).not_to be(gig.end_time)
  end

  it 'has a string as a name' do
    gig = Gig.new
    gig.name = "Running Errands"
    expect(gig.name).to be_a(String)
  end

  it 'has a string as a description' do
    gig = Gig.new
    gig.description = "Treat yourself to anything in the fridge! There will be pizza for the kids for dinner."
    expect(gig.description).to be_a(String)
  end

end
