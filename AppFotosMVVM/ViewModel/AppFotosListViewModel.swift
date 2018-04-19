//
//  AppFotosListViewModel.swift
//  AppFotosMVVM
//
//  Created by Std1 on 13/04/18.
//  Copyright © 2018 Fuscaldi. All rights reserved.
//

import Foundation

class AppFotosListViewModel {
    
    weak var viewModelViewDelegate: ViewModelView?
    let apiService = ApiService()
    
    var fotos: [Foto] = [] {
        didSet {
            DispatchQueue.main.async {
                self.viewModelViewDelegate?.reloadTableView()
            }
        }
    }

    func loadData() {
        apiService.getFotos { (fotosApi) in
            self.fotos = fotosApi
        }
    }
    
    func reloadTableView() {}
    
    func numberOfRowsInSection() -> Int {
        return self.fotos.count
    }
    
}
