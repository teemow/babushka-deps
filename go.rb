dep "go.bin"

dep "go" do
  requires [
    "go.bin", 
    "env var contains".with("PATH", "$GOROOT/bin"),
    "env var contains".with("PATH", "$GOPATH/bin")
  ]
end
