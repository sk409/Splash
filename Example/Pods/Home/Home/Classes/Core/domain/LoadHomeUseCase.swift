import Foundation
import Splash

public enum LoadHomeAction {
    case showSplashAction
    case result(String)
}

public struct LoadHomeUseCase {

    private let splashRepository: SplashRepository

    public init(splashRepository: SplashRepository) {
        self.splashRepository = splashRepository
    }

    public func execute() -> LoadHomeAction {
        if splashRepository.isAlreadyShown {
            Thread.sleep(forTimeInterval: 1)
            return .result("This is home Fragment")
        }
        return .showSplashAction
    }
}
