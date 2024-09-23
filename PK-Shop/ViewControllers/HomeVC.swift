//
//  HomeVC.swift
//  PK-Shop
//
//  Created by Trioangle on 27/08/24.
//

import UIKit
import Alamofire
import SDWebImage
import SkeletonView

class HomeVC: UIViewController, UITextFieldDelegate{
  
    
    
    @IBOutlet weak var topCloseBtnView: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var sideTableView: UITableView!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var addSelectBtn: UIButton!
    @IBOutlet weak var rightTableview: UITableView!
    
    var categories: [Category] = []
    var product: [Product] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTextField.delegate = self
        searchTextField.returnKeyType = UIReturnKeyType.done
        setUI()
        callUrlForSideTableView()
    }
    
    func setUI(){
        self.sideTableView.register(UINib(nibName: "SiteBar", bundle: nil), forCellReuseIdentifier: "SiteBar")
        self.rightTableview.register(UINib(nibName: "CenderCell", bundle: nil), forCellReuseIdentifier: "CenderCell")
        self.sideTableView.delegate = self
        self.sideTableView.dataSource = self
        self.sideTableView.reloadData()
        self.rightTableview.delegate = self
        self.rightTableview.dataSource = self
        self.rightTableview.reloadData()
        self.addSelectBtn.layer.cornerRadius = 20
        self.sideTableView.separatorStyle = .none
        self.rightTableview.separatorStyle = .none
    }
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        var foundItems = [Product]()
//        foundItems = self.product.filter { $0.title.contains(searchTextField.text ?? "")}
//        self.product = foundItems
//        print(product)
//        self.rightTableview.reloadData()
//        return true
//    }
//    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
//        var foundItems = [Product]()
//        foundItems = self.product.filter { $0.title.contains(searchTextField.text ?? "")}
//        self.product = foundItems
//        self.rightTableview.reloadData()
//    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool{
        textField.resignFirstResponder()
        return true
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = searchTextField.text ?? ""
        print("shouldChangeCharactersIn")
        if currentText == ""{
            self.indexpathCell(cateory : self.categories[0].id)
        }else{
            let updatedText = currentText
            let foundItems = self.product.filter { $0.title.localizedCaseInsensitiveContains(updatedText) }
            self.product = foundItems
            self.rightTableview.reloadData()
        }
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        let searchText = textField.text ?? ""
        print("textFieldDidEndEditing")
        if searchText == ""{
            self.indexpathCell(cateory : self.categories[0].id)
        }else{
            let foundItems = self.product.filter { $0.title.localizedCaseInsensitiveContains(searchText) }
            self.product = foundItems
            self.rightTableview.reloadData()
        }
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("did Begin")
    }
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print("shoud did Begin")
        return true
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        print("should clear")
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print("should end editing")
        return true
    }

}

extension HomeVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if tableView ==  self.sideTableView {
            return self.categories.count
        }
        if tableView == rightTableview{
            return product.count
        }
        return 10
    }
   
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView ==  self.sideTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SiteBar", for: indexPath) as! SiteBar
            cell.titleLabel.text = self.categories[indexPath.row].name
            cell.imageViewfor?.sd_setImage(with: URL(string: self.categories[indexPath.row].image))
            return cell
        }
        if tableView == rightTableview{
            let cell = tableView.dequeueReusableCell(withIdentifier: "CenderCell", for: indexPath) as! CenderCell
            cell.titleLabel.text = product[indexPath.row].title
            cell.mainImage?.sd_setImage(with: URL(string: self.product[indexPath.row].images[0]))
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if tableView == sideTableView{
            indexpathCell(cateory: self.categories[indexPath.row].id)
        }
    }
    
}
extension HomeVC{
    func callUrlForSideTableView(){
        let url = "https://api.escuelajs.co/api/v1/categories"
        AF.request(url).responseDecodable(of: [Category].self) { response in
            switch response.result {
            case .success(let json):
                print(json)
                self.categories = json
                self.indexpathCell(cateory : self.categories[0].id)
                self.sideTableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }

    }
    func indexpathCell(cateory : Int){
        let url = "https://api.escuelajs.co/api/v1/categories/\(cateory)/products"
        AF.request(url).responseDecodable(of: [Product].self) { response in
            switch response.result {
            case .success(let json):
                print(json)
                self.product = json
                self.rightTableview.reloadData()
            case .failure(let error):
                print(error)
            }
        }
        
    }
}

