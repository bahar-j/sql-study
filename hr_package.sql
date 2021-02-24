CREATE OR REPLACE PACKAGE body hr_pkg
IS
    PROCEDURE add_emp_proc(ps_emp_name IN VARCHAR2,
                        pe_email IN VARCHAR2,
                        pj_job_id IN VARCHAR2,
                        pd_hire_date IN VARCHAR2)
    IS
    v_cnt NUMBER := 0;
    e_no_such_job EXCEPTION;
    BEGIN
      SELECT count(*)
        INTO v_cnt
        FROM jobs
        WHERE job_id = pj_job_id;

      IF v_cnt = 0 THEN
        raise e_no_such_job;
      END IF;

      INSERT INTO employees2 (employee_id, last_name, email, job_id, hire_date)
        VALUES(employees_seq.nextval, ps_emp_name, pe_email, pj_job_id, TO_DATE(pd_hire_date, 'yyyy-mm-dd'));

    EXCEPTION
      WHEN e_no_such_job THEN
        dbms_output.put_line('해당하는 JOB_ID가 없습니다.');
    END;

    PROCEDURE retire_emp_proc(pn_employee_id IN NUMBER)
    IS
    BEGIN
        UPDATE employees2 SET retire_date = sysdate
        WHERE employee_id = pn_employee_id;

    EXCEPTION
      WHEN NO_DATA_FOUND THEN
        dbms_output.put_line('해당하는 사원이 없습니다.');
    END;
END hr_pkg;