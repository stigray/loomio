UsernameGenerator = Struct.new(:user) do

  def generate
    begin
      i ||= 0
      username = "#{base_username}#{i if i > 0}"
      i += 1
    end while conflicts.include? username
    username
  end

  private

  def base_username
    user.name.parameterize('')[0,18]
  end

  def conflicts
    UsernameConflictsQuery.conflicts_for(base_username).pluck(:username)
  end

end
