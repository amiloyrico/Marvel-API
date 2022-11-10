//
//  NetworkError.swift
//  Marvel API
//
//  Created by Alba Yolima Rico Montenegro on 9/11/22.
//

import Foundation

enum NetworkError: Error{
    case badURL
    case noData
    case decodingError
}
