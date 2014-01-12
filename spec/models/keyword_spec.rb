require 'spec_helper'

describe Keyword do
  it { should have_many(:taggings) }
  it { should have_many(:articles).through(:taggings) }
  it { should have_many(:supplements).through(:taggings) }
  it { should validate_presence_of(:name) }
end
