require "rails_helper"

RSpec.describe Guest, type: :model do
  describe "validations" do
    let(:guest1) { create(:guest) }

    context "when email is valid and unique" do
      it "should be valid" do
        expect(guest1).to be_valid
      end
    end

    context "when email exists" do
      let(:guest2) { build(:guest, email: guest1.email) }

      it "should not be valid" do
        expect(guest2).not_to be_valid
        expect(guest2.errors[:email]).to include("has already been taken")
      end
    end

    context "when phone is valid and unique" do
      it "should be valid" do
        expect(guest1).to be_valid
      end
    end

    context "when phone exists" do
      let(:guest2) { build(:guest, phone: guest1.phone) }

      it "should not be valid" do
        expect(guest2).not_to be_valid
      end
    end
  end
end
