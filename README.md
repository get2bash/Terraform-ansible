# Mini-project
Using Terraform to create 3 EC2 instances and Ansible script that uses the host-inventory file Terraform created to install Apache.


## Task
- Using Terraform, create 3 EC2 instances and put them behind an Elastic Load Balancer
- Make sure the after applying your plan, Terraform exports the public IP addresses of the 3 instances to a file called host-inventory
- Get a .com.ng or any other domain name for yourself (be creative, this will be a domain you can keep using) and set it up with AWS Route53 within your terraform plan, then add an A record for subdomain terraform-test that points to your ELB IP address.
- Create an Ansible script that uses the host-inventory file Terraform created to install Apache, set timezone to Africa/Lagos and displays a simple HTML page that displays content to clearly identify on all 3 EC2 instances.
- Your project is complete when one visits terraform-test.yoursdmain.com and it shows the content from your instances, while rotating between the servers as your refresh to display their unique content.


## Results

### VPC created
![Screen Shot 2023-02-04 at 3 44 46 AM](https://user-images.githubusercontent.com/97449891/216743701-7095a466-3be5-406c-9238-065ca22ff58b.png)


### Instances created
![Screen Shot 2023-02-04 at 3 45 42 AM](https://user-images.githubusercontent.com/97449891/216743711-bc644b35-6553-423f-958d-2c394eb5a5ce.png)


### Loadbalancer created
![Screen Shot 2023-02-04 at 3 46 27 AM](https://user-images.githubusercontent.com/97449891/216743720-f7b9d155-9019-4b5d-b331-ea868b2ebe6b.png)

### Hosted zone created
![Screen Shot 2023-02-04 at 3 47 38 AM](https://user-images.githubusercontent.com/97449891/216743733-d7af1a57-e814-4436-a2d4-9d86bdba705c.png)

### A record created
![Screen Shot 2023-02-04 at 3 48 35 AM](https://user-images.githubusercontent.com/97449891/216743745-d43d1408-c912-4f91-9bc2-048ecdc51d18.png)

### Visiting the domain
![Screen Shot 2023-02-04 at 3 49 13 AM](https://user-images.githubusercontent.com/97449891/216743752-f35433f7-3b24-425a-981a-c4995fdaf9af.png)
![Screen Shot 2023-02-04 at 3 49 29 AM](https://user-images.githubusercontent.com/97449891/216743762-c27dc68e-eb29-4bb6-8563-7ac1fb7dab36.png)
![Screen Shot 2023-02-04 at 3 49 40 AM](https://user-images.githubusercontent.com/97449891/216743774-617e4155-a09d-4f6d-bf63-1b387276f61a.png)
