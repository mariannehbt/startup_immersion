require 'rails_helper'
require 'spec_helper'
RSpec.describe StartupsController, type: :controller do    
  describe "GET index" do
    it "assigns @startup" do
      # création d'une instance
      startup = FactoryBot.create(:startup )
      # on va sur index
      get :index 
      # @startup doit être une array qui contient startup
      expect(assigns(:startups)).to eq([startup])
    end
  
    it "renders the index template" do
      # va sur index
      get :index
  
      # on doit rediriger vers index
      expect(response).to render_template("index")
    end
  end

  describe "GET show" do
    it "assigns @startup" do
      # création d'une instance
      startup = FactoryBot.create(:startup)
      
      # on va sur show
      get :show, params: {id: startup.id}
  
      # @startup doit être startup
      expect(assigns(:startup)).to eq(startup)
    end
  
    it "renders the show template" do
      # création d'une instance
      startup = FactoryBot.create(:startup)

      # va sur show
      get :show, params: {id: startup.id}
  
      # on doit rediriger vers show
      expect(response).to render_template("show")
    end
  end

  describe "GET new" do
    it "renders the new template" do
      # va sur new
      get :new
  
      # on doit rediriger vers new
      expect(response).to render_template("new")
    end
  end

  describe "GET edit" do
    it "assigns @users" do
      # création d'une instance
      startup = FactoryBot.create(:startup)
  
      # on va sur edit
      get :edit, params: {id: startup.id}
  
      # @startup doit être startup
      expect(assigns(:startup)).to eq(startup)
    end
  
    it "renders the edit template" do
       # création d'une instance
       startup = FactoryBot.create(:startup)

      # va sur edit
      get :edit, params: {id: startup.id}
  
      # on doit rediriger vers edit
      expect(response).to render_template("edit")
    end
  end

  describe "POST create" do
    # let(:startup_invalide_params) { FactoryBot.attributes_for(:event) }
    let(:attribut_startup) { FactoryBot.attributes_for(:startup)}
    context "with valid attributes" do

      # test de creation d'une instance via la methode create du controller startup
      it "creates a new startup" do
        expect {
          post :create, params: {:startup => attribut_startup}
      }.to change(Startup,:count).by(1)
      end
      
      # test de redirection apres creation d'une instance via le controller startup
      it "redirects to the created startup" do
        post :create, params: {:startup => attribut_startup}
       
        # en général tu rediriges vers le show de ce que tu viens de créer
        expect(response).to redirect_to(Startup.last)
      end
    end
    
    #test d'invalide creation ne doit pas s'instancier
    context "with invalid attributes" do
      it "doest not create a new user" do
        expect { 
          post :create, params: {:startup => {name: "", catch_phrase: "", website_url: "", description: ""}}
        }.to_not change(Startup, :count)
      end
      
      # test de redirection quand startup n'est pas instancier
      it "re-renders the new method" do
        post :create, params: {:startup => {name: "", catch_phrase: "", website_url: "", description: ""}}
        expect(response).to render_template(:new)
      end
    end
  end

  describe "PUT update" do
    
    before :each do
      @startup =  FactoryBot.create(:startup)
    end
    
    context "with valid attributes" do
      let(:attribut_startup)  { FactoryBot.attributes_for(:startup,
      name: "Name update",
      catch_phrase: "Catch_phrase update",
      website_url: "Website_url update",
      description: "Description update"
        )}
      it "located the requested @startup" do        
        put :update, params:{ id: @startup, startup: attribut_startup}
        @startup.reload
        expect(assigns(:startup)).to eq(@startup)      
      end
      
      it "changes @startup's attributes" do
        put :update, params:{ id: @startup, startup: attribut_startup}
        @startup.reload
        expect(@startup.name).to eq("Name update")
        expect(@startup.catch_phrase).to eq("Catch_phrase update")
        expect(@startup.website_url).to  eq("Website_url update")
        expect(@startup.description).to  eq("Description update")
      end
      
      it "redirects to the updated contact" do
        put :update, params:{ id: @startup, startup: attribut_startup}

        # redirige où tu veux
        expect(response).to redirect_to @startup
      end
    end
    
    
    context "with invalid attributes" do
      let(:invalid_attribut_startup)  { FactoryBot.attributes_for(:startup,
        name: "",
        catch_phrase: "",
        website_url: "",
        description: "")} 

      it "locates the requested @startup" do
        put :update, params: {id: @startup, startup: invalid_attribut_startup}
        expect(assigns(:startup)).to eq(@startup)      
      end
      
      it "does not change @startup's attributes" do
        put :update, params: {id: @startup, startup: invalid_attribut_startup}
        @startup.reload
        expect(@startup.name).to eq("startup")
        expect(@startup.catch_phrase).to eq("catch_phrase")
        expect(@startup.website_url).to  eq("website_url")
        expect(@startup.description).to  eq("description")
        
      end
      
      it "re-renders the edit method" do
        put :update, params: {id: @startup, startup: invalid_attribut_startup}
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE destroy' do
    before :each do
      @startup = FactoryBot.create(:startup)
    end
    
    it "deletes the user" do
      expect{
        delete :destroy, params: {id: @startup}        
      }.to change(Startup, :count).by(-1)
    end
      
    it "redirects to users#index" do
      delete :destroy, params: {id: @startup} 
      expect(response).to redirect_to startups_url
    end
  end

end