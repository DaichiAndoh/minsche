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
    it "is invalid without title" do
      schedule = FactoryBot.build(:schedule, title: nil)
      schedule.valid?
      expect(schedule.errors[:title]).to include("can't be blank")
    end
    
    # 開始時間がなければ無効な状態であること
    it "is invalid without start_time" do
      schedule = FactoryBot.build(:schedule, start_time: nil)
      schedule.valid?
      expect(schedule.errors[:start_time]).to include("can't be blank")
    end
    
    # 終了時間がなければ無効な状態であること
    it "is invalid without end_time" do
      schedule = FactoryBot.build(:schedule, end_time: nil)
      schedule.valid?
      expect(schedule.errors[:end_time]).to include("can't be blank")
    end
end