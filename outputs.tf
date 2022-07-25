output "client_config" {
  value = {
    landingzone = var.landingzone
  }

}

output "global_settings" {
  value = var.global_settings
}

output "objects" {
  value = tomap(
    { (var.landingzone.key) = {
      for key, value in module.caf : key => value
      if try(value, {}) != {}
      }
    }
  )
  sensitive = true
}