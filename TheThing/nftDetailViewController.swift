//
//  nftDetailViewController.swift
//  TheThing
//
//  Created by 黃郁雯 on 2022/11/7.
//

import UIKit

class nftDetailViewController: UIViewController {
    
    var indexOfnft: Int!
    var likeStatus: Bool!
    
    @IBOutlet weak var likeButton: UIButton!
    
    @IBOutlet weak var tockenStandardTextView: UITextView!
    @IBOutlet weak var nftImageView: UIImageView!
    @IBOutlet weak var ownerImageView: UIImageView!
    @IBOutlet weak var creatorImageView: UIImageView!
    
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var creatorLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var numberOfItemBuyLabel: UILabel!
    
    @IBOutlet weak var buyItemStepper: UIStepper!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
        
        // Do any additional setup after loading the view.
    }
    
    func updateUI(){
        let theNFT = nftDataArray[indexOfnft]
        title = theNFT.name
        tockenStandardTextView.text = theNFT.tockenStandard
        nftImageView.image = UIImage(named: theNFT.image)
        nftImageView.layer.cornerRadius = 8
        ownerLabel.text = theNFT.owner
        creatorLabel.text = theNFT.creator
        priceLabel.text = String(theNFT.price)
        numberOfItemBuyLabel.text = String(theNFT.numberOfBuy)
        //為了將 Int 存入 stepper.value，將它變成 double
        buyItemStepper.value = Double(theNFT.numberOfBuy)
        //按讚與否
        if theNFT.like{
            likeButton.setImage(UIImage(systemName: "heart.fill"), for: UIControl.State.normal)
        }else{
            likeButton.setImage(UIImage(systemName: "heart"), for: UIControl.State.normal)
        }
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
