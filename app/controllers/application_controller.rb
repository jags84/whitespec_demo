class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token
  before_action :check_format
  helper_method :current_user

  # Verify format
  def check_format
    render body: nil, :status => 406 unless params[:format] == "json"
  end

  # random current_user
  def current_user
    @current_user = User.order("RANDOM()").limit(1).first
    # In case you dont run rake db:seed
    if @current_user.nil?
      @current_user = User.create(email: 'user5@whitespectre.com')
    end
    @current_user
  end
end
