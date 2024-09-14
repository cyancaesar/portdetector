require 'colorize'

def banner
    title = "PortDetector @ cyancaesar\nTCP/UDP port scanner".light_yellow
    print <<-END
#{title}
Usage:

    ./portdetector <IP> <PORT> <PROT>

Examples:
    
    TCP 445 scan
        ./portdetector 192.168.1.40 445 TCP

    TCP 22,24,80,445 scan
        ./portdetector 192.168.1.40 22,24,80,445 TCP

    TCP 445 scan on a range of hosts
        ./portdetector 192.168.1.40-50 445 TCP

    UDP 80 scan
    	./portdetector 192.168.1.40 445 UDP
    END
end

def main
	return banner if ARGV.size < 3
	ip_regex = /^(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3})$/
	ip_rang_regex = /^(\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}\-\d{1,3})$/
	port_regex = /^(\d{1,5})$/
	port_seq_regex = /^(\d{1,5},)+\d{1,5}$/
	

	host = ARGV[0]
	port = ARGV[1]
	prot = ARGV[2]

	case host
	when ip_regex
		print "One host"
	when ip_rang_regex
		print "Range hosts"
		hosts = range
		print "Hello"
		ports = []
        case port
        when port_regex
        	ports.push(port.first)
        	TCPScanner(hosts, ports)
    	when port_seq_regex
    		ports = port.split(",")
    		TCPScanner(hosts, ports)
		end
	end
end

def range
	host = ARGV[0]
	hosts = []
	networkPortion = host.slice(0,(host.rindex "."))
    i = host.slice((host.rindex ".")+1, initialLength)
    f = host.slice((host.rindex "-")+1, 3)
    i.upto(f) {|x| hosts.push(networkPortion + "." + x.to_s)}
    return hosts
end

def TCPScanner(host, port)
	print host,'\n',port
end

begin
	main
rescue

end