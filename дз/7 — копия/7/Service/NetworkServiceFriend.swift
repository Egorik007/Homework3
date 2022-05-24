//
//  File.swift
//  7
//
//  Created by Егор on 17.02.2022.
//

import Foundation

final class NetworkServiceFriend {
    

    func friends(completion: @escaping (Result<[NameFriend],Error>) -> Void) -> URLComponents {
        
        
        
        let token = SomeSingletone.instance.token
        var comp = URLComponents()
        comp.scheme = "https"
        comp.host = "api.vk.com"
        comp.path = "/method/friends.get"



        comp.queryItems = [

            URLQueryItem(name: "access_token", value: token),
            URLQueryItem(name:"fields", value: "country"),
            URLQueryItem(name: "fields", value: "photo_100"),
   
URLQueryItem(name: "v", value: "5.131")

]


        let session = URLSession.shared


        var request = URLRequest(url: comp.url!)
        request.httpMethod = "GET"
        let task = session.dataTask(with: request){
            data,response,error in

        //    print(data,response,error)
            guard
                error == nil,
                let data = data
            else { return }

           do
           {

               let model = try JSONDecoder().decode(UserFriend.self, from: data)
               completion(.success(model.response.items))
           }
            catch
            {
                completion(.failure(error))
            }


        }
        task.resume()
        return comp



}
}



//
// private var urlComponents: URLComponents =
// {
//
//     let token = SomeSingletone.instance.token
//     var comp = URLComponents()
//     comp.scheme = "https"
//     comp.host = "api.vk.com"
//     comp.path = "/method/friends.get"
//     comp.queryItems = [
//
//         URLQueryItem(name: "access_token", value: token),
//         URLQueryItem(name:"fields", value: "country"),
//URLQueryItem(name: "v", value: "5.131")
//
//]
//
//
//     let session = URLSession.shared
//
//
//     var request = URLRequest(url: comp.url!)
//     request.httpMethod = "GET"
//     let task = session.dataTask(with: request)
//     {
//         data,response,error in
//         print(data,response,error)
//
//         let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
//         print(json)
//     }
//     task.resume()
//     return comp
//
//
// }()


