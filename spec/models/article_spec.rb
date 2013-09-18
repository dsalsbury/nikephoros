require 'spec_helper'

describe Article do
  it { should belong_to(:volume) }
  it { should have_many(:authorships) }
  it { should have_many(:authors).through(:authorships) }
  it { should have_many(:taggings) }
  it { should have_many(:keywords).through(:taggings) }

  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:volume) }
end
