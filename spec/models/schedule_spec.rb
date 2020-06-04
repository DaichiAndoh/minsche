require 'rails_helper'

RSpec.describe Schedule, type: :model do
    # タイトル、開始時間、終了時間があれば有効な状態であること
    it "is valid with a title, start_time, and end_time" do
      group = FactoryBot.build(:group)
      schedule = group.schedules.build(
        title: "Practice",
        start_time: "2020-05-27 12:00:00",
        end_time: "2020-05-27 18:00:00"
      )
      expect(schedule).to be_valid
    end
    
    # タイトルがなければ無効な状態であること
    it { is_expected.to validate_presence_of :title }
    
    # 開始時間がなければ無効な状態であること
    it { is_expected.to validate_presence_of :start_time }
    
    # 終了時間がなければ無効な状態であること
    it { is_expected.to validate_presence_of :end_time }
end