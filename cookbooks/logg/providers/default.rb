action :write do

  @reset           = "\033[0m"
  @style_bold_on   = "\033[1m"
  @style_blink_on  = "\033[5m"
  @style_blink_off = "\033[25m"
  @style_normal    = "\033[22m"

  def colored(string, color)
    return '' unless string
    color_code = case color
    when :red     then 31
    when :green   then 32
    when :yellow  then 33
    when :blue    then 34
    when :magenta then 35
    when :cyan    then 36
    end
    string.gsub!('<b>', @style_bold_on)
    string.gsub!('</b>', @style_normal)
    string.gsub!('<blink>', @style_blink_on)
    string.gsub!('</blink>', @style_blink_off)
    %{\033[#{color_code}m#{string}#{@reset}}
  end

  message = colored(new_resource.message, new_resource.color)
  Chef::Log.send(new_resource.level, message)

end