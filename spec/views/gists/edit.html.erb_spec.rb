require 'spec_helper'

describe "gists/edit.html.erb" do
  before do
    assign(:gist, stub_model(Gist, snippet: 'foo'))
  end

  it "display header" do
    render
    expect(rendered).to include("Editing gist")
  end

  it "renders _form partial" do
    render
    expect(view).to render_template(:partial => "_form", :count => 1)
  end
end
