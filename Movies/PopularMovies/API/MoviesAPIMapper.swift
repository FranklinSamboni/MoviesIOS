//
//  MoviesAPIMapper.swift
//  Movies
//
//  Created by Franklin Samboni on 22/05/22.
//

import Foundation

class MoviesAPIMapper {
    
    static func map(_ data: Data, from response: HTTPURLResponse) throws -> [Movie] {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(dateFormatter)
        
        guard isOK(response) else {
            throw Error.invalidData
        }

        do {
            let payload = try decoder.decode(Paylaod.self, from: data)
            return payload.movies
        } catch {
            throw Error.invalidData
        }
    }
    
    enum Error: Swift.Error {
        case invalidData
    }
    
    private static func isOK(_ response: HTTPURLResponse) -> Bool {
        return response.statusCode == 200
    }

    private struct Paylaod: Decodable {
        private let items: [APIMovie]
        
        enum CodingKeys: String, CodingKey {
            case items = "results"
        }

        // MARK: - APIMovie
        struct APIMovie: Codable {
            let adult: Bool
            let backdropPath: String
            let genreIDS: [Int]
            let id: Int
            let originalLanguage, originalTitle, overview: String
            let popularity: Double
            let posterPath, title: String
            let releaseDate: Date
            let video: Bool
            let voteAverage: Double
            let voteCount: Int

            enum CodingKeys: String, CodingKey {
                case adult
                case backdropPath = "backdrop_path"
                case genreIDS = "genre_ids"
                case id
                case originalLanguage = "original_language"
                case originalTitle = "original_title"
                case overview, popularity
                case posterPath = "poster_path"
                case releaseDate = "release_date"
                case title, video
                case voteAverage = "vote_average"
                case voteCount = "vote_count"
            }
        }


        var movies: [Movie] {
            items.map { Movie(id: $0.id,
                              adult: $0.adult,
                              title: $0.title,
                              overview: $0.overview,
                              backdropImage: $0.backdropPath,
                              posterImage: $0.posterPath,
                              voteAverage: $0.voteAverage,
                              voteCount: $0.voteCount,
                              releaseDate: $0.releaseDate,
                              popularity: $0.popularity) }
        }
    }
}
