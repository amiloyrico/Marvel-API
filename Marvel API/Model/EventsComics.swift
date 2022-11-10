//
//  EventsComics.swift
//  Marvel API
//
//  Created by Alba Yolima Rico Montenegro on 8/11/22.
//

import Foundation

struct EventsComics: Codable{
    var code: Int
    var status:String
    var attributionText : String
    var data: DataEvent
}

struct DataEvent:Codable {
    var offset:Int
    var limit:Int
    var total:Int
    var count: Int
    var results:[ResultsEvent]
}

struct ResultsEvent: Codable{
    var id: Int
    var title: String
    var description: String
    var resourceURI:String
    var urls:[UrlEvent]
    var thumbnail: ThumbnailEvent
    var creators: CreatorsEvent

}

struct UrlEvent:Codable{
    var type:String
    var url:String
}

struct ThumbnailEvent: Codable{
    var path: String
    
    var imageString : String {
        return "\(path).jpg"
    }

}

struct CreatorsEvent: Codable{
    var available : Int
    var collectionURI: String
    var items:[ItemsEvent]
}


struct ItemsEvent : Codable{
    var resourceURI: String
    var name: String
    var role: String
}
