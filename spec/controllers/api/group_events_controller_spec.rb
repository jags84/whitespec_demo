require 'rails_helper'

RSpec.describe Api::GroupEventsController, type: :controller do
  render_views

  describe "GET #index" do
    context "gp01" do
      it "should connect to TEST database" do
        expect(ActiveRecord::Base.connection_config[:database]).to match(/test/)
      end

      it "returns http success" do
        get :index, format: :json
        expect(response).to have_http_status(:success)
      end

      it "returns 406 status without json format" do
        get :index
        is_expected.to respond_with 406
      end

    end
  end
end
