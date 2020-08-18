class Playlist {
  final String playlistName;
  final String image;
  final int id;

  Playlist({this.id, this.playlistName, this.image});
}

List<Playlist> playlists = [
  Playlist(
    id: 1,
    playlistName: 'Party',
    image: "assets/images/party.jpg",
  ),
  Playlist(
    id: 2,
    playlistName: 'Peace',
    image: "assets/images/meditation.jpg",
  ),
  Playlist(
    id: 3,
    playlistName: 'Flutter Time',
    image: "assets/images/colors.jpg",
  ),
  Playlist(
    id: 4,
    playlistName: 'Romance',
    image: "assets/images/love.jpg",
  ),
];
