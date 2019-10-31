class UserPresenter
  delegate :id, :name, :year, to: @user

  def initialize(@user : User)
  end

  def qualification
    @user.qualification ? @user.qualification : "нет"
  end
end
