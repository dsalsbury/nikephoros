require 'spec_helper'

describe Tagging do
  it { should belong_to(:document) }
  it { should belong_to(:keyword) }
end
