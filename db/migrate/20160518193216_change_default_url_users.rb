class ChangeDefaultUrlUsers < ActiveRecord::Migration
  def change
    change_column :users, :image_url, :string, default: "http://www.hiapphere.com/data/icon/201312/HiAppHere_com_com.spotify.mobile.android.ui.png"
  end
end
