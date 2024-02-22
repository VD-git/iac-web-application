# CD12352 - Infrastructure as Code Project Solution
# Victor Dias

## Sketch Architecture
![Image Alt text](/architecture-diagram.png "AWS Architecture [Lucidchart]")

## Project Structure
First the project is split in two parts: 1°) Network Infrastructure and 2°) Application
### Network Infrastructure
* **VPC**: Where the infrastructure will be built on;
* **InternetGateway**: Connetion between the instances and internet;
* **InternetGatewayAttachment**: Attach the IGW with the servers;
* **NatGatewayEIP**: To avoid the change of IP, an Elastic IP Address is built;
* **Subnets**:
  * **Public**: They will be connect with the internet through IGW in order to provide access;
  * **Private**: Where the servers (EC2 Instances) will be hosted. 
* **RouteTable** and **Route**: Both together provide directions for Ingress and Egrees traffic;
### Application
* **SecurityGroup**:
  * **Public**: Ingress and Egress rules for subnets;
  * **Private**: Ingress and Egress rules for subnets.
* **Template**: Template of the servers of the AutoScaling;
* **InstanceRole** and **InstanceProfile**: Creates an IAM Profile with the rules to be applied in template;
* **AutoScalingGroup**: Provide the Autoscaling group where it will applied to the private subnets;
* **LoadBalance**: Share the load for the public subnets so it does not overload any of them;
* **Listener**, **ListenerRule** and **TargetGroup**: Gathered with the LoadBalancer, they will manage its requirements to work properly;
* **S3 Bucket** and **S3 Bucket Policy**: Creation of the S3 Bucket with the specified policies.

## Tear down instructions
In order to run the whole process, there are two main steps:
* **1°) Create the network**: For that it is needed the following command:
  *./run.sh deploy udacity-network us-east-1 network.yml network-parameters.json*
* **2°) Create the application**: For that it is needed the following command:
  *./run.sh deploy udacity-udagram us-east-1 udagram.yml udagram-parameters.json*

After both processes completed, the interface will be generated, as it can be seen below:
## Cloudformation Process
![Image Alt text](/cloudformation-stacks.png "Created Stacks")

## Acces of the DNS
DNS: 
![Image Alt text](/dns-link.png "DNS Acess")

*Note that few parameters can be changed in the .json files*
  
