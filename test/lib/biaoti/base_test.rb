require_relative '../../test_helper'

describe Biaoti::Base do
  subject { Biaoti::Base }
  
  describe "retrieving HTML" do
    it "must have a get_document method" do
      subject.must_respond_to(:get_document)
    end
  end

  describe "#get_document" do
    describe "with invalid url" do
      it "throws an error" do 
        proc {
        subject.get_document("not a url")
        }.must_raise Errno::ENOENT
      end
    end
    describe "with valid url" do
      before do
        @url = ""
      end

      it "returns a Nokogiri::HTML::document" do
        subject.get_document(
          "http://www.mintvelvet.co.uk/"
        ).must_be_instance_of(Nokogiri::HTML::Document)
      end
    end
  end

  describe "#copy_title" do 
    describe "not passed valid Nokogiri::HTML::Document" do
      it "raises a TypeError" do
        proc {
          subject.copy_title(open("http://www.mintvelvet.co.uk/"))
        }.must_raise TypeError
      end
    end

    describe "passed valid document" do
      before do
        Clipboard.copy ""
        @document = subject.get_document("http://www.ruby-doc.org/")
        subject.copy_title(@document)
      end
      it "copies the title from the document to the clipboard" do
        (Clipboard.paste).must_equal "Ruby-Doc.org: Documenting the Ruby Language"
      end
    end
  end

  describe "#copy_title_from_url" do
    before do
      @url = "http://www.ruby-doc.org/"
      @expected_title = "Ruby-Doc.org: Documenting the Ruby Language"
      Clipboard.copy ""
      subject.copy_title_from_url @url
    end

    it "copies the title from the url to the clipboard" do
      (Clipboard.paste).must_equal @expected_title
    end
  end

end
