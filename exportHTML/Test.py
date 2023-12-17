from http.server import HTTPServer, SimpleHTTPRequestHandler, test 

class CORSRequestHandler(SimpleHTTPRequestHandler):
    def end_headers(self):
        self.send_header("Cross-Origin-Opener-Policy", "same-origin")
        self.send_header("Cross-Origin-Embedder-Policy", "require-corp")
        self.send_header("Access-Control-Allow-Origin", "*")
        super().end_headers()


if __name__ == '__main__':
    server_address = ('', 8000)  # Change 8000 to your desired port number
    httpd = HTTPServer(server_address, CORSRequestHandler)
    httpd.serve_forever()