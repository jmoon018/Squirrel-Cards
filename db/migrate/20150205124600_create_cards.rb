class CreateCards < ActiveRecord::Base
  def change
    create_table :cardss do |card|
      card.string   :question
      card.string   :answer
      card.integer  :deck_id

      card.timestamps
    end
  end
end
