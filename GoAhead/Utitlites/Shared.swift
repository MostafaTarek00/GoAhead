import UIKit
import Auk

class Shared {
    static var checkSeller : String?
    static let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    static var cartArray = [Cart]()
}

extension Auk {
    func setupSlider(images: [String]){
        settings.contentMode = .scaleAspectFill
        settings.pageControl.currentPageIndicatorTintColor = UIColor.init(named: "Background")
        for i in images {
            if let image = UIImage(named: i ) {
                show(image: image)
            }
        }
        startAutoScroll(delaySeconds: 3)
    }
}
