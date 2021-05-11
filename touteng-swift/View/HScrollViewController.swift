
import SwiftUI


struct HScrollViewController<Content: View>: UIViewControllerRepresentable {
    let pageWidth: CGFloat
    let contentSize: CGSize
    let content: Content
    @Binding var leftPercent: CGFloat
    init(pageWidth: CGFloat, contentSize: CGSize, leftPercent: Binding<CGFloat>, @ViewBuilder content: () -> Content){
        self.pageWidth = pageWidth
        self.contentSize = contentSize
        self.content = content()
        self._leftPercent = leftPercent
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
        let scrollView = UIScrollView()
        scrollView.bounces = false
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.delegate = context.coordinator
        context.coordinator.scrollView = scrollView
        
        let vc = UIViewController()
        vc.view.addSubview(scrollView)
        
        let host = UIHostingController(rootView: content)
        vc.addChild(host)
        scrollView.addSubview(host.view)
        host.didMove(toParent: vc)
        context.coordinator.host = host
        
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        let scrollView = context.coordinator.scrollView!
        scrollView.frame = CGRect(x: 0, y: 0, width: pageWidth, height: contentSize.height)
        scrollView.contentSize = contentSize
        //scrollView.setContentOffset(CGPoint(x: leftPercent * (contentSize.width - pageWidth), y: 0), animated: true)
        scrollView.setContentOffset(CGPoint(x: leftPercent * 1/3 * (contentSize.width - pageWidth), y: 0), animated: true)
        context.coordinator.host.view.frame = CGRect(origin: .zero, size: contentSize)
    }
    
    class Coordinator: NSObject, UIScrollViewDelegate {
        let parent: HScrollViewController
        var scrollView: UIScrollView!
        var host: UIHostingController<Content>!
        
        init(_ parent: HScrollViewController) {
            self.parent = parent
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            
            print(parent.pageWidth)
            
            var temp: CGFloat
            if scrollView.contentOffset.x < 375 * 0.5 {
                temp = 0
            } else if scrollView.contentOffset.x < 375 * 0.5 * 3 {
                temp = 1
            } else if scrollView.contentOffset.x < 375 * 0.5 * 5 {
                temp = 2
            } else {
                temp = 3
            }

            withAnimation{
                parent.leftPercent = temp
            }
            
        }
        
    }

}



