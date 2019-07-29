class Address < ApplicationRecord
  reg_postalcode = /\A[0-9]{3}\-[0-9]{4}+\z/
  reg_intger_10or11_characters = /\A[0-9]{10,11}+\z/

  validates :postalcode,
    presence: true,
    format: { with: reg_postalcode }
  with_options presence: true do
    validates :prefecture
    validates :city
    validates :number
  end
  validates :phone_number,
    presence: true, 
    uniqueness: true,
    format: { with: reg_intger_10or11_characters }
  
  enum prefecture: %w(-- 北海道 青森県 岩手県)
    # <option >--</option>
    # <option >北海道</option>
    # <option >青森県</option>
    # <option >岩手県</option>
    # <option >宮城県</option>
    # <option >秋田県</option>
    # <option >山形県</option>
    # <option >福島県</option>
    # <option >東京都</option>
    # <option >神奈川県</option>
    # <option >埼玉県</option>
    # <option >千葉県</option>
    # <option >茨城県</option>
    # <option >栃木県</option>
    # <option >群馬県</option>
    # <option >山梨県</option>
    # <option >新潟県</option>
    # <option >長野県</option>
    # <option >富山県</option>
    # <option >石川県</option>
    # <option >福井県</option>
    # <option >愛知県</option>
    # <option >岐阜県</option>
    # <option >静岡県</option>
    # <option >三重県</option>
    # <option  selected>大阪府</option>
    # <option >兵庫県</option>
    # <option >京都府</option>
    # <option >滋賀県</option>
    # <option >奈良県</option>
    # <option >和歌山県</option>
    # <option >鳥取県</option>
    # <option >島根県</option>
    # <option >岡山県</option>
    # <option >広島県</option>
    # <option >山口県</option>
    # <option >徳島県</option>
    # <option >香川県</option>
    # <option >愛媛県</option>
    # <option >高知県</option>
    # <option >福岡県</option>
    # <option >佐賀県</option>
    # <option >長崎県</option>
    # <option >熊本県</option>
    # <option >大分県</option>
    # <option >宮崎県</option>
    # <option >鹿児島県</option>
    # <option >沖縄県</option>
    # </select>
end
