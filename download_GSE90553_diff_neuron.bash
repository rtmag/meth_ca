wget https://s3.amazonaws.com/connect.globusonline.org/linux/stable/globusconnectpersonal-latest.tgz
tar xzf globusconnectpersonal-latest.tgz

globus create XXXXX

/home/rtm/globus_tblab_rtm/globusconnectpersonal-2.3.6/globusconnect -setup Setup Key

#############################################
/home/rtm/globus_tblab_rtm/globusconnectpersonal-2.3.6/globusconnect -start &

globus ls 'b8c35144-cb0f-11e9-9ced-0edb67dd7a14:/globus_tblab_rtm'


globus ls 66479e88-5230-11e8-9056-0a6d4e044368

ep1=66479e88-5230-11e8-9056-0a6d4e044368
ep2=b8c35144-cb0f-11e9-9ced-0edb67dd7a14

globus transfer $ep1:~/ $ep2:~/ --batch --label "WT_QUY_ONLY_WGBS" < transfer_file_wt_final.txt
