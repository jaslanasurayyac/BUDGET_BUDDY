from django.contrib import admin
from django.urls import path, include

from FincMent import views

urlpatterns = [


    path('', views.login),
    path('logincode', views.logincode),
    path('forgotpassword', views.forgotpassword),
    path('forgotpassword_post', views.forgotpassword_post),
    path('admin_changepassword', views.admin_changepassword),
    path('admin_change_password_post', views.admin_change_password_post),

    path('expert_registration', views.expert_registration),

    path('home', views.home),

    path('blockExpert', views.blockExpert),
    path('admin_block_expert/<id>', views.admin_block_expert),
    path('admin_unblocked_expert/<id>', views.admin_unblocked_expert),

    path('blockUser', views.blockUser),
    path('blockparent', views.blockparent),
    path('admin_block_user/<int:id>', views.admin_block_user),
    path('admin_block_parent/<int:id>', views.admin_block_parent),
    path('admin_unblocked_user/<int:id>', views.admin_unblocked_user),
    path('admin_unblocked_parent/<int:id>', views.admin_unblocked_parent),

    path('verifyUser', views.verifyUser),

    path('verifyExpert', views.verifyExpert),
    path('verifyExpert_search', views.verifyExpert_search),

    path('viewfeedback', views.viewfeedback),

    path('sendreply/<int:id>', views.sendreply),
    path('sendReply_post', views.sendReply_post),

    path('complaint', views.complaint),
    path('logout', views.logout),

    path('expert_register', views.register),

    path('registercode',views.registercode),

    path('expert_addTips', views.expert_addTips),

    path('expert_doubt', views.expert_doubt),
    path('expert_doubt_search', views.expert_doubt_search),
    path('expert_sendReply_post', views.expert_sendReply_post),

    path('expert_registration', views.expert_registration),

    path('expert_home', views.expert_home),

    path('expert_manageTips', views.expert_manageTips),
    path('expert_manageTips_delete/<id>', views.expert_manageTips_delete),

    path('expert_addTipsPost', views.expert_addTipsPost),
    path('Parent_expert_sendReply_post', views.Parent_expert_sendReply_post),

    path('expert_sendReply/<int:id>', views.expert_sendReply),
    path('parent_expert_sendReply/<int:id>', views.parent_expert_sendReply),
    path('admin_accept_expert/<int:id>', views.admin_accept_expert),
    path('admin_reject_expert/<int:id>', views.admin_reject_expert),

    path('expert_viewProfile', views.expert_viewProfile),
    path('expert_parent_doubt', views.expert_parent_doubt),
    path('expert_parent_doubt_search', views.expert_parent_doubt_search),
    path('viewExpert', views.viewExpert),
    path('viewchat', views.viewchat),
    path('sendchat', views.sendchat),
    path('/get_students', views.get_students),
    path('/parentregistrationcode', views.parentregistrationcode),

    path('expert_viewReview', views.expert_viewReview),
    path('updateprofile', views.updateprofile),
    path('chatwithuser', views.chatwithuser, name='chatwithuser'),
    path('p_chatwithuser', views.p_chatwithuser, name='p_chatwithuser'),
    path('chatview', views.chatview, name='chatview'),
    path('p_chatview', views.p_chatview, name='p_chatview'),
    path('coun_msg/<int:id>', views.coun_msg, name='coun_msg'),
    path('p_coun_msg/<int:id>', views.p_coun_msg, name='p_coun_msg'),
    path('coun_insert_chat/<str:msg>/<int:id>', views.coun_insert_chat, name='coun_insert_chat'),
    path('p_coun_insert_chat/<str:msg>/<int:id>', views.p_coun_insert_chat, name='p_coun_insert_chat'),



    path('logincodeand', views.logincodeand, name='logincodeand'),
    path('/and_change_password_post', views.and_change_password_post, name='and_change_password_post'),
    path('/parent_change_password_post', views.parent_change_password_post, name='parent_change_password_post'),
    path('registrationcode', views.registrationcode, name='registrationcode'),
    path('viewprofile', views.viewprofile, name='viewprofile'),
    path('/edit_profile', views.edit_profile, name='edit_profile'),
    path('viewTips', views.viewTips, name='viewTips'),
    path('/viewReply', views.viewReply),
    path('send_complaint', views.send_complaint ),
    path('addrating',views.addrating ),


    path('/user_view_bankdetails',views.user_view_bankdetails ),
    path('/user_delete_bankdetails',views.user_delete_bankdetails ),
    path('user_view_doubt_reply',views.user_view_doubt_reply ),
    path('askDoubt',views.askDoubt ),
    path('deletedoubt',views.deletedoubt ),
    path('/user_view_expenses',views.user_view_expenses),

    path('/user_insert_expense',views.user_insert_expense ),
    path('/user_view_bank',views.user_view_bank ),

    path('/user_delete_expense',views.user_delete_expense ),
    path('/user_edit_expense',views.user_edit_expense ),
    path('/user_insert_saving',views.user_insert_saving ),
    path('/manageSavings',views.manageSavings ),
    path('/parent_manageSavings',views.parent_manageSavings ),
    path('/user_delete_saving',views.user_delete_saving),
    path('/user_edit_savings',views.user_edit_savings),
    path('daily_savingss',views.daily_savingss),
    path('/user_insert_bank_details',views.user_insert_bank_details),
    path('read_message',views.read_message),
    path('forecasting_fn1',views.forecasting_fn1),
    path('/user_view_expenses1',views.user_view_expenses1),
    path('transaction',views.transaction),
    path('forecasting_fn',views.forecasting_fn),
    path('forgotcode',views.forgotcode),
    path('/parent_view_expenses',views.parent_view_expenses),
    path('parent_view_doubt_reply',views.parent_view_doubt_reply),
    path('parentaskDoubt',views.parentaskDoubt),
    path('parentdeletedoubt',views.parentdeletedoubt),
    path('expert_change_password',views.expert_change_password),
    path('expert_change_password_post',views.expert_change_password_post),
    path('/chatbot_response',views.chatbot_response),



]
