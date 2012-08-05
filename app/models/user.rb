class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :setinfo_pass, :email, :password, :password_confirmation, :remember_me, :url_name
  validates_presence_of :name, :setinfo_pass, :email
  validates_uniqueness_of :name, :setinfo_pass, :email, :case_sensitive => false
  validates_uniqueness_of :url_name, :message => "Please select a different nick. This nick's url-string is already taken"
  #validates :setinfo_pass, :format => { :with => /\A[a-zA-Z]+\z+_/,
  #  :message => "Only letters allowed" }

  before_validation do |user|
    user.url_name = user.name.parameterize.underscore
  end

  after_create do |user|
    new_user = PermaStat.new
    new_user.name = user.name
    new_user.setinfo_pass = user.setinfo_pass
    new_user.save
  end

  after_create do |user|
    new_user = DailyStat.new
    new_user.name = user.name
    new_user.setinfo_pass = user.setinfo_pass
    new_user.save
  end

  after_update :update_account

  after_destroy do |user|
    DailyStat.find_by_setinfo_pass(self.setinfo_pass_was).delete
    PermaStat.find_by_setinfo_pass(self.setinfo_pass_was).delete
  end

  def update_account
    if self.name_changed? or self.email_changed? or self.setinfo_pass_changed? or self.encrypted_password_changed?
      daily_user = DailyStat.find_by_setinfo_pass(self.setinfo_pass_was)
      daily_user.name = self.name
      daily_user.setinfo_pass = self.setinfo_pass
      daily_user.save

      perma_user = PermaStat.find_by_setinfo_pass(self.setinfo_pass_was)
      perma_user.name = self.name
      perma_user.setinfo_pass = self.setinfo_pass
      perma_user.save
    end
  end

end
