//
//  Character.swift
//  Marvel API
//
//  Created by Alba Yolima Rico Montenegro on 8/11/22.
//

import Foundation

struct Character : Codable{
    var code: Int
    var status:String
    var attributionText : String
    var data:DataChacter
}

struct DataChacter : Codable {
    var offset:Int
    var limit:Int
    var total:Int
    var results:[DatailCharacter]
}

struct DatailCharacter : Codable{
    var id:Int
    var name: String
    var description : String
    var thumbnail:DatailCharacterthumbnail
    var comics:ComicsCharacter
    var series:ComicsCharacter
    var stories:ComicsCharacter
}

struct DatailCharacterthumbnail: Codable{
    var path:String
    
    var imageString : String {
        return "\(path).jpg"
    }
   // var extension:String
}

struct ComicsCharacter: Codable{
    var available:Int
    var collectionURI:String
    var items:[ComicsItemsCharacter]
}

struct ComicsItemsCharacter:Codable{
    var resourceURI:String
    var name:String
    var type: String?
}
