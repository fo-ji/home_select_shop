require 'rails_helper'

describe TalksController, type: :controller do
  let(:community) { create(:community) }
  let(:user)      { create(:user) }

  describe "#index" do

    context "log in" do
      before do
        login user
        get :index, params: { community_id: community.id }
      end

      it "@talkは期待した値になるか" do
        expect(assigns(:talk)).to be_a_new(Talk)
      end
      it "@communityは期待した値になるか" do
        expect(assigns(:community)).to eq community
      end
      it "indexページに遷移するか" do
        expect(response).to render_template :index
      end
    end

    context "not log in" do
      before do
        get :index, params: { community_id: community.id }
      end

      it "ログインページにリダイレクトするか" do
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe "#create" do
    let(:params) { { community_id: community.id, user_id: user.id, talk: attributes_for(:talk) } }

    context "log in" do
      before do
        login user
      end

      context "can save" do
        subject {
          post :create,
          params: params
        }

        it "トークが保存され投稿されているか" do
          expect{ subject }.to change(Talk, :count).by(1)
        end
        it "投稿後、意図したページにリダイレクトするか" do
          subject
          expect(response).to redirect_to(community_talks_path(community))
        end
      end

      context "can not save" do
        let(:invalid_params) { { community_id: community.id, user_id: user.id, talk: attributes_for(:talk, talk: nil, image: nil) } }

        subject {
          post :create,
          params: invalid_params
        }

        it "保存できず、投稿されないか" do
          expect{ subject }.not_to change(Talk, :count)
        end
        it "意図したページに遷移するか" do
          subject
          expect(response).to render_template :index
        end
      end
    end

    context "not log in" do

      it "ログインページにリダイレクトするか" do
        post :create, params: params
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
