class RecordsController < ApplicationController
  def index
    @records = Record.all
    @balance = Record.balance
    @debt = Record.debt
    @total = Record.total
  end

  def create
    @records = Record.create(record_params)
    redirect_to root_path

  end

  def new
    @record = Record.new
  end

  def edit
    @record = Record.find(params[:id])
  end

  def update
    @record = Record.find(params[:id])
    redirect_to root_path if @record.update(record_params)
  end

  def destroy
    @record = Record.find(params[:id])
    @record.destroy
    redirect_to root_path
  end

  private
  def record_params
    params.require(:record).permit(:title, :date, :amount)
  end
end
