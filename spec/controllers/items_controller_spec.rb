require 'rails_helper'

describe ItemsController do

  describe 'Post #create' do
    context '有効なパラメータの場合' do
      before do
        @item = attributes_for(:item)
      end
      it 'データベースに新しい商品が登録されること' do
        expect{
          post :create, item: @item
        }.to change(Item, :count).by(1)
      end
    end
  end

end