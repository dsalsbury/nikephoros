require 'spec_helper'

describe Volume do
  it { should have_many(:articles) }

  it { should validate_presence_of(:number) }
  it { should validate_presence_of(:year) }
end
