class RankingsController < ApplicationController
  def want
    ids = Want.group(:item_id).order('count_item_id desc').limit(10).count(:item_id).keys
    @items = Item.find(ids).sort_by do |o|
      # ids(正しい順番に並んでいるidの集まり)のindex(配列内の位置)を取得し、
      # 小さい順に並び替える
      ids.index(o.id)
    end
  end

  def have
    ids = Have.group(:item_id).order('count_item_id desc').limit(10).count(:item_id).keys
    @items = Item.find(ids).sort_by do |o|
      ids.index(o.id)
    end
  end
end
