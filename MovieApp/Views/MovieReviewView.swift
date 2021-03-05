//
//  MovieReviewView.swift
//  MovieApp
//
//  Created by ramil on 05.03.2021.
//

import SwiftUI

struct MovieReviewView: View {
    var movie: Movie
    
    @ObservedObject var movieReviewMgr: MovieReviewsManager
    
    init(movie: Movie) {
        self.movie = movie
        self.movieReviewMgr = MovieReviewsManager(movie: movie)
        
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().backgroundColor = .clear
        
        UITableViewCell.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.black.opacity(0.7)
            
            List {
                ForEach(movieReviewMgr.reviews) { review in
                    VStack {
                        Text(review.author ?? "")
                            .font(.title)
                            .bold()
                        
                        Text(review.content ?? "")
                            .font(.body)
                            .lineLimit(nil)
                    }.foregroundColor(.white)
                    .listRowBackground(Color.clear)
                }
            }.onAppear() {
                movieReviewMgr.getMovieReviews()
            }.padding(.horizontal, 32)
        }.edgesIgnoringSafeArea(.all)
    }
}
