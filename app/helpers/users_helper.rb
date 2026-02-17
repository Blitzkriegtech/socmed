module UsersHelper
  def avatar_initials(user)
    user.name.split.map(&:first).join.upcase
  end
end
