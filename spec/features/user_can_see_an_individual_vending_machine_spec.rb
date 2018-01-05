require 'rails_helper'

feature 'When a user visits a vending machine show page' do
  scenario 'they see the location of that machine' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")

    visit machine_path(dons)

    expect(page).to have_content("Don's Mixed Drinks Vending Machine")
  end
end

feature 'When a user visits a vending machine show page' do
  scenario 'they see the name of all the snacks associated with that machine' do
    owner = Owner.create(name: "Nico")
    machine  = owner.machines.create(location: "Tennis club")
    snack = machine.snacks.create(name: "Cheetos", price: 300)

    visit machine_path(machine)
   
    expect(page).to have_content("Tennis club")
    expect(page).to have_content("Cheetos:$3.00")
  end
end
