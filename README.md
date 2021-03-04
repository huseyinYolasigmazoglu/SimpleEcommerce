# Ecommerce

This is a simple ecommmerce project.

My Enviroment:
- xCode Version 12.4 (12C33)
- My swift version : Swift 5


Technical:
- Alomofire is used as networking library
- SDWebImage is used as image downloader to help cache issues.
- CocoaPods is used as dependency manager

To Open Project: Download the source code from github and open  Ecomerce.xcworkspace file with xCode.

Important classes:
- ApiOperations: request the product details fom web service and forwards the data to ProductManager with completionhandler.
- ProductManager : is the manager class and executes all kinds manuplations and orchestration of the product. get the data from  ApiOperations class and forward the data via delegate?.loadData
- MainViewController : has the collection view and demonstrate product  image, name and price, when the product is clicked DetailTableViewController opens.
- DetailTableViewController :  is the detail of the product . This is a table view , first row of the tableview cell  is a collectionView. You can slide detail images of the product via this collectionView. Second tableview row cell has detail information about the product. A new row can easily be added the table via registiring the xib file or via  increase row numbers of the table . So the tableView can easily be extensible.
- FilterViewController : You can sort the collectionView data in MainViewController via delagation of this class.
