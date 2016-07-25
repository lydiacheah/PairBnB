class ReservationJob < ActiveJob::Base
  queue_as :default

  def perform(*args)
  end
end
