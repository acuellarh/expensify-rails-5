module Api
  module V1
    class ExpensesController < ApplicationController
      include Response
      before_filter :check_auth      
      before_action :set_expense, only: [:update, :destroy]
      
      def check_auth
        authenticate_or_request_with_http_basic do |username,password|
          # puts "*"*50
          # puts username
          # puts "*"*50
          resource = User.find_by_email(username)
          @user_request_id = current_user.id
          # puts "*"*50
          # puts @user_request_id
          # puts "*"*50
          if resource.valid_password?(password)
            sign_in :user, resource
          end
        end      
      end 

      def index
        @expenses = Expense.all
        json_response(@expenses)
      end

      def create
        @expense = Expense.new(expense_params.merge(user_id: @user_request_id))
        if @expense.save
          render json: @expense, status: 201
        else
          render json: { errors: @expense.errors }, status: 422
        end
        
      end

      def update
        if @expense.update(expense_params)
          json_response(@expense, :updated)
        else
          respond_with_errors @expense
        end
      end

      def destroy
        @expense.destroy
      end

      private

      def expense_params
        params.require(:expense).permit(:concept, :date, :amount, :category_id, :type_id)
      end

      def set_expense
        @expense = Expense.find(params[:id])
      end
    end
  end
end
