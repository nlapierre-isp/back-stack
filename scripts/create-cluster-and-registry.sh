k3d cluster create mycluster --registry-create backstack-registry:0.0.0.0:5000 --agents 1 -p 80:80@agent:0 -p 443:443@agent:0
