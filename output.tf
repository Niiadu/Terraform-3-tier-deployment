output "lb-dns-name" {
  description = "DNS name of the load balancer"
  value       = aws_lb.application-load-balancer.arn
}