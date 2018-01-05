require 'rails_helper'

RSpec.describe MachineSnack, type: :model do
  it "belongs to a snack and a machine" do 
    machinesnack = MachineSnack.create(machine_id: 1, snack_id: 1 )

    expect(machinesnack).to respond_to(:snack)
    expect(machinesnack).to respond_to(:machine)
  end
end
