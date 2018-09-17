
    Last login: Tue Sep 11 06:22:17 on ttys003
    dengjiangzhou@dengjiangzhou  ~  npm install -g appium     ✔  1  15:37:22 
    /usr/local/bin/appium -> /usr/local/lib/node_modules/appium/build/lib/main.js

    > fsevents@1.2.4 install /usr/local/lib/node_modules/appium/node_modules/fsevents
    > node install

    [fsevents] Success: "/usr/local/lib/node_modules/appium/node_modules/fsevents/lib/binding/Release/node-v59-darwin-x64/fse.node" is installed via remote

    > appium-chromedriver@4.4.0 install /usr/local/lib/node_modules/appium/node_modules/appium-chromedriver
    > node install-npm.js

    [15:38:13] [Chromedriver Install] Installing Chromedriver version '2.41' for platform 'mac' and architecture '64'
    [15:38:13] [Chromedriver Install] Opening temp file to write 'chromedriver_mac64' to...
    [15:38:13] [Chromedriver Install] Opened temp file '/var/folders/9w/cjz3v13s133d7yxmb9mjz_ww0000gn/T/2018811-11158-13kj3jv.17h5/chromedriver_mac64.zip'
    [15:38:13] [Chromedriver Install] Downloading https://chromedriver.storage.googleapis.com/2.41/chromedriver_mac64.zip...
    [15:38:14] [Chromedriver Install] Writing binary content to /var/folders/9w/cjz3v13s133d7yxmb9mjz_ww0000gn/T/2018811-11158-13kj3jv.17h5/chromedriver_mac64.zip...
    [15:38:14] [Chromedriver Install] Extracting /var/folders/9w/cjz3v13s133d7yxmb9mjz_ww0000gn/T/2018811-11158-13kj3jv.17h5/chromedriver_mac64.zip to /var/folders/9w/cjz3v13s133d7yxmb9mjz_ww0000gn/T/2018811-11158-13kj3jv.17h5/chromedriver_mac64
    [15:38:15] [Chromedriver Install] Creating /usr/local/lib/node_modules/appium/node_modules/appium-chromedriver/chromedriver/mac...
    [15:38:15] [Chromedriver Install] Copying unzipped binary, reading from /var/folders/9w/cjz3v13s133d7yxmb9mjz_ww0000gn/T/2018811-11158-13kj3jv.17h5/chromedriver_mac64/chromedriver...
    [15:38:15] [Chromedriver Install] Writing to /usr/local/lib/node_modules/appium/node_modules/appium-chromedriver/chromedriver/mac/chromedriver...
    [15:38:15] [Chromedriver Install] /usr/local/lib/node_modules/appium/node_modules/appium-chromedriver/chromedriver/mac/chromedriver successfully put in place

    > appium-selendroid-driver@1.11.0 install /usr/local/lib/node_modules/appium/node_modules/appium-selendroid-driver
    > node ./bin/install.js

    [15:38:17] Java version 1.8.0_144 found
    [15:38:17] Ensuring /usr/local/lib/node_modules/appium/node_modules/appium-selendroid-driver/selendroid/download exists
    [15:38:17] Downloading Selendroid standalone server version 0.17.0 from http://repo1.maven.org/maven2/io/selendroid/selendroid-standalone/0.17.0/selendroid-standalone-0.17.0-with-dependencies.jar --> /usr/local/lib/node_modules/appium/node_modules/appium-selendroid-driver/selendroid/download/selendroid-server-7cf7163ac47f1c46eff95b62f78b58c1dabdec534acc6632da3784739f6e9d82.jar
    [15:38:30] Writing binary content to /usr/local/lib/node_modules/appium/node_modules/appium-selendroid-driver/selendroid/download/selendroid-server.jar.tmp
    [15:38:31] Selendroid standalone server downloaded
    [15:38:31] Determining AndroidManifest location
    [15:38:31] Determining server apk location
    [15:38:31] Extracting manifest and apk to /usr/local/lib/node_modules/appium/node_modules/appium-selendroid-driver/selendroid/download
    [15:38:32] Copying manifest and apk to /usr/local/lib/node_modules/appium/node_modules/appium-selendroid-driver/selendroid
    [15:38:32] Cleaning up temp files
    [15:38:32] Fixing AndroidManifest icon bug

    > appium-windows-driver@1.2.1 install /usr/local/lib/node_modules/appium/node_modules/appium-windows-driver
    > node install-npm.js

    Not installing WinAppDriver since did not detect a Windows system

    > heapdump@0.3.9 install /usr/local/lib/node_modules/appium/node_modules/heapdump
    > node-gyp rebuild

    CXX(target) Release/obj.target/addon/src/heapdump.o
    SOLINK_MODULE(target) Release/addon.node

    > pre-commit@1.2.2 install /usr/local/lib/node_modules/appium/node_modules/pre-commit
    > node install.js


    > wd@1.10.3 install /usr/local/lib/node_modules/appium/node_modules/wd
    > node scripts/build-browser-scripts


    > spawn-sync@1.0.15 postinstall /usr/local/lib/node_modules/appium/node_modules/spawn-sync
    > node postinstall

    + appium@1.9.0
    added 1479 packages from 1796 contributors in 77.11s
    dengjiangzhou@dengjiangzhou  ~  npm install wd            ✔  2  15:38:43 

    > wd@1.10.3 install /Users/dengjiangzhou/node_modules/wd
    > node scripts/build-browser-scripts

    npm WARN saveError ENOENT: no such file or directory, open '/Users/dengjiangzhou/package.json'
    npm notice created a lockfile as package-lock.json. You should commit this file.
    npm WARN enoent ENOENT: no such file or directory, open '/Users/dengjiangzhou/package.json'
    npm WARN dengjiangzhou No description
    npm WARN dengjiangzhou No repository field.
    npm WARN dengjiangzhou No README data
    npm WARN dengjiangzhou No license field.

    + wd@1.10.3
    added 99 packages from 99 contributors and audited 251 packages in 20.46s
    found 0 vulnerabilities



    ╭───────────────────────────────────────────────────────────────╮
    │                                                               │
    │       New minor version of npm available! 6.3.0 → 6.4.1       │
    │   Changelog: https://github.com/npm/cli/releases/tag/v6.4.1   │
    │               Run npm install -g npm to update!               │
    │                                                               │
    ╰───────────────────────────────────────────────────────────────╯

    dengjiangzhou@dengjiangzhou  ~   npm install -g npm       ✔  3  15:40:37 
    /usr/local/bin/npx -> /usr/local/lib/node_modules/npm/bin/npx-cli.js
    /usr/local/bin/npm -> /usr/local/lib/node_modules/npm/bin/npm-cli.js
    + npm@6.4.1
    added 5 packages from 3 contributors, removed 14 packages and updated 34 packages in 11.925s
    dengjiangzhou@dengjiangzhou  ~  appium &                  ✔  4  15:41:24 
    [1] 11427
    dengjiangzhou@dengjiangzhou  ~  [Appium] Welcome to Appium v1.9.0 15:41:47 
    [Appium] Appium REST http interface listener started on 0.0.0.0:4723

    dengjiangzhou@dengjiangzhou  ~                 
