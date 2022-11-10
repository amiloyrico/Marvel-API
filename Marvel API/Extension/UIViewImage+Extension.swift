//
//  UIViewImage+Extension.swift
//  Marvel API
//
//  Created by Alba Yolima Rico Montenegro on 9/11/22.
//

import Foundation
import UIKit

extension UIImageView {
    
    func loadUrl(url:String){
        self.image = UIImage(systemName: "photo.circle")
        
        guard let urlImage = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: urlImage) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
            
        }.resume()
            
        
    }
    
    
}
