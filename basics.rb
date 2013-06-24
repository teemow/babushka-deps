dep "vim.bin"
dep "whois.bin"
dep "wget.bin"
dep "htop.bin"
dep "iostat.bin" do
  installs "sysstat"
end

dep "basics" do
  requires %w{vim.bin whois.bin wget.bin htop.bin iostat.bin}
end
