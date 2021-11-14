echo "ELB_DNS=$(terraform output elb_dns)" > .env
docker-compose up