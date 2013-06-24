meta :yaourt do
  accepts_value_for :package, :basename
  accepts_list_for :provides, :basename
  template {
    met? { in_path?(provides) }
    meet {
      log_shell "Installing #{package}", "sudo yaourt --noconfirm -Sb #{package}"
    }
  }
end
