class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Note: When a new user should be pushed to Iterable? It is being pushed just after creation for now.
  after_commit :push_user_to_iterable, on: :create

  def iterable_user_update_params
    {
      email: self.email,
      userId: self.id.to_s,
      dataFields: {
        full_name: self.full_name,
        mobile: self.mobile,
        dob: self.dob.to_s,
        gender: self.gender
      },
      preferUserId: true
    }
  end

  # Note: This method should be called asynchronously with "Re-Try" option to handle failure scenario, Ex. Using DelayedJob, etc.
  def push_user_to_iterable
    iterable_user = Services::Iterable::User.new(user: self)
    iterable_user.update
  end
end
