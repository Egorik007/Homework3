//
//  NetworkServiceGroup.swift
//  7
//
//  Created by Егор on 19.03.2022.
//

import Foundation

final class NetworkServiceGroup
{
    
    func group(completion: @escaping(Result<[NameGroup],Error>)->Void)
    {
    let token = SomeSingletone.instance.token
    var comp = URLComponents()
    comp.scheme = "https"
    comp.host = "api.vk.com"
    comp.path = "/method/groups.get"
        var urlComponents: URLComponents =
        {
            
            comp.queryItems =
            [
                URLQueryItem(name: "access_token", value: token),
                URLQueryItem(name: "extended", value: "1"),
                URLQueryItem(name: "v", value: "5.131")
            
            ]
            
            let session = URLSession.shared
            var request = URLRequest(url: comp.url!)
            request.httpMethod = "GET"
            let task = session.dataTask(with: request)
            {
                data,response,error in

                print(data,response,error)
                guard
                    error == nil,
                    let data = data
                else { return }

               do
               {

                   let model = try JSONDecoder().decode(UserGroup.self, from: data)
                   completion(.success(model.response.items))
               }
                catch
                {
                    completion(.failure(error))
                }


            }
            task.resume()
            return comp

            }()
        }
    }

