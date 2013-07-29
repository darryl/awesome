# TODO (loosely in order of likelihood)
* figure out the login page. I like the awesomely-bad-login-page branch because
  I think its funny but it will bother some people. probably?
* README.md needs some love
* truncate sample, track, and email string fields. they can be huge.
* chef needs to add the wav mime type to nginx config
* clear out all the ### marked trouble spot comments
* better instructions for new users
* I haven't settled on a standard format for the return .json on ajax
* backups on production
* it looks like unicorn bombs out sometimes (?) --haven't seen this in
  a while
* the flow of adding a samples to library from the no-samples tracker message
  and being redirected back to the user's home/dashboard page is awkward
* get drag and drop working with selenium so i can test sample positioning. if
  its too much trouble I can test it by sending the reposition json
  request, refreshing the page and verifying the left px on the importage
* note to tell people that they can mess with another user's track and play
  it but it wont save
* add a warning at the top for people using unsupported browsers

# ideas for future development
* set the volume level for individual samples in the play queue
* multi file upload for audio samples
* make a "boo" highlight effect (red?) for when an ajax change doesn't
  go through
* transcode audio to a common format
* reject unsupported file types, corrupted files
* loading bar for download and upload of samples
* display sample time length
* a collaboration mode where two or more users can edit the same track with
  real-time dragging using socket.io or similar
* get it usable on mobile / ipad
* if there are ever a lot of samples, would want a way to filter them
  (eg by tag or most popular)
* a sweet logo
* theme it up with some css. or don't. personally, I like Spartan
  design and its a good illustration of where back-end web development
  stops vis-a-vis front-end development
* list tracks on the front page so people can listen to them without logging in
* make tracks displayable as a link or iframe snippet for external
  linking / sharing / facebook
* user profile page is discoverable to other users and has picture,
  description, info 
* let users edit other users tracks and save it as their own fork or draft
  (maybe with a breadcrumb style attribution to the original author)
* port tracker.js to coffee-script
* tests beyond integration tests
* a mechanism for removing samples
* a way to download finished tracks as an audio file or old school tracker file
  or mod
* fix document.ready() so turbolinks won't break everything
* add some fuzzing to the selenium input
* server monitoring, error emails, dashboard
* messaging, voting, commenting (meh. maybe use some external services)
* password recovery
* save or versioning functionality on tracks
* ssl https
* use one of the flash/javascript players that can handle more audio
  types/streaming/caching and be consistent across browsers. howler.js 
  looks good.
* testing on production. I would like to be able to run selenium a/
  test.wtfnewyork.com before switching the symlink to current
* make tracks and samples rename-able
* some unit tests on importage. importage handling is kinda complicated
