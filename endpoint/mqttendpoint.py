import web
import json

urls = ('/.*', 'hooks')
app = web.application(urls, globals())

class hooks:
    def POST(self):
        # fetch hook and request data
        hook = web.ctx.env.get('HTTP_HOOK')
        data = json.loads(web.data())

        # print the hook and request data to the console
        print 'hook:', hook
        print 'data:', data
        print

if __name__ == '__main__':
    app.run()
