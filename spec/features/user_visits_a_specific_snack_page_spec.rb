require 'rails_helper'

feature "when a user visits a snack show page" do 
  scenario "they see name and price of that snack" do 
    snack = Snack.create(name: "Cheetos", price: 200)
    visit snack_path(snack)
   
    expect(page).to have_content("Cheetos")
    expect(page).to have_content("Price:$2.00")
  end
end

feature "when a user visits a snack show page" do 
  let(:owner) { Owner.create(name: "Nico") }
  let(:machine) { owner.machines.create(location: "Don's Mixed Drinks") }
  let(:snack) { machine.snacks.create(name: "Cheetos", price: 100) }
  before do 
    machine2 = owner.machines.create(location: "Turing Basement")
    machine3 = owner.machines.create(location: "Guranty Bank")

    machine2.snacks << snack
    machine3.snacks << snack

    machine.snacks.create(name: "Oreos", price: 200)
    machine2.snacks.create(name: "Fig Newton", price: 300)
    visit snack_path(snack)
  end
  scenario "they see a list of vending machines that carry that snack" do 
    expect(page).to have_content("Don's Mixed Drinks")
    expect(page).to have_content("Turing Basement")
    expect(page).to have_content("Guranty Bank")
  end
  scenario "they see the snack count for each machiene and the average price of snacks in it" do 
   
    expect(page).to have_content("Don's Mixed Drinks (2 kinds of snacks, average price of $1.50)")

  end 
end