require "spec_helper"

describe ImpactTravel::Configuration do
  after { restore_configuration_to_default }

  describe ".configuration" do
    it "returns the configuration object" do
      api_key = "discountnetwork_secret_key"
      ImpactTravel.configure { |config| config.api_key = api_key }

      expect(ImpactTravel.configuration.api_key).to eq(api_key)
    end
  end

  describe "site configurations" do
    it "returns the site configurations" do
      site_title = "Impact Travel"
      site_abbreviation = "IT"
      site_logo = "logo.png"
      site_contact = "+1 123 456 789 1023"
      site_country = "United States"
      site_address = "123, New York, USA"

      site_keywords = "travel, discount"
      site_description = "Travel the world in cheapest price"
      site_author = "Impact Services"
      site_stylesheet = "custom"

      ImpactTravel.configure do |config|
        config.logo = site_logo
        config.logo_inverse = site_logo
        config.title = site_title
        config.abbreviation = site_abbreviation
        config.keywords = site_keywords
        config.description = site_description
        config.author = site_author
        config.phone = site_contact
        config.country = site_country
        config.address =site_address
        config.stylesheet = site_stylesheet
      end

      configuration = ImpactTravel.configuration

      expect(configuration.logo).to eq(site_logo)
      expect(configuration.logo_inverse).to eq(site_logo)
      expect(configuration.title).to eq(site_title)
      expect(configuration.phone).to eq(site_contact)
      expect(configuration.author).to eq(site_author)
      expect(configuration.country).to eq(site_country)
      expect(configuration.address).to eq(site_address)
      expect(configuration.keywords).to eq(site_keywords)
      expect(configuration.stylesheet).to eq(site_stylesheet)
      expect(configuration.description).to eq(site_description)
      expect(configuration.abbreviation).to eq(site_abbreviation)
    end
  end

  describe "social links" do
    it "returns the social link configurations" do
      facebook = "https://facebook.com/example-page"
      twitter = "https://twitter.com/example-page"
      instagram = "https://instagram.com/example-page"

      ImpactTravel.configure do |config|
        config.facebook = facebook
        config.twitter = twitter
        config.instagram = instagram
      end

      expect(ImpactTravel.configuration.facebook).to eq(facebook)
      expect(ImpactTravel.configuration.twitter).to eq(twitter)
      expect(ImpactTravel.configuration.instagram).to eq(instagram)
    end
  end

  describe "hero sliders" do
    it "returns the default when nothing is configured" do
      expect(
        ImpactTravel.configuration.slides.first,
      ).to eq("impact_travel/slide.jpg")
    end

    it "returns the configured slider names" do
      ImpactTravel.configure do |config|
        config.slides = ["image-1.jpg", "image-2.jpg"]
      end

      expect(ImpactTravel.configuration.slides.first).to eq("image-1.jpg")
    end
  end

  describe "white label specific configuration" do
    it "allows developer to configure the white label" do
      site_domain = "example.com"

      ImpactTravel.configure do |config|
        config.domain = site_domain
      end

      expect(ImpactTravel.configuration.domain).to eq(site_domain)
    end
  end
end
