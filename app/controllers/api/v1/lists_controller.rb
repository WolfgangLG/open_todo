class Api::V1::ListsController < Api::V1::BaseController
  #  before_action :authenticate_user, except: [:index, :show]
  #  before_action :authorize_user, except: [:index, :show]

   def index
     lists = List.all
     render json: lists, status: 200
   end

   def show
     list = List.find(params[:id])
     render json: list, status: 200
   end
 end
