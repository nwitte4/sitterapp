require 'rails_helper'

RSpec.describe Parent, type: :model do
  it 'validates all attributes' do
    parent = Parent.new(:email => 'parenty@morty.com')
    expect(parent).to have_attributes(:email => 'parenty@morty.com')
  end

  it 'is not valid without email' do
    parent = Parent.new
    parent.email = "parent@ram.com"
    expect(parent.email).to_not be_nil
  end

  it 'has valid email' do
    parent = Parent.new
    parent.email = "parent@ram.com"
    expect(parent.email).to include('@')
  end

end
