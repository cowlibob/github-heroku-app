Github-Heroku
---

This is an experimental app to see if a Heroku deployed app can manage delopyment of heroku apps.
The aim is to use Github commit hooks to deploy an application into heroku.

This was inspired by iPad apps like Worqshop, which will allow a PC-free workflow.
Imagine using the github website to edit and commit a file change, for it to be automatically deployed to heroku.

Questions
---

- Can I create an app deployed to heroku that can checkout from GitHub and deploy to heroku.
- Will heroku r/o file system be a problem, or will temp suffice?


Use github web hooks to trigger the app to fetch then deploy to heroku.


TODO
---

- github or git gem to fetch repo
- use gem to push to heroku
- implement web hooks
