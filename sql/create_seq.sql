-- sequence

drop sequence users_seq;

create sequence users_seq
start with 1
increment by 1
maxvalue 9999999999;


drop sequence category_seq;

create sequence category_seq
start with 1
increment by 1
maxvalue 9999999999;