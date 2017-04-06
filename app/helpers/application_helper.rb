module ApplicationHelper
  def admin_logs
    f = File.open "#{Rails.root}/" + Settings.logs.admin_log_path, "r"
    admin_logs = Array.new
    f.each_line do |line|
      admin_logs.append line
    end
    admin_logs.last Settings.logs.last_ten
  end
end
