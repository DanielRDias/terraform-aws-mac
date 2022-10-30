variable "subnet_id" {
  description = "VPC Subnet ID to launch in."
  type        = string
}

variable "mac_type" {
  description = "Mac CPU Architecture. Use mac1 for 64-bit mac1.metal, use mac2 for 64-bit-arm mac2.metal. Default: m1"
  type        = string
  default     = "mac1"
}

variable "macos_version" {
  description = "The macOS version number. Monterey is 12, Big-Sur is 11, Catalina is 10. Default: 12"
  type        = string
  default     = "12"
}

variable "auto_placement" {
  description = "(Optional) Indicates whether the host accepts any untargeted instance launches that match its instance type configuration, or if it only accepts Host tenancy instance launches that specify its unique host ID. Valid values: on, off. Default: on."
  type        = string
  default     = "on"
}

variable "host_recovery" {
  description = "(Optional) Indicates whether to enable or disable host recovery for the Dedicated Host. Host recovery is disabled by default."
  type        = string
  default     = "off"
}

variable "instance_type" {
  description = "(Optional) Specifies the instance type to be supported by the Dedicated Hosts. If you specify an instance type, the Dedicated Hosts support instances of the specified instance type only. Default: mac1.metal."
  type        = string
  default     = "mac1.metal"
}

variable "outpost_arn" {
  description = "(Optional) The Amazon Resource Name (ARN) of the AWS Outpost on which to allocate the Dedicated Host."
  type        = string
  default     = null
}

variable "tags" {
  description = "(Optional) A list of tags to associate with the module."
  type        = map(string)
  default     = null
}
