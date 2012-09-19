class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  include PgSearch
  paginates_per 25

  has_and_belongs_to_many :roles

  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :email, :first_name, :last_name, :roles

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role_ids, :first_name, :last_name

  # Scope for Admins search
  pg_search_scope :search, 
    :against => {
      :first_name => "A",
      :last_name => "B",
      :email => "C",
      :id => "D"
    }, 
    :using => {
      :tsearch => {
        :dictionary => "english",
        :prefix => true,
        :any_word => true
      }
    }

    def is_admin?(user)
      return true if user.roles.find_by_name("Admin")
      false
    end

end
