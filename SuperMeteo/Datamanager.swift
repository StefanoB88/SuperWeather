//
//  Datamanager.swift
//  SuperMeteo
//
//  Created by Stefano Brandi on 23/07/21.
//

import UIKit

class Datamanager {
    
    static let shared = Datamanager()
    
    var getMeteo : Main = Main()
    
    var flagOnOff = false
    
    let headers = [
        "x-rapidapi-key": "d5d7710d16mshbd9605fcff6adeap1951e4jsnaefaaaed6fd8",
        "x-rapidapi-host": "yahoo-weather5.p.rapidapi.com"
    ]
    
    
    func callMeteo(view: UIViewController?, citta: String, completion: @escaping (Bool) -> ()) {
        
        
        let request = NSMutableURLRequest(url: NSURL(string: "https://yahoo-weather5.p.rapidapi.com/weather?location=\(citta)")! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            
            
            if data != nil{
                
                let jsonDecoder = JSONDecoder()
                let responseModel = try? jsonDecoder.decode(Main.self, from: data!)
                
                if responseModel == nil {
                    self.flagOnOff = false
                    print("Errore response vuoto")
                    completion(true)
                    
                } else {
                    self.flagOnOff = true
                    self.getMeteo = responseModel!
                    completion(true)
                }
                
                
            } else {
                print("Errore")
                completion(true)
            }
            
        })
        
        dataTask.resume()
        
    }
}

