require 'spec_helper'

describe "gists/index.html.erb" do
  before do
    assign(:gists, [stub_model(Gist, snippet: 'foo'), stub_model(Gist, snippet: 'bar')])
  end

  it "displays header" do
    render
    expect(rendered).to include("Listing gists")
  end
end
