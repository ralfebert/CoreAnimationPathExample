import UIKit

@UIApplicationMain
class CoreAnimationPathExample: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = ShapeViewController()
        self.window = window
        window.makeKeyAndVisible()

        return true
    }

}
