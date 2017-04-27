class Api::V1::ItemsController < Api::V1::BaseController
  before_action :authenticated?
  before_action :set_list
  before_action :authorize_user, only: [:update]

  def create
    item = @list.items.new(item_params)
    item.user = @list.user

    if item.valid?
      item.save!
      render json: item, status: 200
    else
      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      render json: item
    else
      render json: { errors: item.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def index
    items = @list.items.all
    render json: items, each_serializer: ItemSerializer, status: 200
  end

  def show
    item = Item.find(params[:id])
    render json: item, status: 200
  end

  private

  def authorize_user
    item = Item.find(params[:id])
    unless authenticated? == item.user
      render json: { error: "Not Authorized", status: 403 }, status: 403
    end
  end

  def set_list
    @list = List.find(params[:list_id])
  end

  def item_params
    params.require(:item).permit(:name, :body, :completed, :list_id)
  end
end
