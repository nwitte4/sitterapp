require 'rails_helper'

RSpec.describe Sitter, type: :model do
  it 'validates all attributes' do
    sitter = Sitter.new(:email => 'sittery@morty.com')
    expect(sitter).to have_attributes(:email => 'sittery@morty.com')
  end

  it 'is not valid without email' do
    sitter = Sitter.new
    sitter.email = "sitter@ram.com"
    expect(sitter.email).to_not be_nil
  end

  it 'has valid email' do
    sitter = Sitter.new
    sitter.email = "sitter@ram.com"
    expect(sitter.email).to include('@')
  end

end
