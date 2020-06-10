#if !os(macOS)
import UIKit

open class ActionButton: UIButton{
    public var dataSource = [String](){
        didSet{
            updateActionList()
        }
    }
    public var delegate: ActionButtonDelegate?
    public var selectedIndex: Int?
    private var actionController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required public init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        addTarget(self, action: #selector(tapped(_:)), for: .touchUpInside)
    }
    
    public func updateActionList(){
        // reset actions
        actionController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        // add actions from dataSource
        for (index, item) in dataSource.enumerated(){
            let action = UIAlertAction(title: item, style: .default, handler: { [weak self] (_) in
                guard let self = self else{return}
                self.delegate?.actionButton(self, didSelectRow: index)
            })
            
            if selectedIndex == index{            
                action.setValue(true, forKey: "checked")
                actionController.addAction(action)
            }
            
            actionController.addAction(action)
        }
        
        // add cancel button
        actionController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    }
    
    @objc func tapped(_ sender: ActionButton){
        delegate?.present(actionController, animated: true, completion: nil)
    }
}

#endif
