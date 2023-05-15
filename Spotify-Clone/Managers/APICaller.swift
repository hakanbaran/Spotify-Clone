//
//  APICaller.swift
//  Spotify-Clone
//
//  Created by Hakan Baran on 10.03.2023.
//

import Foundation

final class APICaller {
    
    static let shared = APICaller()
    
    private init() {}
    
    struct Constans {
        static let baseAPIURL = "https://api.spotify.com/v1"
    }
    
    enum APIError: Error {
        case failedToGetData
    }
    
    // MARK: - Albums
    
    public func getAlbumDetails(for album: Album, completion: @escaping (Result<AlbumDetailsResponse, Error>) -> Void) {
        
        createRequest(with: URL(string: Constans.baseAPIURL + "/albums/" + album.id), type: .GET) { request in
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(AlbumDetailsResponse.self, from: data)
                    completion(.success(result))
                }catch {
                    print(error.localizedDescription)
                    completion(.failure(error))
                }
            }
            task.resume()
            
        }
        
    }
    
    
    
    // MARK: - Playlists
    
    
    public func getPlaylistDetails(for playlist: Playlist, completion: @escaping (Result<PlaylistDetailsResponse, Error>) -> Void) {
        
        createRequest(with: URL(string: Constans.baseAPIURL + "/playlists/" + playlist.id), type: .GET) { request in
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do {
                    let result = try JSONDecoder().decode(PlaylistDetailsResponse.self, from: data)
                    completion(.success(result))
                    
                }catch {
                    completion(.failure(error))
                }
            }
            task.resume()
            
        }
        
    }
    
    // MARK: - Profile
    
    public func getCurrentUserProfile(completion: @escaping(Result <UserProfile, Error>) -> Void) {
        
        
        createRequest(with: URL(string: Constans.baseAPIURL + "/me"), type: .GET) { baseRequest in
            let task = URLSession.shared.dataTask(with: baseRequest) { data, response, error in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                do {
                    let result = try JSONDecoder().decode(UserProfile.self, from: data)
                    completion(.success(result))
                } catch {
                    print(error.localizedDescription)
                    completion(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    // MARK: - Browse
    
    
    public func getNewReleases(completion: @escaping(Result <NewReleasesResponse, Error>) -> Void) {
        
        createRequest(with: URL(string: Constans.baseAPIURL + "/browse/new-releases?limit=50"), type: .GET) { request in
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                
                guard let data = data, error == nil else {return}
                
                do {
                    let result = try JSONDecoder().decode(NewReleasesResponse.self, from: data)
                    completion(.success(result))
                } catch {
                    completion(.failure(error))
                    print(error.localizedDescription)
                }
            }
            task.resume()
        }
    }
    
    
    public func getFeaturedPlaylists(completion: @escaping(Result <FeaturedPlaylistsResponse, Error>) -> Void) {
        
        createRequest(with: URL(string: Constans.baseAPIURL + "/browse/featured-playlists?limit=20"), type: .GET) { request in
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                
                guard let data = data, error == nil else {return}
                
                do {
                    
                    let result = try JSONDecoder().decode(FeaturedPlaylistsResponse.self, from: data)
                    completion(.success(result))
                } catch {
                    completion(.failure(error))
                    print(error.localizedDescription)
                }
            }
            task.resume()
        }
    }
    
    public func getRecommendations(genres: Set<String>, complation: @escaping(Result <RecommendationsResponse, Error>) -> Void) {
        
        let seeds = genres.joined(separator: ",")

        createRequest(with: URL(string: Constans.baseAPIURL + "/recommendations?limit=40&seed_genres=\(seeds)"), type: .GET) { request in
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {return}

                do {
                    let result = try JSONDecoder().decode(RecommendationsResponse.self, from: data)
                    complation(.success(result))
//                    print(result)

                }catch {
                    print(error.localizedDescription)
                }

            }
            task.resume()
        }

    }
    
    public func getRecommendedGenres(complation: @escaping(Result <RecommendedGenresResponse, Error>) -> Void) {
        
        createRequest(with: URL(string: Constans.baseAPIURL + "/recommendations/available-genre-seeds"), type: .GET) { request in
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {return}
                
                do {
                    let result = try JSONDecoder().decode(RecommendedGenresResponse.self, from: data)
                    complation(.success(result))
//                    print(result)
                    
                }catch {
                    print(error.localizedDescription)
                }
                
            }
            task.resume()
        }
        
    }
    
    
    // MARK: - Category
    
    public func getCategory(complation: @escaping(Result <[Category], Error>) -> Void) {
        
        createRequest(with: URL(string: Constans.baseAPIURL + "/browse/categories?limit=50"), type: .GET) { request in
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {
                    complation(.failure(APIError.failedToGetData))
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(AllCategoriesResponse.self, from: data)
                    complation(.success(result.categories.items))
//                    print(result.categories.items)
                }catch {
                    complation(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    public func getCategoryPlaylists(category: Category, complation: @escaping(Result <[Playlist], Error>) -> Void) {
        
        createRequest(with: URL(string: Constans.baseAPIURL + "/browse/categories/\(category.id)/playlists?limit=20"), type: .GET) { request in
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {return}
                
                do {
                    let result = try JSONDecoder().decode(CategoryPlaylistsResponse.self, from: data)
                    let playlists = result.playlists.items
                    complation(.success(playlists))
                }catch {
                    print(error.localizedDescription)
                    complation(.failure(error))
                }
            }
            task.resume()
        }
    }
    
    // MARK: - Search
    
    public func search(with query: String, completion: @escaping (Result<[String], Error>) -> Void) {
        
        createRequest(with: URL(string: Constans.baseAPIURL+"/search?limit=10&type=album,artist,playlist,track&q=\(query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "none")"), type: .GET) { request in
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {
                    completion(.failure(APIError.failedToGetData))
                    return
                }
                
                do {
                    let result = try JSONSerialization.jsonObject(with: data)
                    print(result)
                } catch {
                    print(error)
                    completion(.failure(error))
                }
            }
            task.resume()
        }
        
    }
    
    // MARK: - Private
    
    enum HTTPMethod: String {
        case GET
        case POST
    }
    
    private func createRequest( with url: URL?, type: HTTPMethod, completion: @escaping (URLRequest) -> Void) {
        
        AuthManager.shared.withValidToken { token in
            
            guard let apiURL = url else {
                return
                
            }
            
            var request = URLRequest(url: apiURL)
            
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
            
            request.httpMethod = type.rawValue
            
            request.timeoutInterval = 30
            completion(request)
            
        }
        
    }
        
        
    
    
    
    
    
}
