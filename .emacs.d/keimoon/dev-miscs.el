(provide 'setup-dev-miscs)

;; Docker
(setenv "DOCKER_TLS_VERIFY" "1")
(setenv "DOCKER_HOST" "tcp://192.168.144.100:2376")
(setenv "DOCKER_CERT_PATH" "/Users/keimoon/.minikube/certs")
(setenv "DOCKER_API_VERSION" "1.23")

