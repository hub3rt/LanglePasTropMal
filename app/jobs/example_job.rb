class ExampleJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
    # Do something later
    logger.info "ok"
  end
end
