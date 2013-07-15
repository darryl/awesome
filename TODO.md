# TODO (loosely in order of likelihood)
* figure out the login page. I like the awesomely-bad-login-page branch because
  it think its funny
  but it will put some people off
* README.md needs some love
* truncate sample, track, and email string fields. they can be huge.
* importages are getting orphaned when a track is deleted
* chef needs to add the wav mime type to nginx config
* clear out all the ###
* read over all source and tidy it up
* spellcheck
* better instructions for new users
* trim out unused routes or make them only available in development
* reorganize the root directory structure --the selenium and deployment dirs
  seem out of place
* I haven't settled on a standard format for the return .json on ajax
* backups on production
* it looks like unicorn bombs out sometimes (?)
* the flow of adding a samples to library from the no-samples tracker message
  and being redirected back to the user's
  home/dashboard page is kinda awkward
* decide on a nomenclature for the users' home page
* get drag and drop working with selenium so i can test sample positioning. if
  its too big of a PITA I can test
  it by sending the reposition json request, refreshing the page and verifying
  the left px on the importage
* note to tell people that they can mess with a track that isnt theirs and play
  it but but it wont save

# ideas for future development
* make a "boo" highlight effect (red?) for when an ajax change doesn't go through
* loading bar for download and upload of samples
* display sample time length
* get it usable on mobile / ipad
* if there are ever a lot of samples, would want a way to filter them
  (eg by tag or most popular)
* a sweet logo
* actually theme it up with some css. or don't. personally, I like it this way
* list tracks on the front page so people can listen to them without logging in
* make tracks displayable as a link or iframe snippet for external
  linking / sharing / facebook / adultfriendfinder / usenet
* user profile page is discoverable to other users and has picture, description, info 
* let users edit other users tracks and save it as their own fork or draft
  (maybe with a breadcrumb style attribution to the original author)
* port tracker.js to coffee-script
* tests beyond integration tests
* a mechanism for removing samples
* a collaboration mode where two or more users can edit the same track with
  real-time dragging using socket.io or similar
* a way to download finished tracks as an audio file or old school tracker file
  or mod or something
* fix document.ready() so turbolinks won't break everything
* add some fuzzing to the selenium input
* server monitoring, error emails, dashboard
* guide new users through making their first track
* messaging, voting, commenting (meh. maybe use some external service)
* password recovery
* save or versioning functionality on tracks
* ssl https
* use one of the flash/javascript players that can handle more audio
  types/streaming/caching and be consistent across browsers
* testing on production. I would like to be able to run selenium a/
  test.wtfnewyork.com before switching the symlink to current
* make tracks and samples rename-able
* some unit tests on importage. importage handling is kinda complicated
