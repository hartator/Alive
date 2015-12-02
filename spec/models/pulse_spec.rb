require "rails_helper"

module PoltergeistLogger
  def self.puts(*)
  end
end

WEBSITE_URLS.each do |website|

  describe "#{website[:url]}" do

    before do
      Capybara.current_driver = :poltergeist
      if ENV['TRAVIS']
        Capybara.register_driver :poltergeist do |app|
          Capybara::Poltergeist::Driver.new(app, {js_errors: false, phantomjs_logger: PoltergeistLogger, logger: PoltergeistLogger})
        end
      end
    end

    it "should include the text: #{website[:check]}" do
      visit website[:url]
      expect(page.status_code).to be(200)
      expect(page.body.size).to be > 250
      expect(page).to have_content /#{website[:check]}/i
    end

  end

end
