//import CoreFirebaseAnalytics
//
//open class ShowHomeUseCase {
//
//    private let googleAnalyticRepository: GoogleAnalyticRepository
//
//    public init(googleAnalyticRepository: GoogleAnalyticRepository) {
//        self.googleAnalyticRepository = googleAnalyticRepository
//    }
//
//    open func execute(eventName: String, eventParameters: EventParameters) {
//        googleAnalyticRepository.sendEvent(name: eventName, parameters: eventParameters)
//    }
//
//}

import Foundation

open class ShowHomeUseCase: NSObject {
    
    override public init() {
        super.init()
    }
}
