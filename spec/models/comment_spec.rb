require 'rails_helper'

RSpec.describe Comment, type: :model do
  context 'validation comment test' do
    it { should validate_presence_of(:content) }
  end
end
