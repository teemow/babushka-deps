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

dep 'babushka-deps', :github_user, :babushka_deps_repo, :babushka_deps_dir do

  def repo
    "git@github.com:#{github_user}/#{babushka_deps_repo}.git"
  end

  met? { File.directory?(babushka_deps_dir) && shell("(cd #{babushka_deps_dir} && git remote -v)")[repo] }
  meet { shell "git clone #{repo} #{babushka_deps_dir}" }
end
 
dep "basics" do
  requires %w{vim.bin whois.bin wget.bin htop.bin iostat.bin gem-environment}, "babushka-deps".with("teemow", "babushka-deps", "~/.babushka" / "deps")
end
