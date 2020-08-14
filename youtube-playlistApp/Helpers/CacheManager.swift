//
//  CacheManager.swift
//  youtube-playlistApp
//
//  Created by elliott kung on 2020-08-14.
//  Copyright © 2020 elliott kung. All rights reserved.
//

import Foundation

class CacheManager{
    
    static var cache = [String:Data]()
    
    static func setVideoCache(_ url: String, _ data:Data?){
        // store the image data and use the url as the key
        cache[url] = data
    }
    
    static func getVideoCache(_ url: String) -> Data?{
        // try to get the data for the specified url
        return cache[url]
    }
    
}
