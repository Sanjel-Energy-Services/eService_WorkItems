--create or replace procedure

create or replace procedure proc_testarchiverigjob is

  cursor cur_RigJobIsNotPenging is select trj.Rig_Id from Test_Rig_Job trj, Rigs r where trj.Rig_Id =r.Id AND r.STATUS !=6 AND trj.IS_LISTED =1 AND trj.JOB_LIFE_STATUS != 2;
  cursor cur_RigJobIsPenging is select trj.Rig_Id from Test_Rig_Job trj, Rigs r where trj.Rig_Id =r.Id AND r.STATUS !=6 AND trj.IS_LISTED =1 AND trj.JOB_LIFE_STATUS = 2;
  Result1 number;
  Result2 number;
  begin
  insert into test_archive_rig_job (select rj.* from Test_Rig_Job rj, Rigs r where rj.Rig_Id = r.Id and r.status = 6);
  delete from Test_Rig_Job where exists (select * from test_archive_rig_job where Test_Rig_Job.Id=test_archive_rig_job.Id );
  for v_emp in cur_RigJobIsNotPenging loop
     Result2:= cur_previousRigJob(v_emp.Rig_Id);
     if(Result2 > 0) then
     insert into test_archive_rig_job (select * from Test_Rig_Job rj where rj.IS_LISTED=0 and Rig_Id = v_emp.Rig_Id and JOB_LIFE_STATUS IN ('8','6'));  
    end if;
     delete from Test_Rig_Job where exists (select * from test_archive_rig_job where Test_Rig_Job.Id=test_archive_rig_job.Id );
    end loop;

  for v_emp in cur_RigJobIsPenging loop
    Result1:= cur_earliestRigJob(v_emp.Rig_Id);
    Result2:= cur_previousRigJob(v_emp.Rig_Id);
    if(Result1 > 0 and Result2 > 0) then
      insert into test_archive_rig_job (select * from Test_Rig_Job rj where rj.IS_LISTED=0 and rj.Rig_Id = v_emp.Rig_Id and rj.JOB_LIFE_STATUS IN ('8','6'));
      elsif(Result1 < 1 and Result2 > 1) then
        insert into test_archive_rig_job (select * from (select * from Test_Rig_Job where Rig_Id = v_emp.Rig_Id and IS_LISTED=0 AND JOB_LIFE_STATUS IN ('8','6') order by JOB_DATE_TIME DESC) where rownum < Result2);
    end if;
    delete from Test_Rig_Job where exists (select * from test_archive_rig_job where Test_Rig_Job.Id=test_archive_rig_job.Id );
    end loop;
    delete from Test_Rig_Job where exists (select * from test_archive_rig_job where Test_Rig_Job.Id=test_archive_rig_job.Id );

end proc_testarchiverigjob;

--create or replace function

create or replace function cur_previousRigJob(rigId in number) return number is
 Result number;
begin
  select count(1) into Result from Test_Rig_Job where Rig_Id = rigId and IS_LISTED=0 AND JOB_LIFE_STATUS IN ('8','6');
  return(Result);
end cur_previousRigJob;


create or replace function cur_earliestRigJob(rigId in number) return number is
 Result number;
begin
  select count(1) into Result from Test_Rig_Job where Rig_Id = rigId and IS_LISTED=0 AND JOB_LIFE_STATUS NOT IN ('9','8','0','6');
  return(Result);
end cur_earliestRigJob;

