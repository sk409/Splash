import Foundation
import CoreMVVM

open class SplashViewModel: ViewModel {
    
    public let eventDispatcher: EventDispatcher<SplashActions>
    private var loadSplashUseCase: LoadSplashUseCase
    
    public init(
        eventDispatcher: EventDispatcher<SplashActions>,
        loadSplashUseCase: LoadSplashUseCase
    ) {
        self.eventDispatcher = eventDispatcher
        self.loadSplashUseCase = loadSplashUseCase
    }
    
    // TODO: 確認
    // viewModelScopeを使っていません。
    open func start() {
        DispatchQueue.global().async {
            let splashAction = self.loadSplashUseCase.execute()
            switch splashAction {
            case .topAction:
                self.eventDispatcher.dispatchEvent { $0.showHome() }
            case .tutorialAction:
                self.eventDispatcher.dispatchEvent { $0.showTutorial() }
            }
        }
    }
    
}
