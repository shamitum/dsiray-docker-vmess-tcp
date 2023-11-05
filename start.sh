#!/bin/sh

cd /xray

apk update
apk add --no-cache wget unzip
wget https://github.com/XTLS/Xray-core/releases/latest/download/Xray-linux-64.zip
unzip ./Xray-linux-64.zip
rm ./Xray-linux-64.zip

cat > ./config.json <<EOF
{
    "log": {
        "loglevel": "info"
    },
    "inbounds": [
        {
            "tag": "VMess TCP",
            "listen": "0.0.0.0",
            "port": 8081,
            "protocol": "vmess",
            "settings": {
                "clients": [
                    {
                        "id": "40b1623c-6cfe-44ef-b6f6-3e9aefc1f0c7"
                    }
                ]
            },
            "streamSettings": {
                "network": "tcp",
                "tcpSettings": {
                    "header": {
                        "type": "http",
                        "request": {
                            "method": "GET",
                            "path": [
                                "/"
                            ],
                            "headers": {
                                "Host": [
                                    "google.com"
                                ]
                            }
                        },
                        "response": {}
                    }
                },
                "security": "none"
            },
            "sniffing": {
                "enabled": true,
                "destOverride": [
                    "http",
                    "tls"
                ]
            }
        },
        {
            "tag": "VMess Websocket",
            "listen": "0.0.0.0",
            "port": 8080,
            "protocol": "vmess",
            "settings": {
                "clients": [
                    {
                        "id": "40b1623c-6cfe-44ef-b6f6-3e9aefc1f0c7"
                    }
                ]
            },
            "streamSettings": {
                "network": "ws",
                "wsSettings": {
                    "path": "/",
                    "headers": {
                        "Host": "google.com"
                    }
                },
                "security": "none"
            },
            "sniffing": {
                "enabled": true,
                "destOverride": [
                    "http",
                    "tls"
                ]
            }
        },
        {
            "tag": "VLESS TCP REALITY",
            "listen": "0.0.0.0",
            "port": 8443,
            "protocol": "vless",
            "settings": {
                "clients": [
                    {
                        "id": "40b1623c-6cfe-44ef-b6f6-3e9aefc1f0c7"
                    }
                ],
                "decryption": "none"
            },
            "streamSettings": {
                "network": "tcp",
                "tcpSettings": {},
                "security": "reality",
                "realitySettings": {
                    "show": false,
                    "dest": "discordapp.com:443",
                    "xver": 0,
                    "serverNames": [
                        "cdn.discordapp.com",
                        "discordapp.com"
                    ],
                    "privateKey": "MMX7m0Mj3faUstoEm5NBdegeXkHG6ZB78xzBv2n3ZUA",
                    "shortIds": [
                        "",
                        "6ba85179e30d4fc2"
                    ]
                }
            },
            "sniffing": {
                "enabled": true,
                "destOverride": [
                    "http",
                    "tls"
                ]
            }
        },
        {
            "tag": "VLESS GRPC REALITY",
            "listen": "0.0.0.0",
            "port": 2053,
            "protocol": "vless",
            "settings": {
                "clients": [
                    {
                        "id": "40b1623c-6cfe-44ef-b6f6-3e9aefc1f0c7"
                    }
                ],
                "decryption": "none"
            },
            "streamSettings": {
                "network": "grpc",
                "grpcSettings": {
                    "serviceName": "xyz"
                },
                "security": "reality",
                "realitySettings": {
                    "show": false,
                    "dest": "discordapp.com:443",
                    "xver": 0,
                    "serverNames": [
                        "cdn.discordapp.com",
                        "discordapp.com"
                    ],
                    "privateKey": "MMX7m0Mj3faUstoEm5NBdegeXkHG6ZB78xzBv2n3ZUA",
                    "shortIds": [
                        "",
                        "6ba85179e30d4fc2"
                    ]
                }
            },
            "sniffing": {
                "enabled": true,
                "destOverride": [
                    "http",
                    "tls"
                ]
            }
        },
        {
            "tag": "Trojan Websocket TLS",
            "listen": "0.0.0.0",
            "port": 2083,
            "protocol": "trojan",
            "settings": {
                "clients": [
                    {
                        "id": "40b1623c-6cfe-44ef-b6f6-3e9aefc1f0c7"
                    }
                ]
            },
            "streamSettings": {
                "network": "ws",
                "security": "tls",
                "tlsSettings": {
                    "certificates": [
                        {
                            "certificate": [
                                "-----BEGIN CERTIFICATE-----",
                                "MIIBvTCCAWOgAwIBAgIRAIY9Lzn0T3VFedUnT9idYkEwCgYIKoZIzj0EAwIwJjER",
                                "MA8GA1UEChMIWHJheSBJbmMxETAPBgNVBAMTCFhyYXkgSW5jMB4XDTIzMDUyMTA4",
                                "NDUxMVoXDTMzMDMyOTA5NDUxMVowJjERMA8GA1UEChMIWHJheSBJbmMxETAPBgNV",
                                "BAMTCFhyYXkgSW5jMFkwEwYHKoZIzj0CAQYIKoZIzj0DAQcDQgAEGAmB8CILK7Q1",
                                "FG47g5VXg/oX3EFQqlW8B0aZAftYpHGLm4hEYVA4MasoGSxRuborhGu3lDvlt0cZ",
                                "aQTLvO/IK6NyMHAwDgYDVR0PAQH/BAQDAgWgMBMGA1UdJQQMMAoGCCsGAQUFBwMB",
                                "MAwGA1UdEwEB/wQCMAAwOwYDVR0RBDQwMoILZ3N0YXRpYy5jb22CDSouZ3N0YXRp",
                                "Yy5jb22CFCoubWV0cmljLmdzdGF0aWMuY29tMAoGCCqGSM49BAMCA0gAMEUCIQC1",
                                "XMIz1XwJrcu3BSZQFlNteutyepHrIttrtsfdd05YsQIgAtCg53wGUSSOYGL8921d",
                                "KuUcpBWSPkvH6y3Ak+YsTMg=",
                                "-----END CERTIFICATE-----"
                            ],
                            "key": [
                                "-----BEGIN RSA PRIVATE KEY-----",
                                "MIGHAgEAMBMGByqGSM49AgEGCCqGSM49AwEHBG0wawIBAQQg7ptMDsNFiL7iB5N5",
                                "gemkQUHIWvgIet+GiY7x7qB13V6hRANCAAQYCYHwIgsrtDUUbjuDlVeD+hfcQVCq",
                                "VbwHRpkB+1ikcYubiERhUDgxqygZLFG5uiuEa7eUO+W3RxlpBMu878gr",
                                "-----END RSA PRIVATE KEY-----"
                            ]
                        }
                    ],
                    "minVersion": "1.2",
                    "cipherSuites": "TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256:TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256:TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384:TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384:TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256:TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256"
                }
            },
            "sniffing": {
                "enabled": true,
                "destOverride": [
                    "http",
                    "tls"
                ]
            }
        }
       
    ],
    "outbounds": [
        {
            "protocol": "freedom",
            "tag": "DIRECT"
        },
        {
            "protocol": "blackhole",
            "tag": "BLOCK"
        }
    ],
    "routing": {
        "rules": [
            {
                "ip": [
                    "geoip:private"
                ],
                "domain": [
                    "geosite:private"
                ],
                "protocol": [
                    "bittorrent"
                ],
                "outboundTag": "BLOCK",
                "type": "field"
            }
        ]
    }
}

EOF

./xray -c ./config.json
