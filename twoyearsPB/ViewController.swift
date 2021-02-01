//
//  ViewController.swift
//  twoyearsPB
//
//  Created by eric on 2020/8/17.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
        
    struct data {
        var img: String
        var description: String
    }
    

    @IBOutlet weak var timeSlider: UISlider!
    @IBOutlet weak var sonImageView: UIImageView!
    @IBOutlet weak var dataPicker: UIDatePicker!
    @IBOutlet weak var albumLabel: UILabel!
   
    let dateFormatter = DateFormatter()
    var dateString:String = ""
    var album:String = ""
    var timer:Timer?
    var imageNumber = 0
    var sliderValue = 0
    let image = ["199977","200077","200176","20031111","2004115","20061229","20081023","20111216","2016721"]
    let albumlist = ["五月天第一張創作專輯","愛情萬歲","人生海海","時光機","神的孩子都在跳舞","為愛而生","後青春期的詩","第二人生","自傳"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        time()
        dataPicker.locale = Locale(identifier: "zh_TW")
        dateFormatter.dateFormat = "yyyy/MM/dd"
    }
//要查詢功用
func time(){
          timer=Timer.scheduledTimer(withTimeInterval: 1, repeats: true){(timer) in self.compare()}
      }
    
    //比對陣列內的照片,num預設0
        func compare(){
    //如果到最後一張照片時則從第一張開始,不是的話繼續跑照片num+=1
            if imageNumber >= image.count{
                imageNumber=0
                choosePicture(num2: imageNumber)
                albumLabel.text = albumlist[imageNumber]
                sonImageView.image=UIImage(named: image[imageNumber])
            }else{
                choosePicture(num2: imageNumber)
                albumLabel.text = albumlist[imageNumber]
                sonImageView.image=UIImage(named: image[imageNumber])
            }
    //連動Slider
            timeSlider.value = Float(imageNumber)
            albumLabel.text = albumlist[imageNumber]
            imageNumber+=1
            
        }
    
    
    @IBAction func albumSliderChange(_ sender: UISlider) {
        
//        sender.value.round()
//        print(sender.value.round())
        sliderValue = Int(sender.value)
        sonImageView.image=UIImage(named: image[sliderValue])
                choosePicture(num2: sliderValue)
        albumLabel.text = albumlist[sliderValue]

        
    }
    
    
    @IBAction func autoSwitch(_ sender: UISwitch) {
        if sender.isOn {
                   time()
            imageNumber = sliderValue
            timeSlider.value = Float(imageNumber)
               }else{
                   timer?.invalidate()
               }
    }
    

    
    //用switch-case選照片
        func choosePicture(num2:Int) {
            
            if num2 == 0{
                dateString = "1999/07/07"
            }else if num2 == 1{
                dateString = "2000/07/07"
            }else if num2 == 2{
                dateString = "2001/07/06"
            }else if num2 == 3{
                dateString = "2003/11/11"
            }else if num2 == 4{
                dateString = "2004/11/05"
            }else if num2 == 5{
                dateString = "2006/12/29"
            }else if num2 == 6{
                dateString = "2008/10/23"
            }else if num2 == 7{
                dateString = "2011/12/16"
            }else{
                dateString = "2016/07/21"
            }
//            switch num2 {
//            case 0:
//                dateString = "1999/07/07"
//            case 1:
//                dateString = "2000/07/07"
//            case 2:
//                dateString = "2001/07/06"
//            case 3:
//                dateString = "2003/11/11"
//            case 4:
//                dateString = "2004/11/05"
//            case 5:
//                dateString = "2006/12/29"
//            case 6:
//                dateString = "2008/10/23"
//            case 7:
//                dateString = "2011/12/16"
//            default:
//                dateString = "2016/07/21"
//            }
            let date = dateFormatter.date(from: dateString)
            dataPicker.date = date!
        }
    
    
    
    @IBAction func changeImageDataPicker(_ sender: UIDatePicker) {
        
   

        
        let dataComponents = Calendar.current.dateComponents(in: TimeZone.current, from: dataPicker.date)
        let yyyy = dataComponents.year!
        let mm = dataComponents.month!
        let dd = dataComponents.day!
        let imageDate = "\(yyyy)\(mm)\(dd)"
        sonImageView.image = UIImage(named: imageDate)
//        print(imageDate)
//        print(dataComponents)

    }
    
    

}

