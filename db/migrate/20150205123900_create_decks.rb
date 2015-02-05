class CreateDecks < ActiveRecord::Migration
  def change
    create_table :decks do |deck|
      deck.string   :description
      deck.string   :name
      deck.integer  :user_id

      deck.timestamps
    end
  end
end
