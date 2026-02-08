# Monitoring

## Turn on Monitoring

![]()

- Add Dashboard
- Create New Button
- Click add to Dashboard
- After about 60s, monitoring graph will update.
  
![](images4/Dashboard.png) 

### Set up an alarm

- Go to the cloudwatch section of the AWS website and click 'all alarms' at the side.
- Click the orange 'Create Alarm' button in the top-right.
- 
![](images4/Cloudwatch.png) 

- Add alarm details  
    
![](images4/configuredAlarmDetails.png)

 - Go to EC2 page and click select metric

![](images4/goToEC2.png)

- For this, I will go EC2 -> Across All Instances -> CPUUtilisation.

![](images4/metric.png)

- Set up conditions

![](images4/setUpConditions.png)

![](images4/setupSNS.png)

- Once everything is done correctly. You'll get that message like below:

![](images4/successfullCreated.png)

- Notifications:
  
![]()



