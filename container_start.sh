# starts the shell
#!/bin/sh

# runs the rails server
rails server -b 0.0.0.0:3000 -d

# keep the shell open for debugging
/bin/sh
