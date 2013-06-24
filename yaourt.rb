dep "yaourt.src" do
  requires "linux build tools", "package-query.src"
  
  source "https://aur.archlinux.org/packages/ya/yaourt/yaourt.tar.gz"
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
  provides "yaourt"
end
