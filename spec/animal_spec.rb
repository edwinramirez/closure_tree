require 'spec_helper'
require 'ruby-debug'

def nuke_db
  AnimalHierarchy.delete_all
  Animal.delete_all
end

describe Animal do
  context "Deterministic siblings sort with custom integer column" do
    nuke_db
    fixtures :animals

    before :each do
      Animal.rebuild!
    end

    it "orders siblings_before and siblings_after correctly" do
debugger
      animals(:animal1).self_and_siblings.to_a.should == [animals(:animal1), animals(:animal2), animals(:animal3), animals(:animal4)]

      # animals(:animal1).siblings_before.to_a.should == []
      # animals(:c16).siblings_after.to_a.should == [animals(:c17), animals(:c18), animals(:c19)]
    end

  end
end
