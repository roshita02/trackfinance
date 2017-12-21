require 'rails_helper'
RSpec.describe RecordsController, type: :controller do
  describe "GET #index" do
    it "renders the index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #new" do
    it "renders the new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    context "when attributes are valid" do
      it "creates a new record" do
        expect {
          post :create, params: { record: FactoryGirl.attributes_for(:record)}
        }.to change(Record, :count).by(1)
      end
      it "redirects to root_path" do
        post :create, params: { record: FactoryGirl.attributes_for(:record) }
        expect(response).to redirect_to root_path
      end
    end

    context "when attributes are invalid" do
      it "doesnot create a new post" do

      end
      it "renders the new template" do
      
      end
    end
  end
end
