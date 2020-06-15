import UIKit
import CoreDI
import CoreLifecycle

open class TutorialViewController: LifecycleObservableViewController, TutorialActions {
    
    public let viewModel: TutorialViewModel?
    
    public init(viewModelFactory: ViewModelFactory) {
        viewModel = viewModelFactory.create(TutorialViewModel.self)
        let pod = Bundle(for: TutorialViewController.self)
        let path = pod.path(forResource: "Tutorial", ofType: "bundle")!
        let bundle = Bundle(path: path)
        super.init(nibName: "TutorialViewController", bundle: bundle)
        setupViewModel()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    open func showHome() {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func onHomeClicked(_ sender: Any) {
        viewModel?.onHomeClicked()
    }
    
    private func setupViewModel() {
        viewModel?.eventDispatcher.bind(lifecycleOwner: self, listener: self)
    }
}
