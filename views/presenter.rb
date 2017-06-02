class String
  def blue;     "\e[34m#{self}\e[0m" end
  def bg_green; "\e[42m#{self}\e[0m" end
end

class Presenter
  def show game
    puts step_info game.step
    puts field_view game.field
  end

  private

    def step_info step
      "================== STEP #{step} ===================".blue
    end

    def field_view field
      field
        .values
        .map { |row| row_view row }
        .join("\n")
    end

    def row_view row
      row
        .values
        .map { |cell| cell_view cell }
        .join
    end

    def cell_view cell
      cell.live ? '[0]'.bg_green : '[ ]'
    end
end
