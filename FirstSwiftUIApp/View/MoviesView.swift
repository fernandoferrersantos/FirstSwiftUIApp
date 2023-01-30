//
//  ContentView.swift
//  FirstSwiftUIApp
//
//  Created by Fernando Ferrer Santos on 23/1/23.
//

import SwiftUI

struct MoviesView: View {
    
    @StateObject private var viewModel = MoviesViewModel()
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .error(let error):
                Text(error.localizedDescription)
            case .loaded(let movies):
                list(of: movies)
            }
        }
        .task {
            await viewModel.loadMovies()
        }
    }
    
    @ViewBuilder
    func list(of movies: [Movie]) -> some View {
        if !movies.isEmpty {
            List(movies) { movie in
                HStack {
                    AsyncImage(url: movie.posterURL) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } placeholder: {
                        ProgressView()
                    }
                    .frame(width: 80)
                    
                    VStack(alignment: .leading) {
                        Text(movie.title)
                            .font(.headline)
                        Text(movie.overview)
                            .lineLimit(4)
                    }
                }
                .padding()
            }
        } else {
            Text("No upcoming movies.")
        }
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesView()
    }
}
