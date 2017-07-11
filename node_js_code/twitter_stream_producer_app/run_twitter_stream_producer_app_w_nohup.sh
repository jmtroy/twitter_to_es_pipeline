#!/bin/bash

# This simple script will start the twitter stream producer app using nohup
# run at the command line :$ sh run_twitter_stream_producer_app_w_nohup.sh
# put this script in the same folder as the "twitter_stream_producer_app"
# as of 7/7/17 the app is on the get-twitter-stream EC2 instance in the folder below
# sftp://ec2-user@ec2-35-161-139-34.us-west-2.compute.amazonaws.com/home/ec2-user/applications/twitter_stream_producer_app/run_twitter_stream_producer_app_w_nohup.sh

# NOTE: to view nohup jobs use: $ ps xw
# and look for 'node twitter_stream_producer_app' and note the PID
#
# NOTE: to stop a nohup job you need to know the PID see above, then at the command line: $ kill <PID>

# start node twitter_stream_producer_app in the background (nohup) 
# and send standard out (tweets) to /dev/null (that is, do not store them anywhere on this EC2)
nohup node twitter_stream_producer_app > /dev/null 2>stderr.txt &
# Save the pid, so we can stop it if needed
echo "nohub pid is: "$! > save_twitter_stream_nohup_pid.txt

