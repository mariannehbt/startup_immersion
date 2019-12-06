require 'rails_helper'

RSpec.describe EventsController, type: :controller do
 
  describe "GET index" do
    it "assigns @events" do
      # création d'une instance
      event = FactoryBot.create(:event)
  
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
  
      # @user doit être user
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
    context "with valid attributes" do
      it "creates a new user" do
        expect { 
          attribut_event = FactoryBot.attributes_for(:event)
          event = FactoryBot.create(:event)
          post :create, params: {  :event => attribut_event.merge(:startup => FactoryBot.create(:startup)) }
      }.to change(Event,:count).by(1)
      end
      
      # it "redirects to the new user" do
      #   attribut_event = FactoryBot.attributes_for(:event)
      #   event = FactoryBot.create(:event)
      #   post :create, params: {  :event => attribut_event.merge(:startup => FactoryBot.create(:startup)) }
      #   # post :create, event: FactoryBot.attributes_for(:event)
  
      #   # en général tu rediriges vers le show de ce que tu viens de créer
      #   response.should redirect_to Event.last
      #   response.should redirect_to '/scorecard'
      # end
    end
    
    # context "with invalid attributes" do
    #   it "doest not create a new user" do
    #     expect { 
    #       # post :create, event: Factory.attributes_for(invalide)
    #       post :create, params: { "event" => { invalide } }
    #     }.to_not change(Event, :count)
    #   end
      
    #   it "re-renders the new method" do
    #     # post :create, event: Factory.attributes_for(invalide)
    #     post :create, params: { "event" => { invalide } }

    #     response.should render_template :new
    #   end
    # end
  end

  # describe "PUT update" do
  #   before :each do
  #     @event = FactoryBot.create(:event)
  #   end
  
  
  #   context "with valid attributes" do
  #     it "located the requested @user" do
  #       title = Faker::Lorem.word
  #       description = Faker::Lorem.sentence
  #       adress = Faker::Address.country 
  #       put :update, id: @event, params: { "event" => { 
  #         title: title,
  #          description: description,
  #          adress: adress} }
  #       assigns(:event).should eq(@event)      
  #     end
    
  #     it "changes @user's attributes" do
  #       title = Faker::Lorem.word
  #       description = Faker::Lorem.sentence
  #       adress = Faker::Address.country 
  #       put :update, id: @event, params: { "event" => {
  #          title: title,
  #          description: description,
  #          adress: adress
  #          }}
  #       @event.reload
  #       @event.title.should eq("event")
  #       @event.description.should eq("event descrription")
  #       @event.adress.should  eq("adress")
  #     end
    
  #     it "redirects to the updated contact" do
  #       title = Faker::Lorem.word
  #       description = Faker::Lorem.sentence
  #       adress = Faker::Address.country 
  #       put :update, id: @event, params: { "event" => { 
  #         title: title,
  #         description: description,
  #         adress: adress} }
  
  #       # redirige où tu veux
  #       response.should redirect_to @event
  #     end
  #   end
    
    # context "with invalid attributes" do
    #   it "locates the requested @event" do
    #     put :update, id: @event, params: { "event" => {  } }
    #     assigns(:event).should eq(@event)      
    #   end
      
    #   it "does not change @event's attributes" do
    #     put :update, id: @event, params: { "event" => {  } }
    #     @event.reload
    #     @event.title.should_not  eq("event")
    #     @event.duration.should_not  eq(30)
    #     @event.description.should_not eq("event descrription")
    #     @event.short_location.should_not eq("short location")
    #     @event.adress.should_not eq("adress")
    #     @event.zip_code.should_not eq("75000")
    #     @event.city.should_not eq("paris")
        
    #   end
      
    #   it "re-renders the edit method" do
    #     put :update, id: @event, params: { "event" => {  } }
    #     response.should render_template :edit
    #   end
    # end
  # end

  # describe 'DELETE destroy' do
  #   before :each do
  #     @user = User.create
  #   end
    
  #   it "deletes the user" do
  #     expect{
  #       delete :destroy, id: @user        
  #     }.to change(User, :count).by(-1)
  #   end
      
  #   it "redirects to users#index" do
  #     delete :destroy, id: @user
  #     response.should redirect_to contacts_url
  #   end
  # end

end