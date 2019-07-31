//
//  ServerManager.swift
//  ViperTest
//
//  Created by user on 27/07/2019.
//  Copyright © 2019 Sergey Koshlakov. All rights reserved.
//

import UIKit

class ServerManager: PhotoSearchProtocol {
    
    static let manager = ServerManager()
    
    private init() {}
    
    let apiKey = "4fb7690ff8bda132439e145d616a715d"
    let baseURL = URL(string: "https://www.flickr.com/services/rest/")!
    
    // MARK: - Methods
    
    func fetchPhotosForSearchText(_ text: String, page: Int, completion: @escaping ([Photo]?, Int?, NSError?) -> Void) {
        
       var components = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        
        let params = ["api_key" : apiKey,
                      "format" : "json",
                      "nojsoncallback" : "1",
                      "tags" : text,
                      "page" : String(page)]
        
        let methodQueryItem = URLQueryItem(name: "method", value: "flickr.photos.getRecent")
        
        components?.queryItems = [methodQueryItem] + params.map(){ URLQueryItem(name: $0, value: $1) }
        
        guard let finalURL = components?.url else {
            completion(nil, nil, NSError(domain: "Bad URL", code: 111, userInfo: nil))
            return
        }
        
        let session = URLSession.shared
        
        session.dataTask(with: finalURL) { (data, _, _) in

            guard let data = data else {
                completion(nil, nil, NSError(domain: "Bad Data", code: 112, userInfo: nil))
                return
            }

            do {
               let photosResponse = try JSONDecoder().decode(PhotosResponse.self, from: data)
               let photosInfo = photosResponse.photos
               let totalPages = photosInfo.total
               let photos = photosInfo.photo
               completion(photos, totalPages, nil)
               return
            } catch {
                print(error.localizedDescription)
                completion(nil, nil, NSError(domain: "Bad Decode", code: 113, userInfo: nil))
                return
            }

        }.resume()
        
    }
    
    func fetchImageByURL(_ url: URL, completion: @escaping (UIImage?) -> Void) {
        
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
