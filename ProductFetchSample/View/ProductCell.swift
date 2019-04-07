//
//  ProductCell.swift
//  TemplateProject
//
//  Created by Benoit PASQUIER on 13/01/2018.
//  Copyright © 2018 Benoit PASQUIER. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {
    
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var otherOfferLabel: UILabel!
    @IBOutlet weak var otherPriceLabel: UILabel!
    @IBOutlet weak var rateView: CosmosView!
    @IBOutlet weak var addProductButton: UIButton!
    @IBOutlet weak var taggedImageView: UIImageView!
    
    @IBOutlet weak var strikedPriceLabel: UILabel!
    let imageCache = NSCache<NSString, UIImage>()
    var product : Products? {
        didSet {
            
            guard let product = product else {
                return
            }
            self.configureCell(withProduct : product)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func configureCell(withProduct product : Products) {
        
        productLabel.text = product.name
        priceLabel.text = product.price?.priceDisplay
        otherOfferLabel.isHidden = true
        otherPriceLabel.isHidden = true
        if let otherOfferings = product.otherOfferings {
            let otherOffersCount = "\(otherOfferings.count ?? 0)+ other offers starting from"
            otherOfferLabel.text = otherOffersCount
            otherOfferLabel.isHidden = false
            otherPriceLabel.text = otherOfferings.startPrice
            otherPriceLabel.isHidden = false
        }
        rateView.rating = Double(product.review?.rating ?? 0)
        rateView.text = "(\(product.review?.count ?? 0))"
        taggedImageView.isHidden = !(product.tags?.contains("BLIBLI_SHIPPING"))!
        let text = "\(product.price?.strikeThroughPriceDisplay ?? "")"
        let attributedString = NSMutableAttributedString(string: text)
        attributedString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: 1, range: NSMakeRange(0, attributedString.length))
        let attributes = [NSAttributedString.Key.font:UIFont(name: "Georgia", size: 12.0)!,NSAttributedString.Key.foregroundColor:UIColor.red]
        let discountString = NSAttributedString(string: " \(product.price?.discount ?? 0)%", attributes: attributes)
        attributedString.append(discountString)
        strikedPriceLabel.attributedText = attributedString
        if let imgUrl = URL(string: (product.images?.first)!) {
            downloadImage(url: imgUrl) { (image) in
                DispatchQueue.main.async {
                    self.productImage.image = image
                }
            }
        }
    }
    
    func downloadImage(url: URL, completion: @escaping (UIImage?) -> Void) {
        if let cachedImage = imageCache.object(forKey: url.absoluteString as NSString) {
            completion(cachedImage)
        } else {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    completion(nil)
                } else if let data = data, let image = UIImage(data: data) {
                    self.imageCache.setObject(image, forKey: url.absoluteString as NSString)
                    completion(image)
                } else {
                    completion(nil)
                }
            }
            task.resume()
        }
        
    }
    
}
