from django.http import HttpResponse
from django.shortcuts import render
# Create your views here.
from myapp.models import Login_table


def login(request):
    return render(request,'index.html')

def logincode(request):
    uname=request.POST['username']
    pwrd=request.POST['password']
    try:
        ob=Login_table.objects.get(username=uname,password=pwrd)
        if ob.type=='admin':
            return HttpResponse('''<Script>alert("welcome");window.location='adminhome'</Script>''')
        elif ob.type=='expert':
            return HttpResponse('''<Script>alert("welcome");window.location='experthome'</Script>''')
        else:
            return HttpResponse('''<Script>alert("invalid");window.location='/'</Script>''')
    except:
        return HttpResponse('''<Script>alert("invalid");window.location='/'</Script>''')


def adminhome(request):
    return render(request,'admin/index.html')