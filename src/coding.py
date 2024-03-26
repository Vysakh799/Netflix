from flask import *
from src.dbconnection import *
app=Flask(__name__)
app.secret_key="123"


import functools

def login_required(func):
    @functools.wraps(func)
    def secure_function():
        if "lid" not in session:
            return render_template('loginindex.html')
        return func()

    return secure_function


@app.route('/logout')
def logout():
    session.clear()
    return redirect('/')




@app.route('/')
def login():
    return render_template('loginindex.html')

@app.route('/login_post',methods=['post'])
def login_post():
    uname=request.form['textfield']
    password=request.form['textfield2']
    qry="SELECT * FROM `login` WHERE `username`=%s AND `password`=%s"
    val=(uname,password)
    res=selectone(qry,val)
    if res is None:
        return '''<script>alert("invalid");window.location="/"</script>'''
    elif res['type']=='admin':
        session['lid']=res['lid']

        return '''<script>alert("welcome");window.location="/admin_funtions"</script>'''
    elif res['type']=='examcell':
        session['lid']=res['lid']

        return '''<script>alert("welcome");window.location="/functions"</script>'''
    elif res['type']=='hod':
        session['lid']=res['lid']
        rr = selectone("SELECT `hod`.*,`department`.`Dept_name` FROM `hod` JOIN `department` ON `department`.`dept_id`=`hod`.`dept_id`  WHERE `lid`=%s",str(res['lid']))
        session['deptid'] = rr['dept_id']
        session['dn'] = rr['Dept_name']


        return '''<script>alert("welcome");window.location="/HOD_functions"</script>'''
    elif res['type']=='student':
        session['un']=res['username']
        session['lid']=res['lid']
        return '''<script>alert("welcome");window.location="/stdhome"</script>'''
    else:
        return '''<script>alert("invalid");window.location="/"</script>'''


@app.route('/admin_funtions')
@login_required
def admin_funtions():
    return render_template('ADMIN/admin funtions.html')

@app.route('/stdhome')
@login_required

def stdhome():
    return render_template('STUDENT/stdindex.html')

@app.route('/viewexamtimetable')
@login_required
def viewexamtimetable():
        qry = "SELECT * FROM `timetable` JOIN `subject` ON timetable.sub_id=`subject`.sub_id  JOIN `student` ON `subject`.dept_id=`student`.dept_id where student.lid=%s"
        res = selectall2(qry,session['lid'])

        return render_template('STUDENT/viewexamtimetable.html', val=res)
@app.route('/viewallocation')
@login_required
def viewallocation():
        qry = "SELECT `student`.`Reg_no`,`subject`.`sub_name`,`timetable`.`time`,`timetable`.`date`,`hall`.`room_no`,`seat_arrangement`.`seat_no` FROM `seat_arrangement` JOIN `student` ON `seat_arrangement`.st_id=`student`.lid JOIN `hall` ON `seat_arrangement`.`hall_id`=`hall`.`hall_id` JOIN `timetable` ON `seat_arrangement`.tid=`timetable`.tid  JOIN `subject` ON `timetable`.`sub_id`=`subject`.`sub_id` WHERE `seat_arrangement`.st_id=%s"
        res = selectall2(qry,session['lid'])
        print(res)
        print(session['lid'])

        return render_template('STUDENT/viewallocation.html', val1=res)

@app.route('/ADD_Dept',methods=['post'])
@login_required
def ADD_Dept():
    qry="select*from department"
    res=selectall(qry)
    return render_template('ADMIN/ADD Dept.html',val3=res)

@app.route('/ADD_Exam_cell',methods=['get'])
@login_required
def ADD_Exam_cell():
    qry="select*from department"
    res=selectall(qry)
    return render_template('ADMIN/ADD Exam cell.html',val=res)

@app.route('/ADD_HOD',methods=['post'])
@login_required
def ADD_HOD():
    qry="select*from department"
    res=selectall(qry)
    return render_template('ADMIN/ADD HOD.html',val2=res)

@app.route('/ADM_Dept')
@login_required
def ADM_Dept():
    qry="select*from department"
    res=selectall(qry)
    return render_template('ADMIN/ADM Dept.html',val3=res)

@app.route('/ADM_Exam_cell')
@login_required
def ADM_Exam_cell():
    qry="SELECT * FROM `examcell` JOIN `department` ON examcell.dept_id=`department`.dept_id "
    res=selectall(qry)
    return render_template('ADMIN/ADM Exam cell.html',val=res)

@app.route('/ADM_HOD')
@login_required
def ADM_HOD():
    qry = "SELECT * FROM `hod` JOIN `department` ON hod.dept_id=`department`.dept_id "
    res = selectall(qry)
    return render_template('ADMIN/ADM HOD.html',val2=res)


@app.route('/view_student')
@login_required
def view_student():
    qry="select*from department"
    res=selectall(qry)
    return render_template('ADMIN/view student.html',val4=res)

@app.route('/view_subject')
@login_required
def view_subject():
    qry="select*from department"
    res=selectall(qry)
    return render_template('ADMIN/view subject.html',val5=res)

@app.route('/Deptedit')
@login_required
def Deptedit():

    id=request.args.get('id')
    session['did']=id
    qry="SELECT * FROM `department` WHERE `dept_id`=%s"
    res=selectone(qry,id)
    return render_template('ADMIN/Deptedit.html',v=res)

@app.route('/editdep',methods=['post'])
@login_required
def editdep():
    deptname=request.form['textfield']
    qry="update department set Dept_name=%s where dept_id=%s"
    val=(deptname,session['did'])
    iud(qry,val)
    return '''<script>alert("Dept Edited");window.location="/ADM_Dept"</script>'''

@app.route('/dletedep',methods=['get'])
@login_required
def dletedep():
    id=request.args.get('id')
    qry="DELETE FROM `department` WHERE `dept_id`=%s"
    iud(qry,id)
    return '''<script>alert("Dept deleted");window.location="/ADM_Dept"</script>'''



@app.route('/Examcelledit')
@login_required
def Examcelledit():
    id=request.args.get('id')
    session['eid']=id
    qry="select * from examcell where eid=%s"
    res1=selectone(qry,id)
    qry1="select * from department"
    res=selectall(qry1)
    return render_template('ADMIN/Examcelledit.html',val7=res,v=res1)


@app.route('/editexamcell',methods=['post'])
@login_required
def editexamcell():
    staff=request.form['textfield']
    dept=request.form['select']
    qry="update examcell set name=%s,dept_id=%s where eid=%s"
    val=(staff,dept,session['eid'])
    iud(qry,val)
    return '''<script>alert("Staff details Edited");window.location="/ADM_Exam_cell"</script>'''

@app.route('/deleteexamcell')

@login_required
def deleteexamcell():
    id=request.args.get('id')
    qry="DELETE FROM login WHERE lid=%s"
    iud(qry,id)
    q="DELETE FROM examcell WHERE lid=%s"
    iud(q,id)
    return '''<script>alert("Staff details deleted");window.location="/ADM_Exam_cell"</script>'''

@app.route('/HODedit')
@login_required
def HODedit():
    id=request.args.get('id')
    session['hid']=id
    qry="select*from hod where hid=%s"
    res=selectone(qry,id)
    qry1="select*from department"
    res1=selectall(qry1)
    return render_template('ADMIN/HODedit.html',val6=res,v=res1)

@app.route('/edithod',methods=['post'])
@login_required
def edithod():
    name=request.form['textfield']
    dept=request.form['select']
    email=request.form['textfield3']
    phno=request.form['textfield4']
    qry="update hod set name=%s,dept_id=%s,emailid=%s,ph_no=%s where hid=%s"
    val=(name,dept,email,phno,session['hid'])
    iud(qry,val)
    return '''<script>alert("HOD details Edited");window.location="/ADM_HOD"</script>'''

@app.route('/deletehod')
@login_required
def deletehod():
    id=request.args.get('id')
    qry="DELETE FROM login WHERE lid=%s"
    iud(qry,id)
    q="DELETE FROM hod WHERE lid=%s"
    iud(q,id)
    return '''<script>alert("HOD deleted");window.location="/ADM_HOD"</script>'''



@app.route('/allotstaff')
@login_required
def allotstaff():
    q="SELECT DISTINCT `date` FROM `timetable` WHERE `date`>CURDATE() "
    q="SELECT DISTINCT `date` FROM `timetable` "
    res=selectall(q)

    return render_template('EXAM CELL/allotstaff1.html',val=res)

@app.route('/allotstaff2',methods=['post'])
@login_required
def allotstaff2():
    date=request.form['select']
    session['d']=date
    q="SELECT * FROM `staff` JOIN `department` ON `department`.`dept_id`=`staff`.`dept_id` WHERE `staff`.`staff_id` NOT IN(SELECT `staff_id` FROM `exam_staff_allocate` WHERE `date`=%s) "
    res=selectall2(q,date)
    qry="SELECT * FROM `hall` WHERE `hall_id` IN(SELECT `hall_id` FROM `seat_arrangement` WHERE `tid` IN(SELECT `tid` FROM `timetable` WHERE `date`=%s))"
    # qry="SELECT * FROM `hall`"
    rr=selectall2(qry,date)
    result=[]
    for i in rr:
        qry="SELECT * FROM `exam_staff_allocate` WHERE `date`=%s AND `hall_id`=%s"
        v=(date,i['hall_id'])
        r=selectall2(qry,v)
        if len(r)<2:
            result.append(i)
    return render_template('EXAM CELL/allotstaff.html',val=res,v=result)


@app.route('/allotstaff1',methods=['post'])
@login_required
def allotstaff1():
    stid=request.form['select']
    hallid=request.form['select2']
    qr="SELECT * FROM `exam_staff_allocate` WHERE `staff_id`=%s and `hall_id`=%s"
    vv=(stid,hallid)
    res=selectone(qr,vv)
    if res is None:
        q="INSERT INTO `exam_staff_allocate` VALUES(NULL,%s,%s,%s)"
        val=(stid,hallid,session['d'])
        iud(q,val)
        return  '''<script>alert("allocated");window.location="/staffallocation"</script>'''
    else:
        return '''<script>alert("already allocated");window.location="/staffallocation"</script>'''


@app.route('/allotstaffedit')
@login_required
def allotstaffedit():
    id = request.args.get('id')
    session['allocate_id'] = id
    qry = "select*from exam_staff_allocate where allocate_id=%s"
    res1 = selectone(qry, id)
    q = "SELECT * FROM `staff`"
    res = selectall(q)
    qry = "SELECT * FROM `hall`"
    rr = selectall(qry)


    return render_template('EXAM CELL/allotstaffedit.html', val=res, v=rr, val1=res1)

@app.route('/editstaffallot',methods=['post'])
@login_required
def editstaffallot():
    name=request.form['select']
    roomno=request.form['select2']
    qry="UPDATE `exam_staff_allocate` SET staff_id=%s,hall_id=%s where allocate_id=%s"
    val=(name,roomno,session['allocate_id'])
    iud(qry,val)
    return '''<script>alert("Staff details editted");window.location="/staffallocation"</script>'''

@app.route('/dltallotedstaff',methods=['get'])
@login_required
def dltallotedstaff():
    id=request.args.get('id')
    qry="DELETE FROM `exam_staff_allocate` WHERE `allocate_id`=%s"
    iud(qry,id)
    return '''<script>alert("Staff datails deleted");window.location="/staffallocation"</script>'''


@app.route('/allocationview',methods=['get','post'])
def allocationview():

    time=request.form['select']
    date=request.form['select2']

    qry="SELECT * FROM `seat_arrangement` WHERE `tid` IN(SELECT `tid` FROM `timetable` WHERE `time`=%s AND `date`=%s)"
    res=selectall2(qry,(time,date))
    if len(res)==0:
        qry="select `sub_id`,tid from `timetable` where `time`=%s and `date`=%s"
        res=selectall2(qry,(time,date))
        total_count=0
        countlist=[]
        remain_list=[]
        result=[]
        tids=[]
        for  i in res:
            qry1="select `lid` from `student` where `dept_id` in(select `dept_id` from `subject` where `sub_id`=%s) and `sem` in(select `sem` from `subject` where `sub_id`=%s)"
            res1=selectall2(qry1,(i['sub_id'],i['sub_id']))
            result.append(res1)
            tids.append(i['tid'])
            countlist.append(len(res1))
            remain_list.append(len(res1))
            total_count+=len(res1)
        print(result)
        print(total_count)
        qry="SELECT `hall_id`,`room_no`,`no.of_studs` FROM `hall`"
        res=selectall(qry)
        alocationlist=[]
        count1=0
        count2=1
        for i in res:
            sno=1
            if len(alocationlist)>=total_count:
                break
            nr=i['no.of_studs']
            for ii in range((nr//2)):
                if remain_list[count1]!=0:
                    row=[tids[count1],sno,result[count1][countlist[count1]-remain_list[count1]]['lid'],i['hall_id']]
                    sno=sno+1
                    alocationlist.append(row)
                    remain_list[count1]=remain_list[count1]-1
                else:
                    count1=count1+2
                    if len(result)>count1:
                        row = [tids[count1], sno, result[count1][countlist[count1] - remain_list[count1]]['lid'],
                               i['hall_id']]
                        sno = sno + 1
                        alocationlist.append(row)
                        remain_list[count1] = remain_list[count1] - 1
                if remain_list[count2] != 0:
                    row = [tids[count2], sno, result[count2][countlist[count2] - remain_list[count2]]['lid'], i['hall_id']]
                    sno = sno + 1
                    alocationlist.append(row)
                    remain_list[count2] = remain_list[count2] - 1
                else:
                    count2 = count2 + 2
                    if len(result) > count2:
                        row = [tids[count2], sno, result[count2][countlist[count2] - remain_list[count2]]['lid'],
                               i['hall_id']]
                        sno = sno + 1
                        remain_list[count2] = remain_list[count2] - 1
                        alocationlist.append(row)
                if len(alocationlist) >= total_count:
                    break

        for ii in alocationlist:
            print(ii)
            qry="insert into seat_arrangement values (null,%s,%s,%s,%s)"
            val=(ii[3],ii[0],ii[2],ii[1])
            iud(qry,val)
    qry="SELECT DISTINCT `seat_arrangement`.`hall_id` FROM seat_arrangement JOIN `student` ON `seat_arrangement`.st_id=`student`.lid  JOIN `timetable` ON `seat_arrangement`.`tid`=`timetable`.tid JOIN `subject` ON `timetable`.sub_id=`subject`.`sub_id`   WHERE `seat_arrangement`.`tid` IN(SELECT `tid` FROM `timetable` WHERE `time`=%s AND `date`=%s) ORDER BY seat_arrangement.seat_no"
    hids=selectall2(qry,(time,date))
    print(hids)
    result=[]
    for i in hids:
        qry2="SELECT `room_no` FROM `hall` WHERE  `hall_id`=%s"
        h=selectone(qry2,i['hall_id'])
        qry1="SELECT * FROM seat_arrangement JOIN `student` ON `seat_arrangement`.st_id=`student`.lid  JOIN `timetable` ON `seat_arrangement`.`tid`=`timetable`.tid JOIN `subject` ON `timetable`.sub_id=`subject`.`sub_id`   WHERE `seat_arrangement`.`tid` IN(SELECT `tid` FROM `timetable` WHERE `time`=%s AND `date`=%s) and `seat_arrangement`.`hall_id`=%s order by seat_arrangement.seat_no"
        res1=selectall2(qry1,(time,date,i['hall_id']))
        row=[h['room_no'],res1]
        result.append(row)
    return render_template('EXAM CELL/allocationview1.html',val=result)


@app.route('/viewexamhall',methods=['get'])
@login_required
def viewexamhall():
    qry1 = "select * from hall"
    res = selectall(qry1)
    return render_template('EXAM CELL/examhall.html', val1=res)

@app.route('/examhall',methods=['post'])
@login_required
def examhall():
    roomno=request.form['textfield']
    no_students=request.form['textfield2']
    qry="insert into hall values(null,%s,%s)"
    val=(roomno,no_students)
    iud(qry,val)
    return redirect("/viewexamhall")

@app.route('/deletexamhall',methods=['get','post'])
@login_required
def deletexamhall():
    id=request.args.get('id')
    qry="DELETE FROM `hall` WHERE `hall_id`=%s"
    iud(qry,id)
    return '''<script>alert("hall deleted");window.location="/viewexamhall"</script>'''














@app.route('/ADM_examhall')
@login_required
def ADM_examhall():
    qry="SELECT DISTINCT `date` FROM `timetable`"
    res=selectall(qry)
    print(res)
    return render_template('EXAM CELL/ADM examhall.html',val=res)

@app.route('/ADD_examtimetable',methods=['get'])
@login_required
def ADD_examtimetable():
    qry = "select*from department"
    res = selectall(qry)
    qry1="select*from subject"
    res1=selectall(qry1)
    return render_template('EXAM CELL/ADD examtimetable.html', val=res,val1=res1)


@app.route('/ADM_Examtimetable')
@login_required
def ADM_Examtimetable():
    # qry = "SELECT * FROM `timetable` JOIN `subject` ON timetable.sub_id=`subject`.sub_id "
    # res=selectall(qry)
    res=[]
    qry1="select * from department"
    res1=selectall(qry1)
    qry2="select * from subject"
    res2=selectall(qry2)
    return render_template('EXAM CELL/ADM Examtimetable.html',val=res,val1=res1,val10=res2)

@app.route('/ADM_Examtimetable1',methods=['get','post'])
@login_required
def ADM_Examtimetable1():
    dep=request.form['select']
    qry="SELECT timetable.*,subject.sub_name FROM timetable JOIN `subject` ON timetable.sub_id=subject.sub_id WHERE timetable.dept_id=%s"
    val=(dep)
    res=selectall2(qry,val)
    qry1 = "select * from department"
    res1 = selectall(qry1)
    return render_template('EXAM CELL/ADM Examtimetable.html',val=res,val1=res1,dep=dep)

@app.route('/Timetabledit')
@login_required
def Timetabbledit():
    id = request.args.get('id')
    session['tid'] = id
    qry = "select*from timetable where tid=%s"
    res = selectone(qry, id)
    qry1="select*from subject"
    res1=selectall(qry1)
    return render_template('EXAM CELL/Timetabledit.html', val7=res,val1=res1)

@app.route('/editimetable',methods=['post'])
@login_required
def editimetable():
    subname = request.form['select2']
    time = request.form['select6']
    date = request.form['textfield4']
    qry = "update timetable set sub_id=%s,time=%s,date=%s where tid=%s"
    val = ( subname, time, date,session['tid'])
    iud(qry,val)
    return '''<script>alert("Timetable details editted");window.location="/ADM_Examtimetable"</script>'''

@app.route('/deletetimetable')
@login_required
def deletetimetable():
    id=request.args.get('id')
    qry="DELETE FROM `timetable` WHERE `tid`=%s"
    iud(qry,id)
    return '''<script>alert("Timetable deleted");window.location="/ADM_Examtimetable"</script>'''

@app.route('/functions')
@login_required
def functions():
    return render_template('EXAM CELL/functions.html')

@app.route('/staffallocation')
@login_required
def staffallocation():
    # q="SELECT * FROM `department`"
    # res=selectall(q)
    qry="  SELECT `staff`.`name`,`exam_staff_allocate`.*,`hall`.`room_no`,`department`.`Dept_name` FROM `exam_staff_allocate` JOIN `staff` ON `staff`.`staff_id`=`exam_staff_allocate`.`staff_id` JOIN `hall` ON `hall`.`hall_id`=`exam_staff_allocate`.`hall_id` JOIN `department` ON `department`.`dept_id`=`staff`.`dept_id` "
    # qry="  SELECT `staff`.`name`,`exam_staff_allocate`.*,`hall`.`room_no` FROM `exam_staff_allocate` JOIN `staff` ON `staff`.`staff_id`=`exam_staff_allocate`.`staff_id` JOIN `hall` ON `hall`.`hall_id`=`exam_staff_allocate`.`hall_id` "
    res1 = selectall(qry)
    print(res1)
    return render_template('EXAM CELL/staffallocation.html',val1=res1)


@app.route('/searchstaffallocation',methods=['post'])
@login_required
def searchstaffallocation():
    did=request.form['select']
    print(did)
    q = "SELECT * FROM `department`"
    res = selectall(q)
    qry="SELECT `staff`.`name`,`exam_staff_allocate`.*,`hall`.`room_no` FROM `exam_staff_allocate` JOIN `staff` ON `staff`.`staff_id`=`exam_staff_allocate`.`staff_id` JOIN `hall` ON `hall`.`hall_id`=`exam_staff_allocate`.`hall_id` WHERE `staff`.`dept_id`=%s"
    res1=selectall2(qry,did)
    print(res1)
    return render_template('EXAM CELL/staffallocation.html', val=res,val1=res1,d=str(did))


@app.route('/View_allocation')
@login_required
def View_allocation():
    return render_template('EXAM CELL/View allocation.html')

@app.route('/ADD_staff',methods=['post'])
@login_required
def ADD_staff():
    qry = "select*from department"
    res = selectall(qry)
    return render_template('HOD/ADD staff.html',val9=res)

@app.route('/ADD_student',methods=['get','post'])
@login_required
def ADD_student():
    # qry="select*from department"
    # res=selectall(qry)
    return render_template('HOD/ADD student.html')

@app.route('/Studentedit')
@login_required
def Studentedit():
    id = request.args.get('id')
    session['st_id'] = id
    qry = "select*from student where lid=%s"
    res = selectone(qry, id)
    qry1 = "select*from department"
    res1 = selectall(qry1)
    return render_template('HOD/Studentedit.html', val7=res, v=res1)

@app.route('/editstud',methods=['post'])
@login_required
def editstud():
    name = request.form['textfield3']
    # dept = request.form['select']
    admno=request.form['textfield']
    regno=request.form['textfield2']
    sem=request.form['textfield5']
    phno=request.form['textfield6']
    year = request.form['textfield4']
    email=request.form['textfield7']
    qry="UPDATE `student` SET st_name=%s,adm_no=%s,Reg_no=%s,sem=%s,Ph_no=%s,year=%s,email=%s where lid=%s"
    val=(name,admno,regno,sem,phno,year,email,session['st_id'])
    iud(qry,val)
    qry1="UPDATE `login` SET `username`=%s,`password`=%s WHERE `lid`=%s"
    val1=(regno,admno,session['st_id'])
    iud(qry1,val1)
    return '''<script>alert("Student details editted");window.location="/ADM_student"</script>'''

@app.route('/dltstud',methods=['get'])
@login_required
def dltstud():
    id=request.args.get('id')
    qry="DELETE FROM `student` WHERE `lid`=%s"
    iud(qry,id)
    qry1="DELETE  FROM  `login` WHERE `lid`=%s"
    iud(qry1,id)
    return '''<script>alert("Student datails deleted");window.location="/ADM_student"</script>'''


@app.route('/ADD_subject',methods=['post','get'])
@login_required
def ADD_subject():
    # qry="select*from department"
    # res=selectall(qry)
    # return render_template('HOD/ADD subject.html',vl=res)
    return render_template('HOD/ADD subject.html')

@app.route('/Subjectedit')
@login_required
def Subjectedit():
    id = request.args.get('id')
    session['sub_id'] = id
    qry = "select*from subject where sub_id=%s"
    res = selectone(qry, id)
    # qry1 = "select*from department"
    # res1 = selectall(qry1)
    # return render_template('HOD/Subjectedit.html', val6=res, v=res1)
    return render_template('HOD/Subjectedit.html', val6=res)

@app.route('/editsub',methods=['post'])
@login_required
def editsub():
    dept=session['deptid']
    scode=request.form['textfield']
    sem=request.form['textfield2']
    sname=request.form['textfield4']
    rev=request.form['textfield3']
    qry="update subject set dept_id=%s,sub_code=%s,sub_name=%s,sem=%s,revision=%s where sub_id=%s"
    val=(dept,scode,sname,sem,rev,session['sub_id'])
    iud(qry,val)
    return '''<script>alert("subject editted");window.location="/ADM_subject"</script>'''

@app.route('/dltsub',methods=['get'])
@login_required
def dltsub():
    id=request.args.get('id')
    qry="DELETE FROM `subject` WHERE `sub_id`=%s"
    iud(qry,id)
    return '''<script>alert("Subject deleted");window.location="/ADM_subject"</script>'''

@app.route('/ADM_staff')
@login_required
def ADM_staff():
    qry = "SELECT * FROM `staff` JOIN `department` ON staff.dept_id=`department`.dept_id JOIN `hod` ON `hod`.`dept_id`=`department`.`dept_id` WHERE `hod`.`lid`=%s"
    res = selectall2(qry,session['lid'])
    return render_template('HOD/ADM staff.html',val=res)

@app.route('/staffedit')
@login_required
def staffedit():
    id=request.args.get('id')
    session['staff_id']=id
    qry="select*from staff where staff_id=%s"
    res=selectone(qry,id)
    qry1="select*from department"
    res1=selectall(qry1)
    return render_template('HOD/Staffedit.html',val6=res,v=res1)

@app.route('/editstaff',methods=['post'])
@login_required
def editstaff():
    name=request.form['textfield']
    dept=request.form['select']
    email=request.form['textfield3']
    phno=request.form['textfield4']
    qry="update staff set name=%s,dept_id=%s,email=%s,ph_no=%s where staff_id=%s"
    val=(name,dept,email,phno,session['staff_id'])
    iud(qry,val)
    return '''<script>alert("Staff details editted");window.location="/ADM_staff"</script>'''

@app.route('/dltstaff',methods=['get'])
@login_required
def dltstaff():
    id=request.args.get('id')
    qry="DELETE FROM `staff` WHERE `staff_id`=%s"
    iud(qry,id)
    return '''<script>alert("Staff details deleted");window.location="/ADM_staff"</script>'''

@app.route('/ADM_student')
@login_required
def ADM_student():
    # qry = "SELECT * FROM `department` where dept_id=%s "
    # res=selectone(qry,str(session['deptid']))
    # print(res,"eeeeeeeeeeee")
    # return render_template('HOD/ADM student.html',val1=res )
    qry = "SELECT * FROM `department` where dept_id=%s "
    res1 = selectone(qry, session['deptid'])
    # dep=request.form['select']
    qry = "SELECT * FROM `student` JOIN `department` ON `department`.`dept_id`=`student`.`dept_id` WHERE `department`.`dept_id`=%s"
    res = selectall2(qry, session['deptid'])
    return render_template('HOD/ADM student.html', val10=res, val1=res1)

@app.route('/ADM_student1',methods=['post'])
@login_required
def ADM_student1():
    qry = "SELECT * FROM `department` where dept_id=%s "
    res1 = selectone(qry,session['deptid'])
    # dep=request.form['select']
    qry="SELECT * FROM `student` JOIN `department` ON `department`.`dept_id`=`student`.`dept_id` WHERE `department`.`dept_id`=%s"
    res=selectall2(qry,session['deptid'])
    return render_template('HOD/ADM student.html',val10=res,val1=res1 )



@app.route('/ADM_subject')
@login_required
def ADM_subject():
    # qry="select*from department WHERE dept_id=%s"
    # res=selectone(qry,session['deptid'])
    # return render_template('HOD/ADM subject.html',va=res)

    qry = "select*from department where dept_id=%s"
    res1 = selectone(qry,session['deptid'])
    # dep = request.form['select']
    qry = "SELECT * FROM `subject` JOIN `department` ON `department`.`dept_id`=`subject`.`dept_id` WHERE `department`.`dept_id`=%s"
    res = selectall2(qry, session['deptid'])
    return render_template('HOD/ADM subject.html', va=res1, val=res)




@app.route('/ADM_subject1',methods=['post'])
@login_required
def ADM_subject1():
    qry="select*from department"
    res1=selectall(qry)
    dep = request.form['select']
    qry = "SELECT * FROM `subject` JOIN `department` ON `department`.`dept_id`=`subject`.`dept_id` WHERE `department`.`dept_id`=%s"
    res=selectall2(qry,dep)
    return render_template('HOD/ADM subject.html',va=res1,val=res)



@app.route('/HOD_functions')
@login_required
def HOD_functions():
    qry="select * from department join hod on department.dept_id=hod.dept_id where hod.lid=%s"
    res=selectone(qry,session['lid'])
    return render_template('HOD/HOD functions.html',val=res)

@app.route('/view_duty')
@login_required
def view_duty():
    qry="SELECT `staff`.`name`,hod.dept_id,`hall`.`room_no`,date FROM `staff`  JOIN `exam_staff_allocate` ON `exam_staff_allocate`.`staff_id`=`staff`.`staff_id` JOIN `hod` ON  `staff`.`dept_id`=`hod`.`dept_id` JOIN `hall` ON `hall`.`hall_id`=`exam_staff_allocate`.`hall_id` where hod.lid=%s"
    res=selectall2(qry,session['lid'])
    print(res)
    return render_template('HOD/view duty.html',val=res)

@app.route('/View_hallarrangement')
@login_required
def View_hallarrangement():
    qry="select*from hall"
    res=selectall(qry)
    q="SELECT distinct `date` FROM `timetable`"
    r=selectall(q)
    return render_template('HOD/View hallarrangement.html',val=res,v=r)

@app.route('/vhallarrangement',methods=['post'])
@login_required
def vhallarrangement():

    roomno=request.form['select2']
    date=request.form['select']

    qry1="SELECT DISTINCT `student`.`Reg_no`,`seat_arrangement`.`seat_no` FROM `seat_arrangement` JOIN `student` ON `student`.`lid`=`seat_arrangement`.`st_id` JOIN `timetable` ON `timetable`.`tid`=`seat_arrangement`.`tid` JOIN `hall` ON `hall`.`hall_id`=`seat_arrangement`.`hall_id` WHERE `timetable`.`date`=%s AND `hall`.`hall_id`=%s ORDER BY seat_arrangement.seat_no "
    val1 = (date,roomno)
    res1=selectall2(qry1,val1)
    qry = "select*from hall"
    res = selectall(qry)
    q = "SELECT `date` FROM `timetable`"
    r = selectall(q)
    return render_template('HOD/View hallarrangement.html',val1=res1,val=res,v=r)




@app.route('/examcellreg',methods=['post'])
@login_required
def examcellreg():
    ename=request.form['textfield']
    dept=request.form['select']
    username=request.form['textfield3']
    password=request.form['textfield4']
    qry="insert into login values(null,%s,%s,'examcell')"
    val=(username,password)
    lid=iud(qry,val)
    qry2="insert into examcell values(null,%s,%s,%s)"
    val2=(lid,ename,dept)
    iud(qry2,val2)
    return '''<script>alert("Examcell Staff added");window.location="/ADM_Exam_cell"</script>'''

@app.route('/hodreg',methods=['post'])
@login_required
def hodreg():
    hname=request.form['textfield']
    dept=request.form['select']
    mail=request.form['textfield3']
    phno=request.form['textfield4']
    username=request.form['textfield5']
    password=request.form['textfield6']
    qry="insert into login values(null,%s,%s,'hod')"
    val=(username,password)
    lid=iud(qry,val)
    qry2="insert into hod values(null,%s,%s,%s,%s,%s)"
    val2=(lid,hname,dept,mail,phno)
    iud(qry2,val2)
    return '''<script>alert("HOD added");window.location="/ADM_HOD"</script>'''

@app.route('/deptreg',methods=['post'])
@login_required
def deptreg():
    deptname=request.form['textfield']
    qry="insert into department values(null,%s)"
    val=(deptname)
    iud(qry,val)
    return '''<script>alert("Dept added");window.location="/ADM_Dept"</script>'''

@app.route('/vstd',methods=['post'])
@login_required
def vstd():
    dept=request.form['select']
    qry="SELECT * FROM `student` WHERE `dept_id`=%s"
    res=selectall2(qry,dept)
    qry1="select*from department"
    res1=selectall(qry1)
    return render_template('ADMIN/view student.html',val=res,val4=res1,dep=dept)

@app.route('/vsub',methods=['post'])
@login_required
def vsub():
    dept=request.form['select2']
    qry="select*from subject where dept_id=%s"
    res=selectall2(qry,dept)
    qry1="select*from department"
    res1=selectall(qry1)
    return render_template('ADMIN/view subject.html', val=res, val5=res1, dep=dept)

@app.route('/staffreg',methods=['post'])
@login_required
def staffreg():
    name=request.form['textfield']
    # dept=request.form['select']
    email=request.form['textfield3']
    phno=request.form['textfield4']

    res = selectone("SELECT * FROM `hod` WHERE `lid`=%s",str(session['lid']))
    print(res)
    qry="insert into staff values(null,%s,%s,%s,%s)"
    val=(name,str(res['dept_id']),email,phno)
    iud(qry,val)
    return '''<script>alert("Staff added");window.location="/ADM_staff"</script>'''

@app.route('/stdreg',methods=['post'])
@login_required
def stdreg():
    name = request.form['textfield3']
    # dept = request.form['select']
    admno= request.form['textfield']
    regno = request.form['textfield2']
    sem = request.form['textfield5']
    phno = request.form['textfield6']
    year = request.form['textfield4']
    email=request.form['textfield7']
    qary1="insert into login values(null,%s,%s,'student')"
    val1=(regno,admno)
    id=iud(qary1,val1)
    qry="insert into student values(null,%s,%s,%s,%s,%s,%s,%s,%s,%s)"
    val=(str(id),name,session['deptid'],admno,regno,sem,phno,year,email)
    iud(qry,val)
    return '''<script>alert("student added");window.location="/ADM_student"</script>'''

@app.route('/subreg',methods=['post'])
@login_required
def subreg():
    # dept=request.form['select']
    scode=request.form['textfield']
    sem=request.form['textfield2']
    sname=request.form['textfield4']
    rev=request.form['textfield3']
    qry="insert into subject values(null,%s,%s,%s,%s,%s)"
    val=(session['deptid'],scode,sname,sem,rev)
    iud(qry,val)
    return '''<script>alert("Subject added");window.location="/ADM_subject"</script>'''

@app.route('/timetablereg',methods=['post'])
@login_required
def timetablereg():
    dept=request.form['select']
    # sem=request.form['select3']
    subname=request.form['select2']
    time=request.form['select6']
    date=request.form['textfield4']
    qry="insert into timetable values(null,%s,%s,%s,%s)"
    val=(dept,subname,time,date)
    iud(qry,val)
    return '''<script>alert("Timetable updated");window.location="/ADM_Examtimetable"</script>'''

app.run(debug=True)