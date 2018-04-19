//
//  APIService.swift
//  AppFotosMVVM
//
//  Created by Std1 on 13/04/18.
//  Copyright © 2018 Fuscaldi. All rights reserved.
//

import Alamofire
import SwiftyJSON
import Kingfisher

class ApiService {
    
    let url = UrlsController().urlGetFotos
    
    var fotos: [Foto] = []
    
    func getFotos(completionHandler: @escaping(_ fotos: [Foto]) -> Void) {
        Alamofire.request(url, method: .get).validate().responseJSON { response in
            if let value = response.result.value {
                let json = JSON(value).arrayValue
                
                for value in json {
                    let urlFoto = URL(string: value["url"].stringValue)!
                    let foto = Foto(title: value["title"].stringValue, url: urlFoto)
                    self.fotos.append(foto)
                }
                completionHandler(self.fotos)
            }
        }
    }
}
