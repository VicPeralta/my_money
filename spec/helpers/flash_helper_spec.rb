require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the FlashHelper. For example:
#
# describe FlashHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end

RSpec.describe FlashHelper, type: :helper do
  it 'Returns the alert css' do
    expect(helper.css_for_flash('alert')).to be == 'alert-bg-color'
  end
  it 'Returns the notice css' do
    expect(helper.css_for_flash('notice')).to be == 'second-bg-color'
  end
end
