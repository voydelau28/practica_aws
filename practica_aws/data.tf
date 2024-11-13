data "aws_subnet" "existing" {
  count = 2  
  id = count.index == 0 ? "subnet-08db431b0d0bb12e4" : "subnet-04f02617fa4fa708b"  
}
