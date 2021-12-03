class ApplicationController < ActionController::API
  include ActionController::Cookies
  before_action :authorize


  private
  def authorize
    return render json: { errors: ["THIS ONE?" ]}, status:401 unless session.include? :user_id
  end

end
