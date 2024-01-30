require 'rails_helper'

RSpec.describe Task, type: :model do
  context 'validations' do
    let(:user) { create(:user) }
    let(:task) { build(:task, user: user) }

    it "is valid with valid attributes" do
      expect(task).to be_valid
    end

    it "is not valid without a title" do
      task.title = nil
      expect(task).not_to be_valid
    end

    it "is not valid without a due date" do
      task.due_date = nil
      expect(task).not_to be_valid
    end

    it "is not valid without a priority" do
      task.priority = nil
      expect(task).not_to be_valid
    end

    it "is not valid with an invalid status" do
      task.status = 'InvalidStatus'
      expect(task).not_to be_valid
    end

    it "is not valid without a user" do
      task.user = nil
      expect(task).not_to be_valid
    end
  end
end
