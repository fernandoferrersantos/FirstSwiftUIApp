//
//  MoviesService.swift
//  FirstSwiftUIApp
//
//  Created by Fernando Ferrer Santos on 25/1/23.
//

import Foundation

class MoviesService {
    func getMoviesFromAPI() async throws -> [Movie] {
        let apiKey = "7f5249108eaa26aae9ca03f84d81386a"
        let url = URL(string: "https://api.themoviedb.org/3/movie/upcoming?api_key=\(apiKey)")!
        
        let (data, _) = try await URLSession.shared.data(from: url)
        
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let decoded = try decoder.decode(MovieResponse.self, from: data)
        
        return decoded.results
    }
}
