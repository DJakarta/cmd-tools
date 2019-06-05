:: Quickly restart the windows audio services
net stop audiosrv
net stop AudioEndpointBuilder
net start audiosrv
net start AudioEndpointBuilder