module SignInHelper
  def sign_in_as(user)
    post admin_signin_path(session: {username: user.name, password: "123456"})
  end

  def sign_out_for(user)
    delete admin_logout_path
  end
end
