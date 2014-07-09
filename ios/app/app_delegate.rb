class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)

    @window.rootViewController = UINavigationController.alloc.initWithRootViewController(BeerCategoriesController.alloc.init)

    @window.makeKeyAndVisible
    true
  end
end
