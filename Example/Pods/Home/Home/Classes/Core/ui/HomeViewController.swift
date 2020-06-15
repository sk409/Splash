import UIKit
import CoreDI
import CoreLifecycle
import Splash

open class HomeViewController: LifecycleObservableViewController, HomeActions {
    
    private(set) public var viewModel: HomeViewModel?
    
    private let viewControllerFactory: ViewControllerFactory
    
    public init(viewModelFactory: ViewModelFactory, viewControllerFactory: ViewControllerFactory) {
        viewModel = viewModelFactory.create(HomeViewModel.self)
        self.viewControllerFactory = viewControllerFactory
        let pod = Bundle(for: HomeViewController.self)
        let path = pod.path(forResource: "Home", ofType: "bundle")!
        let bundle = Bundle(path: path)
        super.init(nibName: "HomeViewController", bundle: bundle)
        setupViewModel()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    open func showSplash() {
        guard let splashViewController = viewControllerFactory.instantiate(SplashViewController.self) else {
            return
        }
        navigationController?.pushViewController(splashViewController, animated: false)
    }
    
    private func setupViewModel() {
        viewModel?.eventDispatcher.bind(lifecycleOwner: self, listener: self)
        viewModel?.start()
    }
}
