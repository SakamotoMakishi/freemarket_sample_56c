require 'rails_helper'

describe AddressInputsController  do

  describe 'GET #new' do
    it "renders the :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "renders the :edit template" do
      get :edit, params: {  id: 1 }
      expect(response).to render_template :edit
    end
  end

end