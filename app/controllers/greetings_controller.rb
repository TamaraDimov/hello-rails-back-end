class GreetingsController < ApplicationController
  def random_greeting
    random_message = Message.order('RANDOM()').first
    render json: { greeting: random_message.greeting }
  rescue StandardError => e
    render json: { error: e.message }, status: :internal_server_error
  end
end
