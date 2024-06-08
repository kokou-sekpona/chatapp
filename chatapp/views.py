from django.shortcuts import render
from gtts import gTTS
import os, io, json
from io import BytesIO
import requests
from openai import AzureOpenAI
from PIL import Image
#import langdetect
import shutil
from .api import *
from django.http import  JsonResponse

# Create your views here.


def home(request):

    if request.method =="POST":
        print(request.POST.get("message"))
    return render(request, "home.html")

def chat_view(request):
    if request.method == "POST":
        print(request.body)
        data = json.loads(request.body)
        text = data.get("user_input")
        print(text)
        
        try:
            text = chat(text)
            print(text)
            return JsonResponse({ 'success': True,  'text':f'{text}'})
        except Exception as e:
            text = chat(text)
            return JsonResponse({ 'success': False,'text':f'{e}'})
    

