require 'fileutils'

GITCONFIG = 'git/gitconfig'
VIMCONFIG = 'vi/vimrc'
BASHCONFIG = 'bash/bash_config'

CURRENT_PATH = File.dirname(__FILE__)

FILES = ["#{GITCONFIG}", "#{VIMCONFIG}", "#{BASHCONFIG}"].collect{|f| File.join(CURRENT_PATH, f) }


def download_lein
  `curl https://raw.github.com/technomancy/leiningen/stable/bin/lein > lein`
  `chmod +x lein`
end

def install_lein
  puts "Add the file lein to path somewhere"
end

def patogen
  `mkdir -p ~/.vim/autoload ~/.vim/bundle; curl -Sso ~/.vim/autoload/pathogen.vim https://raw.github.com/tpope/vim-pathogen/master/autoload/pathogen.vim`
end

def generate_bash_include_verbiage(file)
<<-eos

if [ -f ~/#{file} ]; then
   . ~/#{file}
fi

eos
end

def expanded_path_for_file_in_home(file)
  File.join(File.expand_path('~'), file)
end

BASHRC = expanded_path_for_file_in_home('.bashrc')

def bashrc_contains_include
  filename = File.basename(BASHCONFIG)
  File.open(BASHRC) { |f| f.grep(Regexp.new filename) }.any?
end


def copy_files_to_home
  FILES.each do |file|
    filename = File.basename(file)
    dest = expanded_path_for_file_in_home(".#{filename}")
    FileUtils.cp(file, dest, :verbose => true)
  end
end

def append_bash_configs_to_bashrc
  filename = ".#{File.basename(BASHCONFIG)}"
	content = generate_bash_include_verbiage(filename)
	File.open(BASHRC, 'a') {|f| f << content }
end


patogen
copy_files_to_home
append_bash_configs_to_bashrc unless bashrc_contains_include

