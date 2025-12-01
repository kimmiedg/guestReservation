require "rails_helper"

RSpec.describe Reservation, type: :model do
  describe "validations" do
    let!(:reservation1) { create(:reservation) }

    context "when the attributes are valid" do
      expect(reservation1).to be_valid
    end

    context "when the attributes are invalid" do
      let(:reservation2) { build(:reservation, start_date: "hello") }

      expect(reservation2).not_to be_valid
    end
  end
end
