dep "datomic.yaourt" do 
  requires "yaourt.src", "java"
  met? { "/opt/datomic/bin/datomic".p.exists? }
  meet {
    log_shell "Installing datomic", "sudo yaourt --noconfirm -S datomic"
  }
end
