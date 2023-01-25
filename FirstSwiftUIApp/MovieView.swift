//
//  ContentView.swift
//  FirstSwiftUIApp
//
//  Created by Fernando Ferrer Santos on 23/1/23.
//

import SwiftUI

struct MovieView: View {
    
    let movies: [Movie]
    
    var body: some View {
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
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView(movies: .mock)
    }
}
