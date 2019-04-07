//
//  ViewController.swift
//  TemplateProject
//
//  Created by Benoit PASQUIER on 12/01/2018.
//  Copyright © 2018 Benoit PASQUIER. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var tableView : UITableView! 
    
    let dataSource = ProductDataSource()
    
    lazy var viewModel : ProductViewModel = {
        let viewModel = ProductViewModel(dataSource: dataSource)
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // add error handling example
        self.viewModel.onErrorHandling = { [weak self] error in
            // display error ?
            let controller = UIAlertController(title: "An error occured", message: "Oops, something went wrong!", preferredStyle: .alert)
            controller.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))
            self?.present(controller, animated: true, completion: nil)
        }
        
        self.viewModel.onSuccessHandling = { [weak self] datasource in
            if let weakSelf = self {
                weakSelf.loadingView.isHidden = true
                weakSelf.activityIndicator.stopAnimating()
                weakSelf.tableView.dataSource = datasource
                weakSelf.tableView.delegate = datasource
                weakSelf.dataSource.data?.addAndNotify(observer: weakSelf) { [weak self] _ in
                    if let weakSelf = self {
                        weakSelf.tableView.reloadData()
                    }
                }
                let label = UILabel(frame: CGRect(x:0, y:0, width:400, height:50))
                label.backgroundColor = .clear
                label.numberOfLines = 2
                label.font = UIFont.boldSystemFont(ofSize: 16.0)
                label.textAlignment = .center
                label.textColor = .white
                label.text = "samsung\n\(weakSelf.viewModel.dataSource?.data?.value?.count ?? 0) Search results"
                weakSelf.navigationItem.titleView = label
            }
        }
        self.loadingView.isHidden = false
        self.activityIndicator.startAnimating()
        self.viewModel.fetchProducts()
    }
}
