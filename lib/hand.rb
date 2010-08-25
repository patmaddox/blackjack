class Hand
  def initialize
    @cards = []
  end
  
  def deal(card)
    @cards << card
  end

  def score
    score_of_non_aces + score_of_aces
  end

  def score_of_non_aces
    @cards.reject {|c| c == :ace }.inject(0) do |sum, c|
      sum += if [:king, :queen, :jack].include?(c)
        10
      else
        c
      end
    end
  end

  def score_of_aces
    num_aces = @cards.select {|c| c == :ace }.size
    if num_aces == 0
      0
    elsif score_of_non_aces > 10 ||
        (score_of_non_aces == 10 && num_aces > 1)
      num_aces
    else
      11 + num_aces - 1
    end
  end

  def blackjack?
    score == 21 && @cards.size == 2
  end

  def bonus?
    score == 21 &&
      (@cards.uniq.size == 1 || @cards.max - @cards.min == 2)
  end
end
