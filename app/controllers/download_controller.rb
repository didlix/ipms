class DownloadController < ApplicationController
  layout 'page'
  def index
    require 'uri'
    url = "http://www.netdojo.co.uk/sites/default/files/netdojo_logo.png"
    uri = URI.parse url
    case uri.scheme
        when 'http': 
          require 'net/http' 
        when 'http': 
          require 'net/https' 
        when 'ftp'
          require 'net/ftp' 
        when 'file'
    end

    moo = File.exist? url
    puts moo
    
  end

end
