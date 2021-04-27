class HelloWorldWorker
  include Sidekiq::Worker

  def perform(*args)
    puts '-=+' * 36
    puts "Hello World"
    puts '-=+' * 36
  end
end
