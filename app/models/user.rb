class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :book_lists, as: :ownerable

  def user_initial
    return initial_to_caps(name || email)
  end

  def initial_to_caps(username)
    username[0].upcase
  end

  def username
    if last_name.nil?
      return (name || email)
    elsif !name.nil?
      return name + " " + last_name
    end
    return email
  end

end
