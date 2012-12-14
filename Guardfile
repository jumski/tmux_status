# A sample Guardfile
# More info at https://github.com/guard/guard#readme

# Add files and commands to this file, like the example:
#   watch(%r{file/path}) { `command(s)` }
#
guard 'shell' do
  watch(/(bin|lib|gem)/i) {|m| `/home/jumski/.rvm/bin/current_ruby #{m[0]}` }
end
