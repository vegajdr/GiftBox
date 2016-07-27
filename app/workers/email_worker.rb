class EmailWorker
  include Sidekiq::Worker

  def perform(id)
    # This will look at an object's date and send an email two weeks prior
    # ReminderMailer.
  end
end
