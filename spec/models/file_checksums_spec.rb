require "rails_helper"

FILE_CHECKSUMS.each do |file|

  describe "#{file[:url]}" do

    it "should match checksum" do
      dowloaded_file = open file[:url]
      sha256_from_downloaded_file = Digest::SHA256.file(dowloaded_file).hexdigest
      expect(sha256_from_downloaded_file).to eql(file[:sha256])
    end

  end

end
