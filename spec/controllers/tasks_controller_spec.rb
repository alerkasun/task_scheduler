require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  render_views
  let(:user) { create(:user) }
  let(:valid_attributes) do
    {
      title: 'Test Task',
      due_date: Date.tomorrow,
      priority: 1,
      status: 'ToDo',
      user: user
    }
  end
  let(:invalid_attributes) { { title: nil } }

  before do
    sign_in user
  end

  describe "GET #index" do
    it "returns a success response" do
      Task.create! valid_attributes
      get :index
      expect(response).to be_successful
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      task = Task.create! valid_attributes
      get :show, params: { id: task.id }
      expect(response).to be_successful
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Task" do
        expect {
          post :create, params: { task: valid_attributes }
        }.to change(Task, :count).by(1)
      end

      it "redirects to the tasks list" do
        post :create, params: { task: valid_attributes }
        expect(response).to redirect_to(tasks_path)
      end
    end

    context "with invalid params" do
      it "returns a success response" do
        post :create, params: { task: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end
  
  describe "DELETE #destroy" do
    it "destroys the requested task" do
      task = Task.create! valid_attributes
      expect {
        delete :destroy, params: { id: task.id }
      }.to change(Task, :count).by(-1)
    end

    it "redirects to the tasks list" do
      task = Task.create! valid_attributes
      delete :destroy, params: { id: task.id }
      expect(response).to redirect_to(tasks_url)
    end
  end

  describe "PATCH #update" do
    context "with valid params" do
      let(:new_attributes) { { title: 'Updated Task' } }

      it "updates the requested task" do
        task = Task.create! valid_attributes
        patch :update, params: { id: task.id, task: new_attributes }
        task.reload
        expect(task.title).to eq('Updated Task')
      end

      it "redirects to the task" do
        task = Task.create! valid_attributes
        patch :update, params: { id: task.id, task: new_attributes }
        expect(response).to redirect_to(tasks_path)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e., to display the 'edit' template)" do
        task = Task.create! valid_attributes
        patch :update, params: { id: task.id, task: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end
end
