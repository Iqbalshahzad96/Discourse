require "spec_helper"

describe Onebox::Engine::VimeoOnebox do
  let(:link) { "http://vimeo.com" }
  let(:html) { described_class.new(link).to_html }

  before do
    fake(link, response("vimeo.response"))
  end

  it "returns video title" do
    expect(html).to include("108 years of Herman Miller in 108 seconds")
  end

  # it "returns video photo" do
  #   expect(html).to include("c480x270_18.jpg")
  # end

  it "returns video description" do
    expect(html).to include("To mark the launch of a new website for Hermann Miller furniture")
  end

  # it "returns video URL" do
  #   expect(html).to include("http://www.funnyordie.com/videos/74/the-landlord-from-will-ferrell-and-adam-ghost-panther-mckay")
  # end

  it "returns URL" do
    expect(html).to include(link)
  end
end
