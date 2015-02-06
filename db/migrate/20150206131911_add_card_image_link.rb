class AddCardImageLink < ActiveRecord::Migration
  def change
    add_column :cards, :image_link, :string, default: "./imgs/default_card.png"
  end
end
