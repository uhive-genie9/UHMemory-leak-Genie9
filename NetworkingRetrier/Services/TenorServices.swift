//
//  TenorServices.swift
//  NetworkingRetrier
//
//  Created by Sanad Barjawi on 6/16/19.
//  Copyright © 2019 Barjawi. All rights reserved.
//

import Foundation
import Alamofire

class TenorGIF {
    
    private let apikey = "W0E4LR64KB7E"
    private var anonymousID = UserDefaults.standard.string(forKey: "anonymousID")
    
    ///   If this is a returning user, grab their stored anonymous ID and jump directly to getting data
    /// Otherwise this is a new user, so start the flow by getting an anonymous id and having the callback store it & pass it to requestData
    func registerAnonymous(completion: @escaping ()->Void) {
        
        if anonymousID?.isEmpty ?? true {
            
            guard let anonymousIDURL =  URL(string: String(format: "https://api.tenor.com/v1/anonid?key=%@", apikey)) else {return}
            
            Alamofire.request(anonymousIDURL, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (responseData) in
                
                guard let data = responseData.data else {return}
                // Read the anonymous id for the user
                do {
                    let modessl = try JSONDecoder().decode(GIFAnonymousIDModel.self, from: data)
                    let anonymousID = modessl.anonymousID
                    print("GIF anonymous ID = \(anonymousID)")
                    // Store the anonymousID for use in later API calls
                    self.anonymousID = anonymousID
                    UserDefaults.standard.setValue(anonymousID, forKey: "anonymousID")
                    completion()
                }
                catch {
                    print("decoding failed")
                }
                
            }
        } else {
            completion()
        }
    }
    
    func getGIFCategories() {
        guard let categoryURL = URL(string: String(format: "https://api.tenor.com/v1/trending_terms?key=%@&anon_id=%@&limit=4",
                                                   apikey,
                                                   anonymousID ?? "")) else {return}
        
        Alamofire.request(categoryURL, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (responseData) in
            
            guard let data = responseData.data else {return}
            DBHelper.shared.deleteAll(GIFCategoryItem.self)
            do {
                let GIFCategories = try JSONDecoder().decode(GIFCategoriesModel.self, from: data)
                DBHelper.shared.saveGIFCategories(GIFCategories.items ?? [])
            }
            catch {
                print("decoding failed")
            }
            
        }
    }
    
    
    ///    Execute web requests to retrieve trending GIFs and GIF categories.
    ///
    /// - Parameters:
    ///   - count: count
    ///   - completion: data
    func getGIFS(count: Int, completion: @escaping(GIFResponseModel) -> Void) {
        let urlStr = String(format: "https://api.tenor.com/v1/trending?key=%@&anon_id=%@&limit=%d&media_filter=minimal",
                            apikey,
                            anonymousID ?? "",
                            count)
        
        guard let url = URL(string: urlStr) else {return}
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            guard let data = response.data else {return}
            do {
                let gIFResponseModel = try JSONDecoder().decode(GIFResponseModel.self, from: data)
                completion(gIFResponseModel)
            } catch let error {
                print(error)
            }
        }
    }
    
    /// get GIF's using a search term
    ///
    /// - Parameters:
    ///   - searchTerm: the search term used to get GIF
    ///   - completion: result
    func getGIF(using searchTerm: String, limit: Int, completion: @escaping(GIFResponseModel) -> Void) {
       var x = searchTerm.replacingOccurrences(of: " ", with: "")
        let searchGIFURL = String(format: "https://api.tenor.com/v1/search?q=%@&key=%@&anon_id=%@&limit=%d",
                                  x,
                                  apikey,
                                  anonymousID ?? "",
                                  limit)
        guard let url = URL(string: searchGIFURL) else {return}
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            guard let data = response.data else {return}
          
            do {
                let gIFResponseModel = try JSONDecoder().decode(GIFResponseModel.self, from: data)
                completion(gIFResponseModel)
            } catch let error {
                print(error)
            }
        }
    }
    
    /// get GIF based on category
    ///
    /// - Parameters:
    ///   - category: category
    ///   - completion: completion
    func getGIF(by category: String, completion: @escaping() -> Void) {
        
        
        let categoryURL = String(format: "https://api.tenor.com/v1/categories?key=%@&anon_id=%@",
                                 apikey,
                                 anonymousID ?? "")
        
        guard let url = URL(string: categoryURL) else {return}
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            guard let data = response.data else {return}
            do {
                completion()
            } catch let error {
                print(error)
            }
        }
    }
    
    
    func shareGIF(refreshToken: String, searchTerm: String, gifId: String, completion: @escaping() -> Void) {
        
        let ShareURL = String(format: "https://api.tenor.com/v1/registershare?key=%@&id=%@&q=%@&anon_id=%@",
                              apikey,
                              gifId,
                              searchTerm,
                              anonymousID ?? "")
        
        guard let url = URL(string: ShareURL) else {return}
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            guard let data = response.data else {return}
            do {
                completion()
            } catch let error {
                print(error)
            }
        }
    }
    
    
    
}
