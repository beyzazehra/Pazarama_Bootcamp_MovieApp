import Foundation

class APIManager : MovieService {
    
    
    func fetchMovies(searchParam: String,completion: @escaping(Result<[Movie], Error>) -> Void) {
        let url = URL(string: "http://www.omdbapi.com/?s=\(searchParam)&apikey=ba8b0eb6&type=movie")!
        
        URLSession.shared.dataTask(with: url) { data, res, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                if let user = try? JSONDecoder().decode(ApiResponse.self, from: data) {
                    completion(.success(user.search))
                } else {
                    completion(.failure(NSError()))
                }
            }
        }.resume()
    }
    func fetchMovieByID(id: String,completion: @escaping(Result<MovieDetail, Error>) -> Void) {
        let url = URL(string: "http://www.omdbapi.com/?i=\(id)&apikey=ba8b0eb6&type=movie")!
        
        URLSession.shared.dataTask(with: url) { data, res, error in
            guard let data = data else { return }
            DispatchQueue.main.async {
                if let user = try? JSONDecoder().decode(MovieDetail.self, from: data) {
                    completion(.success(user))
                } else {
                    completion(.failure(NSError()))
                }
            }
        }.resume()
    }
    
}
