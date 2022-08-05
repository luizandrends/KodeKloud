variable "filename" {
  default     = "./pets.txt"
  type        = string
  description = "File path"
}

variable "content" {
  default     = {
    "statement1" = "We love pets!"
    "statement2" = "We love animals!"
  }
  type        = map(string)
  description = "The content of the file"
}

variable "prefix" {
  default     = ["Mr", "Mrs", "Sir"]
  type        = list(string)
  description = "The list of prefixes to be set"
}

variable "foods" {
  default     = ["meet", "chicken", "pork"]
  type        = set(string)
  description = "The list of foods that the pet can eat"
} 

variable "paws" {
  default     = [4, 3, 2, 1]
  type        = set(number)
  description = "The number of paws that the pet haves"
}

variable "bella" {
  type = object({
    name         = string
    color        = string
    age          = number
    food         = list(string)
    favorite_pet = bool
  })

  default = {
    name         = "bella"
    color        = "brown"
    age          = 7
    food         = ["fish", "chicken", "turkey"]
    favorite_pet = true
  }
}

variable "kitty" {
  type = tuple(["string", 7, true])
  default = ["cat", 7, true]
}

variable "separator" {
  default     = "."
  type        = string
  description = "The character who will split the string"

}

variable "length" {
  default     = "1"
  type        = string
  description = "The length of the word after the separator"
}

variable "password_change" {
  default     = true
  type        = bool
  description = "THe field who will decide if the password is going to change or not"
}

variable "age" {
  default     = 0
  type        = number
  description = "The age of the pet"
}

variable "last_vaccination_day" {
  default     = "2021-12-09"
  type        = any
  description = "The last vaccination day"
}