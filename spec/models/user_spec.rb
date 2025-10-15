require 'rails_helper'

RSpec.describe User, type: :model do

  subject { User.new(email: "jsmith@sample.com", password: 'test1234' )}
  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a password" do
    subject.password = nil
    expect(subject).to_not be_valid
  end

end
