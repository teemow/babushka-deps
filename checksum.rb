dep "unzip.bin"

dep "checksum.src" do
  requires "linux build tools", "unzip.bin"

  source "https://github.com/anykey0xde/anykey-sdk/archive/master.zip"
  configure {
    log "nothing to configure"
    true
  }
  build {
    log_shell "build", "cd checksum && make"
  }
  install {
    log_shell "install", "cd checksum && sudo cp checksum /usr/local/bin"
  }
end
