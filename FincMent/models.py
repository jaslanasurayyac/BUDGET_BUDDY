from django.db import models
from datetime import datetime
# Create your models here.
class Login_table(models.Model):
    username = models.CharField(max_length=100)
    password = models.CharField(max_length=100)
    type = models.CharField(max_length=100)

class user_table(models.Model):
    LOGIN_ID = models.ForeignKey( Login_table,on_delete=models.CASCADE)
    fname = models.CharField(max_length=100)
    lname = models.CharField(max_length=100)
    gender = models.CharField(max_length=100)
    photo = models.FileField()
    place = models.CharField(max_length=100)
    phone = models.BigIntegerField()
    email = models.CharField(max_length=50)


class parent_table(models.Model):
    LOGIN_ID = models.ForeignKey( Login_table,on_delete=models.CASCADE)
    STUDENT = models.ForeignKey( user_table,on_delete=models.CASCADE)
    place = models.CharField(max_length=100)
    name = models.CharField(max_length=100)
    phone = models.BigIntegerField()
    email = models.CharField(max_length=50)


class expert_table(models.Model):
    LOGIN_ID = models.ForeignKey( Login_table,on_delete=models.CASCADE)
    firstname = models.CharField(max_length=100)
    lastname = models.CharField(max_length=100)
    dob = models.DateField()
    gender = models.CharField(max_length=100)
    photo = models.FileField()
    place = models.CharField(max_length=100)
    post = models.CharField(max_length=100)
    phone = models.BigIntegerField()
    email = models.EmailField()
    qualification = models.CharField(max_length = 100)
    idproof =  models.FileField()


class chat_table(models.Model):
    from_id = models.ForeignKey(Login_table,on_delete=models.CASCADE,related_name="aa")
    to_id = models.ForeignKey(Login_table,on_delete=models.CASCADE,related_name="bb")
    message = models.CharField(max_length=100)
    date = models.DateField()
    time = models.TimeField()


class doubt_table(models.Model):
    expert_id = models.ForeignKey(expert_table,on_delete=models.CASCADE)
    user_id = models.ForeignKey(user_table,on_delete=models.CASCADE)
    doubt = models.CharField(max_length=200)
    date = models.DateField()
    reply = models.CharField(max_length=200)


class transactions(models.Model):
    user_id = models.ForeignKey(user_table,on_delete=models.CASCADE)
    account_id = models.BigIntegerField()
    date = models.DateTimeField()
    amount = models.FloatField()
    category = models.CharField(max_length=50)
    details = models.TextField()


class bank_details(models.Model):
    user_id = models.ForeignKey(user_table,on_delete=models.CASCADE)
    acc_no = models.BigIntegerField()
    Ifsc_code = models.CharField(max_length=100)
    Bank_name = models.CharField(max_length=200)
    # total_amount = models.BigIntegerField()
    total_amount = models.FloatField()


class expenses(models.Model):
    user_id = models.ForeignKey(user_table, on_delete=models.CASCADE)
    bank = models.CharField(max_length=500)
    time = models.TimeField(default= datetime.now().time())
    date = models.DateField()
    category = models.CharField(max_length=200)
    amount = models.BigIntegerField()
    details = models.CharField(max_length=200)

class Savings(models.Model):
    user_id = models.ForeignKey(user_table,on_delete=models.CASCADE)
    bank = models.CharField(max_length=500)
    category = models.CharField(max_length=100)
    date = models.DateField()
    time = models.TimeField(default= datetime.now().time())
    amount = models.BigIntegerField()
    details = models.CharField(max_length=200)

class Complaint(models.Model):
    user_id = models.ForeignKey(user_table,on_delete=models.CASCADE)
    date = models.DateField()
    complaint = models.CharField(max_length=200)
    Reply= models.CharField(max_length=500)

class feedback(models.Model):
    user_id = models.ForeignKey(user_table,on_delete=models.CASCADE)
    date = models.DateTimeField()
    Rating = models.FloatField()
    review = models.CharField(max_length=300)

class expert_review(models.Model):
    user_id = models.ForeignKey(user_table,on_delete=models.CASCADE)
    EXPERT = models.ForeignKey(expert_table,on_delete=models.CASCADE)
    rating = models.FloatField()
    review = models.CharField(max_length=300)
    date = models.DateField()

class tip(models.Model):
    tips = models.CharField(max_length=200)
    expert_id = models.ForeignKey(expert_table,on_delete=models.CASCADE)
    date = models.DateField(auto_now_add=True)
    details = models.CharField(max_length=200)

class parent_doubt_table(models.Model):
    expert_id = models.ForeignKey(expert_table,on_delete=models.CASCADE)
    parent_id = models.ForeignKey(parent_table,on_delete=models.CASCADE)
    doubt = models.CharField(max_length=200)
    date = models.DateField()
    reply = models.CharField(max_length=200)