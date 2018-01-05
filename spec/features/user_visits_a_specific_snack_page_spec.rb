require 'rails_helper'

feature "when a user visits a snack show page" do 
  scenario "they see name and price of that snack" do 
    snack = Snack.create(name: "Cheetos", price: 200)
    visit snack_path(snack)
   
    expect(page).to have_content("Cheetos")
    expect(page).to have_content("Price:$2.00")
  end
end