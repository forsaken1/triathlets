class RacePresenter
  getter :time, :position

  def initialize(@race : Race, @time : String | Nil, @position : Int32 | Nil)
  end

  delegate :id, :title, :date, to: @race
end
