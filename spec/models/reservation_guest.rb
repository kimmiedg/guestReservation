require "rails_helper"

RSpec.describe ReservationGuest, type: :model do
  describe "associations" do
    it { should belong_to(:guest) }
    it { should belong_to(:reservation) }
  end

  context "when attributes are present" do
    let(:reservation_guest1) { create(:reservation_guest) }

    it "has present attributes" do
      expect(reservation_guest1.guest).to be_present
      expect(reservation_guest1.reservation).to be_present
    end
  end
end
