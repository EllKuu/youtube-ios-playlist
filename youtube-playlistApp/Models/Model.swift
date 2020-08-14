//
//  Model.swift
//  youtube-playlistApp
//
//  Created by elliott kung on 2020-08-14.
//  Copyright © 2020 elliott kung. All rights reserved.
//

import Foundation

protocol  ModelDelegate {
    func videosFetched(_ videos:[Video])
}

class Model{
    var delegate:ModelDelegate?
    
    func getVideos(){
        // create a URL object
        guard let url = URL(string: Constants.API_URL) else { return }
        
        
        
        // Get a URLSession Obj
        let session = URLSession.shared
        
        
        // Get a data task from URLSession object
        let dataTask = session.dataTask(with: url) { (data, response, error) in
            // check if there were any errors
            if error != nil || data == nil{
                return
            }
            
            do{
                // Parsing the data in video objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                
                let response = try decoder.decode(Response.self, from: data!)
                
                if response.items != nil{
                    
                    DispatchQueue.main.async{
                        // call the "videosFetched" method of the delegate
                        self.delegate?.videosFetched(response.items!)
                    }
                    
                    
                }
                
                
                // dump(response)
            }catch{
                
            }
            
            
        }
        
        
        // Kick off the task
        dataTask.resume()
    }
}
