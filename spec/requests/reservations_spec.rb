require "rails_helper"

RSpec.describe "Api/V1/Reservations", type: :request do
  describe "POST /reservations" do
    context "when posting payload 1" do
      let(:payload1) do 
        {
          "start_date": "2021-03-12",
          "end_date": "2021-03-16",
          "nights": 4,
          "guests": 4,
          "adults": 2,
          "children": 2,
          "infants": 0,
          "status": "accepted",
          "guest": {
            "id": 1,
            "first_name": "Wayne",
            "last_name": "Woodbridge",
            "phone": "639123456789",
            "email": "wayne_woodbridge@bnb.com"
          },
          "currency": "AUD",
          "payout_price": "3800.00",
          "security_price": "500",
          "total_price": "4500.00"
        }
      end

      it "creates new reservation" do
        post "/api/v1/reservations", params: payload1

        res = JSON.parse(response.body)
        
        expect(payload1[:start_date]).to eq(res["start_date"])
        expect(payload1[:end_date]).to eq(res["end_date"])
        expect(payload1[:nights]).to eq(res["no_of_nights"])
        expect(payload1[:guests]).to eq(res["no_of_guests"])
        expect(payload1[:guest][:first_name]).to eq(res["guests"].first["first_name"])
        expect(payload1[:guest][:last_name]).to eq(res["guests"].first["last_name"])
        expect([payload1[:guest][:phone]]).to eq(res["guests"].first["phone"])
        expect(payload1[:guest][:email]).to eq(res["guests"].first["email"])
      end
    end
  end
end
