class Cell
  attr_reader :live

  def initialize live
    @live = live
  end

  def update_status neighbours_count
    case neighbours_count
    when 3 then revive
    when (0...2), (4..8) then die
    end
  end

  private

    def die
      @live = false
    end

    def revive
      @live = true
    end
end
