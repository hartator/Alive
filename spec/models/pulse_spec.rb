require "rails_helper"

module NilPoltergeistLogger
  def self.puts(*)
    return nil
  end
end

WEBSITE_URLS.each do |website|

  describe "#{website[:url]}" do

    before do
      Capybara.current_driver = :poltergeist
      if ENV['TRAVIS']
        Capybara.register_driver :poltergeist do |app|
          Capybara::Poltergeist::Driver.new(app, {js_errors: false})
        end
      end
    end

    it "should include the text: #{website[:check]}" do
      visit website[:url]
      expect(page.status_code).to be(200)
      expect(page.body.size).to be > 250
      expect(page).to have_content /#{website[:check]}/i
    end

    # Open-uri Based Scrapper
    # page = open website[:url]
    # body = page.read
    # expect(page.status[0].to_i).to be == 200
    # expect(body.size).to be > 250
    # expect(body.downcase).to include website[:check].downcase

  end

end
