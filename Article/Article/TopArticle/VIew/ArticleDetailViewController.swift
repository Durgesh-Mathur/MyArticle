//
//  ArticleViewController.swift
//  Article
//
//  Created by Durgesh Mathur on 18/03/25.
//

import UIKit

class ArticleDetailViewController: UIViewController {
    
    @IBOutlet weak var articleImageView: UIImageView!
    @IBOutlet weak var articleTitle: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    
    var article: Article?

    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }
    
    
    func updateUI() {
        guard let article = article else { return }
        ImageDownloader.shared.loadImage(from: article.urlToImage ?? "", into: articleImageView)
        articleTitle.text = article.title
        authorLabel.text = article.author
        descriptionLabel.text = article.description
        contentLabel.text = article.content
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
