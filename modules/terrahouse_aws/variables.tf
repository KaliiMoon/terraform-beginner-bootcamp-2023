variable "user_uuid" {
  description = "The UUID of the user"
  type        = string
  validation {
    condition     = can(regex("^([0-9a-fA-F]){8}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){4}-([0-9a-fA-F]){12}$", var.user_uuid))
    error_message = "The user_uuid value is not a valid UUID."
  }
}

variable "bucket_name" {
  description = "Name of the AWS S3 bucket"
  type        = string

  validation {
    condition     = can(regex("^[a-z0-9.-]{3,63}$", var.bucket_name))
    error_message = "Bucket name must be between 3 and 63 characters and can only contain lowercase letters, numbers, hyphens, and periods."
  }
}

variable "index_html_filepath" {
  description = "The file path for index.html"
  type        = string

  validation {
    condition     = fileexists(var.index_html_filepath)
    error_message = "The provided path for index.html does not exist"
  }  
}

variable "error_html_filepath" {
  description = "The file path for error.html"
  type        = string

  validation {
    condition     = fileexists(var.error_html_filepath)
    error_message = "The provided path for error.html does not exist"
  }  
}

variable "content_version" {
  type        = number
  description = "The content version. Should be a positive integer starting at 1."

  validation {
    condition     = var.content_version >= 0 && floor(var.content_version) == var.content_version
    error_message = "The content version must be a positive integer starting at 1"
  }
}