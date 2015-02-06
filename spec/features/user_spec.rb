require_relative '../spec_helper'

describe 'User deck relation' do
  it 'users have decks' do
    expect(User.public_instance_methods.include?(:decks)).to eq(true)
  end

end
