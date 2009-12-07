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

  action :environments do |session|
    envs = []
    session.get("https://cloud.engineyard.com/dashboard") do |page|
      page.parser.css("div.environment").each do |env|
        title = env.css('h3').first["title"]
        stack = env.css('h3 small').text
        instances = env.css('table.instances tr[id^=instance]').inject([]) do |list, inst|
          status = (inst.css("td.instance_status").first["class"].split(" ") - ["instance_status"]).first
          status_icon = inst.css("td.instance_status img").first["src"]
          role = inst.css("td.instance_status").text
          size = inst.css("td.instance_size").text
          host = inst.css("td.instance_hostname").text
          cpu_graph = inst.css("img.sparkline").first.try(:[], "src")
          log = inst.css("td.chef").collect(&:text)
          list << {:status => status, :status_icon => status_icon, :size => size, :host => host, :cpu_graph => cpu_graph, :log => log, :role => role}
          list
        end
        envs << {:title => title, :stack => stack, :instances =>instances}
      end
    end
    envs
  end
end