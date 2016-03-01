require 'spec_helper'

describe ItemsController do

	it_renders_404_page_when_item_is_not_found :show, :edit, :update, :destroy

  describe 'show action' do

    it "renders show template if an item is found" do
      item = create(:item)
      get :show, id: item.id
      response.should render_template('show')
    end

    # it "renders 404 page if an item is not found" do
    #   get :show, id: 0
    #   response.status.should == 404
    # end

  end

    describe 'create action' do

    it "redirects to image cropping page if validations pass" do
      post :show, item: { name: 'Item 1', price: '10', description: 'description' }#, admin: true
      response.should redirect_to(item_path(assigns(:item)))
    end

    it "renders new page agane if validations fail" do
      post :show, item: { name: 'Item 1', price: 0 }
      response.should render_template('new')
    end

    it "renders 403 page if user is not an admin" do
      post :show, item: { name: 'Item 1', price: '10', description: 'description' }
      response.status.should == 403
    end

  end

  describe 'destroy action' do

    it "redirect to index action when an item is destroyed successfully" do
      item = create(:item)#, admin: true
      delete :destroy, id: item.id
      response.should redirect_to(items_path)
    end

    # it "renders 404 page if an item was not found" do
    #   delete :destroy, id: 0#, admin: true
    #   response.status.should == 404
    # end

  end

end