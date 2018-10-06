import json
from django.shortcuts import render
from django.http import HttpResponse
from rest_framework.response import Response
from rest_framework.views import APIView
from rest_framework import status
from django.views.decorators.csrf import csrf_exempt
from django.utils.decorators import method_decorator
from rest_framework.decorators import api_view
from ..common.base_service import *
from ..common.models import *

class register_user_request(base_request):
    def __init__(self, http_req):
        self.userId = ''
        self.password = ''
        self.emailId=''
        json_req=http_request_to_json(http_req)
        self.userId=json_req['userId']
        self.password=json_req['password']
        self.emailId = json_req['emailId']

class register_user_response(base_response):
    pass



class register_user(base_service):
    
    def pre_service(self, req, resp):
        print("Calling pre service")

    def service(self, req, resp):
        new_user = users()
        print("Calling service")
        new_user.userid = req.userId
        new_user.password=req.password
        new_user.emailid =req.emailId
        new_user.save()

    def post_service(self, req, resp):
        print("Calling post service")





@csrf_exempt
@api_view(["POST"],)
def request_handler(request):
   
    if request.method == "GET":
        print("GET Method")
    elif request.method == 'POST':
        print("POST method")

    reg_user_req = register_user_request(request)
    reg_user_resp = register_user_response()

    print("Hi Rahul")
    user_reg = register_user()
    reg_user_resp.set_ret_val(0)
    user_reg.process(reg_user_req,reg_user_resp)
    return Response(status=status.HTTP_201_CREATED)
   # return HttpResponse("I am okay")






# Create your views here.


