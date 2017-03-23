require 'rails_helper'

RSpec.describe Api::GroupEventsController, type: :controller do
  render_views
  # Index
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

      it "must returns all group_events" do
        group_events = FactoryGirl.create_list(:group_event, 5)
        get :index, format: :json
        parsed_response = JSON.parse(response.body)
        expect(parsed_response['group_events'].length).to eq(5)
      end
    end
  end

  # Show
  describe "GET #show" do
    context "gp02" do
      it "should connect to TEST database" do
        expect(ActiveRecord::Base.connection_config[:database]).to match(/test/)
      end

      it "returns http success" do
        group_event = FactoryGirl.create(:group_event)
        get :show, format: :json, params: {id: group_event.id}
        expect(response).to have_http_status(:success)
      end

      it "returns 406 status without json format" do
        group_event = FactoryGirl.create(:group_event)
        get :show, params: {id: group_event.id}
        is_expected.to respond_with 406
      end

      it "must returns one EventGroup" do
        group_event = FactoryGirl.create(:group_event)
        get :show, format: :json, params: {id: group_event.id}
        parsed_response = JSON.parse(response.body)
        expect(parsed_response).to match({
          "name" => group_event.name,
          "description" => group_event.description,
          "start_date" => group_event.start_date.strftime("%Y-%m-%d"),
          "end_date" => group_event.end_date.strftime("%Y-%m-%d"),
          "event_duration" => 9,
          "user" => {"email" => "email@server.com"},
          "location" => {"latitude" => 10.44, "longitude" => -66.04, "city_name" => "Río Chico", "country_name" => "Venezuela"}
        })
      end
    end
  end

  describe "PUT #update" do
    context "gp03" do
      it "should connect to TEST database" do
        expect(ActiveRecord::Base.connection_config[:database]).to match(/test/)
      end

      it "returns http success" do
        group_event = FactoryGirl.create(:group_event)
        put :update, format: :json, params: {id:group_event.id, group_event:{:id => group_event.id, :name => group_event.name}}
        expect(response).to have_http_status(:success)
      end

      it "returns 406 status without json format" do
        group_event = FactoryGirl.create(:group_event)
        put :update, params: {id:group_event.id}
        is_expected.to respond_with 406
      end

      it "must update one EventGroup record" do
        group_event = FactoryGirl.create(:group_event)
        group_event.name = "New Update Name"
        put :update, format: :json, params: {id:group_event.id, group_event:{:id => group_event.id, :name => group_event.name}}

        parsed_response = JSON.parse(response.body)
        expect(parsed_response).to match({
          "name" => "New Update Name",
          "description" => group_event.description,
          "start_date" => group_event.start_date.strftime("%Y-%m-%d"),
          "end_date" => group_event.end_date.strftime("%Y-%m-%d"),
          "event_duration" => 9,
          "user" => {"email" => "email@server.com"},
          "location" => {"latitude" => 10.44, "longitude" => -66.04, "city_name" => "Río Chico", "country_name" => "Venezuela"}
        })
      end
    end
  end

end
