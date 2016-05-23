require 'test_helper'

class MusicTest < ActiveSupport::TestCase
  describe "Music" do
    before do
      @music_track = Music.spotify_find("track", "0fDFzVTG8c2fW9EM5f1RHM")
      @music_album = Music.spotify_find("album", "1OYLLmDS0pJVFRbUo19vrG")
      @music_artist = Music.spotify_find("artist", "0cOpQTKJdCEzz2wplnnyP6")
    end

    it "Knows various track attributes", :vcr do
      assert_equal @music_track.name, "Indian Food"
      assert_equal @music_track.type, "track"
      assert_equal @music_track.uri, "spotify:track:0fDFzVTG8c2fW9EM5f1RHM"
      assert_equal @music_track.external_urls["spotify"], "https://open.spotify.com/track/0fDFzVTG8c2fW9EM5f1RHM"
    end

    it "Knows various album attributes", :vcr do
      assert_equal @music_album.name, "Thunderbox"
      assert_equal @music_album.type, "album"
      assert_equal @music_album.uri, "spotify:album:1OYLLmDS0pJVFRbUo19vrG"
      assert_equal @music_album.external_urls["spotify"], "https://open.spotify.com/album/1OYLLmDS0pJVFRbUo19vrG"
    end

    it "Knows various artist attributes", :vcr do
      assert_equal @music_artist.name, "Miso Banana Trio"
      assert_equal @music_artist.type, "artist"
      assert_equal @music_artist.uri, "spotify:artist:0cOpQTKJdCEzz2wplnnyP6"
      assert_equal @music_artist.external_urls["spotify"], "https://open.spotify.com/artist/0cOpQTKJdCEzz2wplnnyP6"
    end
  end
end
