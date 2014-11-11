1. Use javascript to track user's activity(idle or active in this case) in browser. I'm using a simple jquery plugin idletimer(https://github.com/thorst/jquery-idletimer) which support mouse, key and touch events. 

2. To track an anonymouse user's action and eventually associate them with their account once they register, we could set up a permanent tracking cookie in their browser as long as the user does not manually get rid of it.

3. Devise for Rails has sign_in_count build in.

4. The easiest way of tracking how many users are presently online(Meaning, active with last couple of minutes) is to ping the server a few seconds. However, if you want real-time communication Socket.IO and Node.js seem to be the best options. 


app is running on heroku


https://glacial-peak-8073.herokuapp.com/