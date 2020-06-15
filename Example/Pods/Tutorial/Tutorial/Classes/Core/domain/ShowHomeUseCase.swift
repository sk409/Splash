//import CoreFirebaseAnalytics
//import HomeCommon
//import Home

// TODO: GoogleAnaliticRepository
//open class TutorialShowHomeUseCase: ShowHomeUseCase {
//
//    private var tutorialRepository: TutorialRepository
//
//    public init(
////        googleAnalyticRepository: GoogleAnalyticRepository,
//        tutorialRepository: TutorialRepository
//    ) {
//        self.tutorialRepository = tutorialRepository
////        super.init(googleAnalyticRepository: googleAnalyticRepository)
//        super.init()
//    }
//
////    override open func execute(eventName: String, eventParameters: EventParameters) {
////        tutorialRepository.isAlreadyShown = true
////        super.execute(eventName: eventName, eventParameters: eventParameters)
////    }
//}


open class TutorialShowHomeUseCase: NSObject {
    
    private var tutorialRepository: TutorialRepository
    
    public init(
//        googleAnalyticRepository: GoogleAnalyticRepository,
        tutorialRepository: TutorialRepository
    ) {
        self.tutorialRepository = tutorialRepository
//        super.init(googleAnalyticRepository: googleAnalyticRepository)
        super.init()
    }
    
//    override open func execute(eventName: String, eventParameters: EventParameters) {
//        tutorialRepository.isAlreadyShown = true
//        super.execute(eventName: eventName, eventParameters: eventParameters)
//    }
}
