class Numeric
  def inc
    self + 1
  end

  def dec
    self - 1
  end

  def pos?
    self > 0
  end

  def neg?
    self < 0
  end

  def zero?
    self == 0
  end
end
