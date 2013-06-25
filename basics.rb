dep "vim.bin"
dep "whois.bin"
dep "wget.bin"
dep "htop.bin"
dep "iostat.bin" do
  installs "sysstat"
end
dep "gem-environment" do
  met? {
    shell "grep rubygems ~/.zprofile"
  }
  meet {
    shell "echo 'PATH=$PATH:$(ruby -rubygems -e \"puts Gem.user_dir\")/bin' >> ~/.zprofile"
    shell "echo 'export GEM_HOME=~/.gem/ruby/2.0.0' >> ~/.zprofile"
  }
end

dep "basics" do
  requires %w{vim.bin whois.bin wget.bin htop.bin iostat.bin gem-environment}
end
