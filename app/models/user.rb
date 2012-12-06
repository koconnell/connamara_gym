class User < ActiveRecord::Base
  attr_accessible :email, :role, :username, :enabled
  attr_accessible :password, :password_confirmation # fields from has_secure_password

  # if you change the Roles, do a "grep -iR User::Role --include=*rb" to catch all the existing usages
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
