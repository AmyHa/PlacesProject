#  PlacesProject - MagicSeaweed

This app was developed for the MagicSeaweed coding test. 

The app was designed with the MVVM design pattern in mind. To use this app, please replace the hard-coded API key with your own in Constants.URL.apiKey

When running this app, you can either input your own valid coordinates in the latitude and longitude text fields, or you can click the pin icon to the right of those text fields to use your current location.


Technical Questions

1. I spent maybe in total about 8-10 hours on this task spread over a number of days. On top of that, I was learning the MVVM design pattern which I have never used before, so I would say an extra 5 hours was to understand that a bit better.

2. I found that being able to use your current location (as opposed to manually inputting coordinates) is a really handy feature for the user. I wouldn't expect many users to know their current coordinates and in particular, I don't think users would even be bothered to type them in even if they were aware of it. So I think in a modern app, being able to find your current location is absolutely crucial. It would be even better if there I had used MapKit to display a map and the user could search for their current location or any location of their choice.

3. I would use a third-party tool such as Sentry / Firebase, where we could catch any errors or crashes in the app. This would be particularly useful after releasing a new feature. With Continous Integration, we could catch any failed unit tests as soon as we push to our dev branch and hence recitfy before the code is released into test or production.

    Xcode also includes the Instruments tool which can be used to detect issues such as memory leaks.
