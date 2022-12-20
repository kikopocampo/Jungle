require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe "Validations" do

    it "should be valid if all entries are filled correctly" do
      @user = User.new(first_name: "Bob",
                      last_name: "Brown",
                      email: "bobbybrown@gmail.com",
                      password: "bananas",
                      password_confirmation: "bananas"
                      )
      expect(@user).to be_valid
    end  

    it "should return invalid if password do not match" do
      @user = User.new(first_name: "Bob",
                      last_name: "Brown",
                      email: "bobbybrown@gmail.com",
                      password: "bananas",
                      password_confirmation: "apples"
                      )
      expect(@user).to_not be_valid
    end  

    it "should return invalid if first_name is nil" do
      @user = User.new(first_name: nil,
                      last_name: "Brown",
                      email: "bobbybrown@gmail.com",
                      password: "bananas",
                      password_confirmation: "bananas"
                      )
      expect(@user).to_not be_valid
    end  

    it "should return invalid if last_name is nil" do
      @user = User.new(first_name: "Bob",
                      last_name: nil,
                      email: "bobbybrown@gmail.com",
                      password: "bananas",
                      password_confirmation: "bananas"
                      )
      expect(@user).to_not be_valid
    end  

    it "should return invalid if email is nil" do
      @user = User.new(first_name: "Bob",
                      last_name: "Brown",
                      email: nil,
                      password: "bananas",
                      password_confirmation: "bananas"
                      )
      expect(@user).to_not be_valid
    end  
    
    it "should return invalid if email already exist" do
      @user = User.new(first_name: "Bob",
                      last_name: "Brown",
                      email: "bbrown@gmail.com",
                      password: "bananas",
                      password_confirmation: "bananas"
                      )
      @user.save
      @user2 = User.new(first_name: "Billy",
                        last_name: "Green",
                        email: "bbrown@gmail.com",
                        password: "bananas",
                        password_confirmation: "bananas"
                        )
      expect(@user2).to_not be_valid
    end  

    it "should return invalid if password is less than 7 characters" do
      @user = User.new(first_name: "Bob",
                      last_name: "Brown",
                      email: "bobbybrown@gmail.com",
                      password: "apple",
                      password_confirmation: "apple"
                      )
      expect(@user).to_not be_valid
    end  

  end
  describe 'authenticate_with_credentials' do

    subject {
      User.new(first_name: "Bob",
      last_name: "Brown",
      email: "bobbybrown@gmail.com",
      password: "bananas",
      password_confirmation: "bananas"
      )
    }

    it 'should return the user when authenticated' do
      subject.save
      @user = User.authenticate_with_credentials("bobbybrown@gmail.com", 'bananas')
      expect(@user).to_not be_nil
    end

    it 'should return nil when email does not exist' do
      subject.save
      @user = User.authenticate_with_credentials("unknownemail@gmail.com", 'bananas')
      expect(@user).to be_nil
    end

    it 'should return nil when the incorrect passsword is entered' do
      subject.save
      @user = User.authenticate_with_credentials("bobbybrown@gmail.com", 'banana')
      expect(@user).to be_nil
    end


    it 'should return the user even when trailing spaces exist' do
      subject.save
      @user = User.authenticate_with_credentials("   bobbybrown@gmail.com   ", 'bananas')
      expect(@user).to_not be_nil
    end

    it 'should return the user for case related user errors' do
      subject.save
      @user = User.authenticate_with_credentials("   boBBYbrown@GMail.com   ", 'bananas')
      expect(@user).to_not be_nil
    end
  end

end
