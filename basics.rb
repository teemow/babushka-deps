dep "vim.bin"
dep "whois.bin"
dep "wget.bin"
dep "htop.bin"
dep "iostat.bin" do
  installs "sysstat"
end
dep "editorconfig-core-git.yaourt" do
  provides "editorconfig"
end

dep "gem-path" do
  met? { "~/.gem/ruby/2.0.0/bin".p.exists? and "~/.gem/ruby/2.0.0/gems".p.exists? }
  meet { 
    shell "mkdir -p ~/.gem/ruby/2.0.0/bin" 
    shell "mkdir -p ~/.gem/ruby/2.0.0/gems" 
  }
end

dep "gem-environment" do
  requires "gem-path"
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
  requires %w{vim.bin whois.bin wget.bin htop.bin iostat.bin gem-environment editorconfig-core-git.yaourt}, "babushka-deps".with("teemow", "babushka-deps", "~/.babushkai" / "deps")
end
