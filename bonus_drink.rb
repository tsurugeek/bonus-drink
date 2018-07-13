class BonusDrink

  def self.total_count_for(amount)
    BonusDrink.new(amount).total_count
  end

  def initialize amount
    # 飲んだ回数 == 手に入れた飲み物の数
    @total_count = amount
    # 飲んで空になった瓶の数
    @empty_amount = amount
  end

  # 交換できなくなるまで繰り返す。
  def total_count
    # 空き瓶が３個未満になると交換できなくなるので、それまで繰り返す。
    while @empty_amount >= 3
      exchange
    end
    @total_count
  end

  private

  # １度交換する
  def exchange
    # 交換してもらえる飲み物の数
    bonus_amount = @empty_amount / 3
    # まず、空き瓶を渡す
    @empty_amount -= bonus_amount * 3
    # 飲み物をもらう
    @total_count += bonus_amount
    # 空き瓶が増える
    @empty_amount += bonus_amount
  end

end

# puts BonusDrink.total_count_for(0)
# puts BonusDrink.total_count_for(1)
# puts BonusDrink.total_count_for(3)
# puts BonusDrink.total_count_for(11)
# puts BonusDrink.total_count_for(100)
