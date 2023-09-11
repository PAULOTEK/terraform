variable "location" {
  description = "Variavel indica regiao que recursos vao ser criados"
  type        = string
  default     = "west Europe"
}

variable "account_tier" {
  description = "tier da Storage Account na azure"
  type        = string
  default     = "Standard"
}

variable "account_replication_type" {
  description = "Tipo de replicacao de dados da Storage account"
  type        = string
  default     = "LRS"
}