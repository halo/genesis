def online?
  @online ||= system('ping -c 1 www.example.com &> /dev/null')
end

def offline?
  !online?
end
