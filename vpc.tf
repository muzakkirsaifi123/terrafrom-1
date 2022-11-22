## Create VPC-1 
resource "aws_vpc" "firstvpcuseast" {
    cidr_block="10.1.0.0/16"
    tags = {
        Name = "VPC-1"
    }
}
## Create VPC-2
resource "aws_vpc" "secondvpcuswest" {
    provider = aws.central
    cidr_block="172.16.0.0/16" 
    tags = {
        Name = "VPC-2"
        }
        
 }
 ## Create Peering between VPC-1 and VPC-2 
 resource "aws_vpc_peering_connection" "vpcpeerig" { 
    peer_owner_id= "468963083817" 
    peer_vpc_id = aws_vpc.secondvpcuswest.id
    vpc_id = aws_vpc.firstvpcuseast.id 
    peer_region= "us-west-1"
    auto_accept = false
     tags = { 
        Name = "VPC1-to-VPC2"
     }

 }

## Accepter's side of the connection. 
resource "aws_vpc_peering_connection_accepter" "acceptpeer" {

    provider =aws.central
    vpc_peering_connection_id = aws_vpc_peering_connection.vpcpeerig.id 
    auto_accept = true  
    tags  = { 
        Side = "Accepter" 
    }

}