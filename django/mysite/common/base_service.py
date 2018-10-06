from abc import ABC, abstractmethod
import json
from rest_framework.response import Response
from rest_framework import status
from rest_framework.parsers import JSONParser

class base_request:
    pass

class base_response:

    def __init__(self, sucess=True, ret_val=0):
        self.success = sucess
        self.ret_val= ret_val

    def is_success(self):
        return self.success

    def get_ret_val(self):
        return self.ret_val

    def set_ret_val(self, ret_val):
        self.ret_val= ret_val
        if ret_val >0:
            self.success = False

class error_response(base_response):
    def __init_(self):
        self.error_str = ""

class base_service(ABC):

    def process(self, req, resp):
        print("Calling process")
        self.pre_service(req, resp)

        if resp.is_success() == True:
            self.service(req, resp)

        if resp.is_success() == True:
            self.post_service(req,resp)

    @abstractmethod
    def pre_service(self, req, resp):
        pass

    @abstractmethod
    def service(self, req, resp):
        pass
    
    @abstractmethod
    def post_service(self, req, resp):
        pass

def http_request_to_json(http_req):
    if http_req.body:
        json_req = JSONParser().parse(http_req)
        print(json_req)
        return json_req


