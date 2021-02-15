class Rating
  getter :users

  def initialize(@users : Array(User))
  end
end
