require 'spec_helper'

describe Tagging do
  it { should belong_to(:article) }
  it { should belong_to(:keyword) }
end
