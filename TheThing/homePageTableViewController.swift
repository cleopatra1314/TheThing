//
//  homePageTableViewController.swift
//  TheThing
//
//  Created by 黃郁雯 on 2022/11/4.
//

import UIKit
import WebKit

class homePageTableViewController: UITableViewController {

    @IBOutlet weak var adImageView: UIImageView!
    @IBOutlet weak var adPageControl: UIPageControl!
    
    @IBOutlet weak var popularScrollView: UIScrollView!
    @IBOutlet weak var popularImageView: UIImageView!
    
    let nameOfAdSeries = ["room01", "room02", "room03", "room04"]
    var indexOfPage:Int = 0
    
    //NFT items
    @IBOutlet weak var certificationImageView: UIImageView!
    @IBOutlet weak var itemLikeImageView: UIImageView!
    @IBOutlet weak var numberOfLikeTextView: UITextView!
    
    @IBOutlet weak var itemPriceLabel: UILabel!
    @IBOutlet weak var item01PriceLabel: UILabel!
    @IBOutlet weak var item02PriceLabel: UILabel!
    
    
    @IBOutlet weak var numberOfItemBuyLabel: UILabel!
    @IBOutlet weak var numberOfItem01BuyLabel: UILabel!
    @IBOutlet weak var numberOfItem02BuyLabel: UILabel!
    
    @IBOutlet weak var buyItemStepper: UIStepper!
    @IBOutlet weak var buyItem01Stepper: UIStepper!
    @IBOutlet weak var buyItem02Stepper: UIStepper!
    
    //商品購買資訊總結
    @IBOutlet weak var totalPriceLabel: UILabel!
    @IBOutlet weak var totalAmountOfItemBuyLabel: UILabel!
    @IBOutlet weak var clearButton: UIButton!
    
    @IBOutlet weak var likeItemButton: UIButton!
    
    //外部網站
    @IBOutlet weak var WebsiteWebView: WKWebView!
    
    var sumOfPrice = 0.0
    var sumOfAmountOfitem = 0
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //
        title = "TheThing"
        adImageView.image = UIImage(named: nameOfAdSeries[0])
        adImageView.contentMode = .scaleAspectFill
        
        numberOfLikeTextView.text = String(numberOfLike)
        
        showWebsite()
    }

    @IBAction func changeAd(_ sender: UIPageControl) {
        indexOfPage = sender.currentPage
        adImageView.image = UIImage(named: nameOfAdSeries[indexOfPage])
    }
    
    //---------- NFT item area -----------
    //點擊愛心收藏
    var likeButtonStatus = false
    var numberOfLike = 32
    
    @IBAction func likeItemButton(_ sender: UIButton){
        likeButtonStatus = !likeButtonStatus
        if likeButtonStatus{
            sender.setImage(UIImage(systemName: "heart.fill"), for: UIControl.State.normal)
            numberOfLike += 1
            numberOfLikeTextView.text = String(numberOfLike)
        }else{
            sender.setImage(UIImage(systemName: "heart"), for: UIControl.State.normal)
            numberOfLike -= 1
            numberOfLikeTextView.text = String(numberOfLike)
        }
    }
    
    //統計商品選購數量
    var numberOfitem = 0
    var numberOfitem01 = 0
    var numberOfitem02 = 0
    var totalPrice = 0.0
    
    @IBAction func buyItemStepper(_ sender: UIStepper) {
//        numberOfitem = Int(sender.value)
//        numberOfItemBuyLabel.text = String(numberOfitem)
//        calculate(price: 0.8, number: Int(sender.value))
        
        numberOfitem = Int(buyItemStepper.value)
        numberOfItemBuyLabel.text = String(numberOfitem)
        
        numberOfitem01 = Int(buyItem01Stepper.value)
        numberOfItem01BuyLabel.text = String(numberOfitem01)
        
        numberOfitem02 = Int(buyItem02Stepper.value)
        numberOfItem02BuyLabel.text = String(numberOfitem02)
        
        let priceOfItem = calculate(price: Double(itemPriceLabel.text!)!, number: numberOfitem)
        let priceOfItem01 = calculate(price: Double(item01PriceLabel.text!)!, number: numberOfitem01)
        let priceOfItem02 = calculate(price: Double(item02PriceLabel.text!)!, number: numberOfitem02)
        totalPrice = priceOfItem + priceOfItem01 + priceOfItem02
        sumOfAmountOfitem = numberOfitem + numberOfitem01 + numberOfitem02
        
        //將數字轉為金額格式
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        let moneyString = formatter.string(from: NSNumber(value: totalPrice))
        
        totalAmountOfItemBuyLabel.text = String(sumOfAmountOfitem)
        totalPriceLabel.text = "\(moneyString!) ETH"
    }
    
    //總計購買
    func calculate(price: Double, number: Int) -> Double{
        sumOfPrice = price * Double(number)
        sumOfAmountOfitem = number
//        totalPriceLabel.text = String(totalPrice)
//        totalAmountOfItemBuyLabel.text = String(totalAmountOfitem)
        
        return sumOfPrice
    }
    
    //清除全部購買
    func cleanBuyRecord(){
        buyItemStepper.value = 0
        buyItem01Stepper.value = 0
        buyItem02Stepper.value = 0
        
        numberOfItemBuyLabel.text = "0"
        numberOfItem01BuyLabel.text = "0"
        numberOfItem02BuyLabel.text = "0"
        
//        sumOfAmountOfitem = 0
//        totalPrice = 0
        totalAmountOfItemBuyLabel.text = "0"
        totalPriceLabel.text = "0"
    }
    
    @IBAction func cleanBuyRecord(_ sender: Any) {
        cleanBuyRecord()
    }
    
    //將購買總金額資料傳至 ProfileController
    @IBSegueAction func calculateBalance(_ coder: NSCoder) -> ProfileViewController? {
        cleanBuyRecord()
        let controller = ProfileViewController(coder: coder)
        controller?.totalPrice02 = totalPrice
        return controller
    }
    
    //click NFT cell 進到各別 NFT 的詳細頁面
    @IBSegueAction func showNFTDetail(_ coder: NSCoder, sender: Any?, segueIdentifier: String?) -> nftDetailViewController? {
        let controller = nftDetailViewController(coder: coder)
        switch segueIdentifier{
        case "thing1":
            controller?.indexOfnft = 0
        case "thing2":
            controller?.indexOfnft = 1
        case "thing3":
            controller?.indexOfnft = 2
        default:
            break
        }
        
        return controller
    }
    
    
    //segue被觸發時，切換到相對應的nft詳細資訊viewController
    
    
    
    
    
    
    //顯示外部網站
    func showWebsite(){
        if let url = URL(string: "https://www.youtube.com/watch?v=fgwQXa727ko"){
            let request = URLRequest(url: url)
            WebsiteWebView.load(request)
        }
        
    }
    
    

}
