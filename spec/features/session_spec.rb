require_relative "../spec_helper"
require "faker"

describe "session starting" do
  describe "post /users/new" do
    it "user creation leads to new user" do
      name = Faker::Name.first_name
      email = Faker::Internet.email
      new_user = {name: name, email: email, password:"derrby", password_confirmation:"derrby"}
      expect{
        post "/users/new", user: new_user
      }.to change{User.count}
    end
  end
=begin

  it "" do
  end

  it "" do
  end

  it "" do
  end

=end
end
