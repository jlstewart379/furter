require 'spec_helper'

describe Furter::Accessors::Screen do

  let(:screen) { Furter::Accessors::Screen.new}
  let(:server){double('frank-server')}


  context 'Getting screen data' do

    it 'can get all the screen data' do
      screen.should_receive(:send_get).with 'dump'
      screen.big_dump
    end

    context 'getting root elements' do

      it 'can get window subview' do
        json = MultiJson.load('{"class":"UIWindow","subviews":["a_subview"],"uid":1}')
        screen.should_receive(:send_get).with('dump').and_return(json)
        screen.get_window("subviews").should == ["a_subview"]
      end
      #
      #it 'can get the window id' do
      #  json = MultiJson.load('{"class":"UIWindow","subviews":["a_subview"],"uid":1}')
      #  screen.should_receive(:send_get).with('dump').and_return(json)
      #  screen.
      #
      #end

    end


  end










end
