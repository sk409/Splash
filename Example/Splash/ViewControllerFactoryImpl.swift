import CoreDI
import Splash

public struct ViewControllerFactoryImpl: ViewControllerFactory {
    
    
    let viewModelFactory = ViewModelFactoryImpl()
    
    public func instantiate<T: UIViewController>(_ metatype: T.Type) -> T? {
        switch metatype {
//        case is HomeViewController.Type:
//            return HomeViewController(viewModelFactory: viewModelFactory, viewControllerFactory: self) as? T
        case is SplashViewController.Type:
            return SplashViewController(viewModelFactor: viewModelFactory) as? T
//        case is TutorialViewController.Type:
//            return TutorialViewController(viewModelFactory: viewModelFactory) as? T
        default:
            return nil
        }
    }
    
}
