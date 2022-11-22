provider "random" {} 
## Provider us-east-1 
provider "aws" { 
    region = "us-east-1" 
} 
## Provider us-west-1 
provider "aws" { 
    alias= "central" 
    region="us-west-1"
}