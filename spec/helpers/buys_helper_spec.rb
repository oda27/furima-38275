require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the BuysHelper. For example:
#
# describe BuysHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe BuysHelper, type: :helper do
  config.use_transactional_fixtures = true

  pending "add some examples to (or delete) #{__FILE__}"
end