class User < ActiveRecord::Base
  has_many :posts
  has_many :replies

  validates_presence_of :first_name, :if => lambda {|user| user.sign_up_status == 'who_you_are'}
  validates_presence_of :company, :if => lambda {|user| user.sign_up_status == 'about_you'}

  def initialize(status = nil, *params)
    @status = sign_up_status(status)
    super(*params)
  end

  def sign_up_status(status = nil)
    @status || status || sign_up_statuses.first
  end

  def next_sign_up_status
    @status = sign_up_statuses[sign_up_statuses.index(@status)+1]
  end

  def sign_up_finished?
    @status == sign_up_statuses.last
  end

  def sign_up_statuses
    ['who_you_are', 'about_you']
  end
end