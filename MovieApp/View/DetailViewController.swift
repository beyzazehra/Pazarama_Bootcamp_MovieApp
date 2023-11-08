import UIKit

class DetailViewController: UIViewController, DetailViewModelProtocol {
    
    private let viewModel: DetailViewModel
    let selectedMovieID: String
    let poster = UIImageView()
    let titleLabel = UILabel()
    let year = UILabel()
    let country = UILabel()
    let actors = UILabel()
    let director = UILabel()
    let imdbRating = UILabel()
    
    init(viewModel: DetailViewModel, selectedMovieID: String) {
        self.viewModel = viewModel
        self.selectedMovieID = selectedMovieID
        super.init(nibName: nil, bundle: nil)
        self.viewModel.output = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView(movie: MovieDetail?) {
        if let movie = movie {
            poster.imageFromUrl(urlString: movie.poster)
            titleLabel.text = movie.title
            year.text = movie.year
            country.text = movie.country
            actors.text = movie.actors
            director.text = movie.director
            imdbRating.text = movie.imdbRating
        }
        
        print(movie ?? "nil")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)
        
        poster.contentMode = .scaleAspectFit
        poster.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(poster)
        
        let labelFontSize: CGFloat = 20
        let labelTextColor: UIColor = .white
        
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
        titleLabel.textColor = labelTextColor
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(titleLabel)
        
        year.font = UIFont.boldSystemFont(ofSize: labelFontSize)
        year.textColor = labelTextColor
        year.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(year)
        
        country.textColor = labelTextColor
        country.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(country)
        
        actors.textColor = labelTextColor
        actors.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(actors)
        
        director.textColor = labelTextColor
        director.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(director)
        
        imdbRating.textColor = labelTextColor
        imdbRating.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(imdbRating)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            poster.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 20),
            poster.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            titleLabel.topAnchor.constraint(equalTo: poster.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            titleLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            year.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            year.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            year.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            country.topAnchor.constraint(equalTo: year.bottomAnchor, constant: 20),
            country.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            country.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            actors.topAnchor.constraint(equalTo: country.bottomAnchor, constant: 20),
            actors.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            actors.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            director.topAnchor.constraint(equalTo: actors.bottomAnchor, constant: 20),
            director.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            director.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
            imdbRating.topAnchor.constraint(equalTo: director.bottomAnchor, constant: 20),
            imdbRating.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            imdbRating.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            imdbRating.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -20)
        ])
        self.viewModel.fetchMovie(id: selectedMovieID)
    }
}
