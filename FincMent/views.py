import datetime
import json
import smtplib
from email.mime.text import MIMEText
from datetime import datetime

from django.contrib.auth.decorators import login_required
from django.core.files.storage import FileSystemStorage

from django.http import HttpResponse, JsonResponse
from django.shortcuts import render, redirect
from django.contrib import auth
# Create your views here.

from FincMent.models import *

def login(request):
    return render(request,"index.html")

def forgotpassword(request):
    return render(request,"forgotpassword.html")

def forgotpassword_post(request):
    email = request.POST['textfield']
    try:
        s = expert_table.objects.get(email=email)
        # qry = "SELECT login.password FROM student  JOIN login ON login.L_id = student.L_id WHERE email=%s"
        # s = selectone(qry, email)
        print(s, "=============")
        if s is None:
            return HttpResponse('''<script>alert('invalid email');window.location='/forgotpassword'</script>''')

            # return jsonify({'task': 'invalid email'})
        else:
            try:
                gmail = smtplib.SMTP('smtp.gmail.com', 587)
                gmail.ehlo()
                gmail.starttls()
                gmail.login('ajinnn712@gmail.com', 'fbst nhpj yuty nqrz')
                print("login=======")
            except Exception as e:
                print("Couldn't setup email!!" + str(e))
            msg = MIMEText("Your new password id : " + str(s.LOGIN_ID.password))
            print(msg)
            msg['Subject'] = 'Fincment - Forgot Password'
            msg['To'] = email
            msg['From'] = 'ajinnn712@gmail.com'

            print("ok====")

            try:
                gmail.send_message(msg)
            except Exception as e:
                print(e)
                return HttpResponse('''<script>alert('invalid email');window.location='/forgotpassword'</script>''')
            return HttpResponse('''<script>alert('sended');window.location='/'</script>''')

    except Exception as e:
            print(e)
            return HttpResponse('''<script>alert('invalid email');window.location='/forgotpassword'</script>''')

def logout(request):
    auth.logout(request)
    return render(request,"index.html")



def logincode(request):
    username = request.POST['textfield']
    password = request.POST['textfield2']
    try:
        ob = Login_table.objects.get(username = username, password = password)
        if ob.type == "admin":
            ob1=auth.authenticate(username ='admin',password ='admin')
            if ob1 is not None:
                auth.login(request,ob1)
            request.session["lid"] = ob.id
            return HttpResponse('''<script> alert("login success");window.location="/home"</script>''')
        elif ob.type == "Expert":
            ob1 = auth.authenticate(username='admin', password='admin')
            if ob1 is not None:
                auth.login(request, ob1)
            request.session["lid"] = ob.id
            return HttpResponse('''<script> alert("login success");window.location="/expert_home"</script>''')

        elif ob.type == "blocked":
            ob1 = auth.authenticate(username='admin', password='admin')
            if ob1 is not None:
                auth.login(request, ob1)
            request.session["lid"] = ob.id
            return HttpResponse('''<script> alert("Blocked");window.location="/"</script>''')
        else:
            return HttpResponse('''<script> alert("invalid password or username");window.location="/"</script>''')
            #return HttpResponse('''<script> alert("invalid password or username");window.location=""<\script>''')

    except:
        return HttpResponse('''<script> alert("Error.....");window.location="/"</script>''')


def register(request):
    return render(request,"register index.html")




def registercode(request):
    firstname = request.POST['textfield']
    lastname = request.POST['textfield2']
    dob = request.POST['textfield9']
    gender = request.POST['textfield3']
    post = request.POST['post']
    photo = request.FILES['file']
    fs=FileSystemStorage()
    fsave=fs.save(photo.name,photo)

    idproof = request.FILES['idproof']
    fs1=FileSystemStorage()
    fsave1=fs1.save(idproof.name,idproof)


    place = request.POST['textfield4']
    phone = request.POST['textfield5']
    email = request.POST['textfield6']

    username = request.POST['textfield7']
    password = request.POST['textfield8']
    qualification = request.POST['textfield10']

    ob = Login_table()
    ob.username=username
    ob.password=password
    ob.type="pending"
    ob.save()
    obb = expert_table()
    obb.firstname = firstname
    obb.lastname = lastname
    obb.dob = dob
    obb.gender = gender
    obb.idproof = fsave1
    obb.photo = fsave
    obb.place = place
    obb.post = post
    obb.phone = phone
    obb.email = email
    obb.qualification = qualification
    obb.LOGIN_ID = ob
    obb.save()
    return HttpResponse('''<script> alert("registration succesfully");window.location="/"</script>''')



@login_required(login_url='/')
def expert_addTipsPost(request):
    tips = request.POST['textfield']
    details = request.POST['textfield2']

    ob = tip()

    ob.tips=tips
    ob.details=details
    ob.expert_id=expert_table.objects.get(LOGIN_ID=request.session["lid"])
    ob.save()

    return HttpResponse('''<script> alert("added successfully");window.location="/expert_manageTips"</script>''')

@login_required(login_url='/')
def home(request):
    return render(request,"admin/admin_home1.html")

@login_required(login_url='/')
def blockExpert(request):
    ob=expert_table.objects.all()
    return render(request,"admin/blockexpert.html",{'data':ob})


@login_required(login_url='/')
def blockUser(request):
    ob=parent_table.objects.all()
    return render(request,"admin/blockuser.html",{'data':ob})


@login_required(login_url='/')
def blockparent(request):
    ob=parent_table.objects.all()
    return render(request,"admin/blockparent.html",{'data':ob})

@login_required(login_url='/')
def verifyUser(request):
    ob = user_table.objects.all()
    return render(request,"admin/Verifyuser.html",{'val':ob})

@login_required(login_url='/')
def verifyExpert(request):
    ob=expert_table.objects.all()
    return render(request,"admin/Verifyexpert.html",{'val':ob})

@login_required(login_url='/')
def verifyExpert_search(request):

    name=request.POST["textfield"]

    ob=expert_table.objects.filter(firstname__contains=name)

    return render(request,"admin/Verifyexpert.html",{'val':ob})

@login_required(login_url='/')
def admin_accept_expert(request,id):
    ob=Login_table.objects.get(id=id)
    ob.type="Expert"
    ob.save()
    return HttpResponse('''<script> alert('accepted');window.location="/verifyExpert"</script>''')

@login_required(login_url='/')
def admin_reject_expert(request,id):
    ob = Login_table.objects.get(id=id)
    ob.type = "Rejected"
    ob.save()
    return HttpResponse('''<script> alert('rejected');window.location='/verifyExpert'</script>''')

def admin_block_expert(request,id):
    ob = Login_table.objects.get(id=id)
    ob.type = "blocked"
    ob.save()
    return HttpResponse('''<script> alert('blocked');window.location='/blockExpert#about'</script>''')

@login_required(login_url='/')
def admin_unblocked_expert(request,id):
    ob = Login_table.objects.get(id=id)
    ob.type = "Expert"
    ob.save()
    return HttpResponse('''<script> alert('unblocked');window.location='/blockExpert#about'</script>''')

@login_required(login_url='/')
def admin_block_user(request,id):
    ob = Login_table.objects.get(id=id)
    ob.type = "blocked"
    ob.save()
    return HttpResponse('''<script> alert('blocked');window.location='/blockUser#about'</script>''')

@login_required(login_url='/')
def admin_unblocked_user(request,id):
    ob = Login_table.objects.get(id=id)
    ob.type = "user"
    ob.save()
    return HttpResponse('''<script> alert('unblocked');window.location='/blockUser#about'</script>''')

@login_required(login_url='/')
def admin_block_parent(request,id):
    ob = Login_table.objects.get(id=id)
    ob.type = "blocked"
    ob.save()
    return HttpResponse('''<script> alert('blocked');window.location='/blockparent#about'</script>''')

@login_required(login_url='/')
def admin_unblocked_parent(request,id):
    ob = Login_table.objects.get(id=id)
    ob.type = "parent"
    ob.save()
    return HttpResponse('''<script> alert('unblocked');window.location='/blockparent#about'</script>''')

@login_required(login_url='/')
def viewfeedback(request):
    ob=feedback.objects.all()
    return render(request,"admin/feedback.html",{'val':ob})


@login_required(login_url='/')
def sendreply(request,id):
    request.session['cid']=id
    return render(request,"admin/send reply.html")

@login_required(login_url='/')
def sendReply_post(request):
    reply = request.POST["textfield"]
    kk=Complaint.objects.get(id=request.session['cid'])
    kk.Reply=reply
    kk.save()
    return HttpResponse('''<script> alert("send successfully");window.location="/complaint"</script>''')

@login_required(login_url='/')
def complaint(request):
    ob = Complaint.objects.all()
    return render(request,"admin/Complaint.html",{'val':ob})

@login_required(login_url='/')
def expert_addTips(request):
    return render(request,"expert/add tips.html")

@login_required(login_url='/')
def expert_doubt(request):
    ob = doubt_table.objects.filter(expert_id__LOGIN_ID=request.session["lid"])
    return render(request,"expert/doubt.html",{'ob':ob})

@login_required(login_url='/')
def expert_doubt_search(request):
    date = request.POST["textfield"]
    ob = doubt_table.objects.filter(date=date)
    return render(request, "expert/doubt.html", {'ob': ob})

@login_required(login_url='/')
def expert_parent_doubt(request):
    ob = parent_doubt_table.objects.filter(expert_id__LOGIN_ID=request.session["lid"])
    return render(request,"expert/parentdoubt.html",{'ob':ob})


@login_required(login_url='/')
def expert_parent_doubt_search(request):
    date = request.POST["textfield"]
    ob = parent_doubt_table.objects.filter(date=date)
    return render(request, "expert/parentdoubt.html", {'ob': ob})


def expert_registration(request):
    return render(request,"register index.html")

@login_required(login_url='/')
def expert_home(request):
    return render(request,"expert/index1.html")

@login_required(login_url='/')
def expert_manageTips(request):
    ob=tip.objects.filter(expert_id__LOGIN_ID=request.session['lid'])
    return render(request,"expert/managetips.html",{"val":ob})

@login_required(login_url='/')
def expert_manageTips_delete(request,id):
    ob=tip.objects.get(id=id)
    ob.delete()
    return HttpResponse('''<script>alert('deleted');window.location='/expert_manageTips#about'</script>''')

@login_required(login_url='/')
def expert_sendReply(request,id):
    request.session['did']=id
    return render(request,"expert/send reply.html")

@login_required(login_url='/')
def expert_sendReply_post(request):
    reply = request.POST["textfield"]
    kk=doubt_table.objects.get(id=request.session['did'])
    kk.reply=reply
    kk.save()
    return HttpResponse('''<script> alert("send successfully");window.location="/expert_doubt#about"</script>''')


@login_required(login_url='/')
def parent_expert_sendReply(request,id):
    request.session['did']=id
    return render(request,"expert/Paren_send reply.html")

@login_required(login_url='/')
def Parent_expert_sendReply_post(request):
    reply = request.POST["textfield"]
    kk=parent_doubt_table.objects.get(id=request.session['did'])
    kk.reply=reply
    kk.save()
    return HttpResponse('''<script> alert("send successfully");window.location="/expert_parent_doubt#about"</script>''')





@login_required(login_url='/')
def expert_viewProfile(request):
    ob = expert_table.objects.get(LOGIN_ID=request.session["lid"])
    return render(request,"expert/view profile and update.html",{'val':ob,"date":str(ob.dob)})

@login_required(login_url='/')
def updateprofile(request):
    fname=request.POST['n1']
    lname=request.POST['n2']
    gender = request.POST['r1']
    place = request.POST['n3']
    post = request.POST['n4']
    email = request.POST['n5']
    phone=request.POST['n6']
    dob=request.POST['n7']
    qualification = request.POST['n9']
    ob=expert_table.objects.get(LOGIN_ID__id=request.session['lid'])
    ob.firstname=fname
    ob.lastname=lname
    ob.gender=gender
    ob.place=place
    ob.post=post
    ob.phone=phone
    ob.email=email
    ob.qualification=qualification
    ob.dob=dob
    if 'img' in request.FILES:
        img=request.FILES['img']
        fs=FileSystemStorage()
        fn=fs.save(img.name,img)
        ob.photo=fn
    ob.save()
    return  redirect("/expert_viewProfile")

@login_required(login_url='/')
def expert_viewReview(request):
    ob = expert_review.objects.all()
    return render(request, "expert/Viewreview.html",{'val':ob})

@login_required(login_url='/')
def chatwithuser(request):
    ob = user_table.objects.all()
    return render(request,"Expert/fur_chat.html",{'val':ob})


@login_required(login_url='/')
def chatview(request):
    ob = user_table.objects.all()
    d=[]
    for i in ob:
        r={"name":i.fname+i.lname,'photo':i.photo.url,'email':i.email,'loginid':i.LOGIN_ID.id}
        d.append(r)
    return JsonResponse(d, safe=False)



@login_required(login_url='/')
def coun_insert_chat(request,msg,id):
    from datetime import datetime
    print("===",msg,id)
    ob=chat_table()
    ob.from_id=Login_table.objects.get(id=request.session['lid'])
    ob.to_id=Login_table.objects.get(id=id)
    ob.message=msg
    ob.date=datetime.now().strftime("%Y-%m-%d")
    ob.time=datetime.now()
    ob.save()

    return JsonResponse({"task":"ok"})
    # refresh messages chatlist


@login_required(login_url='/')
def coun_msg(request,id):

    ob1=chat_table.objects.filter(from_id__id=id,to_id__id=request.session['lid'])
    ob2=chat_table.objects.filter(from_id__id=request.session['lid'],to_id__id=id)
    combined_chat = ob1.union(ob2)
    combined_chat=combined_chat.order_by('id')
    res=[]
    for i in combined_chat:
        res.append({"from_id":i.from_id.id,"msg":i.message,"date":i.date,"chat_id":i.id})

    obu=user_table.objects.get(LOGIN_ID__id=id)


    return JsonResponse({"data":res,"name":obu.fname+obu.lname,"photo":obu.photo.url,"user_lid":obu.LOGIN_ID.id})

def admin_changepassword(request):
    return render(request,'admin/change pss.html')

def admin_change_password_post(request):
        current_password = request.POST['textfield']
        new_password = request.POST['textfield2']
        confirm_password = request.POST['textfield3']

        ob = Login_table.objects.filter(password=current_password)
        print(ob, "==================")
        if len(ob) != 0:
            if new_password == confirm_password:
                ob = Login_table.objects.get(password=current_password)
                ob.password = new_password
                ob.save()
                return HttpResponse('''<script>alert(" Password updated..");window.location="/"</script>''')
            else:
                return HttpResponse('''<script>alert(" Password missmatch..");window.location="/"</script>''')


        else:
            return HttpResponse('''<script>alert(" Invalid password..");window.location="/"</script>''')


# "================================anndroid================================="
def registrationcode(request):
    try:
        print(request.POST,"uuuki")
        image=request.FILES['image']
        fname=request.POST['fname']
        lname=request.POST['lname']
        place=request.POST['place']
        gender=request.POST['gender']
        email=request.POST['email']
        phone=request.POST['phone']
        uname=request.POST['username']
        password=request.POST['password']

        fs=FileSystemStorage()
        fsave=fs.save(image.name,image)

        lob1 = Login_table()
        lob1.username = uname
        lob1.password = password
        lob1.type = 'user'
        lob1.save()

        lob = user_table()
        lob.fname = fname
        lob.lname = lname
        lob.place =place
        lob.photo=fsave
        lob.gender = gender
        lob.phone = phone
        lob.email = email
        lob.LOGIN_ID =lob1
        lob.save()
        print("uuuuuuuuu",lob)
        return JsonResponse({'task':'valid'})
    except Exception as e:
        print(e)
        return JsonResponse({"task": "invalid"})


def edit_profile(request):
    try:
        print(request.FILES, "uuuki")
        id = request.POST['id']
        image = request.FILES['photo']
        fname = request.POST['fname']
        lname = request.POST['lname']
        place = request.POST['place']
        gender = request.POST['gender']
        email = request.POST['email']
        phone = request.POST['phone']


        fs = FileSystemStorage()
        fsave = fs.save(image.name, image)

        lob = user_table.objects.get(LOGIN_ID__id=id)
        lob.fname = fname
        lob.lname = lname
        lob.place = place
        lob.photo = fsave
        lob.gender = gender
        lob.phone = phone
        lob.email = email
        lob.save()
        print("uuuuuuuuu", lob)
        return JsonResponse({'task': 'valid'})
    except:
        print(request.FILES, "uuuki")
        id = request.POST['id']
        fname = request.POST['fname']
        lname = request.POST['lname']
        place = request.POST['place']
        gender = request.POST['gender']
        email = request.POST['email']
        phone = request.POST['phone']

        lob = user_table.objects.get(LOGIN_ID__id=id)
        lob.fname = fname
        lob.lname = lname
        lob.place = place
        lob.gender = gender
        lob.phone = phone
        lob.email = email
        lob.save()
        print("uuuuuuuuu", lob)
        return JsonResponse({'task': 'valid'})



def logincodeand(request):
    print(request.POST)
    un = request.POST['username']
    pwd = request.POST['password']
    print(un, pwd)
    try:
        ob = Login_table.objects.get(username=un, password=pwd)

        if ob.type=='blocked':
            data = {"status": "no"}

        elif ob is None:
            data = {"status": "invalid"}

        else:
            print("in user function")
            obb=bank_details.objects.filter(user_id__LOGIN_ID__id=ob.id)
            bal=0
            for i in obb:
                bal+=i.total_amount
            obs=Savings.objects.filter(user_id__LOGIN_ID__id=ob.id)
            sav=0
            for i in obs:
                sav+=i.amount
            data = {"status": "ok", "lid": ob.id,"type":ob.type,"bal":bal,"sav":sav}

            obs=expenses.objects.filter(user_id__LOGIN_ID__id=ob.id)
            exp=0
            for i in obs:
                exp+=i.amount
            data = {"status": "ok", "lid": ob.id,"type":ob.type,"bal":str(bal),"sav":str(sav),"exp":str(exp),"dif":str((sav-exp)-bal)}

        r = json.dumps(data)
        print(r)
        return HttpResponse(r)
    except Exception as e:
        print(e)
        data = {"task": "invalid"}
        r = json.dumps(data)
        print(r)
        return HttpResponse(r)




def forgotcode(request):
    print(request.POST)
    un = request.POST['username']

    print(un)
    try:
        ob = user_table.objects.get(email=un)

        try:
            gmail = smtplib.SMTP('smtp.gmail.com', 587)
            gmail.ehlo()
            gmail.starttls()
            gmail.login('hibamuhsinakm8005@gmail.com', 'pkpolwistnzbayfr')
            print("login=======")
        except Exception as e:
            print("Couldn't setup email!!" + str(e))
        msg = MIMEText("Your new password id : " + str(ob.LOGIN_ID.password))
        print(msg)
        msg['Subject'] = 'Fincment'
        msg['To'] = un
        msg['From'] = 'hibamuhsinakm8005@gmail.com'

        print("ok====")

        try:
            gmail.send_message(msg)
        except Exception as e:
            return JsonResponse({"task": "invalid"})





        data = {"status": "ok"}
        r = json.dumps(data)
        print(r)
        return HttpResponse(r)
    except:
        data = {"task": "invalid"}
        r = json.dumps(data)
        print(r)
        return HttpResponse(r)

def viewprofile(request):
    lid = request.POST['lid']
    ob=user_table.objects.get(LOGIN_ID=lid)
    profile = {
        'id':ob.id,
        'fname':ob.fname,
        'lname':ob.lname,
        'gender':ob.gender,
        'photo':ob.photo.url[1:],
        'place':ob.place,
        'phone':ob.phone,
        'email':ob.email
    }
    obb = bank_details.objects.filter(user_id__LOGIN_ID__id=lid)
    bal = 0
    for i in obb:
        bal += i.total_amount
    obs = Savings.objects.filter(user_id__LOGIN_ID__id=lid)
    sav = 0
    for i in obs:
        sav += i.amount

    obs = expenses.objects.filter(user_id__LOGIN_ID__id=lid)
    exp = 0
    for i in obs:
        exp += i.amount


    return JsonResponse({'status':'ok','profile':[profile],"bal": str(bal), "sav": str(sav), "exp": str(exp),
            "dif": str((sav - exp) - bal)})

def manageExpense(request):
    ob=Savings.objects.all()
    print(ob,"HHHHHHHHHHHHHHH")
    mdata=[]
    for i in ob:
        data={'amount':i.amount,'details':i.details,'date':str(i.date),'id':i.id}
        mdata.append(data)
        print(mdata)
    return JsonResponse({"status":"ok","data":mdata})


def transaction(request):
    lid=request.POST['lid']
    ob = Savings.objects.filter(user_id__LOGIN_ID__id=lid)
    ob1 = expenses.objects.filter(user_id__LOGIN_ID__id=lid)

    # print(ob, "HHHHHHHHHHHHHHH")
    mdata = []
    for i in ob:
        data = {'amount': i.amount, 'details': i.details, 'date': str(i.date),'time': str(i.time), 'id': i.id,"type":'credited'}
        mdata.append(data)
    #     print(mdata)
    # return JsonResponse({"status": "ok", "data": mdata})

    print(ob1, "HHHHHHHHHHHHHHH")
    mdata1 = []
    for i in ob1:
        data = {'amount': i.amount, 'details': i.details, 'date': str(i.date),'time': str(i.time), 'id': i.id,"type":"debited"}
        mdata1.append(data)
        print(mdata1)

    merged_data = mdata + mdata1

    # Sort the merged data by the 'date' field
    # sorted_data = sorted(merged_data, key=lambda x: x['date'])
    # sorted_data = sorted(merged_data, key=lambda x: datetime.strptime(x['date'], '%Y-%m-%d'), reverse=True)
    # sorted_data = sorted(data, key=lambda x: datetime.strptime(f"{x['date']} {x['time']}", "%Y-%m-%d %H:%M:%S"))
    sorted_data = sorted(merged_data, key=lambda x: datetime.strptime(f"{x['date']} {x['time']}", "%Y-%m-%d %H:%M:%S.%f"), reverse=True)

    return JsonResponse({"status": "ok", "data": sorted_data})


def viewDoubt(request):
    ob=doubt_table.objects.all()
    print(ob,"HHHHHHHHHHHHHHH")
    mdata=[]
    for i in ob:
        data={'expertname':i.expert_id.firstname+i.expert_id.lastname,'doubt':i.doubt,'time':i.time,'date':str(i.date),'reply':i.reply}
        mdata.append(data)
        print(mdata)
    return JsonResponse({"status":"ok","data":mdata})

def send_doubt(request):
    from datetime import datetime
    com = request.POST['doubt']
    lid = request.POST['lid']
    lob = doubt_table()
    lob.user_id = doubt_table.objects.get(LOGIN_ID__id=lid)
    lob.doubt = com
    lob.Reply = 'pending'
    lob.date = datetime.today()
    lob.save()
    return JsonResponse({'task': 'ok'})
import datetime
def send_complaint(request):
    com = request.POST['complaint']
    lid = request.POST['lid']
    lob = Complaint()
    lob.user_id = user_table.objects.get(LOGIN_ID__id=lid)
    lob.complaint = com
    lob.Reply = 'pending'
    lob.date = datetime.today().date()
    lob.save()
    return JsonResponse({'task': 'ok'})

def viewReply(request):
    lid=request.POST['lid']
    ob=Complaint.objects.filter(user_id__LOGIN_ID__id=lid)
    print(ob,"HHHHHHHHHHHHHHH")
    mdata=[]
    for i in ob:
        data={'reply':i.Reply,'complaint':i.complaint,'date':str(i.date),'id':i.id}
        mdata.append(data)
        print(mdata)
    return JsonResponse({"status":"ok","data":mdata})

def viewTips(request):
    ob=tip.objects.all()
    mdata=[]
    for i in ob:
        data={'tips':i.tips,
              'details':i.details,
              'expertname':i.expert_id.firstname+i.expert_id.lastname,
              'date':str(i.date),
              'id':i.id
              }
        mdata.append(data)
        print(mdata)
    return JsonResponse({"status":"ok","data":mdata})

def addrating(request):
    rating = request.POST['rating']
    review = request.POST['review']
    lid = request.POST['lid']
    lob = feedback()
    lob.user_id = user_table.objects.get(LOGIN_ID__id=lid)
    lob.Rating = rating
    lob.review = review
    lob.date = datetime.today()
    lob.save()
    return JsonResponse({'task': 'ok'})

def addSavings(request):
    det = request.POST['det']
    amount = request.POST['amount']
    bank = request.POST['bank']
    lid = request.POST['lid']
    lob = Savings()
    lob.user_id = user_table.objects.get(LOGIN_ID__id=lid)
    lob.amount = amount
    lob.bank = bank
    lob.details = det
    lob.date = datetime.today()
    lob.save()
    if bank!="Cash":
        ob=bank_details.objects.get(user_id__LOGIN_ID__id=lid,Bank_name=bank)
        ob.total_amount+=int(amount)
        ob.save()
    return JsonResponse({'task': 'ok'})

def viewSavings(request):
    ob=Savings.objects.all()
    print(ob,"HHHHHHHHHHHHHHH")
    mdata=[]
    for i in ob:
        data={'amount':i.amount,'details':i.details,'date':str(i.date),'id':i.id}
        mdata.append(data)
        print(mdata)
    return JsonResponse({"status":"ok","data":mdata})


def viewExpense(request):
    ob=expenses.objects.all()
    print(ob,"HHHHHHHHHHHHHHH")
    mdata=[]
    for i in ob:
        data={'amount':i.amount,'category':i.category,'details':i.details,'time':i.time,'date':str(i.date),'id':i.id}
        mdata.append(data)
        print(mdata)
    return JsonResponse({"status":"ok","data":mdata})

def addBankDetails(request):
    from datetime import datetime

    bankname= request.POST['Bank_name']
    ifsccode= request.POST['Ifsc_code']
    accno= request.POST['acc_no']
    lid = request.POST['lid']

    lob = Savings()

    lob.USER = user_table.objects.get(LOGIN__id=lid)
    lob.Bank_name = bankname
    lob.Ifsc_code = ifsccode
    lob.acc_no = accno
    lob.date = datetime.today()
    lob.save()
    return JsonResponse({'task': 'ok'})

def viewBankDetails(request):
    ob=bank_details.objects.all()
    print(ob,"HHHHHHHHHHHHHHH")
    mdata=[]
    for i in ob:
        data={'accno':i.acc_no,'ifsccode':i.Ifsc_code,'bankname':i.Bank_name,'category':i.category,'date':str(i.date),'id':i.id}
        mdata.append(data)
        print(mdata)
    return JsonResponse({"status":"ok","data":mdata})


def user_send_feedback(request):
    from datetime import datetime

    id = request.POST['lid']
    user = user_table.objects.get(LOGIN_ID=id)
    feedbac = request.POST['feedback']
    rating = request.POST['rating']
    review = request.POST['review']
    lob = feedback()
    lob.USER = user
    lob.date = datetime.now()
    lob.feedback = feedbac
    lob.Rating = rating
    lob.review = review
    lob.save()
    return JsonResponse({'task': 'ok'})

def user_send_complaint(request):
    from datetime import datetime
    id = request.POST['lid']
    user = user_table.objects.get(LOGIN_ID=id)
    complaint = request.POST['complaint']

    lob = Complaint()

    lob.USER = user
    lob.date = datetime.now()
    lob.complaint = complaint
    lob.Reply = 'pending'
    lob.save()
    return JsonResponse({'task': 'ok'})

def viewExpert(request):
    ob=expert_table.objects.filter(LOGIN_ID__type='Expert')
    print(ob,"HHHHHHHHHHHHHHH")
    mdata=[]
    for i in ob:
        data={'lid':str(i.LOGIN_ID.id),
              'firstname':str(i.firstname),
              'lastname':str(i.lastname),
              'photo': request.build_absolute_uri(i.photo.url[1:]),
              'place': str(i.place) ,
              'phone':str( i.phone),
              'email': str(i.email),
              'qualification': str(i.qualification),
              }
        mdata.append(data)
        print(mdata)
    return JsonResponse({"status":"ok","data":mdata})




def viewchat(request):
    print(request.POST)
    fromid = request.POST['from_id']
    toid=request.POST['to_id']
    ob1 = chat_table.objects.filter(from_id__id=fromid, to_id__id=toid)
    ob2 = chat_table.objects.filter(from_id__id=toid, to_id__id=fromid)
    combined_chat = ob1.union(ob2)
    combined_chat = combined_chat.order_by('id')
    res = []
    for i in combined_chat:
        res.append({'msg': i.message, 'fromid': i.from_id.id, 'toid': i.to_id.id, 'date':i.date})
    return JsonResponse({"status": "ok", "data": res})


def sendchat(request):
    from datetime import datetime
    print(request.POST)
    msg=request.POST['message']
    fromid=request.POST['fromid']
    toid=request.POST['toid']
    ob=chat_table()
    ob.message=msg
    ob.from_id=Login_table.objects.get(id=fromid)
    ob.to_id=Login_table.objects.get(id=toid)
    ob.date=datetime.now().date()
    ob.time=datetime.now().time()
    ob.save()
    return JsonResponse({"status": "ok"})

def user_view_doubt_reply(request):
    id = request.POST['lid']
    ob = user_table.objects.get(LOGIN_ID=id)
    ob1 = doubt_table.objects.filter(user_id=ob)
    mdata = []
    for i in ob1:
        data = {
            'id': i.id,
            'expert_name': i.expert_id.firstname+i.expert_id.lastname,
            'date': i.date,
            'doubt': i.doubt,
            'reply': i.reply
        }
        mdata.append(data)
    print(mdata,"+++++++++++++++++++++++++++++++++++++++++++++++++++")
    return JsonResponse({"status": "ok", "data": mdata})

def askDoubt(request):
    from datetime import datetime
    expert_id = request.POST['expert_id']
    lid = request.POST['lid']


    doubt = request.POST['doubt']
    expert = expert_table.objects.get(LOGIN_ID=expert_id)
    user = user_table.objects.get(LOGIN_ID=lid)

    ob = doubt_table()
    ob.doubt = doubt
    ob.user_id = user
    ob.expert_id = expert
    ob.date = datetime.today()
    ob.reply = "pending"
    ob.save()
    return JsonResponse({"status": "ok"})

def deletedoubt(request):
    doubt_id = request.POST['doubt_id']
    doubt = doubt_table.objects.get(id=doubt_id)
    doubt.delete()
    return JsonResponse({"status": "ok"})



def manageSavings(request):
    lid = request.POST['lid']
    user = user_table.objects.get(LOGIN_ID=lid)
    expense = Savings.objects.filter(user_id=user).order_by('-id')
    data = []
    for i in expense:
        data.append({
            'id':i.id,
            'date':i.date,
            'bank':i.bank,
            'category':i.category,
            'amount':i.amount,
            'details':i.details,
        })

    return JsonResponse({'status':'ok','data':data})



def user_view_expenses(request):
    lid = request.POST['lid']
    user = user_table.objects.get(LOGIN_ID=lid)
    expense = expenses.objects.filter(user_id=user).order_by('-id')
    data = []
    for i in expense:
        data.append({
            'id':i.id,
            'date':i.date,
            'category':i.category,
            'amount':i.amount,
            'bank':i.bank,
            'details':i.details,
        })
    return JsonResponse({'status':'ok','data':data})


def user_view_expenses1(request):
    lid = request.POST['lid']
    user = user_table.objects.get(LOGIN_ID=lid)
    expense = expenses.objects.filter(user_id=user,date=datetime.today()).order_by('-id')
    data = []
    for i in expense:
        data.append({
            'id':i.id,
            'date':i.date,
            'category':i.category,
            'amount':i.amount,
            'bank':i.bank,
            'details':i.details,
        })
    return JsonResponse({'status':'ok','data':data})




def user_view_bankdetails(request):
    lid = request.POST['lid']
    user = user_table.objects.get(LOGIN_ID=lid)
    expense = bank_details.objects.filter(user_id=user).order_by('-id')
    data = []
    for i in expense:
        data.append({
            'id':i.id,
            'accno':i.acc_no,
            'ifsc':i.Ifsc_code,
            'bank':i.Bank_name,
        })
    # data.append({
    #     'id': 0,
    #     'accno':"",
    #     'ifsc': "",
    #     'bank': "Cash",
    # })
    return JsonResponse({'status':'ok','data':data})


def user_view_bank(request):
    lid=request.POST['lid']
    a=bank_details.objects.filter(user_id__LOGIN_ID_id=lid)
    l=[]
    for i in a:
        l.append({'id':i.id,'Bank_name':i.Bank_name})
    l.append({
        'id': 0,

        'Bank_name': "Cash",
    })
    print(l)
    return JsonResponse({'status': 'ok','data':l})





from datetime import datetime
from django.http import JsonResponse
from .models import user_table, bank_details, expenses


def user_insert_expense(request):
    lid = request.POST['lid']
    user = user_table.objects.get(LOGIN_ID=lid)

    category = request.POST['category']
    amount = int(request.POST['amount'])  # Ensure amount is an integer
    details = request.POST['details']
    bank = request.POST['bank']

    print(request.POST)
    # Retrieve the bank details
    # try:
    #     bank_details_instance = bank_details.objects.get(id=bank)
    # except bank_details.DoesNotExist:
    #     return JsonResponse({'status': 'error', 'message': 'Bank details not found.'})

    # Check if the bank has enough funds before adding the expense
    # if bank_details_instance.total_amount < amount:
    #     # If the amount is greater than the total amount, show an error
    #     return JsonResponse({'status': 'error', 'message': 'Insufficient balance in the bank account.'})

    # Create a new expense entry if there is enough balance
    if bank!="Cash":
        ob=bank_details.objects.get(user_id__LOGIN_ID__id=lid,Bank_name=bank)
        amt=ob.total_amount

        if amt<amount:
            return JsonResponse({'status': 'invalid', 'message': 'No balance.'})

    lob = expenses()
    lob.user_id = user
    lob.date = datetime.now()
    lob.category = category
    lob.bank = bank
    lob.amount = amount
    lob.details = details
    lob.save()

    if bank!="Cash":
        ob=bank_details.objects.get(user_id__LOGIN_ID__id=lid,Bank_name=bank)
        ob.total_amount-=int(amount)
        ob.save()

    return JsonResponse({'status': 'ok', 'message': 'Expense added successfully and total amount updated.'})


# def user_insert_saving(request):
#     from datetime import datetime
#     lid = request.POST['lid']
#     user = user_table.objects.get(LOGIN_ID=lid)
#     amount = request.POST['amount']
#     details = request.POST['details']
#     bank = request.POST['bank']
#     lob = Savings()
#     lob.user_id = user
#     lob.date = datetime.now()
#     lob.amount = amount
#     lob.bank = bank_details.objects.get(id=bank)
#     lob.details = details
#     lob.save()
#     return JsonResponse({'status': 'ok'})




from datetime import datetime
from django.http import JsonResponse
from .models import user_table, bank_details, Savings

def user_insert_saving(request):
    print(request.POST)
    lid = request.POST['lid']
    user = user_table.objects.get(LOGIN_ID=lid)
    amount = int(request.POST['amount'])  # Ensure amount is an integer
    details = request.POST['details']
    category = request.POST['category']
    bank = request.POST['bank']

    # Retrieve the bank details
    # try:
    #     bank_details_instance = bank_details.objects.get(id=bank)
    # except bank_details.DoesNotExist:
    #     return JsonResponse({'status': 'error', 'message': 'Bank details not found.'})

    # Create a new saving entry

    lob = Savings()
    lob.category = category
    lob.user_id = user
    lob.date = datetime.now()
    lob.amount = amount
    lob.bank = bank
    lob.details = details
    lob.save()
    if bank!='Cash':
        ob = bank_details.objects.get(user_id__LOGIN_ID__id=lid, Bank_name=bank)
        ob.total_amount += int(amount)
        ob.save()

    return JsonResponse({'status': 'ok', 'message': 'Saving added successfully and total amount updated.'})


def user_delete_saving(request):
    id = request.POST['id']
    exp = Savings.objects.get(id=id)
    bank=exp.bank
    lid=exp.user_id.LOGIN_ID.id
    amount=exp.amount
    if bank!="Cash":
        ob=bank_details.objects.get(user_id__LOGIN_ID__id=lid,Bank_name=bank)
        ob.total_amount-=int(amount)
        ob.save()

    exp.delete()

    return JsonResponse({'status': 'ok'})


def user_delete_expense(request):
    id = request.POST['id']
    exp = expenses.objects.get(id=id)
    exp.delete()
    return JsonResponse({'status': 'ok'})



def user_delete_bankdetails(request):
    id = request.POST['eid']
    exp=bank_details.objects.get(id=id)
    exp.delete()
    return JsonResponse({'status': 'ok'})


def user_edit_expense(request):

    print(request.POST)
    expense_id = request.POST['expense_id']
    category = request.POST['category']
    amount = request.POST['amount']
    details = request.POST['details']
    exp = expenses.objects.get(id=expense_id)
    pexp = exp.amount
    pb = exp.bank
    uid=exp.user_id.id

    dif=pexp-int(amount)
    if pb!="Cash":
        ob=bank_details.objects.get(user_id__id=uid,Bank_name=pb)
        ob.total_amount+=int(dif)
        ob.save()
    if details == '':

        exp = expenses.objects.get(id=expense_id)

        exp.category = category
        exp.amount = amount

        exp.save()
        return JsonResponse({'status':'ok','message':'Expense Updated Successfully'})
    else:
        exp = expenses.objects.get(id=expense_id)
        exp.category = category
        exp.amount = amount
        exp.details = details
        exp.save()
        return JsonResponse({'status': 'ok', 'message': 'Expense Updated Successfully'})


def user_edit_savings(request):
    print(request.POST)
    expense_id = request.POST['expense_id']
    amount = request.POST['amount']
    details = request.POST['details']



    exp = Savings.objects.get(id=expense_id)

    pexp = exp.amount
    pb = exp.bank
    uid = exp.user_id.id

    dif = pexp - int(amount)
    if pb != "Cash":
        ob = bank_details.objects.get(user_id__id=uid, Bank_name=pb)
        ob.total_amount -= int(dif)
        ob.save()


    exp.amount = amount
    exp.details = details
    exp.save()
    return JsonResponse({'status':'ok','message':'Expense Updated Successfully'})




def daily_savingss(request):
    lid = request.POST['lid']
    d=datetime.today()
    user = user_table.objects.get(LOGIN_ID=lid)
    expense = Savings.objects.filter(user_id=user, ).order_by('-id')
    # expense = Savings.objects.filter(user_id=user,date=d).order_by('-id')
    data = []
    for i in expense:
        data.append({
            'id':i.id,
            'date':i.date,
            'amount':i.amount,
            'details':i.details,
        })

    return JsonResponse({'status':'ok','data':data})


def find_dates_between(start_date, end_date):
    # Convert to datetime objects if not already
    if isinstance(start_date, str):
        start_date = datetime.strptime(start_date, "%Y-%m-%d")
    if isinstance(end_date, str):
        end_date = datetime.strptime(end_date, "%Y-%m-%d")

    # List to store dates
    all_dates = []
    current_date = start_date
    while current_date <= end_date:
        all_dates.append(current_date.strftime("%Y-%m-%d"))
        current_date += timedelta(days=1)

    return all_dates
from datetime import  timedelta
# def forecasting_code(x,y):
#     import numpy as np
#     print(x,y)
#     from sklearn.ensemble import RandomForestRegressor
#     from sklearn.model_selection import train_test_split
#     from sklearn.metrics import mean_squared_error, r2_score
#
#     # Sample Dataset: Features (X) and Target (y)
#     X = np.array(x)
#     y = np.array(y)
#
#     # Split the dataset into training and testing sets
#     X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)
#
#     # Create and train the Random Forest Regressor
#     model = RandomForestRegressor(n_estimators=1, random_state=42)
#     model.fit(x, y)
#
#     # Make predictions
#     y_pred = model.predict(X_test)
#
#     # Evaluate the model
#     mse = mean_squared_error(y_test, y_pred)
#     r2 = r2_score(y_test, y_pred)
#
#     # print(f"Mean Squared Error: {mse}")
#     # print(f"R² Score: {r2}")
#     result=[]
#     for i in range(len(x),len(x)+8):
#         # Example prediction
#         example_input = np.array([[i]])
#         example_prediction = model.predict(example_input)
#         result.append(example_prediction[0])
#         # print(f"Prediction for input {example_input.flatten()[0]}: {example_prediction[0]}")
#     return result
def forecasting_code(x, y):
    import numpy as np
    print(x, y)
    import pandas as pd
    from statsmodels.tsa.arima.model import ARIMA
    from datetime import timedelta

    # Convert x to a pandas DateTime index if it represents time (e.g., days)
    # Here x should be numeric and represents sequential time points like [1, 2, 3, ...]
    dates = pd.date_range(start='2023-01-01', periods=len(x), freq='D')  # Adjust start date if necessary
    data = pd.Series(y, index=dates)

    # Train ARIMA model
    model = ARIMA(data, order=(5, 1, 0))  # ARIMA(p, d, q) parameters can be adjusted
    model_fit = model.fit()

    # Predict the next 7 days
    forecast = model_fit.forecast(steps=7)

    # Generate future dates for the next 7 days
    last_date = data.index[-1]  # Get the last date from the data
    future_dates = [last_date + timedelta(days=i) for i in range(1, 8)]  # Next 7 days

    # Return predicted values for the next 7 days as a list
    result = list(forecast)

    # Optionally, return the forecasted values with corresponding future dates
    forecast_df = pd.DataFrame({
        'date': future_dates,
        'predicted_value': forecast
    })

    print(forecast_df)  # Print the forecasted values with dates
    for i in range(0,len(forecast_df)):
        if result[i]<0:
            result[i]=0.0
        result[i]=round(result[i],2)
    return result  # Return the forecasted values for the next 7 days



# 8.31====

# def forecasting_fn(request):
#     try:
#
#         lid = request.POST['lid']
#
#         # a=parent_table.objects.get(LOGIN_ID_id=lid)
#         # c=a.STUDENT.LOGIN_ID.id
#         # print(c)
#         #
#         # aa=parent_table.objects.get(LOGIN_ID_id=lid)
#
#         print(lid,'loginn')
#     except:
#         lid=request.GET['lid']
#         print(lid,'loginn')
#
#     obe=expenses.objects.filter(user_id__LOGIN_ID__id=lid).order_by('date')
#     obs=Savings.objects.filter(user_id__LOGIN_ID__id=lid).order_by('date')
#
#     mind_exp=str(obe[0].date)
#     max_exp=datetime.now().strftime("%Y-%m-%d")
#     alldates=find_dates_between(mind_exp,max_exp)
#     res=[]
#
#     data=[]
#     x=1
#     for i in alldates:
#         ob=expenses.objects.filter(user_id__LOGIN_ID__id=lid,date=i)
#         sum=0
#         for j in ob:
#             sum+=j.amount
#         res.append(sum)
#         data.append([x])
#         x=x+1
#     exp_res=forecasting_code(data,res)
#
#     obs = Savings.objects.filter(user_id__LOGIN_ID__id=lid).order_by('date')
#
#     mind_exp = str(obs[0].date)
#     max_exp = datetime.now().strftime("%Y-%m-%d")
#     alldates = find_dates_between(mind_exp, max_exp)
#     res = []
#
#     data = []
#     x = 1
#     for i in alldates:
#         ob = Savings.objects.filter(user_id__LOGIN_ID__id=lid, date=i)
#         sum = 0
#         for j in ob:
#             sum += j.amount
#         res.append(sum)
#         data.append([x])
#         x = x + 1
#     sav_res = forecasting_code(data, res)
#     print(sav_res)
#     print(exp_res)
#     return render(request,"forecast.html",{'status':'ok',"exp":exp_res,"sav":sav_res})
#     return JsonResponse({'status':'ok','data':{"exp":exp_res,"sav":sav_res}})






def forecasting_fn(request):
    try:

        lid = request.POST['lid']
        # Get the parent record using the parent login ID (lid)
        parent = parent_table.objects.get(LOGIN_ID_id=lid)

        # Retrieve the associated student using the parent record
        student = parent.STUDENT

        # Now get the student’s LOGIN_ID
        student_lid = student.LOGIN_ID.id

        print(student_lid, 'Student Login ID')

    except:
        lid = request.GET['lid']
        parent = parent_table.objects.filter(LOGIN_ID_id=lid)
        if len(parent)>0:
            student = parent[0].STUDENT
            student_lid = student.LOGIN_ID.id
        else:
            student_lid=lid
        print(student_lid, 'Student Login ID')
    ob=expenses.objects.filter(user_id__LOGIN_ID__id=student_lid)
    category_det=["All"]
    request.session['student_lid']=student_lid

    for i in ob:
        if i.category not in category_det:
            category_det.append(i.category)

    obe = expenses.objects.filter(user_id__LOGIN_ID__id=student_lid).order_by('date')
    obs = Savings.objects.filter(user_id__LOGIN_ID__id=student_lid).order_by('date')

    mind_exp = str(obe[0].date)
    max_exp = datetime.now().strftime("%Y-%m-%d")
    alldates = find_dates_between(mind_exp, max_exp)

    res = []
    data = []
    x = 1
    for i in alldates:
        ob = expenses.objects.filter(user_id__LOGIN_ID__id=student_lid, date=i)
        total_exp = 0
        for j in ob:
            total_exp += j.amount
        res.append(total_exp)
        data.append([x])
        x += 1
    exp_res = forecasting_code(data, res)

    mind_sav = mind_exp#str(obs[0].date)
    max_sav = max_exp#datetime.now().strftime("%Y-%m-%d")
    alldates = find_dates_between(mind_sav, max_sav)

    res = []
    data = []
    x = 1
    for i in alldates:
        ob = Savings.objects.filter(user_id__LOGIN_ID__id=student_lid, date=i)
        total_sav = 0
        for j in ob:
            total_sav += j.amount
        res.append(total_sav)
        data.append([x])
        x += 1
    sav_res = forecasting_code(data, res)

    print(sav_res)
    print(exp_res)

    # Return the result as a rendered response
    return render(request, "forecast.html", {'status': 'ok', "exp": exp_res, "sav": sav_res,"cat":category_det})

    # Optionally, you could also return a JsonResponse:
    # return JsonResponse({'status': 'ok', 'data': {"exp": exp_res, "sav": sav_res}})


def forecasting_fn1(request):
    student_lid=request.session['student_lid']
    ob=expenses.objects.filter(user_id__LOGIN_ID__id=student_lid)
    category_det=["All"]
    scat=request.POST['cat']

    for i in ob:
        if i.category not in category_det:
            category_det.append(i.category)

    obe = expenses.objects.filter(user_id__LOGIN_ID__id=student_lid).order_by('date')
    obs = Savings.objects.filter(user_id__LOGIN_ID__id=student_lid).order_by('date')

    mind_exp = str(obe[0].date)
    max_exp = datetime.now().strftime("%Y-%m-%d")
    alldates = find_dates_between(mind_exp, max_exp)

    res = []
    data = []
    x = 1
    print(scat,"=======================")
    print(scat,"=======================")
    for i in alldates:
        ob = expenses.objects.filter(user_id__LOGIN_ID__id=student_lid, date=i,category=scat)
        total_exp = 0
        for j in ob:
            total_exp += j.amount
        res.append(total_exp)
        data.append([x])
        x += 1
    exp_res = forecasting_code(data, res)

    mind_sav = mind_exp#str(obs[0].date)
    max_sav = max_exp#datetime.now().strftime("%Y-%m-%d")
    alldates = find_dates_between(mind_sav, max_sav)

    res = []
    data = []
    x = 1
    for i in alldates:
        ob = Savings.objects.filter(user_id__LOGIN_ID__id=student_lid, date=i)
        total_sav = 0
        for j in ob:
            total_sav += j.amount
        res.append(total_sav)
        data.append([x])
        x += 1
    sav_res = forecasting_code(data, res)

    print(sav_res)
    print(exp_res)

    # Return the result as a rendered response
    return render(request, "forecast.html", {'status': 'ok', "exp": exp_res, "sav": sav_res,"cat":category_det,"scat":scat})



def user_insert_bank_details(request):


    lid = request.POST['lid']
    user = user_table.objects.get(LOGIN_ID=lid)
    accno = request.POST['acc']
    ifscode = request.POST['ifsc']
    bankname = request.POST['bank']
    amount = request.POST['total_amount']


    cc=bank_details.objects.filter(user_id__LOGIN_ID_id=lid,acc_no=accno,Ifsc_code=ifscode,Bank_name=bankname)
    if cc.exists():
        return JsonResponse({'status': 'notok'})

    lob = bank_details()
    print(lob)
    lob.total_amount = amount
    lob.user_id = user
    lob.acc_no = accno
    lob.Ifsc_code = ifscode
    lob.Bank_name = bankname
    lob.save()
    return JsonResponse({'status': 'ok'})

banknamelist = ['KGB', 'SBI']

# Print the updated list
print(banknamelist)

creditlist=[['Dear Customer, Account XXXX','Your a/c XXXX','After debit of Rs '],['Dear SBI User, your A/c X']]
debitlist=[['Your a/c no. XXXX'],['Dear UPI user A/C X']]

def read_message(request):
    lid = request.POST['lid']
    msg = request.POST['msg']
    print(msg)
    user = user_table.objects.get(LOGIN_ID=lid)


    lob = bank_details.objects.filter(user_id__id = user.id)
    bn=lob[0].Bank_name.upper()
    ind=banknamelist.index(bn)
    cl=creditlist[ind]
    dl=debitlist[ind]
    for i in dl:
        print(i,"===========")
        if msg.startswith(i):
            print(True)
            try:
                if 'debited' in msg:
                    try:
                        print(msg.split('Rs.'))
                        amt=msg.split('Rs.')[1].split(' ')[0].split(".")[0]
                        ob=expenses()
                        ob.user_id = user
                        ob.date = datetime.today()
                        ob.category = 'Category'
                        ob.amount = amt
                        ob.bank=bn
                        ob.details = 'bank transfer'
                        ob.save()
                        ob = bank_details.objects.get(user_id__LOGIN_ID__id=lid, Bank_name=bn)
                        ob.total_amount -= int(msg.split('Rs.')[1].split(' ')[0].split('.')[0])
                        ob.save()
                        return JsonResponse({"task":"ok"})
                    except:
                        print(msg.split('debited by '))
                        amt = msg.split('debited by ')[1].split(' ')[0].split(".")[0]
                        ob = expenses()
                        ob.user_id = user
                        ob.date = datetime.today()
                        ob.category = 'Category'
                        ob.amount = amt
                        ob.bank = bn
                        ob.details = 'bank transfer'
                        ob.save()
                        ob = bank_details.objects.get(user_id__LOGIN_ID__id=lid, Bank_name=bn)
                        ob.total_amount -= int(msg.split('Rs.')[1].split(' ')[0].split('.')[0])
                        ob.save()
                        return JsonResponse({"task": "ok"})

            #

            except Exception as e:
                print(e)
    for i in cl:
        print(i)
        if msg.startswith(i):
            try:
                print("----------------------------")
                if 'credited' in msg:
                    try:
                        print("1111111111111111111111")
                        amt = msg.split('Rs.')[1].split(' ')[0].split(".")[0]
                        ob = Savings()
                        ob.user_id =user
                        ob.date = datetime.today()
                        ob.amount =amt
                        ob.bank=bn
                        ob.details ="bank transfer"
                        ob.save()
                        ob = bank_details.objects.get(user_id__LOGIN_ID__id=lid, Bank_name=bn)
                        ob.total_amount += int(msg.split('Rs.')[1].split(' ')[0].split('.')[0])
                        ob.save()
                        return JsonResponse({"task": "ok"})
                    except Exception as e:
                        print(e)
                        try:
                            print("2222222222222222222")
                            amt = msg.split('INR ')[1].split(' ')[0].split(".")[0]
                            ob = Savings()
                            ob.user_id = user
                            ob.date = datetime.today()
                            ob.amount = amt
                            ob.category = "Category"
                            ob.bank = bn
                            ob.details = "bank transfer"
                            ob.save()
                            ob = bank_details.objects.get(user_id__LOGIN_ID__id=lid, Bank_name=bn)
                            ob.total_amount += int(msg.split('INR ')[1].split(' ')[0].split('.')[0])
                            ob.save()
                            return JsonResponse({"task": "ok"})
                        except Exception as e:
                            print(e)

            except Exception as e:
                print(e)
    return JsonResponse({'status': 'ok'})


def report_page(request):
    lid = request.POST['lid']
    d=datetime.today()
    user = user_table.objects.get(LOGIN_ID=lid)
    savings = Savings.objects.filter(user_id=user, ).order_by('-id')
    expense = expenses.objects.filter(user_id=user, ).order_by('-id')
    # expense = Savings.objects.filter(user_id=user,date=d).order_by('-id')
    data = []
    for i in expense:
        data.append({
            'id':i.id,
            'date':i.date,
            'amount':i.amount,
            'details':i.details,
            "type":"Expence"
        })
    for i in savings:
        data.append({
            'id':i.id,
            'date':i.date,
            'amount':i.amount,
            'details':i.details,
            "type":"Savings"
        })
    sorted_data = sorted(data, key=lambda x: x['date'])
    return JsonResponse({'status':'ok','data':sorted_data})
# ========================================================

def parent_view_expenses(request):
    lid = request.POST['lid']
    parent = parent_table.objects.get(LOGIN_ID=lid)
    child = parent.STUDENT
    expense = expenses.objects.filter(user_id=child).order_by('-id')
    data = []
    for i in expense:
        data.append({
            'id': i.id,
            'date': i.date,
            'category': i.category,
            'amount': i.amount,
            'bank': i.bank,
            'details': i.details,
        })

    return JsonResponse({'status': 'ok', 'data': data})


def parent_view_doubt_reply(request):
    id = request.POST['lid']
    ob = parent_table.objects.get(LOGIN_ID=id)
    ob1 = parent_doubt_table.objects.filter(parent_id=ob)
    mdata = []
    for i in ob1:
        data = {
            'id': i.id,
            'expert_name': i.expert_id.firstname+i.expert_id.lastname,
            'date': i.date,
            'doubt': i.doubt,
            'reply': i.reply
        }
        mdata.append(data)
    print(mdata,"+++++++++++++++++++++++++++++++++++++++++++++++++++")
    return JsonResponse({"status": "ok", "data": mdata})

def parentaskDoubt(request):
    from datetime import datetime
    expert_id = request.POST['expert_id']
    lid = request.POST['lid']


    doubt = request.POST['doubt']
    expert = expert_table.objects.get(LOGIN_ID=expert_id)
    user = parent_table.objects.get(LOGIN_ID=lid)

    ob = parent_doubt_table()
    ob.doubt = doubt
    ob.parent_id = user
    ob.expert_id = expert
    ob.date = datetime.today()
    ob.reply = "pending"
    ob.save()
    return JsonResponse({"status": "ok"})

def parentdeletedoubt(request):
    doubt_id = request.POST['doubt_id']
    doubt = parent_doubt_table.objects.get(id=doubt_id)
    doubt.delete()
    return JsonResponse({"status": "ok"})


def parent_manageSavings(request):
    lid = request.POST['lid']
    parent = parent_table.objects.get(LOGIN_ID=lid)
    child = parent.STUDENT
    savings = Savings.objects.filter(user_id=child).order_by('-id')
    data = []
    for i in savings:
        data.append({
            'id': i.id,
            'date': i.date,
            'bank': i.bank,
            'category': i.category,
            'amount': i.amount,
            'details': i.details,
        })

    return JsonResponse({'status': 'ok', 'data': data})


# ===========================================
def p_chatwithuser(request):
    ob = parent_table.objects.all()
    return render(request,"Expert/parent_chat.html",{'val':ob})


@login_required(login_url='/')
def p_chatview(request):
    ob = parent_table.objects.all()
    d=[]
    for i in ob:
        r={"name":i.name,
           # 'photo':i.photo.url,
           'email':i.email,'loginid':i.LOGIN_ID.id}
        d.append(r)
    return JsonResponse(d, safe=False)



@login_required(login_url='/')
def p_coun_insert_chat(request,msg,id):
    from datetime import datetime
    print("===",msg,id)
    ob=chat_table()
    ob.from_id=Login_table.objects.get(id=request.session['lid'])
    ob.to_id=Login_table.objects.get(id=id)
    ob.message=msg
    ob.date=datetime.now().strftime("%Y-%m-%d")
    ob.time=datetime.now()
    ob.save()

    return JsonResponse({"task":"ok"})
    # refresh messages chatlist


@login_required(login_url='/')
def p_coun_msg(request,id):

    ob1=chat_table.objects.filter(from_id__id=id,to_id__id=request.session['lid'])
    ob2=chat_table.objects.filter(from_id__id=request.session['lid'],to_id__id=id)
    combined_chat = ob1.union(ob2)
    combined_chat=combined_chat.order_by('id')
    res=[]
    for i in combined_chat:
        res.append({"from_id":i.from_id.id,"msg":i.message,"date":i.date,"chat_id":i.id})

    obu=parent_table.objects.get(LOGIN_ID__id=id)


    return JsonResponse({"data":res,"name":obu.name,
                         # "photo":obu.photo.url,
                         "user_lid":obu.LOGIN_ID.id})







def parentregistrationcode(request):
    try:
        print(request.POST, "uuuki")
        fname = request.POST['fname']
        place = request.POST['place']
        email = request.POST['email']
        phone = request.POST['phone']
        uname = request.POST['username']
        password = request.POST['password']
        student_id = request.POST['student']  # Retrieve student ID as a string

        # Fetch the user_table instance using the provided student ID
        student_instance = user_table.objects.get(id=student_id)

        # Create a login entry
        lob1 = Login_table()
        lob1.username = uname
        lob1.password = password
        lob1.type = 'parent'
        lob1.save()

        # Create a parent_table entry
        lob = parent_table()
        lob.name = fname
        lob.place = place
        lob.phone = phone
        lob.email = email
        lob.STUDENT = student_instance  # Assign the user_table instance
        lob.LOGIN_ID = lob1
        lob.save()

        print("Saved parent entry:", lob)
        return JsonResponse({'task': 'valid'})
    except user_table.DoesNotExist:
        return JsonResponse({"task": "invalid", "error": "Student not found"})
    except Exception as e:
        print(e)
        return JsonResponse({"task": "invalid", "error": str(e)})


def get_students(request):
    try:
        students = user_table.objects.all().values('id', 'fname', 'lname')
        student_list = [{'id': s['id'], 'name': f"{s['fname']} {s['lname']}"} for s in students]
        return JsonResponse({'students': student_list})
    except Exception as e:
        print(e)
        return JsonResponse({'error': 'Unable to fetch students'})

def and_change_password_post(request):
        current_password = request.POST['old']
        new_password = request.POST['new']
        confirm_password = request.POST['confirm']

        ob = Login_table.objects.filter(password=current_password)
        if ob.exists():
            if new_password == confirm_password:
                ob1 = Login_table.objects.filter(password=current_password).update(password=new_password)
                return JsonResponse({'status': 'ok'})
            else:
                return JsonResponse({'status': 'not ok'})
        else:
            return JsonResponse({'status': 'not ok'})


def parent_change_password_post(request):
    current_password = request.POST['old']
    new_password = request.POST['new']
    confirm_password = request.POST['confirm']

    ob = Login_table.objects.filter(password=current_password)
    if ob.exists():
        if new_password == confirm_password:
            ob1 = Login_table.objects.filter(password=current_password).update(password=new_password)
            return JsonResponse({'status': 'ok'})
        else:
            return JsonResponse({'status': 'not ok'})
    else:
        return JsonResponse({'status': 'not ok'})



def expert_change_password(request):
    return render(request,'expert/change pss (1).html')

def expert_change_password_post(request):
        current_password = request.POST['textfield']
        new_password = request.POST['textfield2']
        confirm_password = request.POST['textfield3']

        ob = Login_table.objects.filter(password=current_password)
        print(ob, "==================")
        if len(ob) != 0:
            if new_password == confirm_password:
                ob = Login_table.objects.get(password=current_password)
                ob.password = new_password
                ob.save()
                return HttpResponse('''<script>alert(" Password updated..");window.location="/expert_home"</script>''')
            else:
                return HttpResponse('''<script>alert(" Password missmatch..");window.location="/expert_home"</script>''')


        else:
            return HttpResponse('''<script>alert(" Invalid password..");window.location="/expert_home"</script>''')

import json
# import google.generativeai as genai
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt

# Configure Google Gemini API
GOOGLE_API_KEY = 'AIzaSyB_G0I9odde2-IwZHB1EgHGmBTKaFvSf6Y'  # Replace with your actual API key
# genai.configure(api_key=GOOGLE_API_KEY)

# Initialize Gemini Model
# model = genai.GenerativeModel('gemini-1.5-flash')

@csrf_exempt  # Allows POST requests without CSRF token (Only for testing, secure in production)
def chatbot_response(request):
    """
    Handles user input and generates a response from the Gemini API.
    """
    if request.method == 'POST':
        try:
            # Parse JSON request body
            data = json.loads(request.body)
            user_message = data.get('message', '').strip()

            if not user_message:
                return JsonResponse({'response': 'Please enter a valid question.'})

            # Generate response from Gemini
            gemini_response = model.generate_content(user_message)

            # Ensure response is always JSON formatted
            return JsonResponse({'response': gemini_response.text.strip()})

        except json.JSONDecodeError:
            return JsonResponse({'response': 'Invalid JSON format.'}, status=400)
        except Exception as e:
            return JsonResponse({'response': f'Error: {str(e)}'}, status=500)

    return JsonResponse({'response': 'Invalid request method. Use POST.'}, status=405)