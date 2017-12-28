class DoStuffJob < ApplicationJob
  queue_as :default

  def perform(*args)
    puts "Look, I'm doing stuff in the background!"
  end
end
