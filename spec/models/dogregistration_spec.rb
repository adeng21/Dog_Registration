require 'spec_helper'

describe Dogregistration do
  it {should validate_presence_of(:first_name)}
  it {should validate_presence_of(:last_name)}
  it {should validate_presence_of(:email)}
  it {should validate_presence_of(:dog_name)}
end
