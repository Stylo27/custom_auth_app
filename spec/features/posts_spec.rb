require 'rails_helper'
require 'support/login_helper'

RSpec.describe PostsController, type: :controller do
  let!(:user) { FactoryBot.create(:user) }
  let!(:user_post) { FactoryBot.create(:post) }
  context 'when user authorized' do
    login
    describe 'Posts controller' do
      it '#index' do
        get :index
        expect(response.status).to eq(200)
      end

      it '#new' do
        get :new
        expect(response).to render_template('new')
      end

      it '#create' do
        post :create, params: { post: { title: user_post.title, body: user_post.body } }
        expect(response).to redirect_to(assigns(:post))
      end

      it '#show' do
        get :show, params: { id: user_post.id }
        expect(response).to render_template("show")
      end

      it '#edit' do
        get :edit, params: { id: user_post.id }
        expect(response).to render_template("edit")
      end

      it '#update' do
        patch :update, params: { id: user_post.id, post: { title: user_post.title, body: user_post.body } }
        expect(response).to redirect_to(assigns(:post))
      end

      it '#destroy' do
        delete :destroy, params: { id: user_post.id }
        expect(response).to redirect_to(root_path)
      end
    end
  end

  context 'when user unauthorized' do
    describe 'Posts' do
      it '#show' do
        get :show, params: { id: user_post.id }
        expect(response).to render_template('show')
      end

      it '#edit' do
        get :edit, params: { id: user_post.id }
        expect(response.status).to eq(302)
      end

      it '#update' do
        patch :update, params: { id: user_post.id, post: { title: user_post.title, body: user_post.body } }
        expect(response.status).to eq(302)
      end

      it '#destroy' do
        delete :destroy, params: { id: user_post.id }
        expect(response.status).to eq(302)
      end
    end
  end
end