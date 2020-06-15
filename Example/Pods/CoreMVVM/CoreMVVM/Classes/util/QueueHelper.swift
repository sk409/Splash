import Foundation

public struct QueueHelper {
    
    public static func createQueueOnMainThread() -> DispatchQueue {
        return DispatchQueue.main
    }
    
    private init() {
    }
}
