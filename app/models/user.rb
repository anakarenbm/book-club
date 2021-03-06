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

  def is_member_of_club?(club)
    return UserClub.where(user: self, club: club).any?
  end

  def is_admin_of_club?(club)
    return club.admin == self
  end

  def belongs_to_club?(club)
    return is_member_of_club?(club) || is_admin_of_club?(club)
  end
end
