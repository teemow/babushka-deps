dep "mux.go" do
  package "github.com/gorilla/mux"
end
dep "sessions.go" do
  package "github.com/gorilla/sessions"
end
dep "go-router" do
  requires "mux.go", "sessions.go"
end
