class Facebooker
  attr_accessor :oauth

  def initialize(attrs)
    @oauth = attrs[:oauth]
  end

  def user_exists?
    user.present?
  end

  def user
    User.find_by(uid: @oauth[:uid])
  end

  def register!
    User.create!(
      name: @oauth[:info][:name],
      email: @oauth[:info][:email],
      uid: @oauth[:uid],
      password: SecureRandom.uuid
    )
  end
end
