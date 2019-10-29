class RacePresenter
  getter :time, :position
  delegate :id, :title, :date, to: @race

  def initialize(@race : Race, @time : String | Nil, @position : Int32 | Nil)
  end
end
