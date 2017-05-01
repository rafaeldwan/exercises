class SumOfMultiples
  def initialize(*operators)
    @operators = operators
  end


  def self.to(limit)
    new(3,5).to(limit)
  end
  
  def to(limit)
    (1...limit).select do |num|
      @operators.any? { |op| num % op == 0 }
    end.sum
  end
end