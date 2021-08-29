require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
    @address = FactoryBot.build(:address, user_id: @user.id, item_id: [:item_id])
  end

  describe '購入内容確認' do
    context '商品購入がうまくいく時' do
      it '全ての値が正しく入力されていれば購入できる' do
        expect(@address).to be_valid
      end
      it '建物名が抜けていても登録できること' do
        @address.building = ''
        expect(@address).to be_valid
      end
    end
    context '商品購入がうまくいかない時' do
      it 'postal_codeが空だと購入できない' do
        @address.postal_code = ''
        @address.valid?
        expect(@address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeにハイフンがないと購入できない' do
        @address.postal_code = '1234567'
        @address.valid?
        expect(@address.errors.full_messages).to include('Postal code is invalid')
      end
      it 'ship_fromが未選択だと出品できない' do
        @address.ship_from_id = 1
        @address.valid?
        expect(@address.errors.full_messages).to include('Ship from must be other than 1')
      end
      it 'cityが空だと購入できない' do
        @address.city = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空だと購入できない' do
        @address.block = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Block can't be blank")
      end
      it 'phone_numberが空だと購入できない' do
        @address.phone_number = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが9桁では購入できない' do
        @address.phone_number = '090123456'
        @address.valid?
        expect(@address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'tokenが空では登録できないこと' do
        @address.token = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空では登録できないこと' do
        @address.user_id = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では登録できないこと' do
        @address.item_id = nil
        @address.valid?
        expect(@address.errors.full_messages).to include("Item can't be blank")
      end
      it '電話番号が12桁以上では登録できないこと' do
        @address.phone_number = '123456789123'
        @address.valid?
        expect(@address.errors.full_messages).to include('Phone number is invalid')
      end
      it '電話番号が英数混合では登録できないこと' do
        @address.phone_number = 'aabb112233'
        @address.valid?
        expect(@address.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
