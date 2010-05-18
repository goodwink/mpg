require 'spec_helper'

describe FillupsController do

  def mock_fillup(stubs={})
    @mock_fillup ||= mock_model(Fillup, stubs).as_null_object
  end

  describe "GET index" do
    it "assigns all fillups as @fillups" do
      Fillup.stub(:all) { [mock_fillup] }
      get :index
      assigns(:fillups).should eq([mock_fillup])
    end
  end

  describe "GET show" do
    it "assigns the requested fillup as @fillup" do
      Fillup.stub(:find).with("37") { mock_fillup }
      get :show, :id => "37"
      assigns(:fillup).should be(mock_fillup)
    end
  end

  describe "GET new" do
    it "assigns a new fillup as @fillup" do
      Fillup.stub(:new) { mock_fillup }
      get :new
      assigns(:fillup).should be(mock_fillup)
    end
  end

  describe "GET edit" do
    it "assigns the requested fillup as @fillup" do
      Fillup.stub(:find).with("37") { mock_fillup }
      get :edit, :id => "37"
      assigns(:fillup).should be(mock_fillup)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created fillup as @fillup" do
        Fillup.stub(:new).with({'these' => 'params'}) { mock_fillup(:save => true) }
        post :create, :fillup => {'these' => 'params'}
        assigns(:fillup).should be(mock_fillup)
      end

      it "redirects to the created fillup" do
        Fillup.stub(:new) { mock_fillup(:save => true) }
        post :create, :fillup => {}
        response.should redirect_to(fillup_url(mock_fillup))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved fillup as @fillup" do
        Fillup.stub(:new).with({'these' => 'params'}) { mock_fillup(:save => false) }
        post :create, :fillup => {'these' => 'params'}
        assigns(:fillup).should be(mock_fillup)
      end

      it "re-renders the 'new' template" do
        Fillup.stub(:new) { mock_fillup(:save => false) }
        post :create, :fillup => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested fillup" do
        Fillup.should_receive(:find).with("37") { mock_fillup }
        mock_fillup.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :fillup => {'these' => 'params'}
      end

      it "assigns the requested fillup as @fillup" do
        Fillup.stub(:find) { mock_fillup(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:fillup).should be(mock_fillup)
      end

      it "redirects to the fillup" do
        Fillup.stub(:find) { mock_fillup(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(fillup_url(mock_fillup))
      end
    end

    describe "with invalid params" do
      it "assigns the fillup as @fillup" do
        Fillup.stub(:find) { mock_fillup(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:fillup).should be(mock_fillup)
      end

      it "re-renders the 'edit' template" do
        Fillup.stub(:find) { mock_fillup(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested fillup" do
      Fillup.should_receive(:find).with("37") { mock_fillup }
      mock_fillup.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the fillups list" do
      Fillup.stub(:find) { mock_fillup(:destroy => true) }
      delete :destroy, :id => "1"
      response.should redirect_to(fillups_url)
    end
  end

end
