terraform {
 backend "s3" {
   bucket = "sctp-ce9-tfstate"
   key    = "huang-ce9-module2-lesson3.tfstate"
   region = "us-east-1"
 }
}