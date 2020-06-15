import Foundation
//import TutorialCommon

public enum SplashAction {
    case tutorialAction
    case topAction
}

public struct LoadSplashUseCase {
    
    private var splashRepository: SplashRepository
//    private let tutorialRepository: TutorialRepository
    
    public init(splashRepository: SplashRepository/*, tutorialRepository: TutorialRepository*/) {
        self.splashRepository = splashRepository
//        self.tutorialRepository = tutorialRepository
    }
    
    mutating func execute() -> SplashAction {
        Thread.sleep(forTimeInterval: 5)
        splashRepository.isAlreadyShown = true
//        return tutorialRepository.isAlreadyShown ? .topAction : .tutorialAction
        return .tutorialAction
    }
}
