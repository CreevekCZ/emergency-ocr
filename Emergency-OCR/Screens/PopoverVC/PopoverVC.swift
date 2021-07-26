import AppKit
import WebKit

class PopoverVC: CoreVC {
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        togglePopoverHotKey.keyDownHandler = {
//            self.delegate.togglePopover()
//        }
//
        prepareView()
        
    }
    
    
    private func prepareView() {
        

    }
    
    override func viewDidAppear() {
        super.viewDidAppear()

        
    }
    
    
    override func keyDown(with event: NSEvent) {
        
        let key = event.keyCode
        
        if (key == 53) {
//            delegate.closePopover()
        }
        
    }
    
    
    @IBAction func quitButton(_ sender: Any) {
        NSApplication.shared.terminate(self)
    }
    
    
}


//MARK: HELPER METHODS
extension PopoverVC {
    
    static func getPopoverVC() -> PopoverVC {
        
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
        
        guard let vc = storyboard.instantiateController(withIdentifier: "PopoverVC") as? PopoverVC else {
            fatalError("Why i cant find MainViewController? - Check Main.storyboard")
        }
        
        return vc
    }
    
}
