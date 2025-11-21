output "subscription_id" {
  description = "Subscription ID"
  value       = data.azurerm_subscription.current.subscription_id
}