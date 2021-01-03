# Ecommerce

This is a simple ecommmerce project.

My Enviroment:
- xCode Version 12.3 (12C33)
- My swift version : Swift 5


Technical:
- Alomofire is used as networking library
- SDWebImage is used as image downloader to help cache issues.
- CocoaPods is used as dependency manager

To Open Project: -Download the source code from github and open  Ecomerce.xcworkspace file with xCode.

Important classes:
ApiOperations: request the product details fom web service and forwards the data to ProductManager with completionhandler.
ProductManager : is the manager class and executes all kinds manuplations and orchestration of the product.
MainViewController : has the collection view and demonstrate product image, name and price, when the product is clicked detail view opens.

