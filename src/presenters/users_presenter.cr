class UsersPresenter
  @users : Array(User)

  def initialize(@users)
  end

  def each_with_index(&callback : UserPresenter, Int32 -> String::Builder)
    @users.each_with_index do |user, i|
      yield UserPresenter.new(user), i
    end
  end
end
