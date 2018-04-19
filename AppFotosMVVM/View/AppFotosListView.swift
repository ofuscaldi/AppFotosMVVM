//
//  AppFotosListView.swift
//  AppFotosMVVM
//
//  Created by Std1 on 13/04/18.
//  Copyright © 2018 Fuscaldi. All rights reserved.
//

import UIKit
import Kingfisher

class AppFotosListView: UIViewController, ViewModelView {
    
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = AppFotosListViewModel()
    
    override func viewDidLoad() {
        viewModel.loadData()
        viewModel.viewModelViewDelegate = self
    }
    
    func reloadTableView() {
        tableView.reloadData()
    }
}

extension AppFotosListView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let rows = viewModel.numberOfRowsInSection()
        return rows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? AppFotosListCell else {
            fatalError("Could not dequeue cell with identifier")
        }
        let foto = viewModel.fotos[indexPath.row]
        
        cell.activityIndicator.startAnimating()
        cell.lblCell.text = foto.title
        cell.lblCell.backgroundColor = UIColor.white
        cell.imageCell.kf.setImage(with: foto.url)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return self.tableView.frame.height / 3
    }
}
