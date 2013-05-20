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

      it 'can get the root frame' do

      end

    end


  end










end
