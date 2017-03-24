class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_before_action :verify_authenticity_token
  before_action :check_format

  # Verify format
  def check_format
    render body: nil, :status => 406 unless params[:format] == "json"
  end
end
