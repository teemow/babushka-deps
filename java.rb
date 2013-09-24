dep "java-environment.bin" do
  provides "java"
end

dep "java" do
  requires [
    "java-environment.bin", 
    "env var set".with("JAVA_HOME", "/usr/lib/jvm/java-7-openjdk"),
    "env var contains".with("PATH", "$JAVA_HOME/bin")
  ]
end
