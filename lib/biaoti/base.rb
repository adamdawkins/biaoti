require 'open-uri'
require 'nokogiri'
require 'clipboard'

module Biaoti

  class Base

    def self.get_document url
      Nokogiri::HTML( open(url) )
    end

    def self.copy_title document
      if document.class != Nokogiri::HTML::Document
        raise TypeError, "Expected Nokogiri::HTML::Document, received #{document.class}"
      else
       Clipboard.copy document.title
      end
    end

    def self.copy_title_from_url url
      self.copy_title( self.get_document(url) )
    end

  end

end
