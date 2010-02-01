require 'shoulda'
require 'rack/mock'
require 'fileutils'
require 'rack-git-up'  # may want to change this to rack/gitup
 
class GitUpTest < Test::Unit::TestCase
  context "Rack::GitUp" do
    setup do
      @app = lambda { |env| [404, { }, []] }
      dir = File.dirname(__FILE__)
      @root = File.join(dir, "public")
      @repo = File.join(dir, "test-repo")
      @urls = ["/"]
      
      clear_dir @root
    end

    should "should allow regular requests to follow through" do
      app = git_up :root => @root, :repo => @repo, :urls => @urls
      status, headers, body = app.call(mock_env('/README'))
      assert_equal 200, status
      
      out = ''
      body.each { |s| out << s }
      
      assert_equal "This is a test repo for using the rack-git-up gem\n", out
    end
    
    should "should filter based on url" do
      app = git_up :root => @root, :repo => @repo, :urls => ["/wonki wonki donki/*.jpg"]
      status, headers, body = app.call(mock_env('/README'))
      assert_equal 404, status
    end
    
    should "should return 404 if file does not exist" do 
      app = git_up :root => @root, :repo => @repo, :urls => ["/wonki wonki donki/*.jpg"]
      status, headers, body = app.call(mock_env('/cannot_readme_because_i_do_not_exist'))
      assert_equal 404, status
    end
  end
  
    
  def clear_dir dirname
    Dir.foreach(dirname) do |f|
      path = File.join(dirname, f)
      if f == '.' or f == '..' then 
	next
      elsif 
	File.directory?(path) then FileUtils.rm_rf(path)
      else 
	FileUtils.rm( path )
      end
    end
  end
  
  def mock_env path = '/'
    Rack::MockRequest.env_for path
  end

  def git_up options = {}
    Rack::GitUp.new @app, options
  end
  
end