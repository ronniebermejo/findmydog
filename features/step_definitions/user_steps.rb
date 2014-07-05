module UserStepsHelper
  def login(user_or_email)
    user = user_or_email.respond_to?(:email) ? user_or_email : User.find_by_email!(user_or_email)
    logout
    login_as(user, :scope => :user)
    set_current_user user
  end

  def find_or_create_user_by_email(email, factory=:user)
    User.find_by_email(email) || create(factory, email: email)
  end

  def find_by_email_and_decorate(email)
    UserDecorator.new(User.find_by_email!(email))
  end

  def set_current_user(user)
    @current_user = user
  end

  def current_user
    @current_user
  end
end

def set_and_login_as(user)
  set_current_user user
  login current_user
end

Given "I am logged in as a user" do
  set_and_login_as create(:user)
end

Given %|I am logged in as a user with the email "$email"| do |email|
  user = User.find_by_email(email)
  set_and_login_as user
end






World(UserStepsHelper)
