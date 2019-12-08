class AccountsController < ApplicationController
  before_action :set_account, only: [:show, :update, :destroy, :balance]
  before_action :authorize_request

  # GET /accounts
  def index
    @accounts = Account.all

    render json: @accounts
  end

  # GET /accounts/1
  def show
    render json: @account, include: [:bank, :client] 
  end

  # POST /accounts
  def create
    @account = Account.new(account_params)
    if @account.save
      render json: @account, status: :created, location: @account
    else
      render json: @account.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /accounts/1
  def update
    if @account.update(account_params)
      render json: @account
    else
      render json: @account.errors, status: :unprocessable_entity
    end
  end

  def balance
    render json: {"balance": @account.balance}, status: :ok 
  end  

  # DELETE /accounts/1
  def destroy
    @account.destroy
  end

  private
    def set_account
      if params[:account_id]
        @account = Account.find_by(id: params[:account_id])
      else
        @account = Account.find(params[:id])
      end
      render json: {"message": 'Conta inexistente'}, status: :not_found if @account.blank?
    end

    # Only allow a trusted parameter "white list" through.
    def account_params
      params.require(:account).permit(:number, :agency, :client_id, :bank_id)
    end
end
