import UIKit
import CoreDI
import CoreLifecycle
import Tutorial

// TODO: 確認
// MvvmFragmentに相当するクラスを継承していません
open class SplashViewController: LifecycleObservableViewController, SplashActions {
    
    private(set) public var viewModel: SplashViewModel?
    
    private let viewControllerFactory: ViewControllerFactory
    
    public init(
        viewModelFactor: ViewModelFactory,
        viewControllerFactory: ViewControllerFactory
    ) {
        viewModel = viewModelFactor.create(SplashViewModel.self)
        self.viewControllerFactory = viewControllerFactory
        let pod = Bundle(for: SplashViewController.self)
        let path = pod.path(forResource: "Splash", ofType: "bundle")!
        let bundle = Bundle(path: path)
        super.init(nibName: "SplashViewController", bundle: bundle)
        setupViewModel()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    open func showHome() {
        navigationController?.popViewController(animated: true)
    }
    
    open func showTutorial() {
        guard let tutorialViewController = viewControllerFactory.instantiate(TutorialViewController.self) else {
            return
        }
        navigationController?.pushViewController(tutorialViewController, animated: true)
    }
    
    private func setupViewModel() {
        viewModel?.eventDispatcher.bind(lifecycleOwner: self, listener: self)
        viewModel?.start()
    }
}
