class Series
  def initialize(int)
    @int = int
  end
  
  def slices(num)
    raise ArgumentError, "too big" if @int.size < num
    @int.split("").map(&:to_i).each_cons(num).to_a
  end
end