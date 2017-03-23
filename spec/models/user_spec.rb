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
end
