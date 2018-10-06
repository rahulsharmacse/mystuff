from django.shortcuts import render

# Create your views here.
from django.shortcuts import render_to_response
from django.template import RequestContext
from django.http import HttpResponse

def index(request):
#    return HttpResponse('Hello, World!, Django')
#    return render_to_response('welcome.jsp')
     return render(request,'welcome.jsp')
