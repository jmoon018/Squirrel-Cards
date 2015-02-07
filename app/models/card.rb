class Card < ActiveRecord::Base
  belongs_to :deck

  attr_reader :result

  def compare(input)
    @result = self.answer == input
    return @result
  end
end
