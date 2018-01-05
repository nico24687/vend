class MachinesController < ApplicationController
  def index
    @owner = Owner.find(params[:owner_id])
  end

  def show
    @machine = Machine.find(params[:id])
    @average_price = @machine.snacks.average(:price) || 0.0
  end
end
