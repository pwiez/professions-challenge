//
//  CapturedImageModel.swift
//  professions-challenge
//
//  Created by Rodrigo Yamauchi on 08/09/25.
//

import Foundation
import SwiftData
import UIKit

@Model
class CapturedImageModel {
    var imageData: Data?
    
    init(imageData: Data? = nil) {
        self.imageData = imageData
    }
    
    init(uiImage: UIImage) {
        guard let data = uiImage.jpegData(compressionQuality: 1.0) else {
            self.imageData = nil
            return
        }
        self.imageData = data
    }
    
    var uiImage: UIImage? {
        guard let data = imageData else { return nil }
        return UIImage(data: data)
    }
}
