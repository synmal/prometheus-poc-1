class HomeController < ApplicationController
  def index
    HelloWorldWorker.perform_async
    render json: { message: "ok" }
  end
end
