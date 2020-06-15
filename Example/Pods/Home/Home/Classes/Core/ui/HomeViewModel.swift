import CoreMVVM

open class HomeViewModel: ViewModel {
    
    public let eventDispatcher: EventDispatcher<HomeActions>
    private let loadHomeUseCase: LoadHomeUseCase
    
    public init(
        eventDispatcher: EventDispatcher<HomeActions>,
        loadHomeUseCase: LoadHomeUseCase
    ) {
        self.eventDispatcher = eventDispatcher
        self.loadHomeUseCase = loadHomeUseCase
    }
    
    // TODO: 確認
    // viewModelScopeを使っていません。
    open func start() {
        let homeAction = loadHomeUseCase.execute()
        switch homeAction {
        case .showSplashAction:
            eventDispatcher.dispatchEvent { $0.showSplash() }
        case .result(let text):
            // TODO: 確認
            // DataBindingを実装していないので
            // printしています
            print(text)
        }
    }
    
}
