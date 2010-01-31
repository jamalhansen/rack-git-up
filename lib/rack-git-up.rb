require 'grit'
require 'rack/file'

module Rack
  class GitUp
 
    def initialize(app, options={})
      @app = app
      @repo = Grit::Repo.new(options[:repo])
      @urls = options[:urls] || ["/favicon.ico"]
      @root = options[:root] || Dir.pwd
      @file_server = Rack::File.new(@root)
    end
 
    def call(env)
      path = env["PATH_INFO"]
      can_serve = @urls.any? { |url| path.index(url) == 0 }
 
      if can_serve
        pull_from_git path
        result = @file_server.call(env)
        return result if result[0] == 200
      end
      @app.call(env)
    end

    def pull_from_git path
      blob = (@repo.tree/path[1..-1])
      f = ::File.new(::File.join(@root, path), "w")
      f.syswrite(blob.data)
      f.close
    end
  end
end
