output "alb_public_url" {
  value       = "http://${aws_lb.app_alb.dns_name}"
  description = "Public URL to access the Application Load Balancer"
}
