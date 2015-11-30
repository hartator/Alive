require "rails_helper"

WEBSITE_URLS.each do |website|

  describe "#{website[:url]}" do

    before do
      Capybara.current_driver = :poltergeist
    end

    it "should include the text: #{website[:check]}" do
      visit website[:url]
      expect(page.status_code).to be(200)
      expect(page.body.size).to be > 250
      expect(page).to have_content website[:check]
    end

  end

end
