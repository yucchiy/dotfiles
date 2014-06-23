require 'rake'
require 'fileutils'

desc "Hook our dotfiles into system-standard positions."
task :install => [:submodule_init, :submodules] do

  puts "Welcome to yucchiy's Dotfiles Installation. "

  install_homebrew if RUBY_PLATFORM.downcase.include?("darwin")
  link_file(Dir.glob('git/*')) if want_to_install?('git configs (gitignore_global, gitconfig)')
  link_file(Dir.glob('tmux/*')) if want_to_install?('tmux config')
  link_file(Dir.glob('zsh/*')) if want_to_install?('zshrc')

  if want_to_install?('vim configuration (highly recommended)')
    link_file(Dir.glob('{vim,vimrc}'))
  end

  install_fonts if RUBY_PLATFORM.downcase.include?("darwin")

  puts "All installed!"
end

task :submodule_init do
  unless ENV["SKIP_SUBMODULES"]
    run %{ git submodule update --init --recursive }
  end
end

desc "Init and update submodules."
task :submodules do
  unless ENV["SKIP_SUBMODULES"]
    puts "Downloading submodules...please wait "

    run %{
      cd $HOME/.dotfiles
      git submodule update --recursive
      git clean -df
    }
    puts
  end
end

private
def run(cmd)
  puts "[Running] #{cmd}"
  `#{cmd}` unless ENV['DEBUG']
end

def want_to_install? (section)
  if ENV["ASK"]=="true"
    puts "Would you like to install configuration files for: #{section}? [y]es, [n]o"
    STDIN.gets.chomp == 'y'
  else
    true
  end
end

def install_homebrew
  run %{which brew}
  unless $?.success?
    puts "Installing Homebrew, the OSX package manager...If it's"
    puts "already installed, this will do nothing."
    run %{ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"}
  end

  puts "Installing Homebrew packages...There may be some warnings."
  run %{brew bundle}
end

def link_file(files, method = :symlink)
  files.each do |f|
    file = f.split('/').last
    source = "#{ENV["PWD"]}/#{f}"
    target = "#{ENV["HOME"]}/.#{file}"

    puts "======================#{file}=============================="
    puts "Source: #{source}"
    puts "Target: #{target}"

    if File.exists?(target) && (!File.symlink?(target) || (File.symlink?(target) && File.readlink(target) != source))
      puts "[Overwriting] #{target}...leaving original at #{target}.backup..."
      run %{ mv "$HOME/.#{file}" "$HOME/.#{file}.backup" }
    end

    if method == :symlink
      run %{ ln -nfs "#{source}" "#{target}" }
    else
      run %{ cp -f "#{source}" "#{target}" }
    end

    run %{ source "$HOME/.zshrc" } if file == "zshrc"
  end
end

def iTerm_profile_list
  profiles=Array.new
  begin
    profiles <<  %x{ /usr/libexec/PlistBuddy -c "Print :'New Bookmarks':#{profiles.size}:Name" ~/Library/Preferences/com.googlecode.iterm2.plist 2>/dev/null}
  end while $?.exitstatus==0
  profiles.pop
  profiles
end

def install_fonts
  puts "Installing fonts"
  run %{ cp -f $HOME/.dotfiles/fonts/* $HOME/Library/Fonts }
  puts
end
