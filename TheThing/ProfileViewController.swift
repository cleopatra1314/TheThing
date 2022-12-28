//
//  ProfileViewController.swift
//  TheThing
//
//  Created by 黃郁雯 on 2022/11/6.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var balanceAlertTextView: UITextView!
    @IBOutlet weak var profileImageButton: UIButton!
    
    let imagePickController = UIImagePickerController()
    let profileBorderColorPickController = UIColorPickerViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePickController.delegate = self
        profileBorderColorPickController.delegate = self
        updateUI()
        //calculateBalance()
        // Do any additional setup after loading the view.
    }
    
    func updateUI(){
        //profileImageButton.layer.cornerRadius = 40
        profileImageButton.imageView?.layer.cornerRadius = 40
        profileImageButton.clipsToBounds = false
        profileImageButton.imageView?.contentMode = .scaleAspectFill
        
        //頭貼外框
        profileImageButton.layer.borderWidth = 4
        profileImageButton.layer.cornerRadius = 40
        //profileImageButton.layer.borderColor =
    }
    
    //更換個人大頭照
    // - 建立 @IBAction
    @IBAction func selectProfileImage(_ sender: UIButton) {
        
        //建立彈出視窗
          let profileImageActionSheetController = UIAlertController(title: "更換大頭貼", message: "請問要以何種方式取得照片？", preferredStyle: .actionSheet)
        
        //建立彈出視窗的選項
          let profileImageFromLibraryAction = UIAlertAction(title: "從相簿選取", style: .default){ _ in
            //加 self 方法一
              self.openPhotolibrary()
          }
          profileImageActionSheetController.addAction(profileImageFromLibraryAction)
        
          let profileImageFromTakePhotoAction = UIAlertAction(title: "拍照", style: .default){ [self] _ in
              //加 self 方法二
                takePicture()
          }
          profileImageActionSheetController.addAction(profileImageFromTakePhotoAction)
        
          let cancelImagePickAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        profileImageActionSheetController.addAction(cancelImagePickAction)
        
        //呈現彈窗
          present(profileImageActionSheetController, animated: true)
    }
    
    //從相簿媒體庫選擇頭貼
    func openPhotolibrary(){
        //let imagePickController = UIImagePickerController()
        imagePickController.sourceType = .photoLibrary
        //imagePickController.delegate = self
        present(imagePickController, animated: true)
    }
    
    //從相機拍攝頭貼
    func takePicture(){
        //let imagePickController = UIImagePickerController()
        imagePickController.sourceType = .camera
        //imagePickController.delegate = self
        present(imagePickController, animated: true)
    }
    
    //??
    //接收 homepageController 的購買總金額資料
    var totalPrice02: Double!
    var balance = 50.0
    
    func calculateBalance(){
        
        if balance >= totalPrice02{
            balance = balance - totalPrice02
            balanceLabel.text = String(balance)
            balanceAlertTextView.text = String("交易成功，已扣款")
            balanceAlertTextView.textColor = .green
        }else{
            balanceLabel.text = String(balance)
            balanceAlertTextView.text = String("餘額不足，交易失敗！")
            balanceAlertTextView.textColor = .red
        }
        
    }
}


//----------- extension ------------

//將更換頭貼功能獨立出來
extension ProfileViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate{
    // - 定義 delegate 執行的 func
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as? UIImage
        profileImageButton.setImage(image, for: .normal)
        
        //通常會與 present 一起搭配
        dismiss(animated: true)
        print("已更換照片")
    }
}

//將更換頭貼外框顏色功能獨立出來
extension ProfileViewController: UIColorPickerViewControllerDelegate{
    
    //更換頭貼外框顏色
    // - 建立 @IBAction 觸發 delegate
    @IBAction func pickProfileBorderColor(_ sender: UIButton) {
        present(profileBorderColorPickController, animated: true)
    }
    
    // - 設定 delegate 的 func
    func colorPickerViewController(_ viewController: UIColorPickerViewController, didSelect color: UIColor, continuously: Bool) {
        profileImageButton.layer.borderColor = color.cgColor
        dismiss(animated: true)
    }
    
}
