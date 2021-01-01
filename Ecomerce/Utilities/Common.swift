//
//  Common.swift
//  Ecomerce
//
//  Created by Huseyin Yolasigmazoglu on 31.12.2020.
//

import Foundation
import UIKit

class Common {
    
    public static func getNavigationBarHeight(navigationController nav: UINavigationController? ) -> CGFloat   {
        
        if let controller = nav {
            
            if controller.isNavigationBarHidden == true {
                return 0
            }
            else{
                return controller.navigationBar.frame.size.height
            }
        }
        else {
            return 0
        }
    }    
}
