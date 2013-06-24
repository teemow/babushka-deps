dep "package-query.src" do
  requires "linux build tools"

  source "https://aur.archlinux.org/packages/pa/package-query/package-query.tar.gz" 
  configure {
    log "nothing to configure"
    true
  }
  build {
    log_shell "build", "makepkg -s --noconfirm"
  }
  install {
    log_shell "install", "makepkg -i --noconfirm"
  }
  provides "package-query"
end
