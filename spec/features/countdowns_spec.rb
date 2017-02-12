require "rails_helper"

RSpec.describe "GET /countdown", type: :feature do
  it "renders a countdown" do
    Timecop.freeze do
      ENV["HACKATHON_STARTS_AT"] = (1.day + 2.hours + 3.minutes + 4.seconds).from_now.iso8601

      visit "/countdown"
      expect(page).to have_content("1 day")
      expect(page).to have_content("2 hours")
      expect(page).to have_content("3 minutes")
      expect(page).to have_content("4 seconds")
    end
  end
end
