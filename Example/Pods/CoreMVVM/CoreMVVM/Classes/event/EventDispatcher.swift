import Foundation
import CoreLifecycle

// TODO: 確認
// iOSでもこのようにpendingEventsにeventを溜めておく必要はありますか?
open class EventDispatcher<ListenerType: Any>: NSObject {
    
    private let queue: DispatchQueue
    private var pendingEvents = [(ListenerType) -> Void]()
    private var currentListener: ListenerType?
    
    public override init() {
        queue = QueueHelper.createQueueOnMainThread()
        super.init()
    }
    
    public init(queue: DispatchQueue) {
        self.queue = queue
        super.init()
    }
    
    open func bind(lifecycleOwner: LifecycleOwner, listener: ListenerType) {
        let lifecycleObserver = LifecycleObserver()
        lifecycleObserver.onViewDidAppear = {
            self.currentListener = listener
            self.queue.async { [weak self] in
                self?.pendingEvents.forEach{ $0(listener) }
            }
            self.pendingEvents.removeAll()
        }
        // TODO: 確認
        // onPause,onDestoryで実行されていた処理をonViewDidDisappearにまとめてしまったのですが
        // 問題ありませんか?
        lifecycleObserver.onViewDidDisappear = { source in
            self.currentListener = nil
            source?.lifecycle.removeObserver(observer: lifecycleObserver)
        }
        lifecycleOwner.lifecycle.addObserver(observer: lifecycleObserver)
    }
    
    open func dispatchEvent(event: @escaping (ListenerType) -> Void) {
        if let listener = currentListener {
            queue.async {
                event(listener)
            }
        } else {
            queue.async { [weak self] in
                self?.pendingEvents.append(event)
            }
        }
    }
}
