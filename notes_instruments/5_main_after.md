> after main( )


After all that, the app's main function is called,



> UIApplicationMain()


which then calls UIApplicationMain() ,

loads your initial neighbor storyboard

neighbor ， 什么鬼


<hr>



> application( _  : willFinishLaunchingWithOptions :  )
> func application(_ application: UIApplication, willFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {



and then calls the application willFinishLaunchingWithOptions



>  application( _  : didFinishLaunchingWithOptions :  )
> func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {


and did finish launching callbaks in the app delegate.

<hr>



<hr>



These two methods are where your code can get
into the launch time mix .





