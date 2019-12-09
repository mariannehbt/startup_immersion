require 'rails_helper'
require 'spec_helper'
RSpec.describe AttendancesController, type: :controller do    
  describe "GET index" do
    
    it "assigns @attendance" do
      # création d'une instance
      attendance = FactoryBot.create(:attendance)

      # on va sur index
      get :index 
      # @attendance doit être une array qui contient attendance
      expect(assigns(:attendances)).to eq([attendance])
    end
  
    it "renders the index template" do
      # va sur index
      get :index
  
      # on doit rediriger vers index
      expect(response).to render_template("index")
    end
  end

  describe "GET show" do
    it "assigns @attendance" do
      # création d'une instance
      attendance = FactoryBot.create(:attendance)
      
      # on va sur show
      get :show, params: {id: attendance.id}
  
      # @attendance doit être attendance
      expect(assigns(:attendance)).to eq(attendance)
    end
  
    it "renders the show template" do
      # création d'une instance
      attendance = FactoryBot.create(:attendance)

      # va sur show
      get :show, params: {id: attendance.id}
  
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
      attendance = FactoryBot.create(:attendance)
  
      # on va sur edit
      get :edit, params: {id: attendance.id}
  
      # @attendance doit être attendance
      expect(assigns(:attendance)).to eq(attendance)
    end
  
    it "renders the edit template" do
       # création d'une instance
       attendance = FactoryBot.create(:attendance)

      # va sur edit
      get :edit, params: {id: attendance.id}
  
      # on doit rediriger vers edit
      expect(response).to render_template("edit")
    end
  end

  describe "POST create" do
    let(:attribut_attendance) { FactoryBot.attributes_for(:attendance).merge(
      :user_id => FactoryBot.create(:user).id,
      :event_id => FactoryBot.create(:event).id )}
    context "with valid attributes" do

      # test de creation d'une instance via la methode create du controller attendance
      it "creates a new attendance" do
        expect {
          post :create, params: {:attendance => attribut_attendance}
      }.to change(Attendance,:count).by(1)
      end
      
      # test de redirection apres creation d'une instance via le controller attendance
      it "redirects to the created attendance" do
        post :create, params: {:attendance => attribut_attendance}
       
        # en général tu rediriges vers le show de ce que tu viens de créer
        expect(response).to redirect_to(Attendance.last)
      end
    end
    
    #test d'invalide creation ne doit pas s'instancier
    context "with invalid attributes" do
      it "doest not create a new user" do
        expect { 
          post :create, params: {:attendance => {motivation: "", comment: ""}}
        }.to_not change(Attendance, :count)
      end
      
      # test de redirection quand attendance n'est pas instancier
      it "re-renders the new method" do
        post :create, params: {:attendance => {motivation: "", comment: ""}}
        expect(response).to render_template(:new)
      end
    end
  end

  describe "PUT update" do
    
    before :each do
      @attendance =  FactoryBot.create(:attendance)
    end
    
    context "with valid attributes" do
      let(:attribut_attendance)  { FactoryBot.attributes_for(:attendance,
      motivation: "Motivation update greate",
      comment: "Comment update greate"
        )}
      it "located the requested @attendance" do        
        put :update, params:{ id: @attendance, attendance: attribut_attendance}
        @attendance.reload
        expect(assigns(:attendance)).to eq(@attendance)      
      end
      
      it "changes @attendance's attributes" do
        put :update, params:{ id: @attendance, attendance: attribut_attendance}
        @attendance.reload
        expect(@attendance.motivation).to eq("Motivation update greate")
        expect(@attendance.comment).to eq("Comment update greate")
      end
      
      it "redirects to the updated contact" do
        put :update, params:{ id: @attendance, attendance: attribut_attendance}

        # redirige où tu veux
        expect(response).to redirect_to @attendance
      end
    end
    
    
    context "with invalid attributes" do
      let(:invalid_attribut_attendance)  { FactoryBot.attributes_for(:attendance,
        motivation: "",
        comment: "")} 

      it "locates the requested @attendance" do
        put :update, params: {id: @attendance, attendance: invalid_attribut_attendance}
        expect(assigns(:attendance)).to eq(@attendance)      
      end
      
      it "does not change @attendance's attributes" do
        put :update, params: {id: @attendance, attendance: invalid_attribut_attendance}
        @attendance.reload
        expect(@attendance.motivation).to eq("Motivation greater than 20 charactere")
        expect(@attendance.comment).to eq("Comment greater than 20 charactere")       
      end
      
      it "re-renders the edit method" do
        put :update, params: {id: @attendance, attendance: invalid_attribut_attendance}
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE destroy' do
    before :each do
      @attendance = FactoryBot.create(:attendance)
    end
    
    it "deletes the user" do
      expect{
        delete :destroy, params: {id: @attendance}        
      }.to change(Attendance, :count).by(-1)
    end
      
    it "redirects to users#index" do
      delete :destroy, params: {id: @attendance} 
      expect(response).to redirect_to attendances_url
    end
  end

end