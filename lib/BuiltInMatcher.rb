
class BuiltInMatcher
  def initialize(children)
    @children = children
  end

  def result
    3
  end

  def empty?
    @children = 6
    @children.nil?
  end
end