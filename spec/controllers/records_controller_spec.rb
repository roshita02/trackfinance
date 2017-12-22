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
    #let(:valid_attributes) {{ title:"title", date: "2017-12-25", amount: "50000.0" }}
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
        expect {
          post :create, params: { record: FactoryGirl.attributes_for(:invalid_record)}
        }.to change(Record, :count).by(0)
      end
      it "renders the new template" do
        post :create, params: {record: FactoryGirl.attributes_for(:invalid_record)}
        expect(response).to render_template :new
      end
    end
  end

  describe "GET #edit" do
    it "renders the edit template" do
      record = FactoryGirl.create(:record)
      get :edit, params: { id: record.id }
      expect(response).to render_template :edit
    end
  end

  describe "PUT #update" do
    context "when attributes are valid" do
      it "updates the record" do
        record = FactoryGirl.create(:record)
        put :update, params: {id: record.id, record: FactoryGirl.attributes_for(:record, title: "Education", date: Time.new(2017, 11, 12), amount: "500.0")}
        record.reload
        expect(record.title).to eq("Education")
        expect(record.date.to_time.to_i).to eq(Time.new(2017, 11, 12).to_time.to_i)
        expect(record.amount).to eq(500.0)
      end
      it "redirects to root_path" do
        record = FactoryGirl.create(:record)
        put :update, params: {id: record.id, record: FactoryGirl.attributes_for(:record, title: "Test expense", date: Time.new(2017, 11, 12), amount: "500.0")}
        expect(response).to redirect_to root_path
      end
    end

    context "when attributes are invalid" do

    end
  end

  describe "DELETE #destroy" do
    it "deletes the record" do
      record = FactoryGirl.create(:record)
      expect {
      delete :destroy, params: { id: record.id }
    }.to change(Record, :count).by(-1)
    end
    it "redirects to root_path" do
      record = FactoryGirl.create(:record)
      delete :destroy, params: {id: record.id}
      expect(response).to redirect_to root_path
    end
  end


end
