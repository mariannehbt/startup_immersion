require 'rails_helper'
require 'spec_helper'
RSpec.describe EventsController, type: :controller do    
  describe "GET index" do
    it "assigns @events" do
      # création d'une instance
      event = FactoryBot.create(:event )
      # on va sur index
      get :index 
      # @events doit être une array qui contient event
      expect(assigns(:events)).to eq([event])
    end
  
    it "renders the index template" do
      # va sur index
      get :index
  
      # on doit rediriger vers index
      expect(response).to render_template("index")
    end
  end

  describe "GET show" do
    it "assigns @event" do
      # création d'une instance
      event = FactoryBot.create(:event)
      
      # on va sur show
      get :show, params: {id: event.id}
  
      # @event doit être event
      expect(assigns(:event)).to eq(event)
    end
  
    it "renders the show template" do
      # création d'une instance
      event = FactoryBot.create(:event)

      # va sur show
      get :show, params: {id: event.id}
  
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
      event = FactoryBot.create(:event)
  
      # on va sur edit
      get :edit, params: {id: event.id}
  
      # @event doit être event
      expect(assigns(:event)).to eq(event)
    end
  
    it "renders the edit template" do
       # création d'une instance
       event = FactoryBot.create(:event)

      # va sur edit
      get :edit, params: {id: event.id}
  
      # on doit rediriger vers edit
      expect(response).to render_template("edit")
    end
  end

  describe "POST create" do
    let(:event_invalide_params) { FactoryBot.attributes_for(:event) }
    let(:create_event) { FactoryBot.attributes_for(:event).merge(:startup_id => FactoryBot.create(:startup).id) }
    context "with valid attributes" do

      # test de creation d'une instance via la methode create du controller event
      it "creates a new event" do
        expect {
          post :create, params: {:event => create_event}
      }.to change(Event,:count).by(1)
      end
      
      # test de redirection apres creation d'une instance via le controller event
      it "redirects to the created event" do
        post :create, params: {:event => create_event}
       
        # en général tu rediriges vers le show de ce que tu viens de créer
        expect(response).to redirect_to(Event.last)
      end
    end
    
    #test d'invalide creation ne doit pas s'instancier
    context "with invalid attributes" do
      it "doest not create a new user" do
        expect { 
          post :create, params: {:event => event_invalide_params}
        }.to_not change(Event, :count)
      end
      
      # test de redirection quand event n'est pas instancier
      it "re-renders the new method" do
        post :create, params: {:event => event_invalide_params}
        expect(response).to render_template(:new)
      end
    end
  end

  describe "PUT update" do
    
    before :each do
      @event =  FactoryBot.create(:event)
    end
    
    context "with valid attributes" do
      let(:valid_params_event)  { FactoryBot.attributes_for(:event,
      title: "title update",
      duration: 20,
      description: "description update greater",
      short_location: "short location update",
      adress: "adress update",
      zip_code: "75000",
      city: "city update")}
      
      it "located the requested @user" do        
        put :update, params:{ id: @event, event: valid_params_event}
        @event.reload
        expect(assigns(:event)).to eq(@event)      
      end
      
      it "changes @event's attributes" do
        put :update, params:{ id: @event, event: valid_params_event}
        @event.reload
        expect(@event.title).to eq("title update")
        expect(@event.description).to eq("description update greater")
        expect(@event.adress).to  eq("adress update")
      end
      
      it "redirects to the updated contact" do
        put :update, params:{ id: @event, event: valid_params_event}

        # redirige où tu veux
        expect(response).to redirect_to @event
      end
    end
    
    
    context "with invalid attributes" do
      let(:invalid_params_event)  { FactoryBot.attributes_for(:event,
      title: "invalid title update",
      duration: "trente",
      description: "invalid description update",
      short_location: "invalid short location",
      adress: "invalid adress update",
      zip_code: "",
      city: "")} 

      it "locates the requested @event" do
        put :update, params: {id: @event, event: invalid_params_event}
        expect(assigns(:event)).to eq(@event)      
      end
      
      it "does not change @event's attributes" do
        put :update, params: {id: @event, event: invalid_params_event}
        @event.reload
        expect(@event.title).to eq("event")
        expect(@event.description).to eq("more event description !")
        expect(@event.adress).to eq("adress")
        
        
      end
      
      it "re-renders the edit method" do
        put :update, params: {id: @event, event: invalid_params_event}
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE destroy' do
    before :each do
      @event = FactoryBot.create(:event)
    end
    
    it "deletes the user" do
      expect{
        delete :destroy, params: {id: @event}        
      }.to change(Event, :count).by(-1)
    end
      
    it "redirects to users#index" do
      delete :destroy, params: {id: @event} 
      expect(response).to redirect_to events_url
    end
  end

end