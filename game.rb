require_relative './lib/life'
require_relative './views/presenter'

size = 0

while size < 3
  puts "Please write correct side length it should be more than 2"
  size = gets.chomp.to_i
end

life      = Life.new size
presenter = Presenter.new

presenter.show life

while life.continues?
  life.next_step
  sleep(2)
  presenter.show life
end
