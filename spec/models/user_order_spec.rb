require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe '商品購入機能' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.build(:item, user_id: user.id)
      item.image = fixture_file_upload('unittest/hero.jpg')
      item.save
      @userorder = FactoryBot.build(:user_order, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '商品購入がうまくいくとき' do
      it 'postal_code, prefectures, city, house_number, phone_numberが存在すれば購入できる' do
        expect(@userorder).to be_valid
      end
      it 'postal_codeに-が存在すれば購入できる' do
        @userorder.postal_code = '123-4567'
        expect(@userorder).to be_valid
      end
      it 'build_numberが空でも購入できる' do
        @userorder.build_number = nil
        expect(@userorder).to be_valid
      end
      it 'phone_numberが11桁以内なら購入できる' do
        @userorder.phone_number = 12_345_678_901
        expect(@userorder).to be_valid
      end
      
      it 'phone_numberに-が存在しなければ購入できる' do
        @userorder.phone_number = 12_345_678_901
        expect(@userorder).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'postal_codeがなければ購入できない' do
        @userorder.postal_code = nil
        @userorder.valid?
        expect(@userorder.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeに-がなければ購入できない' do
        @userorder.postal_code = '1234567'
        @userorder.valid?
        expect(@userorder.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefecturesがなければ購入できない' do
        @userorder.prefectures = nil
        @userorder.valid?
        expect(@userorder.errors.full_messages).to include("Prefectures can't be blank")
      end
      it 'cityがなければ購入できない' do
        @userorder.city = nil
        @userorder.valid?
        expect(@userorder.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberがなければ購入できない' do
        @userorder.house_number = nil
        @userorder.valid?
        expect(@userorder.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberがなければ購入できない' do
        @userorder.phone_number = nil
        @userorder.valid?
        expect(@userorder.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが12桁以上だと購入できない' do
        @userorder.phone_number = 12_345_678_901_234_567_890
        @userorder.valid?
        expect(@userorder.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end
      it 'phone_numberに-が存在すると購入できない' do
        @userorder.phone_number = '123-4567-8901'
        @userorder.valid?
        expect(@userorder.errors.full_messages).to include('Phone number Contains hyphen(-)')
      end
    end
  end
end
