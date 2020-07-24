require 'rails_helper'

describe ItemsController, type: :controller do
  let(:item)     { create(:item) }
  let(:user)     { create(:user) }
  let(:shop)     { create(:shop) }
  let(:category) { create(:category) }
  let(:brand)    { create(:brand) }

  describe "#new" do

    context "log in" do
      before do
        login user
        get :new, params: { shop_id: shop.id }
      end

      it "@itemは期待した値になるか" do
        expect(assigns(:item)).to be_a_new(Item)
      end
      it "newページに遷移するか" do
        expect(response).to render_template :new
      end
    end

    context "not log in" do
      before do
        get :new, params: { shop_id: shop.id }
      end

      it "ログインページにリダイレクトするか" do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "#create" do
    let(:params) { { shop_id: shop.id, user_id: user.id, category_id: category.id, brand_id: brand.id, item: attributes_for(:item) } }

    # context "log in" do
    #   before do
    #     login user
    #   end

    #   context "can save" do
    #     subject {
    #       post :create,
    #       params: params
    #     }

    #     it "アイテムが保存され投稿されているか" do
    #       expect{ subject }.to change(Item, :count).by(1)
    #     end
    #     it "投稿後、意図したページにリダイレクトするか" do
    #       subject
    #       expect(response).to redirect_to(root_path)
    #     end
    #   end

    context "not log in" do

      it "ログインページにリダイレクトするか" do
        post :create, params: params
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "#show" do
    before do
      get :show, params: { id: item }
    end

    it "@itemが期待したものになるか" do
      expect(assigns(:item)).to eq item
    end
    it "商品詳細ページに遷移するか" do
      expect(response).to render_template :show  
    end
  end

  # describe 'GET #edit' do

  #   it "インスタンス変数の値が期待したものになるか" do
  #     item = create(:item)
  #     get :edit, params: { shop_id: shop.id, id: item }
  #     expect(assigns(:item)).to eq item
  #   end
  #   it "商品編集ページに遷移するか" do
  #     item = create(:item)
  #     get :edit, params: { shop_id: shop.id, id: item }
  #     expect(response).to render_template :edit
  #   end
  # end

  describe "#destroy" do

    it "リクエストが成功すること" do
    expect(item).to be_valid
    end
    # it "商品が削除されること" do
    #   expect do
    #     delete :destroy, params:{ shop_id: shop.id, id: item }
    #   end.to change(Item, :count).by(-1)
    # end
  end
end
