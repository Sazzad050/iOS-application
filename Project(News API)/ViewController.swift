//
//  ViewController.swift
//  Project(News API)
//
//  Created by Bjit on 12/1/23.
//

import UIKit

class ViewController: UIViewController {
    var articleList = [Articledata]()
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        fatchData  ()
        downloadJSON () {
            self.tableView.reloadData()
        }
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
//    func fatchData  () {
//        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=89e9414e695f403fa02e9b8d190e0984")
//
//        let dataTask = URLSession.shared.dataTask(with: url!, completionHandler: {
//            (data, respose , error) in
//            guard let  data = data , error == nil else {
//                print("Error")
//                return
//            }
//
//            var newsFullList : NewsData?
//            do {
//                newsFullList = try JSONDecoder().decode(NewsData.self, from: data)
//            }
//            catch {
//                print(" Error ")
//            }
//           self.articleList = newsFullList! .data
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//
//        })
//        dataTask.resume()
//    }




func downloadJSON (completed: @escaping () -> () ) {
    let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=89e9414e695f403fa02e9b8d190e0984")
    URLSession.shared.dataTask(with: url!) { (Data,respose,error ) in
        
        if error == nil {
            do {
                self.articleList =  try JSONDecoder().decode([Articledata].self, from: Data!)
                DispatchQueue.main.async {
                    completed()
                }
            } catch {
                print("aadas")
            }
    }
    
   
}.resume()
}
}

extension UIImageView {
//    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit){
//        URLSession.shared.dataTask(with: url) { data, response, error in
//            guard
//                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
//                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
//                let data = data, error == nil,
//                let image = UIImage(data: data)
//                else { return }
//            DispatchQueue.main.async() { [weak self] in
//                self?.image = image
//            }
//        }.resume()
//
//
//
//}
}


extension ViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articleList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellA") as! MyTableViewCell
        cell.label.text = articleList[indexPath.row].status
//        if articleList[indexPath.row].image != nil
//        {
//            let url = URL (string:  articleList[indexPath.row].image)
//            cell.imgView.d
//        }
//
//        return cell
//        return UITableViewCell ()
        return cell
    }
    
    
    
}
extension ViewController : UITableViewDelegate {
    
}

