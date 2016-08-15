class ItemsController < ApplicationController
  before_action :logged_in_user , except: [:show]
  before_action :set_item, only: [:show]
  before_action :search_want_items, only: [:new]
  before_action :search_have_items, only: [:new]

  def new
    if params[:q]
      response = RakutenWebService::Ichiba::Item.search(
        keyword: params[:q],
        imageFlag: 1,
      )
      @items = response.first(20)
    end
  end

  def show
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def search_want_items
    @want_items = current_user.want_items
  end

  def search_have_items
    @have_items = current_user.have_items
  end
end
