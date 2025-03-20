//
//  ViewController.swift
//
//
//  Created by Durgesh Mathur on 24/12/24.
//

import UIKit

class ArticleViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var articleTableView: UITableView!
    var viewModel = ArticleViewModel()
    var isLoadingMore = false // Flag to prevent multiple API calls

    override func viewDidLoad() {
        super.viewDidLoad()
        // View setup
        title = "Top Headlines"
        view.backgroundColor = .white
        setupTableview()
        callApi()
    }
    
    func setupTableview() {
        // TableView setup
        articleTableView.delegate = self
        articleTableView.dataSource = self
        articleTableView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    func callApi() {
        Task {
            await viewModel.fetchHomeData(completion: {
                isLoadingMore = false
                DispatchQueue.main.async {
                    self.articleTableView.reloadData()
                }
                
            })
        }
    }
    
    func navigateToDetails(result: Article) {
        // Get the storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        // Instantiate the destination view controller using its Storyboard ID
        guard let detailsViewController = storyboard.instantiateViewController(withIdentifier: "ArticleDetailViewController") as? ArticleDetailViewController else {
            print("Could not find view controller with Storyboard ID: ArticleDetailViewController")
            return
        }
        detailsViewController.article = result
        // Push the destination view controller onto the navigation stack
        navigationController?.pushViewController(detailsViewController, animated: true)
    }
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.listOfArticle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as? ArticleCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        let model = viewModel.listOfArticle[indexPath.row]
        cell.configure(model: model)
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        navigateToDetails(result: viewModel.listOfArticle[indexPath.row])
    }
    
    // MARK: - UIScrollViewDelegate
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let frameHeight = scrollView.frame.size.height
        
        if offsetY > contentHeight - frameHeight - 50 { // Trigger API call when 50 points from bottom
            if !isLoadingMore {
                isLoadingMore = true
                callApi()
            }
        }
    }
}


class ArticleCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var articleImage: UIImageView!
    
    func configure(model: Article)  {
        titleLabel.text = model.title
        authorLabel.text = model.author
        contentLabel.text = model.content
        ImageDownloader.shared.loadImage(from: model.urlToImage ?? "", into: articleImage)
    }
    
    
}




