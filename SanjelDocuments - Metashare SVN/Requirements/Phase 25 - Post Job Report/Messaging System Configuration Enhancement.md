# Messaging System Configuration Enhancement 



## Summary

This enhancement is to handle separate message queue with different services. We have two set of entity definition in our application, the first set is the legacy definition which eService application was built on, the second set is MCC generated definition which eService Online is built on which is the future first set will migrate to.

We don't want to mess up the WCF services with two set of entity definitions which have different foundation, so two separate WCF services are hosted on server. 

In this stage, it is hard to migrate messaging system to a modern framework due to the budget limit. eService messaging system has been used in production for 15 years stably, the reliability is proven. We will continue to do minor enhancement to support configurable named message queue.



PROVEN:

1. Separate cachePath can isolate the message queue by service configuration. 
2. On client side, one WCF endpoint url per client.



TODO:



1. Further investigation, specify end point address for message receiver. Currently the endpoint url is using "EServiceBaseAddress" configuration which actually is only one option,  the naming is confusing, need a better naming and also considering compatibility issue.

2. Separate enqueue and send message. This will also allow us the improve eService performance down the road. The call back mechanism needs to be reviewed and enhanced.

## Code Highlight



### eServiceOnline

- Add a new project eServiceOnline.WCFServices
- Version strategy:  Now we only support Create method for each entity. So check the existence first, if yes, call update method to insert a new version, otherwise, create new object.



### eServiceExpress

- Enqueue message whenever a piece of information is saved.



### eServiceLocalDataManager

- Current solution, run message sender in certain time cycle whenever network is available. e.g. 5 minutes.  It will go through message queue  and send all queued messages.
- Future, we may refactor it to monitor message queue folder to trigger sending when message comes in.