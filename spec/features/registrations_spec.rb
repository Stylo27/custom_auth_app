require 'rails_helper'
require 'support/login_helper'

RSpec.describe RegistrationsController, type: :controller do
  let!(:user) { FactoryBot.build(:user) }

  context 'registration' do
    describe 'sign up' do
      it '#new' do
        get :new
        expect(response).to render_template :new
      end

      it '#create' do
        post :create, params: { registration:
          {
           name: user.name,
           email: user.email,
           password: user.password,
           password_confirmation: user.password_confirmation
          }
        }
        expect(response).to redirect_to(root_path)
      end
    end

    describe 'invalid_data' do
      it '#create' do
        post :create, params: {
          registration: {
            name: user.name,
            email: user.email,
            password: "",
            password_confirmation: user.password_confirmation
          }
        }
      expect(flash[:error]).to match(["Password can't be blank", "Password digest can't be blank"])
      end
    end
  end
end