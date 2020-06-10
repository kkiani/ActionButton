# ActionButton
custom class from UIButton which open a UIAlertController with sheetStyle act like combo box.

## Intallation Options
-   Swift Package Manager

## ⚠️ Attention
do not use for large number of options.

## Example

```swift

class viewController: UIViewController{
    @IBOutlet weak var fooButton: ActionButton!
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        fooButton.dataSource = [
            "option 1",
            "option 2"
        ]
    }
}

extension viewController: ActionButtonDelegate{
    func actionButton(_ actionButton: ActionButton, didSelectRow index: Int){
        print(index, actionButton.dataSource[index])
    }
}

```
