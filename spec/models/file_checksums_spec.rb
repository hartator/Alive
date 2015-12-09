require "rails_helper"
require "open-uri"

OpenURI::Buffer.send :remove_const, 'StringMax' if OpenURI::Buffer.const_defined?('StringMax')
OpenURI::Buffer.const_set 'StringMax', 0

FILE_CHECKSUMS.each do |file|

  describe "#{file[:url]}" do

    it "should match checksum" do
      dowloaded_file = open file[:url]
      sha256_from_downloaded_file = Digest::SHA256.file(dowloaded_file).hexdigest
      expect(sha256_from_downloaded_file).to eql(file[:sha256])
    end

  end

end
