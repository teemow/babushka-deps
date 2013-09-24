dep "env var set", :key, :value do
  met? {
    login_shell("echo $#{key}") == login_shell("echo #{value}")
  }
  meet {
    "~/.zshrc".p.append("export #{key}=#{value}\n")
  }
end

dep "env var contains", :key, :value do
  met? {
    login_shell("echo $#{key}").match(login_shell("echo #{value}"))
  }
  meet {
    "~/.zshrc".p.append("export #{key}=$#{key}:#{value}\n")
  }
end

