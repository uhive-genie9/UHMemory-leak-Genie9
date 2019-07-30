//
//  Services.swift
//  NetworkingRetrier
//
//  Created by Sanad Barjawi on 4/3/19.
//  Copyright © 2019 Barjawi. All rights reserved.
//

import Foundation
import Alamofire

class ChatService {
    
     func uploadImage(userImage : UIImage?, conversationId: Int, withCompletionHandler:@escaping (_ result: [ImageModel]) -> Void) {
                   guard let url = URL(string: "http://34.200.219.66:8000/api/attachment/") else {return}
        
            Alamofire.upload(
                multipartFormData: { multipartFormData in
                    if((userImage) != nil){
                        
                        multipartFormData.append((userImage?.jpegData(compressionQuality: 0.25))!, withName: "upload_file", fileName: "\(Date().timeIntervalSince1970)", mimeType: "image/jpeg")
                    }
                    
                    multipartFormData.append(String(conversationId).data(using: .utf8)!, withName: "conversation_id")
                    multipartFormData.append(String("\(Date().timeIntervalSince1970)").data(using: .utf8)!, withName: "filename")
                    
            }, to: url) { (result) in
                
                switch result {
                case .success(let upload, _, _):
                    
                    upload.responseJSON { response in
      
                        guard let data = response.data else {return}
                        do {
                            let imageModel = try JSONDecoder().decode([ImageModel].self, from: data)
                            withCompletionHandler(imageModel)
                        }catch{
                            print("decoding failed")
                        }
                    }
                    
                case .failure(let error):
                    print(error)
                    // getting error
                }
            }
        }

}
