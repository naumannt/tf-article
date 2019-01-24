terraform {
 backend "s3" {
   region         = ""
   bucket         = "tf-article"
   key            = "terraform.tfstate"
   encrypt        = "true"
   dynamodb_table = "tf-article-statelock"
 }
}