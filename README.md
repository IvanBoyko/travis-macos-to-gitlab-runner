# Synopsis

GitLab doesn't have managed macOS runners yet.  
So we borrow them from Travis ;)  
Plus, we pre-install some generic build tools, so they are available to GitLab builds immediately.


# Disclaimer

"Don't try this at home"  
This was not meant to be used for any purpose other than academic.  
Otherwise Travis guys might find me and shoot me in the leg.

If you do use it - you take all the responsibilities on yourself.  
I wash my hands.  
Seriously - do NOT use this project! :)


# Setup

* GitHub repository
* GitLab project configured to Pull mirror from the GitHub repository
* Travis account, connected to the GitHub repository
* Travis environment variable GITLAB_REGISTRATION_TOKEN set to
  the registration token from the GitLab project (Settings > CI/CD > Runners)

# TODO

* implement graceful shutdown of the agent - unregister GitLab runner some time before the Travis will kill it by timeout
* configure Travis build to run by Schedule, so agent is always available
