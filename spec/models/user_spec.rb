require 'rails_helper'

RSpec.describe User, type: :model do
  subject {
    described_class.new(email: "email@server.com")
  }
  describe "Record Validations" do
    context "user01" do
      it "is valid with valid attributes" do
        expect(subject).to be_valid
      end

      it "is not valid without a email" do
        subject.email = nil
        expect(subject).to_not be_valid
      end
    end
  end

  describe "Associations" do
    context "user02" do
      it "is not valid without many group_events" do
        should have_many(:group_events)
      end
    end
  end
  
end
