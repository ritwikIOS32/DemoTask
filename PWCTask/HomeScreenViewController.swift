//
//  HomeScreenViewController.swift
//  PWCTask
//
//  Created by Hanriver MacBook on 24/08/22.
//

import UIKit

class HomeScreenViewController: UIViewController {

    @IBOutlet weak var vwSecond: UIView!
    @IBOutlet weak var vwTop: UIView!
    @IBOutlet weak var vwBottom: UIView!
    @IBOutlet weak var vwCart: UIView!
    @IBOutlet weak var vwMenu: UIView!
    @IBOutlet weak var lblCount: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewTop: UICollectionView!
    var arr = ["10%","$32","$70"]
    var arr2 = ["Discount","Bonuse","Discount"]
    var arr3 = ["Order Histry","Payment method","Tracking","Statistics","Settings","Statistics"]
    var name:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func setupUI(){
        
        vwTop.layer.cornerRadius = 25
        
        
        vwBottom.clipsToBounds = true
        vwSecond.layer.cornerRadius = 25
        vwSecond.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        vwSecond.roundCorners(corners: [.topLeft, .topRight], radius: 25)
        
        //vwBottom.clipsToBounds = true
        vwBottom.layer.cornerRadius = 25
        
       // vwBottom.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
       // vwBottom.roundCorners(corners: [.topLeft, .topRight], radius: 25)
        
        
        imgProfile.layer.cornerRadius = imgProfile.frame.size.height / 2.0
        imgProfile.layer.masksToBounds = true
        
        vwCart.layer.cornerRadius = vwCart.frame.size.height / 2.0
        vwCart.layer.masksToBounds = true
        
        vwMenu.layer.cornerRadius = vwMenu.frame.size.height / 2.0
        vwMenu.layer.masksToBounds = true
        
        lblCount.layer.cornerRadius = lblCount.frame.size.height / 2.0
        lblCount.layer.masksToBounds = true
        
        lblCount.layer.borderColor = UIColor.green.cgColor
        lblCount.layer.borderWidth = 1
        
        vwCart.layer.borderColor = UIColor.green.cgColor
        vwCart.layer.borderWidth = 1
        
        lblName.text = name
        

        collectionView.register(UINib(nibName: "HomeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeCollectionViewCell")
        
        collectionViewTop.register(UINib(nibName: "TopCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "TopCollectionViewCell")
    }
    
    //MARK: - ACTION
    @IBAction func btnSignupAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension HomeScreenViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == collectionViewTop{
            return arr.count
        }else{
            return arr3.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if collectionView == collectionViewTop{
           
            let cell2 = collectionView.dequeueReusableCell(withReuseIdentifier: "TopCollectionViewCell", for: indexPath) as! TopCollectionViewCell
            
            cell2.lblTop.text = arr[indexPath.row]
            cell2.lblBottom.text = arr2[indexPath.row]
            if indexPath.row == 1{
                cell2.lblCount.isHidden = false
            }
            
            return cell2
        }
        else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
            
            if indexPath.row == 2{
                cell.lblCount.isHidden = false
            }
            cell.lblTitle.text = arr3[indexPath.row]
            
            return cell
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        if collectionView == collectionViewTop{
            
            let noOfCellsInRow = 3
            let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
            let totalSpace = flowLayout.sectionInset.left
                + flowLayout.sectionInset.right
                + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
            let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
            return CGSize(width: size, height: 100)
        }else{
            
            let noOfCellsInRow = 2
            let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
            let totalSpace = flowLayout.sectionInset.left
                + flowLayout.sectionInset.right
                + (flowLayout.minimumInteritemSpacing * CGFloat(noOfCellsInRow - 1))
            let size = Int((collectionView.bounds.width - totalSpace) / CGFloat(noOfCellsInRow))
            return CGSize(width: size, height: 120)
            
           
        }
        
    }
    

  /*  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let flowayout = collectionViewLayout as? UICollectionViewFlowLayout
                let space: CGFloat = (flowayout?.minimumInteritemSpacing ?? 0.0) + (flowayout?.sectionInset.left ?? 0.0) + (flowayout?.sectionInset.right ?? 0.0)
                let size:CGFloat = (collectionView.frame.size.width - space) / 2.0
                return CGSize(width: size, height: 99)
            
    }*/
}
extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
