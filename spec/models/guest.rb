require "rails_helper"

RSpec.describe Guest, type: :model do
  describe "validations" do
    let(:guest1) { create(:guest) }

    context "when validating uniqueness" do
      it "should be valid" do
        expect(guest1).to be_valid
      end

      context "when email exists" do
        let(:guest2) { create(:guest, email: guest1.email) }

        it "should not be valid" do
          expect(guest2).not_to be_valid
        end
      end
    end
  end
end
