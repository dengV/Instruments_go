
    dengjiangzhou@dengjiangzhou  ~/Downloads/material-components-ios/demos/Bare   develop ?  pod install                                    ✔  9  22:01:47 
    
    
    
    
    Analyzing dependencies
    Fetching podspec for `MaterialComponents` from `../../`
    [!] CocoaPods could not find compatible versions for pod "MotionTransitioning":
    In Podfile:
    MaterialComponents (from `../../`) was resolved to 64.0.0, which depends on
    MaterialComponents/MaskedTransition (= 64.0.0) was resolved to 64.0.0, which depends on
    MotionTransitioning (~> 5.0)

    None of your spec sources contain a spec satisfying the dependency: `MotionTransitioning (~> 5.0)`.

    You have either:
    * out-of-date source repos which you can update with `pod repo update` or with `pod install --repo-update`.
    * mistyped the name or version.
    * not added the source repo that hosts the Podspec to your Podfile.

    Note: as of CocoaPods 1.0, `pod repo update` does not happen on `pod install` by default.
    dengjiangzhou@dengjiangzhou  ~/Downloads/material-components-ios/demos/Bare   develop ?  pod repo update                            31 ↵  10  22:01:55 
    Updating spec repo `master`
    $ /usr/bin/git -C /Users/dengjiangzhou/.cocoapods/repos/master fetch origin
    --progress
    remote: Enumerating objects: 97982, done.        
    remote: Counting objects: 100% (97982/97982), done.        
    remote: Compressing objects: 100% (343/343), done.        
    remote: Total 794519 (delta 97707), reused 97803 (delta 97611), pack-reused 696537        
    Receiving objects: 100% (794519/794519), 135.25 MiB | 584.00 KiB/s, done.
    Resolving deltas: 100% (539201/539201), completed with 10516 local objects.
    From https://github.com/CocoaPods/Specs
    5b69b8e0f6c..44b50684a10  master                -> origin/master
    * [new branch]              backz                 -> origin/backz
    * [new branch]              swift_version_support -> origin/swift_version_support
    $ /usr/bin/git -C /Users/dengjiangzhou/.cocoapods/repos/master rev-parse
    --abbrev-ref HEAD
    master
    $ /usr/bin/git -C /Users/dengjiangzhou/.cocoapods/repos/master reset --hard
    origin/master
    ^C[!] Cancelledfiles:   2% (1539/76927)   
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    dengjiangzhou@dengjiangzhou  ~/Downloads/material-components-ios/demos/Bare   develop ?  pod repo update                             1 ↵  11  22:07:29 
    Updating spec repo `master`
    $ /usr/bin/git -C /Users/dengjiangzhou/.cocoapods/repos/master fetch origin
    --progress
    remote: Enumerating objects: 40, done.        
    remote: Counting objects: 100% (40/40), done.        
    remote: Compressing objects: 100% (26/26), done.        
    remote: Total 27 (delta 17), reused 0 (delta 0), pack-reused 0        
    From https://github.com/CocoaPods/Specs
    44b50684a10..46f970db4c1  master     -> origin/master
    $ /usr/bin/git -C /Users/dengjiangzhou/.cocoapods/repos/master rev-parse
    --abbrev-ref HEAD
    master
    $ /usr/bin/git -C /Users/dengjiangzhou/.cocoapods/repos/master reset --hard
    origin/master
    HEAD is now at 46f970db4c1 [Add] DeliBinary 0.5.0
    warning: inexact rename detection was skipped due to too many files.

    CocoaPods 1.6.0.beta.1 is available.
    To update use: `sudo gem install cocoapods --pre`
    [!] This is a test version we'd love you to try.

    For more information, see https://blog.cocoapods.org and the CHANGELOG for this version at https://github.com/CocoaPods/CocoaPods/releases/tag/1.6.0.beta.1

    Updating spec repo `MyRepo`
    $ /usr/bin/git -C /Users/dengjiangzhou/.cocoapods/repos/MyRepo fetch origin
    --progress
    Username for 'https://gitee.com': 
    Password for 'https://gitee.com': 
    remote: Incorrect username or password ( access token )
    fatal: Authentication failed for 'https://gitee.com/dengshaoxia/pod_start.git/'
    [!] CocoaPods was not able to update the `MyRepo` repo. If this is an unexpected issue and persists you can inspect it running `pod repo update --verbose`
    dengjiangzhou@dengjiangzhou  ~/Downloads/material-components-ios/demos/Bare   develop ?  pod install                                 1 ↵  12  22:11:33 
    Analyzing dependencies
    Fetching podspec for `MaterialComponents` from `../../`
    Downloading dependencies
    Installing MDFInternationalization (1.1.0)
    Installing MDFTextAccessibility (1.2.0)
    Installing MaterialComponents (64.0.0)
    Installing MotionAnimator (2.8.1)
    Installing MotionInterchange (1.6.0)
    Installing MotionTransitioning (5.0.0)
    Generating Pods project
    Integrating client project
    Sending stats
    Pod installation complete! There is 1 dependency from the Podfile and 6 total pods installed.
    dengjiangzhou@dengjiangzhou  ~/Downloads/material-components-ios/demos/Bare   develop ● ?     
