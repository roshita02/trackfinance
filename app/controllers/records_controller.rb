class RecordsController < ApplicationController
  def index
    @records = Record.all
    @balance = Record.balance
    @debt = Record.debt
    @total = Record.total
  end

  def create
    @records = Record.create(record_params)
    if @records.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @record = Record.new
  end

  def edit
    @record = Record.find(params[:id])
  end

  def update
    @record = Record.find(params[:id])
    @record.update(record_params)
    if @record.valid?
        redirect_to root_path
    else
      render :edit
    end

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
