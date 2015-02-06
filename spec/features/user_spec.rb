require_relative '../spec_helper'

describe 'User deck relation' do
  it 'users have decks' do
    expect(User.public_instance_methods.include?(:decks)).to eq(true)
  end

  it 'users can create decks' do
    new_deck = {description: "drinking lots of juice", name: "Beverages"}
    temp_user = User.last
    expect{temp_user.decks.create(new_deck)}.to change{temp_user.decks.count}
  end

  it 'users can create decks' do
    new_deck = {description: "drinking lots of juice", name: "Beverages"}
    temp_user = User.last
    temp_user.decks.create(new_deck)
    expect(temp_user.decks.last.user_id).to eq(temp_user.id)
  end
end
