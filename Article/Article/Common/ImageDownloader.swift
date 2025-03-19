//
//  ImageDownloader.swift
//  Article
//
//  Created by Durgesh Mathur on 18/03/25.
//
import UIKit

class ImageDownloader: NSObject {
    
    static let shared = ImageDownloader()
    private let imageCache = NSCache<NSString, UIImage>()
    
    private override init() {}

    func loadImage(from urlString: String, into imageView: UIImageView, placeholder: UIImage? = UIImage(named: "placeholder")) {
        
        // Show placeholder immediately
        DispatchQueue.main.async {
            imageView.image = placeholder
        }

        // Return cached image if available
        if let cachedImage = imageCache.object(forKey: urlString as NSString) {
            DispatchQueue.main.async {
                imageView.image = cachedImage
            }
            return
        }

        // Validate URL
        guard let url = URL(string: urlString) else {
            return
        }

        // Download image
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            guard let self = self,
                  let data = data,
                  let image = UIImage(data: data),
                  error == nil else {
                return
            }

            // Cache and update UI on main thread
            self.imageCache.setObject(image, forKey: urlString as NSString)

            DispatchQueue.main.async {
                imageView.image = image
            }
        }.resume()
    }
}
