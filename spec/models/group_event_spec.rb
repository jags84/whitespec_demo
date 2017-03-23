require 'rails_helper'

RSpec.describe GroupEvent, type: :model do
  subject {
    described_class.new(name: "Event 1", description:"Description 1", start_date:"2017-05-01", end_date:"2017-05-10", publish_status:"published", latitude:10.44, longitude:-66.09, user: User.create(email: 'client@server.com'))
  }

  describe "Record Validations" do
    context "group_event01" do
      it "is valid with valid attributes" do
        expect(subject).to be_valid
      end
    end

    context "group_event02" do
      it "is not valid if publish_status is published and empty name" do
        subject.name = nil
        expect(subject).to_not be_valid
      end

      it "is not valid if publish_status is published and empty description" do
        subject.description = nil
        expect(subject).to_not be_valid
      end

      it "is not valid if publish_status is published and empty start_date" do
        subject.start_date = nil
        expect(subject).to_not be_valid
      end

      it "is not valid if publish_status is published and empty end_date" do
        subject.end_date = nil
        expect(subject).to_not be_valid
      end

      it "is not valid if publish_status is published and empty latitude" do
        subject.latitude = nil
        expect(subject).to_not be_valid
      end

      it "is not valid if publish_status is published and empty longitude" do
        subject.longitude = nil
        expect(subject).to_not be_valid
      end
    end

    context "group_event02" do
      it "is not valid if publish_status is draft and empty name" do
        subject.publish_status = 'draft'
        subject.name = nil
        expect(subject).to_not be_valid
      end

      it "is valid if publish_status is draft and empty description" do
        subject.publish_status = 'draft'
        subject.description = nil
        expect(subject).to be_valid
      end

      it "is valid if publish_status is draft and empty start_date" do
        subject.publish_status = 'draft'
        subject.start_date = nil
        expect(subject).to be_valid
      end

      it "is valid if publish_status is draft and empty end_date" do
        subject.publish_status = 'draft'
        subject.end_date = nil
        expect(subject).to be_valid
      end

      it "is valid if publish_status is draft and empty latitude" do
        subject.publish_status = 'draft'
        subject.latitude = nil
        expect(subject).to be_valid
      end

      it "is valid if publish_status is draft and empty longitude" do
        subject.publish_status = 'draft'
        subject.longitude = nil
        expect(subject).to be_valid
      end
    end
  end

  describe "Associations" do
    context "group_event03" do
      it "is not valid without belong_to user" do
        should belong_to(:user)
      end
    end
  end

  describe  "Methods" do
    context "group_event04" do
      it "must return event duration" do
        group_event = FactoryGirl.create(:group_event)
        expect(group_event.event_duration).to eq(9)
      end

      it "must be mark the event as removed" do
        group_event = FactoryGirl.create(:group_event)
        group_event.mark_for_remove
        expect(group_event.remove_mark).to eq(true)
      end

      it "must return a location" do
        group_event = FactoryGirl.create(:group_event)
        expect(group_event.location).to match({latitude: 10.44, longitude: -66.04, city_name: "Río Chico", country_name: "Venezuela"})
      end

      it "must return true if field publish_status is published when calling is_published?" do
        group_event = FactoryGirl.create(:group_event)
        expect(group_event.is_published?).to eq(true)
      end

      it "must return false if field publish_status is draft when calling is_published?" do
        group_event = FactoryGirl.create(:group_event)
        group_event.publish_status = 'draft'
        expect(group_event.is_published?).to eq(false)
      end

      it "must return true if field publish_status is draft when calling is_draft?" do
        group_event = FactoryGirl.create(:group_event)
        group_event.publish_status = 'draft'
        expect(group_event.is_draft?).to eq(true)
      end

      it "must return false if field publish_status is published when calling is_draft?" do
        group_event = FactoryGirl.create(:group_event)
        group_event.publish_status = 'published'
        expect(group_event.is_draft?).to eq(false)
      end

    end
  end

end
