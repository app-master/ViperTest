//
//  ServerManager.swift
//  ViperTest
//
//  Created by user on 27/07/2019.
//  Copyright © 2019 Sergey Koshlakov. All rights reserved.
//

import UIKit

class ServerManager {
    
    static let manager = ServerManager()
    
    let apiKey = "4fb7690ff8bda132439e145d616a715d"
    let baseURL = URL(string: "https://www.flickr.com/services/rest/")!
    
    private init() {}
    
    // MARK: - Methods
    
    func fetchPhotosForSearchText(_ text: String, page: Int, completion: @escaping ([Photo]?) -> Void) {
        
       var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        
        let params = ["api_key" : apiKey,
                      "format" : "json",
                      "nojsoncallback" : "1",
                      "tags" : text,
                      "page" : String(page)]
        
        let methodQueryItem = URLQueryItem(name: "method", value: "flickr.photos.getRecent")
        
        components?.queryItems = [methodQueryItem] + params.map(){ URLQueryItem(name: $0, value: $1) }
        
        guard let finalURL = components?.url else {
            completion(nil)
            return
        }
        
        let session = URLSession.shared
        
        session.dataTask(with: finalURL) { (data, _, _) in

            guard let data = data else {
                completion(nil)
                return
            }

            do {
               let photosResponse = try JSONDecoder().decode(PhotosResponse.self, from: data)
               let photosInfo = photosResponse.photos
               let photos = photosInfo.photo
               completion(photos)
               return
            } catch {
                print(error.localizedDescription)
                completion(nil)
                return
            }

        }.resume()
        
    }
    
    func fetchImageFromURL(_ url: URL, completion: @escaping (UIImage?) -> Void) {
        
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            let image = UIImage(data: data)
            
            completion(image)
            
            
        }.resume()
        
    }
    
    
    
}
