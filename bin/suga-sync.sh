
#!/bin/bash
# Fetches from upstream and then syncs back to user's
# fork repo. Run when on master.

# Assumes we've done:
# git clone git@github.com:roblevintennis/Mango.git
# cd Mango/
# git remote add upstream git@github.com:sugarcrm/Mango.git
  
# Fetch from upstream repo
git fetch upstream

# Merge in to local upstream/master and then push back 
# to user's fork repo
git merge upstream/master 
git push origin master

# Now check out branch: git co -t -b toffee origin/toffee
