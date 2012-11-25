require 'spec_helper'

describe "categories/index.html.erb" do
  before(:each) do
    assign(:categories, [
      stub_model(Categorie,
        :libelle => "Libelle"
      ),
      stub_model(Categorie,
        :libelle => "Libelle"
      )
    ])
  end

  it "renders a list of categories" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Libelle".to_s, :count => 2
  end
end
