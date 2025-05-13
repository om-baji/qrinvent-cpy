#!/bin/bash

echo "Setting up production secrets for qr-inventory..."

# Function to set a secret and check for errors
set_secret() {
    local key=$1
    local value=$2
    
    if fly secrets set -a qr-inventory "$key=$value"; then
        echo "✅ Successfully set $key"
    else
        echo "❌ Failed to set $key"
        exit 1
    fi
}

# Database connections
set_secret "DATABASE_URL" "postgresql://postgres.gphdvrwbypdbjpkicwpl:1234@aws-0-ap-south-1.pooler.supabase.com:6543/postgres?pgbouncer=true"
set_secret "DIRECT_URL" "postgresql://postgres.gphdvrwbypdbjpkicwpl:1234@aws-0-ap-south-1.pooler.supabase.com:5432/postgres"

# Supabase configuration
set_secret "SUPABASE_ANON_PUBLIC" "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdwaGR2cndieXBkYmpwa2ljd3BsIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDcwNTU3MTAsImV4cCI6MjA2MjYzMTcxMH0.FZSVN7nr6cuuwC6yj6VRXc3zVu_fwK6hsfcqzShhcd8"
set_secret "SUPABASE_SERVICE_ROLE" "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImdwaGR2cndieXBkYmpwa2ljd3BsIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc0NzA1NTcxMCwiZXhwIjoyMDYyNjMxNzEwfQ.xNfmPeKNnB92LI2KB6YHsX9SRP8zCG4rKEWW_XsPe3E"
set_secret "SUPABASE_URL" "https://gphdvrwbypdbjpkicwpl.supabase.co"

# Application configuration
set_secret "SERVER_URL" "https://qr-inventory.fly.dev"
set_secret "SESSION_SECRET" "41G0cWpc0AN1G9QbwJECDvwVBZTgdRasdasyj6KKEcvVaVsRdPxhQZ605NgvuvwH"
set_secret "FINGERPRINT" "qmoV1F5tF7954GDfwQAkXmU4BAZ3xLR6"

# Email configuration
set_secret "SMTP_HOST" "smtp.gmail.com"
set_secret "SMTP_PORT" "465"
set_secret "SMTP_USER" "inventqr@gmail.com"
set_secret "SMTP_PWD" "ajbipcfvhjouodhi"
set_secret "SMTP_FROM" "Harshad <inventqr@gmail.com>"

# API keys and other secrets
set_secret "MAPTILER_TOKEN" "it8MYnWJxJtmHWjlg6A0"
set_secret "GEOCODE_API_KEY" "68127a9d290e8956198388qlbebf414"
set_secret "INVITE_TOKEN_SECRET" "secret-test-invite"
set_secret "ADMIN_EMAIL" "support@canspirit.ai"

echo "✅ All production secrets have been set successfully!"