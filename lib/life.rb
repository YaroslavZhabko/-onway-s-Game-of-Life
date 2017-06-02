require_relative './cell'

class Life
  attr_reader :size, :field, :step

  def initialize size = 10
    @size  = size
    @step  = 0
    @field = Hash.new({})

    populate_field
  end

  def continues?
    field.each_value do |row|
      row.each_value do |cell|
        return true if cell.live
      end
    end

    false
  end

  def next_step
    next_state = Hash.new({})

    size.times do |i|
      next_state[i] = {}

      size.times do |j|
        cell = field[i][j].dup
        cell.update_status live_count neighbours(i, j)

        next_state[i][j] = cell
      end
    end

    @field = next_state
    @step += 1
  end

  private

    def live_count neighbours
      neighbours
        .select { |cell| cell && cell.live }
        .length
    end

    def neighbours i, j
      [
        field[i][j - 1],
        field[i][j + 1],

        field[i + 1][j],
        field[i + 1][j - 1],
        field[i + 1][j + 1],

        field[i - 1][j],
        field[i - 1][j - 1],
        field[i - 1][j + 1]
      ]
    end

    def populate_field
      size.times do |i|
        field[i] = {}

        size.times do |j|
          field[i][j] = Cell.new cell_status
        end
      end
    end

    def cell_status
      [true, false].sample
    end
end
