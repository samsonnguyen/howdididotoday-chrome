howdididotoday-chrome
=========================

Chrome Plugin for howdidido.today. This plugin will log page navigations to howdidido.today  

To Build and Install
--------------------
We need to first build the plugin. We are using [cake](http://coffeescript.org/), to install cake to handle coffeescript builds. Install coffeescript (and cake) via npm. 

There are two ways to install npm (on a mac)
* [install the npm binary](https://www.npmjs.org/)
* `brew install npm`

Once npm is installed, we can intall coffeescript binaries.  

    npm install -g coffee-script

To start a build

    cd howdidido-chrome
    cake build

viola!, you should see something like this.

   16:46:20 - compiled /Users/samsonnguyen/dev/howdidido_chrome/src/howdidido.coffee
   16:49:29 - compiled /Users/samsonnguyen/dev/howdidido_chrome/src/logservice.coffee

Now, in chrome go to

    chrome://extensions

Now, we need to install our newly build plugin.

* Check the developer mode checkbox
* Click "load unpacked extension"
* Select the howdididotoday-chrome directory


That's it!
