if ENV["EMAIL_RECIPIENTS"]
  Mail.register_interceptor RecipientInterceptor.new(
    ENV["EMAIL_RECIPIENTS"],
    subject_prefix: "[STAGING] ",
  )
end
