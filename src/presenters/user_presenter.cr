class UserPresenter
  def initialize(@user : User)
  end

  delegate :id, :name, :year, to: @user

  def qualification
    @user.qualification ? @user.qualification : "нет"
  end
end
