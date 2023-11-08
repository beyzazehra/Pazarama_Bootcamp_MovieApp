import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,UISearchBarDelegate, MoviesViewModelProtocol {
    
    func updateView(movies: [Movie]) {
        shownArray = movies
        tableView.reloadData()
    }
    
    
    private let viewModel : MoviesViewModel
    let tableView = UITableView()
    let searchBar = UISearchBar()
    
    
    
    init(viewModel: MoviesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.viewModel.output = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var shownArray = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.frame = CGRect(x: 0, y: 70, width: view.bounds.width, height: 50)
        searchBar.delegate = self
        searchBar.searchBarStyle = .prominent
        searchBar.placeholder = "Search..."
        view.addSubview(searchBar)
        
        tableView.frame = CGRect(x: 0, y: 120, width: view.bounds.width, height: view.bounds.height - 50)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .black
        view.addSubview(tableView)
        tableView.register(MovieCell.self, forCellReuseIdentifier: "movieCell")
        
        
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.fetchMovies(searchParam: searchText)
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shownArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieCell
        let movie = shownArray[indexPath.row]
        
        cell.movieImg.imageFromUrl(urlString: movie.poster)
        cell.movieTitle.text = movie.title
        cell.releaseDate.text = movie.year
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("movieCell touched")
        let movieService = APIManager()
        let detailVM = DetailViewModel(movieService: movieService)
        let detailVC = DetailViewController(viewModel: detailVM,selectedMovieID: shownArray[indexPath.row].imdbID)
        self.navigationController!.pushViewController(detailVC, animated: true)
    }
}


