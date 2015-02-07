class Deck < ActiveRecord::Base
  has_many :cards
  belongs_to :user
  attr_reader :muck, :skip_pile, :shuffled
  attr_accessor :guess_count
  def start_game
    @shuffled = self.cards.shuffle
    @muck = []
    @skip_pile = []
    @guess_count = 0
    self.draw_card!
  end

  def draw_card!
    @muck << @shuffled.pop
  end

  def skip!
    @skip_pile << @muck[-1]
  end

  def next_card?
    if !@muck[-1].nil?
      right_answer = @muck[-1].result
    end
    skipped = (@muck[-1] == @skip_pile[-1]) || false
    wrong_overload = @guess_count > 3
    return [right_answer, skipped, wrong_overload].include?(true)
  end


end
