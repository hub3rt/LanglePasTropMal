class ExampleJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    # Do something later
    puts "ok"
  end
end
