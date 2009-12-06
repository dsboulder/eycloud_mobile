class EySession < MechanizedSession
  action :login do |session, options|
    session.get("https://login.engineyard.com/login") do |page|
      next_page = page.form_with(:action =>"/login") do |form|
        form["email"] = options[:username]
        form["password"] = options[:password]
        session.logger.debug "Submitting /login form"
      end.click_button
      session.logger.debug "Ended up on page #{next_page.uri}"
    end
    true
  end  
end