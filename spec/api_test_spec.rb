require 'spec_helper'

describe HypemController do
  
  it "will return a data hash" do
    get :artist
    expect(response).to be_success
  end

end