class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    # rootViewController = UIViewController.alloc.init
    # rootViewController.title = 'Reach'
    # rootViewController.view.backgroundColor = UIColor.whiteColor

    # navigationController = UINavigationController.alloc.initWithRootViewController(MainViewController.new)
    storyboard = UIStoryboard.storyboardWithName('root', bundle: nil)
    # tab_controller = UITabBarController.alloc.initWithNibName(nil, bundle: nil)
    # city_controller = CityViewController.alloc.initWithNibName( nil, bundle: nil)
    # friends_controller = FriendsViewController.alloc.initWithNibName(nil, bundle: nil)
    # tab_controller.viewControllers = [ city_controller, friends_controller ]
    # user = UsersModel.new
    # user.loadUsers
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = storyboard.instantiateInitialViewController
    @window.makeKeyAndVisible

    true
  end
end
