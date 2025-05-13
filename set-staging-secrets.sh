#!/bin/bash

echo "Setting up staging secrets for qr-inventory-staging..."

# Function to set a secret and check for errors
set_secret() {
    local key=$1
    local value=$2
    
    if fly secrets set -a qr-inventory-staging "$key=$value"; then
        echo "✅ Successfully set $key"
    else
        echo "❌ Failed to set $key"
        exit 1
    fi
}

# Database connections
set_secret "DATABASE_URL" "postgresql://postgres.ffdzwsacnezyzqxkirbo:1234@aws-0-ap-south-1.pooler.supabase.com:6543/postgres?pgbouncer=true"
set_secret "DIRECT_URL" "postgresql://postgres.ffdzwsacnezyzqxkirbo:1234@aws-0-ap-south-1.pooler.supabase.com:5432/postgres"

# Supabase configuration
set_secret "SUPABASE_ANON_PUBLIC" "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZmZHp3c2FjbmV6eXpxeGtpcmJvIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDcwNTU3MDQsImV4cCI6MjA2MjYzMTcwNH0.rDyBIo4zE7DKtvGus44WJdo6GwAtjwBNjK5rTxplPPA"
set_secret "SUPABASE_SERVICE_ROLE" "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZmZHp3c2FjbmV6eXpxeGtpcmJvIiwicm9sZSI6InNlcnZpY2Vfcm9sZSIsImlhdCI6MTc0NzA1NTcwNCwiZXhwIjoyMDYyNjMxNzA0fQ.dRnJdjkkC0iz3vMI8lcdg8XC6u7GEIWNtvNCqUuBjbs"
set_secret "SUPABASE_URL" "https://ffdzwsacnezyzqxkirbo.supabase.co"

# Application configuration
set_secret "SERVER_URL" "https://qr-inventory-staging.fly.dev"
set_secret "SESSION_SECRET" "Fjh06q1ejNqAhKqpCZTaiLAE5ViMbCA60ZpKLrFrZcHNrcRqBFF2JKBUdZa76Mrh"
set_secret "FINGERPRINT" "CwMidk3fEAVYfVpQzjBDhgjdX2VGMVe1"

# Email configuration
set_secret "SMTP_HOST" "smtp.gmail.com"
set_secret "SMTP_PORT" "465"
set_secret "SMTP_USER" "inventqr@gmail.com"
set_secret "SMTP_PWD" "ajbipcfvhjouodhi"
set_secret "SMTP_FROM" "Harshad <inventqr@gmail.com>"

# API keys and other secrets
set_secret "MAPTILER_TOKEN" "it8MYnWJxJtmHWjlg6A0"
set_secret "GEOCODE_API_KEY" "68127a9d290e8956198388qlbebf414"
set_secret "INVITE_TOKEN_SECRET" "secret-test-invite-staging"
set_secret "ADMIN_EMAIL" "support@canspirit.ai"

echo "✅ All staging secrets have been set successfully!"