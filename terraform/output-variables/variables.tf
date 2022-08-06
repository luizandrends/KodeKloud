variable "filename" {
  default     = "./pets.txt"
  type        = string
  description = "File path"
}

variable "content" {
  default = "My favorite pet is Mr.whiskers"
  type        = string
  description = "The content of the file"
}

variable "prefix" {
  default     = "Mrs"
  type        = string
  description = "The prefix to be set"
}

variable "separator" {
  default     = "."
  type        = string
  description = "The character who will split the string"
}

variable "length" {
  default     = "1"
  type        = string
  description = "Definition for how many words will have after the separator"
}