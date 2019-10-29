class UserPresenter
  getter :races
  delegate :id, :name, :year, to: @user

  @races : RacesPresenter

  def initialize(@user : User)
    _races = Race.by_user_id(@user.id, order_query).to_a
    @races = RacesPresenter.new _races, @user
  end

  def qualification
    @user.qualification ? @user.qualification : "нет"
  end

  private def order_query
    "ORDER BY TO_TIMESTAMP(races.date, 'DD.MM.YYYY')"
  end
end
