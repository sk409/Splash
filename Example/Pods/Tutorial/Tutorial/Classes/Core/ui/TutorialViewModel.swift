//import CoreFirebaseAnalytics
import CoreMVVM

open class TutorialViewModel: ViewModel {
    
    public let eventDispatcher: EventDispatcher<TutorialActions>
    private var showHomeUseCase: TutorialShowHomeUseCase
    
    public init(
        eventDispatcher: EventDispatcher<TutorialActions>,
        showHomeUseCase: TutorialShowHomeUseCase
    ) {
        self.eventDispatcher = eventDispatcher
        self.showHomeUseCase = showHomeUseCase
        super.init()
    }
    
    open func onHomeClicked() {
//        showHomeUseCase.execute(eventName: "click_tutorial_home", eventParameters: EventParameters())
        eventDispatcher.dispatchEvent { $0.showHome() }
    }
    
}
