class Card < ActiveRecord::Base
  belongs_to :deck

  def compare(input)
    return self.answer == input
  end
end
