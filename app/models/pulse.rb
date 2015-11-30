class Pulse

  def self.pulsate
    browser = Watir::Browser.new :firefox
    WEBSITE_URLS.last(5000).each do |pulse|
      print pulse[:url]
      print " with "
      print pulse[:check]
      print " ."
      begin
        browser.goto pulse[:url]
        print "."
        text = browser.text
        print ". "
        if text.include? pulse[:check]
          puts "ok"
        else
          puts "FAILED"
        end
      rescue StandardError => e
        puts " FAILED #{e}"
      end
    end
    browser.close
  end

end
