#!/usr/bin/ruby
#
# Copyright:: Copyright 2009 Google Inc.
# Original Author:: John Woodell (mailto:woodie@google.com)
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

require 'fileutils'

FILE_BASE = 'http://appengine-jruby.googlecode.com/hg/demos/rails2/'
MOD_FILES = %w{ app/controllers/rails/info_controller.rb config/boot_rb
                config/environment_rb config/gae_boot_patch.rb
                config/initializers/gae_init_patch.rb config/database.yml
                config/initializers/session_store_rb config.ru }
# Install Rails 2.3.5
FileUtils.touch 'config.ru'
system "curl -s -o Gemfile #{FILE_BASE}Gemfile"
system 'appcfg.rb bundle --update .'
# Remove dups and generate Rails app
FileUtils.rm 'public/robots.txt'
system 'appcfg.rb run -rthread bin/rails .'
# Fetch configuration files
FileUtils.mkdir_p 'app/controllers/rails'
MOD_FILES.each { |path| system "curl -s -o #{path} #{FILE_BASE}#{path}" }
# Merge configs into boot.rb
system 'head -n 108 config/boot.rb > boot'
system 'cat config/boot_rb >> boot'
system 'tail -n 3 config/boot.rb >> boot'
FileUtils.rm 'config/boot_rb'
FileUtils.mv 'boot', 'config/boot.rb'
# Merge configs into environment.rb
system 'head -n 30 config/environment.rb > conf'
system 'cat config/environment_rb >> conf'
system 'tail -n 12 config/environment.rb >> conf '
FileUtils.rm 'config/environment_rb'
FileUtils.mv 'conf', 'config/environment.rb'
# Merge session_store initializer
system 'cat config/initializers/session_store_rb' +
       ' >> config/initializers/session_store.rb'
FileUtils.rm 'config/initializers/session_store_rb'
# install the nulldb adapter
system 'ruby script/plugin install http://svn.avdi.org/nulldb/trunk/'
puts "##"
puts "## Now type 'dev_appserver.rb .'"
puts "##"
