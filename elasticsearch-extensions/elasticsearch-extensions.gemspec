# Licensed to Elasticsearch B.V. under one or more contributor
# license agreements. See the NOTICE file distributed with
# this work for additional information regarding copyright
# ownership. Elasticsearch B.V. licenses this file to you under
# the Apache License, Version 2.0 (the "License"); you may
# not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#	http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'elasticsearch/extensions/version'

Gem::Specification.new do |s|
  s.name          = "elasticsearch-extensions"
  s.version       = Elasticsearch::Extensions::VERSION
  s.authors       = ["Karel Minarik"]
  s.email         = ["karel.minarik@elasticsearch.org"]
  s.description   = %q{Extensions for the Elasticsearch Rubygem}
  s.summary       = %q{Extensions for the Elasticsearch Rubygem}
  s.homepage      = "https://github.com/elasticsearch/elasticsearch-ruby/tree/master/elasticsearch-extensions"
  s.license       = "Apache-2.0"

  s.files         = `git ls-files`.split($/)
  s.executables   = s.files.grep(%r{^bin/}) { |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.add_dependency "ansi"
  s.add_dependency "elasticsearch"

  if defined?(RUBY_VERSION) && RUBY_VERSION > '1.9'
    s.add_development_dependency "ruby-prof" unless defined?(JRUBY_VERSION) || defined?(Rubinius)
  end

  s.add_development_dependency "bundler"

  if defined?(RUBY_VERSION) && RUBY_VERSION > '1.9'
    s.add_development_dependency "rake", "~> 11.1"
  else
    s.add_development_dependency "rake", "< 11.0"
  end

  s.add_development_dependency "awesome_print"

  s.add_development_dependency 'shoulda-context'
  s.add_development_dependency 'mocha'
  s.add_development_dependency 'minitest', '~> 5'
  s.add_development_dependency 'minitest-reporters', '~> 1'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'yard'
  s.add_development_dependency 'cane'
  s.add_development_dependency 'pry'

  unless defined?(JRUBY_VERSION)
    s.add_development_dependency 'oj'
    s.add_development_dependency 'patron'
  end

  if defined?(RUBY_VERSION) && RUBY_VERSION < '1.9'
    s.add_development_dependency "json", '~> 1.8'
  end
end
