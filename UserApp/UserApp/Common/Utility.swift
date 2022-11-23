//
//  Utility.swift
//  UserApp
//
//  Created by srikanth on 10/31/22.
//

import Foundation
import UIKit

class Utility: NSObject {
    
    /// Get image from imageUrl
    /// - Parameters:
    ///   - urlString: image url string
    ///   - completion: Callback method after fetching image from url
    class func getImage(fromUrl urlString: String, completion: @escaping(_ image: UIImage?) -> Void){
        DispatchQueue.global().async {
            
            /// Set image from cache if cache is not empty else
            /// Fetch image from url
            if let image = ImageCache.imageCache.object(forKey: urlString as NSString) as? UIImage{
                completion(image)
            }else if let url = URL(string: urlString), let data = try? Data(contentsOf: url), let image = UIImage(data: data){
                    /// save image to imageCache with url as Key
                    ImageCache.imageCache.setObject(image, forKey: urlString as NSString)
                completion(image)
            }
        }
    }
    
    
    /// Handle localizable strings
    /// - Parameters:
    ///   - str: Localizable key
    ///   - comment: String descreption
    /// - Returns: a localized string
    class func localize(string str: String?, comment: String?) -> String{
        return NSLocalizedString(str ?? "", comment: comment ?? "")
    }
    
    
    /// Construct an attributed string, partial string with bold font
    /// - Parameters:
    ///   - string: original String
    ///   - boldString: bold font string
    ///   - font: default font of original String
    /// - Returns: an attributed String (bold + regular)
    class func attributedText(actualString string: String, boldString: String, font: UIFont) -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: string,
                                                     attributes: [NSAttributedString.Key.font: font])
        /// consgtruct Bold font attribute
        let boldFontAttribute: [NSAttributedString.Key: Any] = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: font.pointSize)]
        /// consgtruct Color font attribute
        let colorAttribute:[NSAttributedString.Key: Any] = [NSAttributedString.Key.foregroundColor: UIColor.black]
        
        /// get range of boldString in actualString
        let range = (string as NSString).range(of: boldString)
        
        /// add all attributes
        attributedString.addAttributes(boldFontAttribute, range: range)
        attributedString.addAttributes(colorAttribute, range: range)
        
        return attributedString /// final attributed string
    }
}

class ImageCache: NSObject {
    static var imageCache =  NSCache<NSString, AnyObject>()
}
