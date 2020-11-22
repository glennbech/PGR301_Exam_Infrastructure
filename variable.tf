#Variable which is empty and will be submitted by container's environment variable
#Terraform.apply fails if this is not set
variable "logz_token" {

}

variable "project_id" {
  default = "dragonballz-296302"
}