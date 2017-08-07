require "rails_helper"



RSpec.describe User, type: :model do
  context "validations" do

    it "should have all specific attributes" do
      should have_db_column(:name).of_type(:string)
      should have_db_column(:email).of_type(:string)
      should have_db_column(:password_digest).of_type(:string)
    end

    describe "validates presence of attributes" do

      it { is_expected.to validate_presence_of(:password)}
    end

    describe "validates valid email and password" do
      it { is_expected.to validate_length_of(:password).is_at_least(6) }
    end

    #happy_path
    describe "can be created when all attributes are present" do
      When(:user) { User.create(
                      name: "Testing",
                      email: "test@gmail.com",
                      password: "12345678",
      )}
      Then { user.valid? == true }
    end

    # unhappy_path
    describe "cannot be created without a password" do
      When(:user) { User.create(email: "test@gmail.com", name: "Test") }
      Then { user.valid? == false }
    end

    describe "should permit valid email only" do
      let(:user1) { User.create(name: "Testing", email: "testing@gmail.com", password: "123456")}
      let(:user2) { User.create(name: "TestTwo",email: "test.com", password: "123456") }

      # happy_path
      it "sign up with valid email" do
        expect(user1).to be_valid
      end

      # unhappy_path
      it "sign up with invalid email" do
        expect(user2).to be_invalid
      end
    end
  end

  context 'associations with dependency' do
    it { is_expected.to have_many(:authentications).dependent(:destroy)}
  end
end
