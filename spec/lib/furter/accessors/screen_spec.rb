require 'spec_helper'

describe Furter::Accessors::Screen do

  let(:screen) { Furter::Accessors::Screen.new}
  let(:server){double('frank-server')}

  let(:json) {
    MultiJson.load(
    '{
      "frame":
      {
        "size":
        {
          "width":768,
          "height":1024
        },
        "origin":
        {
          "x":0,
          "y":0
        }
      },
        "uid":1,
        "backgroundColor":{},
        "isHidden":0,
        "subviews":["a_subview"],
        "tag":0,
        "isKeyWindow":1,
        "accessibilityFrame":{},
        "windowLevel":0,
        "alpha":1,
        "autoresizingMask":0,
        "class":"UIWindow"
    }')
   }

  context 'Getting screen data' do
    it 'can get all the screen data' do
      screen.should_receive(:send_get).with 'dump'
      screen.big_dump
    end
  end

  context 'getting root elements' do

    before(:each){
      screen.should_receive(:send_get).with('dump').and_return(json)
    }

    it 'can get all the screen elements' do
      screen.should_receive(:send_get).with('dump').and_return(json)
      screen.big_dump
    end

    it 'can get window subview' do
      screen.get_window("subviews").should == ["a_subview"]
    end

    it 'can get the window id' do
      screen.get_window("uid").should == 1
    end

    it 'can get the window element class' do
      screen.get_window("class").should == "UIWindow"
    end

    context 'getting the frame properties' do
      it 'can get the frame properties' do
        screen.get_window("frame").should == {"size"=>{"width"=>768, "height"=>1024}, "origin"=>{"x"=>0, "y"=>0}}
      end
    end

    context 'getting screen elements by id' do
      it 'can get a view by id' do
        screen.get_view(1).should == json
      end
    end
  end
end