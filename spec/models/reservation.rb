require "rails_helper"

RSpec.describe Reservation, type: :model do
  describe "validations" do
    context "when the attributes are valid" do
      let!(:reservation1) { create(:reservation) }

      it "should be valid" do
        expect(reservation1).to be_valid
      end
    end

    context "when the attributes are invalid" do
      let(:reservation2) { build(:reservation, start_date: "hello") }

      it "should not be valid" do
        expect(reservation2).not_to be_valid
      end
    end
  end
end
