//
//  SearchResultResponse.swift
//  Spotify-Clone
//
//  Created by Hakan Baran on 15.05.2023.
//

import Foundation

struct SearchResultResponse: Codable {
    
    let albums: SearchAlbumResponse
    let artists: SearchArtistsResponse
    let playlists: SearchPlaylistsResponse
    let tracks: SearchTracksResponse
    
}

struct SearchAlbumResponse: Codable {
    let items: [Album]
}

struct SearchArtistsResponse: Codable {
    let items: [Artist]
}

struct SearchPlaylistsResponse: Codable {
    let items: [Playlist]
}

struct SearchTracksResponse: Codable {
    let items: [AudioTrack]
}




/*
 {
     albums =     {
         href = "https://api.spotify.com/v1/search?query=Mabel&type=album&locale=tr-TR%2Ctr%3Bq%3D0.9&offset=0&limit=1";
         items =         (
                         {
                 "album_group" = album;
                 "album_type" = album;
                 artists =                 (
                                         {
                         "external_urls" =                         {
                             spotify = "https://open.spotify.com/artist/1dpqJqIuNqideTvmxBsSku";
                         };
                         href = "https://api.spotify.com/v1/artists/1dpqJqIuNqideTvmxBsSku";
                         id = 1dpqJqIuNqideTvmxBsSku;
                         name = "Mabel Matiz";
                         type = artist;
                         uri = "spotify:artist:1dpqJqIuNqideTvmxBsSku";
                     }
                 );
                 "available_markets" =                 (
                     AD,
                     AE,
                     AG,
                    
 
 
 
                     ZM,
                     ZW
                 );
                 "external_urls" =                 {
                     spotify = "https://open.spotify.com/album/1SjI5mOEGsnrfHRR4zY88f";
                 };
                 href = "https://api.spotify.com/v1/albums/1SjI5mOEGsnrfHRR4zY88f";
                 id = 1SjI5mOEGsnrfHRR4zY88f;
                 images =                 (
                                         {
                         height = 640;
                         url = "https://i.scdn.co/image/ab67616d0000b273673669edc4c83a8ed2e2b20d";
                         width = 640;
                     },
                                         {
                         height = 300;
                         url = "https://i.scdn.co/image/ab67616d00001e02673669edc4c83a8ed2e2b20d";
                         width = 300;
                     },
                                         {
                         height = 64;
                         url = "https://i.scdn.co/image/ab67616d00004851673669edc4c83a8ed2e2b20d";
                         width = 64;
                     }
                 );
                 name = Maya;
                 "release_date" = "2018-06-20";
                 "release_date_precision" = day;
                 "total_tracks" = 23;
                 type = album;
                 uri = "spotify:album:1SjI5mOEGsnrfHRR4zY88f";
             }
         );
         limit = 1;
         next = "https://api.spotify.com/v1/search?query=Mabel&type=album&locale=tr-TR%2Ctr%3Bq%3D0.9&offset=1&limit=1";
         offset = 0;
         previous = "<null>";
         total = 22;
     };
     artists =     {
         href = "https://api.spotify.com/v1/search?query=Mabel&type=artist&locale=tr-TR%2Ctr%3Bq%3D0.9&offset=0&limit=1";
         items =         (
                         {
                 "external_urls" =                 {
                     spotify = "https://open.spotify.com/artist/1dpqJqIuNqideTvmxBsSku";
                 };
                 followers =                 {
                     href = "<null>";
                     total = 2959637;
                 };
                 genres =                 (
                     "turkish pop"
                 );
                 href = "https://api.spotify.com/v1/artists/1dpqJqIuNqideTvmxBsSku";
                 id = 1dpqJqIuNqideTvmxBsSku;
                 images =                 (
                                         {
                         height = 640;
                         url = "https://i.scdn.co/image/ab6761610000e5eb3157b4c5761430d59470f0fe";
                         width = 640;
                     },
                                         {
                         height = 320;
                         url = "https://i.scdn.co/image/ab676161000051743157b4c5761430d59470f0fe";
                         width = 320;
                     },
                                         {
                         height = 160;
                         url = "https://i.scdn.co/image/ab6761610000f1783157b4c5761430d59470f0fe";
                         width = 160;
                     }
                 );
                 name = "Mabel Matiz";
                 popularity = 71;
                 type = artist;
                 uri = "spotify:artist:1dpqJqIuNqideTvmxBsSku";
             }
         );
         limit = 1;
         next = "https://api.spotify.com/v1/search?query=Mabel&type=artist&locale=tr-TR%2Ctr%3Bq%3D0.9&offset=1&limit=1";
         offset = 0;
         previous = "<null>";
         total = 2;
     };
     playlists =     {
         href = "https://api.spotify.com/v1/search?query=Mabel&type=playlist&locale=tr-TR%2Ctr%3Bq%3D0.9&offset=0&limit=1";
         items =         (
                         {
                 collaborative = 0;
                 description = "";
                 "external_urls" =                 {
                     spotify = "https://open.spotify.com/playlist/6AGd0PKkyk36rfaszJF5l4";
                 };
                 href = "https://api.spotify.com/v1/playlists/6AGd0PKkyk36rfaszJF5l4";
                 id = 6AGd0PKkyk36rfaszJF5l4;
                 images =                 (
                                         {
                         height = 640;
                         url = "https://mosaic.scdn.co/640/ab67616d0000b273673669edc4c83a8ed2e2b20dab67616d0000b2736a4753885f8de374c6ff1240ab67616d0000b273a2d8dfb8d64ef8420953d230ab67616d0000b273c84f59124c23df6ca1b43fbd";
                         width = 640;
                     },
                                         {
                         height = 300;
                         url = "https://mosaic.scdn.co/300/ab67616d0000b273673669edc4c83a8ed2e2b20dab67616d0000b2736a4753885f8de374c6ff1240ab67616d0000b273a2d8dfb8d64ef8420953d230ab67616d0000b273c84f59124c23df6ca1b43fbd";
                         width = 300;
                     },
                                         {
                         height = 60;
                         url = "https://mosaic.scdn.co/60/ab67616d0000b273673669edc4c83a8ed2e2b20dab67616d0000b2736a4753885f8de374c6ff1240ab67616d0000b273a2d8dfb8d64ef8420953d230ab67616d0000b273c84f59124c23df6ca1b43fbd";
                         width = 60;
                     }
                 );
                 name = "Mabel Matiz\U2019in En \U0130yileri";
                 owner =                 {
                     "display_name" = "Ugur Ceylan";
                     "external_urls" =                     {
                         spotify = "https://open.spotify.com/user/1199985087";
                     };
                     href = "https://api.spotify.com/v1/users/1199985087";
                     id = 1199985087;
                     type = user;
                     uri = "spotify:user:1199985087";
                 };
                 "primary_color" = "<null>";
                 public = "<null>";
                 "snapshot_id" = "MTA5LDdiYzQ1MzQ2OTFiNWY5MDBkOGYwMzc0ZTFjOTc4YzI2YTYxYWY4M2I=";
                 tracks =                 {
                     href = "https://api.spotify.com/v1/playlists/6AGd0PKkyk36rfaszJF5l4/tracks";
                     total = 27;
                 };
                 type = playlist;
                 uri = "spotify:playlist:6AGd0PKkyk36rfaszJF5l4";
             }
         );
         limit = 1;
         next = "https://api.spotify.com/v1/search?query=Mabel&type=playlist&locale=tr-TR%2Ctr%3Bq%3D0.9&offset=1&limit=1";
         offset = 0;
         previous = "<null>";
         total = 2;
     };
     tracks =     {
         href = "https://api.spotify.com/v1/search?query=Mabel&type=track&locale=tr-TR%2Ctr%3Bq%3D0.9&offset=0&limit=1";
         items =         (
                         {
                 album =                 {
                     "album_group" = single;
                     "album_type" = single;
                     artists =                     (
                                                 {
                             "external_urls" =                             {
                                 spotify = "https://open.spotify.com/artist/1Zj4GtouAnxHq4qw7ooLfm";
                             };
                             href = "https://api.spotify.com/v1/artists/1Zj4GtouAnxHq4qw7ooLfm";
                             id = 1Zj4GtouAnxHq4qw7ooLfm;
                             name = "Mert Demir";
                             type = artist;
                             uri = "spotify:artist:1Zj4GtouAnxHq4qw7ooLfm";
                         },
                                                 {
                             "external_urls" =                             {
                                 spotify = "https://open.spotify.com/artist/1dpqJqIuNqideTvmxBsSku";
                             };
                             href = "https://api.spotify.com/v1/artists/1dpqJqIuNqideTvmxBsSku";
                             id = 1dpqJqIuNqideTvmxBsSku;
                             name = "Mabel Matiz";
                             type = artist;
                             uri = "spotify:artist:1dpqJqIuNqideTvmxBsSku";
                         }
                     );
                     "available_markets" =                     (
                         AD,
                      
                         ZW
                     );
                     "external_urls" =                     {
                         spotify = "https://open.spotify.com/album/7qeEafcjWKfuhE2HgXciUL";
                     };
                     href = "https://api.spotify.com/v1/albums/7qeEafcjWKfuhE2HgXciUL";
                     id = 7qeEafcjWKfuhE2HgXciUL;
                     images =                     (
                                                 {
                             height = 640;
                             url = "https://i.scdn.co/image/ab67616d0000b2736a4753885f8de374c6ff1240";
                             width = 640;
                         },
                                                 {
                             height = 300;
                             url = "https://i.scdn.co/image/ab67616d00001e026a4753885f8de374c6ff1240";
                             width = 300;
                         },
                                                 {
                             height = 64;
                             url = "https://i.scdn.co/image/ab67616d000048516a4753885f8de374c6ff1240";
                             width = 64;
                         }
                     );
                     name = Antidepresan;
                     "release_date" = "2022-11-04";
                     "release_date_precision" = day;
                     "total_tracks" = 1;
                     type = album;
                     uri = "spotify:album:7qeEafcjWKfuhE2HgXciUL";
                 };
                 artists =                 (
                                         {
                         "external_urls" =                         {
                             spotify = "https://open.spotify.com/artist/1Zj4GtouAnxHq4qw7ooLfm";
                         };
                         href = "https://api.spotify.com/v1/artists/1Zj4GtouAnxHq4qw7ooLfm";
                         id = 1Zj4GtouAnxHq4qw7ooLfm;
                         name = "Mert Demir";
                         type = artist;
                         uri = "spotify:artist:1Zj4GtouAnxHq4qw7ooLfm";
                     },
                                         {
                         "external_urls" =                         {
                             spotify = "https://open.spotify.com/artist/1dpqJqIuNqideTvmxBsSku";
                         };
                         href = "https://api.spotify.com/v1/artists/1dpqJqIuNqideTvmxBsSku";
                         id = 1dpqJqIuNqideTvmxBsSku;
                         name = "Mabel Matiz";
                         type = artist;
                         uri = "spotify:artist:1dpqJqIuNqideTvmxBsSku";
                     }
                 );
                 "available_markets" =                 (
                     AR,
                     AU,
                   
                     TJ,
                     VE,
                     ET,
                     XK
                 );
                 "disc_number" = 1;
                 "duration_ms" = 240125;
                 explicit = 0;
                 "external_ids" =                 {
                     isrc = USA2P2247676;
                 };
                 "external_urls" =                 {
                     spotify = "https://open.spotify.com/track/4OH5Cd8ZOI1eSgJSC9PYmU";
                 };
                 href = "https://api.spotify.com/v1/tracks/4OH5Cd8ZOI1eSgJSC9PYmU";
                 id = 4OH5Cd8ZOI1eSgJSC9PYmU;
                 "is_local" = 0;
                 name = Antidepresan;
                 popularity = 79;
                 "preview_url" = "https://p.scdn.co/mp3-preview/e6d85974d4027dd1662b9e07586a8abcbf8fb77a?cid=fb1d2e315351401cb30fdb6871a52102";
                 "track_number" = 1;
                 type = track;
                 uri = "spotify:track:4OH5Cd8ZOI1eSgJSC9PYmU";
             }
         );
         limit = 1;
         next = "https://api.spotify.com/v1/search?query=Mabel&type=track&locale=tr-TR%2Ctr%3Bq%3D0.9&offset=1&limit=1";
         offset = 0;
         previous = "<null>";
         total = 33;
     };
 }
 */
