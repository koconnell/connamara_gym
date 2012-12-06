class User < ActiveRecord::Base
  attr_accessible :email, :password_digest, :role, :username
  attr_accessible :password, :password_confirmation # fields from from has_secure_password

  module Role
    Admin = 'admin'
    AdvancedUser = 'advanced_user'
    BasicUser = 'basic_user'
  end

  ROLES = Role.constants.map {|c| Role.const_get c }

  has_secure_password

  # for cancan
  def ability
     @ability ||= Ability.new(self)
  end

  # cancan: make it so we can call user.can? instead of user.ability.can?
  delegate :can?, :cannot?, :to => :ability

  before_validation :clean_fields
  validates_presence_of :password, :on => :create
  validates_presence_of :email, :on => :create
  validates_presence_of :username, :on => :create
  validates_uniqueness_of :username, :on => :create
  validates_presence_of :role, :on => :create
  validate :role_is_valid


private
  def role_is_valid
    errors.add(:role, "invalid role: '#{role}'") unless ROLES.include? role
  end

  def clean_fields
    email.strip! if email
    username.strip! if username
  end


end
