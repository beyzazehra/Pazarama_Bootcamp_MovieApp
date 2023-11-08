import Foundation

protocol MovieService {
    func fetchMovies(searchParam: String, completion: @escaping (Result<[Movie], Error>) -> Void)
    func fetchMovieByID(id: String,completion: @escaping(Result<MovieDetail, Error>) -> Void)
    }
