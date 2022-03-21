//
//  MyCollectionViewController.swift
//  7
//
//  Created by Егор on 17.02.2022.
//

import UIKit



class MyCollectionViewController: UICollectionViewController
{
  

    var photo = [PhotoStruct(photo: UIImage(named: "bugatti") ?? UIImage()),
                 PhotoStruct(photo: UIImage(named: "g63") ?? UIImage()),
                 PhotoStruct(photo: UIImage(named: "g63") ?? UIImage()),
                 PhotoStruct(photo: UIImage(named: "bugatti") ?? UIImage())
    
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
 
      
       
    collectionView.register(UINib(nibName: "PhotoCollectionCell", bundle: nil),forCellWithReuseIdentifier: "photoCollectionCell")



                                    }
//
//    private var urlComponents: URLComponents =
//    {
//
//        let token = SomeSingletone.instance.token
//        var comp = URLComponents()
//        comp.scheme = "https"
//        comp.host = "api.vk.com"
//        comp.path = "/method/photos.getProfile"
//        comp.queryItems = [
//
//            URLQueryItem(name: "access_token", value: token),
//            URLQueryItem(name:"owner_id", value: "profile"),
//URLQueryItem(name: "v", value: "5.131")
//
//]
//
//
//        let session = URLSession.shared
//
//
//        var request = URLRequest(url: comp.url!)
//        request.httpMethod = "GET"
//        let task = session.dataTask(with: request)
//        {
//            data,response,error in
//            print(data,response,error)
//
//            let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
//            print(json)
//        }
//        task.resume()
//        return comp
//
//
//    }()
    
  

    
    
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return photo.count
        
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCollectionCell", for: indexPath) as? PhotoCollectionCell
            
        else {return UICollectionViewCell()}
        let currencyPhoto = photo[indexPath.row]
        cell.configure(emblem: currencyPhoto.photo)
    
        // Configure the cell
    
        return cell
    }
    
      

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
