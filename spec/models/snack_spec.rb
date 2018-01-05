require 'rails_helper'

RSpec.describe Snack, type: :model do
  it "has many machines" do 
    snack = Snack.create(name: "oreos", price: 200)

    expect(snack).to respond_to(:machines)
  end 
end
