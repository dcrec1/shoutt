require File.dirname(__FILE__) + '/../spec_helper'

describe Shoutt do
  fixtures :shoutts

  should_belong_to :user
  should_validate_presence_of :user, :body, :date
end
