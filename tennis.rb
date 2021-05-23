
class TennisGame1

  def initialize(player1Name, player2Name)
    @player1Name = player1Name
    @player2Name = player2Name
    @p1points = 0
    @p2points = 0
  end

  def won_point(playerName)
    if playerName == "player1"
      @p1points += 1
    else
      @p2points += 1
    end
  end

  def score
    if (@p1points==@p2points)
      return score_of_draw
    elsif (@p1points>=4 or @p2points>=4)
      return score_after_deuce
    else
      return score_of(@p1points) + "-" + score_of(@p2points)
    end
  end

  private
  def score_of_draw
    {
      0 => "Love-All",
      1 => "Fifteen-All",
      2 => "Thirty-All",
    }.fetch(@p1points, "Deuce")
  end

  def score_of(points)
    {
      0 => "Love",
      1 => "Fifteen",
      2 => "Thirty",
      3 => "Forty",
    }[points]
  end

  def score_after_deuce
    minusResult = @p1points-@p2points
    if (minusResult==1)
      return "Advantage player1"
    elsif (minusResult ==-1)
      return "Advantage player2"
    elsif (minusResult>=2)
      return "Win for player1"
    else
      return"Win for player2"
    end
  end
end

class TennisGame2
  def initialize(player1Name, player2Name)
    @player1Name = player1Name
    @player2Name = player2Name
    @p1points = 0
    @p2points = 0
  end

  def won_point(playerName)
    if playerName == @player1Name
      p1Score()
    else
      p2Score()
    end
  end

  def score
    if (@p1points == @p2points)
      return score_of_draw
    end
    if (@p1points <= 3 and @p2points <= 3)
      return score_of(@p1points) + "-" + score_of(@p2points)
    end
    return score_after_deuce
  end

  private
  def p1Score
    @p1points +=1
  end

  def p2Score
    @p2points +=1
  end

  def score_of(point)
    if (point == 0)
      return "Love"
    elsif (point == 1)
      return "Fifteen"
    elsif (point == 2)
      return "Thirty"
    elsif (point == 3)
      return "Forty"
    end
  end

  def score_of_draw
    if (@p1points < 3)
      return score_of(@p1points) + "-All"
    else
      return "Deuce"
    end
  end

  def score_after_deuce
    if (@p1points>=4 and (@p1points-@p2points)>=2)
      return "Win for " + @player1Name
    end
    if (@p2points>=4 and (@p2points-@p1points)>=2)
      return "Win for " + @player2Name
    end
    if (@p1points > @p2points and @p2points >= 3)
      return "Advantage " + @player1Name
    end
    if (@p2points > @p1points and @p1points >= 3)
      return "Advantage " + @player2Name
    end
  end
end

class TennisGame3
  def initialize(player1Name, player2Name)
    @player1Name = player1Name
    @player2Name = player2Name
    @points1 = 0
    @points2 = 0
  end

  def won_point(playerName)
    if playerName == @player1Name
        @points1 += 1
    else
        @points2 += 1
    end
  end

  def score
    if (@points1 < 4 and @points2 < 4) and (@points1 + @points2 < 6)
      counts = ["Love", "Fifteen", "Thirty", "Forty"]
      @points1 == @points2 ?
        counts[@points1] + "-All" :
        counts[@points1] + "-" + counts[@points2]
    else
      if (@points1 == @points2)
        "Deuce"
      else
        player = @points1 > @points2 ? @player1Name : @player2Name
        (@points1-@points2).abs == 1 ?
          "Advantage " + player :
          "Win for " + player
      end
    end
  end
end
