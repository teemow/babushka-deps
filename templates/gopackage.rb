meta :go do
  accepts_value_for :package, :basename
  accepts_list_for :basename
  template {
    requires_when_unmet "go"
    met? {
      login_shell("go list #{package}") == package
    }
    meet {
      log "Installing #{package}"
      login_shell "GOPATH=#{login_shell("echo $GOPATH")} go get #{package}", :sudo => true
    }
  }
end
