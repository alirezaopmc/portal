import portal as p

def run():
    config_path = '/etc/ssh/sshd_config'
    with open(config_path, 'r+') as f:
        cfg = f.read()
        cfg = p.u.repl('#PermitRootLogin yes', 'PermitRootLogin no', cfg)
        f.write(cfg)
    