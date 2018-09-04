import UIKit

class MainVC: UIViewController {
    
    var nrm: NetworkRequestManager = NetworkRequestManager();
    
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = ""
        
    }
    
    @IBAction func getRandomPhoto(_ sender: Any) {
        //The JSON Place Holder API has 5000 photos
        //So Setting Upper Bound to 5000 makes sense
        
        let randomPhotoIndex = arc4random_uniform(5000);
        
        nrm.getPhoto(with: Int(randomPhotoIndex)) { (photo) in
            self.titleLabel.text = photo?.title;
            if let parsedPhoto = photo {
                self.getImageFromURL(forURL: (parsedPhoto.url));
            }
        }
    }
    
    func getImageFromURL(forURL imageURL: String) {
        let url = URL(string: imageURL);
        
        DispatchQueue.global().async {
            do {
                let imageData = try Data(contentsOf: url!);
                DispatchQueue.main.sync {
                    self.photoImageView.image = UIImage(data: imageData)
                }
            } catch {
                debugPrint(error)
            }
        }
    }
    
}

