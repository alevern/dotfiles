function _peco_change_directory
  if [ (count $argv) ]
    peco --layout=bottom-up --query "$argv "|perl -pe 's/([ ()])/\\\\$1/g'|read foo
  else
    peco --layout=bottom-up |perl -pe 's/([ ()])/\\\\$1/g'|read foo
  end
  if [ $foo ]
    builtin cd $foo
    commandline -r ''
    commandline -f repaint
  else
    commandline ''
  end
end

function peco_change_directory
  begin
    echo $HOME/.config
    ls -ad *|perl -pe "s#^#$PWD/#"|grep -v \.git
    find $HOME/Repositories -maxdepth 3 -type d -name .git -prune -exec dirname {} \;
  end | sed -e 's/\/$//' | awk '!a[$0]++' | _peco_change_directory $argv
end
