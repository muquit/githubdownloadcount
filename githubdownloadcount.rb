#!/usr/bin/env ruby

########################################################################
# a ruby script display github download count for a project
# adapted from gdc python script
# muquit@muquit.com Mon Jan 06 16:46:16 -0500 2014 - first cut
########################################################################

require 'rubygems'
require 'logger'

require 'rest_client'
require 'trollop'
require 'json'

class GithubDownloadCount
  STDERRLOGGER = Logger.new(STDERR)
  STDOUTLOGGER = Logger.new(STDOUT)
            ME = File.basename($0)
       VERSION = "1.01"
GITHUP_API_URL = "https://api.github.com/repos/"

  def initialize
    @topts = nil
  end

  def log(msg)
#    STDERRLOGGER.info "#{msg}"
    STDOUTLOGGER.info "#{msg}"
  end

  def directory_exists?(dir)
    return File.exists?(dir) && File.directory?(dir)
  end

  def show_download_counts
    url = ""
    url << GITHUP_API_URL
    url << @topts[:user]
    url << "/"
    url << @topts[:project]
    url << "/releases"


    begin
      log "url: #{url}"
      response = RestClient.get(url, {"User-Agent" => "githubdownloadcount"})
      json = JSON.parse(response)
      json.each do |a|
        assets = a['assets']
        assets.each do |array|
          name = array['name']
          dc = array['download_count']
          puts "#{name} #{dc} downloads"
        end
      end
#      puts JSON.pretty_generate(JSON.parse(response))
    rescue => e
      log "Error: #{e}"
    end

  end

  def doit
    parse_args
    show_download_counts
  end

  def parse_args
    @topts = Trollop::options do
      version "#{ME} v#{VERSION}"
       banner <<-EOS
#{version}
 A script to display github download count for a project
 Usage: #{ME} options
 Where the options are:
EOS
      opt :user,    "Name of the github user", :type => :string, :required => true
      opt :project, "Name of the github project", :type => :string, :required => true
    end
  end

end

if __FILE__ == $0
  GithubDownloadCount.new.doit
end


