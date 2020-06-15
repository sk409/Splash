import UIKit

open class LifecycleObservableViewController: UIViewController, LifecycleOwner {
    
    public let lifecycle = Lifecycle()
    
    public init() {
        super.init(nibName: nil, bundle: nil)
        lifecycle.owner = self
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        lifecycle.owner = self
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    open override func loadView() {
        super.loadView()
        lifecycle.onLoadView()
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        lifecycle.onViewDidAppear()
    }
    
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        lifecycle.onViewWillAppear()
    }
    
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        lifecycle.onViewWillLayoutSubviews()
    }
    
    open override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        lifecycle.onViewDidLayoutSubviews()
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        lifecycle.onViewDidAppear()
    }
    
    open override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        lifecycle.onViewWillDisappear()
    }
    
    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        lifecycle.onViewDidDisappear()
    }
}
