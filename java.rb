dep "java-environment.bin" do
  provides "java"
end

dep "env var set", :key, :value do
  met? {
    login_shell("echo $#{key}") == value
  }
  meet {
    "~/.zprofile".p.append("export #{key}=#{value}\n")
  }
end

dep "env var contains", :key, :value do
  met? {
    log(login_shell("echo $#{key}"))
    login_shell("echo $#{key}").match(value)
  }
  meet {
    "~/.zprofile".p.append("export #{key}=$#{key}#{value}\n")
  }
end

dep "java" do
  requires [
    "java-environment.bin", 
    "env var set".with("JAVA_HOME", "/usr/lib/jvm/java-7-openjdk"),
    "env var contains".with("PATH", ":/usr/lib/jvm/java-7-openjdk/bin")
  ]
end
