--tao bang chat lieu
create table chatlieu
(
    macl char(9) not null primary key,
    check(macl like'CL%'),
    Tencl nvarchar2(30) not null
);
create table nhacungcap
(
   mancc char(9) not null primary key,
   tenncc nvarchar2(30) not null,
   diachi nvarchar2(30) not null,
   dienthoai nvarchar2(30) not null
);
create table congviec
(
   macv char(9) not null primary key,
   tencv nvarchar2(30) not null
);
create table nhanvien
(
   manv char(9) not null primary key,
   check(manv like'NV%'),
   tennv nvarchar2(30) not null,
   gioitinh nvarchar2(4) not null,
   ngaysinh date not null,
   dienthoai nvarchar2(10) not null,
   diachi nvarchar2(30) not null,
   macv char(9),
   CONSTRAINT cv_nv FOREIGN KEY (Macv) REFERENCES congviec (Macv)
);
create table khachhang
(
   makhach char(9) not null primary key,
   check(makhach like'KH%'),
   tenkhach nvarchar2(30) not null,
   diachi nvarchar2(30) not null,
   dienthoai nvarchar2(10) not null
);
create table sanpham
(
   magiaydep char(9) not null primary key,
   check(magiaydep like'SP%'),
   tengiaydep varchar(30) not null,
   soluong number not null,
   dongianhap number not null,
   dongiaban number not null,
   macl char(9),
   tenco nvarchar2(20),
   tenmau nvarchar2(20),
   tentheloai nvarchar2(20),
   tendoituong nvarchar2(20),
   CONSTRAINT   chatlieu_sp FOREIGN KEY (Macl) REFERENCES chatlieu (Macl)
);
create table hoadonban
(
   sohdb nvarchar2(30) not null primary key,
   check (sohdb like 'HDB%'),
   ngayban date not null,
   tongtien number not null,
   manv char(9),
   makhach char(9),
   CONSTRAINT  nv_hdb FOREIGN KEY (manv) REFERENCES nhanvien (Manv),
   CONSTRAINT  kh_hdb FOREIGN KEY (Makhach) REFERENCES khachhang(makhach)
);
create table hoadonnhap
(
  sohdn nvarchar2(30) not null primary key,
  check (sohdn like 'HDN%'),
  ngaynhap date not null,
  tongtien number not null,
  manv char(9),
  mancc char(9),
  CONSTRAINT  nv_hdn FOREIGN KEY (Manv) REFERENCES nhanvien (Manv),
  CONSTRAINT  ncc_hdn FOREIGN KEY (Mancc) REFERENCES nhacungcap(Mancc)

);
create table chitiethoadonban
(
  sohdb nvarchar2(30) not null,
  check (sohdb like 'HDB%'),
  magiaydep char(9) not null,
  soluong number not null,
  giamgia number not null,
  thanhtien number not null,
    CONSTRAINT hdb_sp PRIMARY KEY(sohdb, Magiaydep),
    CONSTRAINT  ct_spb FOREIGN KEY (Magiaydep) REFERENCES sanpham (magiaydep),
    CONSTRAINT ct_hdb FOREIGN KEY (sohdb) REFERENCES hoadonban (sohdb)

);
create table chitiethoadonnhap
(
  sohdn nvarchar2(30) not null,
  check (sohdn like 'HDN%'),
  magiaydep char(9)not null,
  soluong number not null,
  dongia number not null,
  giamgia number not null,
  thanhtien number not null,
  CONSTRAINT hdn_sp PRIMARY KEY(sohdn, magiaydep),
  CONSTRAINT  ct_sp FOREIGN KEY (Magiaydep) REFERENCES sanpham(magiaydep), 
  CONSTRAINT ct_hdn FOREIGN KEY (sohdn) REFERENCES hoadonnhap (sohdn)
);
---------chatlieu--------------

insert into chatlieu(macl,tencl)
   values ('CL1', 'da that'); 
insert into chatlieu(macl,tencl)
   values ('CL2', 'da nhan tao'); 
insert into chatlieu(macl,tencl)
   values ('CL3', 'nhua'); 
insert into chatlieu(macl,tencl)
   values ('CL4', 'vai cotton'); 
insert into chatlieu(macl,tencl)
   values ('CL5', 'vai tong hop');
   
------------ congviec ----------

insert into congviec(macv, tencv)
values ('CV1', 'quan ly');
insert into congviec(macv, tencv)
values ('CV2', 'ke toan');
insert into congviec(macv, tencv)
values ('CV3', 'nhan vien van chuyen');
insert into congviec(macv, tencv)
values ('CV4', 'nhan vien kho');
insert into congviec(macv, tencv)
values ('CV5', 'nhan vien ban hang');
insert into congviec(macv, tencv)
values ('CV6', 'nhan vien dong goi');

------------- nhan vien -------------------

insert into nhanvien(manv, macv, tennv, gioitinh,ngaysinh, dienthoai, diachi)
values ('NV1','CV1','vu thi hau', ' nu',to_date('16/1/2002','dd/mm/yyyy'),0367836734,'Dong da-Ha Noi');
insert into nhanvien(manv, macv, tennv, gioitinh,ngaysinh, dienthoai, diachi)
values ('NV2','CV2','le tung lam', ' nam',to_date('24/10/2000','dd/mm/yyyy'),0365871365,'Ha dong-Ha Noi');
insert into nhanvien(manv, macv, tennv, gioitinh,ngaysinh, dienthoai, diachi)
values ('NV3','CV3','vu van sinh', ' nam',to_date('3/8/1999','dd/mm/yyyy'),0347235912,'Duc Tho-Ha Tinh');
insert into nhanvien(manv, macv, tennv, gioitinh,ngaysinh, dienthoai, diachi)
values ('NV4','CV3','ho van cuong', ' nam',to_date('26/4/2000','dd/mm/yyyy'),0384762398,'Cau Giay-Ha Noi');
insert into nhanvien(manv, macv, tennv, gioitinh,ngaysinh, dienthoai, diachi)
values ('NV5','CV4','nguyen thanh hang', ' nu',to_date('8/9/2002','dd/mm/yyyy'),0358422693,'Thanh Xuan-Ha Noi');
insert into nhanvien(manv, macv, tennv, gioitinh,ngaysinh, dienthoai, diachi)
values ('NV6','CV5','do thi linh', ' nu',to_date('4/7/2000','dd/mm/yyyy'),0384736515,'Chuong my-Ha Noi');
insert into nhanvien(manv, macv, tennv, gioitinh,ngaysinh, dienthoai, diachi)
values ('NV7','CV5','pham hong hanh', ' nu',to_date('26/9/2002','dd/mm/yyyy'),0368427692,'Quoc Oai-Ha Noi');
insert into nhanvien(manv, macv, tennv, gioitinh,ngaysinh, dienthoai, diachi)
values ('NV8','CV6','le duong ngoc', ' nu',to_date('14/11/2000','dd/mm/yyyy'),0314725863,'Thanh Tri-Ha Noi');
insert into nhanvien(manv, macv, tennv, gioitinh,ngaysinh, dienthoai, diachi)
values ('NV9','CV4','nguyen van hung', ' nam',to_date('17/1/2001','dd/mm/yyyy'),0314725863,'Thanh Tri-Ha Noi');


--------- nha cung cap -------------

insert into nhacungcap(mancc, tenncc, diachi, dienthoai)
values ('NCC1', 'Biti"s','Ha Noi',0341275898);
insert into nhacungcap(mancc, tenncc, diachi, dienthoai)
values ('NCC2', 'Vina','TP.HCM',0371485236);
insert into nhacungcap(mancc, tenncc, diachi, dienthoai)
values ('NCC3', 'Juno','Ha Noi',0371826935);
insert into nhacungcap(mancc, tenncc, diachi, dienthoai)
values ('NCC4', 'Giay thuong dinh','Ha Noi',0254187658);
insert into nhacungcap(mancc, tenncc, diachi, dienthoai)
values ('NCC5', 'hanh dung','sai gon',0342579638);
--------- khachhang ----------
insert into khachhang(makhach, tenkhach,diachi, dienthoai)
values('KH1', 'Dang thi hong', 'Ha Noi',0311752463);
insert into khachhang(makhach, tenkhach,diachi, dienthoai)
values('KH2', 'vu van nam', 'Ha Noi',0314752383);
insert into khachhang(makhach, tenkhach,diachi, dienthoai)
values('KH3', 'le thanh hang', 'Ha Noi',0147236985);
insert into khachhang(makhach, tenkhach,diachi, dienthoai)
values('KH4', 'nguyen hong duyen', 'Ha Noi',0358936421);
insert into khachhang(makhach, tenkhach,diachi, dienthoai)
values('KH5', 'nguyen mai anh', 'Ha Noi',0342387533);
insert into khachhang(makhach, tenkhach,diachi, dienthoai)
values('KH6', 'le van thang', 'Ha Noi',0342398614);

----------- sanpham -------------

insert into sanpham(magiaydep, tengiaydep, tenmau, tenco, tentheloai, tendoituong, macl,dongianhap,dongiaban,soluong)
values('SP1', 'Bitis hunter X', 'trang','36','sneaker','nam/nu','CL5',500000,600000,20);
insert into sanpham(magiaydep, tengiaydep, tenmau, tenco, tentheloai, tendoituong, macl,dongianhap,dongiaban,soluong)
values('SP2', 'Bitis hunter X', 'den','37','sneaker','nam/nu','CL5',500000,600000,15);
insert into sanpham(magiaydep, tengiaydep, tenmau, tenco, tentheloai, tendoituong, macl,dongianhap,dongiaban,soluong)
values('SP3', 'Bitis hunter X', 'den','38','sneaker','nam/nu','CL5',500000,600000,15);
insert into sanpham(magiaydep, tengiaydep, tenmau, tenco, tentheloai, tendoituong, macl,dongianhap,dongiaban,soluong)
values('SP4', 'Bitis hunter X', 'trang','40','sneaker','nam/nu','CL5',500000,600000,10);
insert into sanpham(magiaydep, tengiaydep, tenmau, tenco, tentheloai, tendoituong, macl,dongianhap,dongiaban,soluong)
values('SP5', 'Oxford', '?en','40','Giay da','nam','CL1',600000,700000,20);
insert into sanpham(magiaydep, tengiaydep, tenmau, tenco, tentheloai, tendoituong, macl,dongianhap,dongiaban,soluong)
values('SP6', 'oxford', 'nau','40','giay da','nam','CL2',550000,650000,20);
insert into sanpham(magiaydep, tengiaydep, tenmau, tenco, tentheloai, tendoituong, macl,dongianhap,dongiaban,soluong)
values('SP7', 'Boat shoes', 'nau','39','giay luoi','nam','CL5',500000,600000,25);
insert into sanpham(magiaydep, tengiaydep, tenmau, tenco, tentheloai, tendoituong, macl,dongianhap,dongiaban,soluong)
values('SP8', 'sandal bit mui', 'trang','36','sandal bit mui','nu','CL2',200000,300000,20);
insert into sanpham(magiaydep, tengiaydep, tenmau, tenco, tentheloai, tendoituong, macl,dongianhap,dongiaban,soluong)
values('SP9', 'sandal', 'trang','37','sandal','nu','CL2',200000,250000,15);
insert into sanpham(magiaydep, tengiaydep, tenmau, tenco, tentheloai, tendoituong, macl,dongianhap,dongiaban,soluong)
values('SP10', 'giay cao got', 'den','37','cao got mui nhon','nu','CL2',450000,500000,15);
insert into sanpham(magiaydep, tengiaydep, tenmau, tenco, tentheloai, tendoituong, macl,dongianhap,dongiaban,soluong)
values('SP11', 'boot', 'den','38','boot cao co','nu','CL1',500000,600000,15);
insert into sanpham(magiaydep, tengiaydep, tenmau, tenco, tentheloai, tendoituong, macl,dongianhap,dongiaban,soluong)
values('SP12', 'boot', 'trang','37','boot co thap','nu','CL1',500000,600000,15);
insert into sanpham(magiaydep, tengiaydep, tenmau, tenco, tentheloai, tendoituong, macl,dongianhap,dongiaban,soluong)
values('SP13', 'slip-on', 'den','38','sneaker','nu','CL4',200000,300000,15);

-----------  HOA DON BAN -----------

insert into hoadonban(sohdb,manv,makhach,ngayban,tongtien)
values('HDB001','NV6','KH5',to_date('12/02/2022','dd/mm/yyyy'),1680000);
insert into hoadonban(sohdb,manv,makhach,ngayban,tongtien)
values('HDB002','NV7','KH2',to_date('11/12/2021','dd/mm/yyyy'),585000);
insert into hoadonban(sohdb,manv,makhach,ngayban,tongtien)
values('HDB003','NV6','KH4',to_date('10/7/2021','dd/mm/yyyy'),600000);
insert into hoadonban(sohdb,manv,makhach,ngayban,tongtien)
values('HDB004','NV6','KH6',to_date('1/8/2022','dd/mm/yyyy'),1730000);
insert into hoadonban(sohdb,manv,makhach,ngayban,tongtien)
values('HDB005','NV7','KH3',to_date('20/10/2021','dd/mm/yyyy'),870000);
insert into hoadonban(sohdb,manv,makhach,ngayban,tongtien)
values('HDB006','NV6','KH5',to_date('3/2/2022','dd/mm/yyyy'),1045000);
insert into hoadonban(sohdb,manv,makhach,ngayban,tongtien)
values('HDB007','NV7','KH4',to_date('7/3/2022','dd/mm/yyyy'),270000);
insert into hoadonban(sohdb,manv,makhach,ngayban,tongtien)
values('HDB008','NV7','KH1',to_date('12/2/2022','dd/mm/yyyy'),1620000);

-------- BANG CHI TIET HOA DON BAN ----------------

insert into chitiethoadonban(sohdb,magiaydep,soluong,giamgia,thanhtien)
values('HDB001','SP1',2,0.1,1080000);
insert into chitiethoadonban(sohdb,magiaydep,soluong,giamgia,thanhtien)
values('HDB001','SP3',1,0,600000);
insert into chitiethoadonban(sohdb,magiaydep,soluong,giamgia,thanhtien)
values('HDB002','SP5',1,0.1,585000);
insert into chitiethoadonban(sohdb,magiaydep,soluong,giamgia,thanhtien)
values('HDB003','SP4',1,0,600000);
insert into chitiethoadonban(sohdb,magiaydep,soluong,giamgia,thanhtien)
values('HDB004','SP2',2,0.1,1080000);
insert into chitiethoadonban(sohdb,magiaydep,soluong,giamgia,thanhtien)
values('HDB004','SP6',1,0,650000);
insert into chitiethoadonban(sohdb,magiaydep,soluong,giamgia,thanhtien)
values('HDB005','SP7',1,0,600000);
insert into chitiethoadonban(sohdb,magiaydep,soluong,giamgia,thanhtien)
values('HDB005','SP8',1,0.1,270000);
insert into chitiethoadonban(sohdb,magiaydep,soluong,giamgia,thanhtien)
values('HDB006','SP10',1,0.05,475000);
insert into chitiethoadonban(sohdb,magiaydep,soluong,giamgia,thanhtien)
values('HDB006','SP11',1,0.05,570000);
insert into chitiethoadonban(sohdb,magiaydep,soluong,giamgia,thanhtien)
values('HDB007','SP13',1,0.1,270000);
insert into chitiethoadonban(sohdb,magiaydep,soluong,giamgia,thanhtien)
values('HDB008','SP12',2,0.1,1080000);
insert into chitiethoadonban(sohdb,magiaydep,soluong,giamgia,thanhtien)
values('HDB008','SP1',1,0.1,540000);

------------- HOA DON NHAP ------------

INSERT INTO hoadonnhap(sohdn,manv,mancc,ngaynhap,tongtien)
VALUES('HDN100','NV5','NCC1',TO_DATE('11/11/2021','DD/MM/YYYY'),21250000);
INSERT INTO hoadonnhap(sohdn,manv,mancc,ngaynhap,tongtien)
VALUES('HDN101','NV5','NCC2',TO_DATE('10/12/2021','DD/MM/YYYY'),22500000);
INSERT INTO hoadonnhap(sohdn,manv,mancc,ngaynhap,tongtien)
VALUES('HDN102','NV9','NCC3',TO_DATE('7/8/2021','DD/MM/YYYY'),4800000);
INSERT INTO hoadonnhap(sohdn,manv,mancc,ngaynhap,tongtien)
VALUES('HDN103','NV9','NCC1',TO_DATE('6/9/2021','DD/MM/YYYY'),7537500);
INSERT INTO hoadonnhap(sohdn,manv,mancc,ngaynhap,tongtien)
VALUES('HDN104','NV5','NCC1',TO_DATE('15/12/2021','DD/MM/YYYY'),9000000);
INSERT INTO hoadonnhap(sohdn,manv,mancc,ngaynhap,tongtien)
VALUES('HDN105','NV9','NCC5',TO_DATE('12/1/2022','DD/MM/YYYY'),11050000);
INSERT INTO hoadonnhap(sohdn,manv,mancc,ngaynhap,tongtien)
VALUES('HDN106','NV5','NCC3',TO_DATE('7/10/2021','DD/MM/YYYY'),4050000);
INSERT INTO hoadonnhap(sohdn,manv,mancc,ngaynhap,tongtien)
VALUES('HDN107','NV9','NCC2',TO_DATE('13/1/2022','DD/MM/YYYY'),6375000);
INSERT INTO hoadonnhap(sohdn,manv,mancc,ngaynhap,tongtien)
VALUES('HDN108','NV5','NCC4',TO_DATE('10/2/2022','DD/MM/YYYY'),10350000);

------------- CHI TIET HOA DON NHAP--------------

INSERT INTO CHITIETHOADONNHAP(sohdn,magiaydep,soluong,dongia,giamgia,thanhtien)
VALUES ('HDN100','SP1',30 ,500000 ,0.15 ,12750000 );
INSERT INTO CHITIETHOADONNHAP(sohdn,magiaydep,soluong,dongia,giamgia,thanhtien)
VALUES ('HDN100','SP2',20 ,500000 ,0.15 ,8500000 );
INSERT INTO CHITIETHOADONNHAP(sohdn,magiaydep,soluong,dongia,giamgia,thanhtien)
VALUES ('HDN101','SP5',20 ,700000 ,0.1 ,12600000 );
INSERT INTO CHITIETHOADONNHAP(sohdn,magiaydep,soluong,dongia,giamgia,thanhtien)
VALUES ('HDN101','SP6',20 ,550000 ,0.1 ,9900000 );
INSERT INTO CHITIETHOADONNHAP(sohdn,magiaydep,soluong,dongia,giamgia,thanhtien)
VALUES ('HDN102','SP9',30 ,200000 ,0.2 ,4800000 );
INSERT INTO CHITIETHOADONNHAP(sohdn,magiaydep,soluong,dongia,giamgia,thanhtien)
VALUES ('HDN103','SP10',15 ,450000 ,0.15 ,5737500 );
INSERT INTO CHITIETHOADONNHAP(sohdn,magiaydep,soluong,dongia,giamgia,thanhtien)
VALUES ('HDN103','SP8',10 ,200000 ,0.1 ,1800000 );
INSERT INTO CHITIETHOADONNHAP(sohdn,magiaydep,soluong,dongia,giamgia,thanhtien)
VALUES ('HDN104','SP4',10 ,500000 ,0.1 ,4500000 );
INSERT INTO CHITIETHOADONNHAP(sohdn,magiaydep,soluong,dongia,giamgia,thanhtien)
VALUES ('HDN104','SP3',10 ,500000 ,0.1 ,4500000 );
INSERT INTO CHITIETHOADONNHAP(sohdn,magiaydep,soluong,dongia,giamgia,thanhtien)
VALUES ('HDN105','SP7',10 ,500000 ,0.15 ,4250000 );
INSERT INTO CHITIETHOADONNHAP(sohdn,magiaydep,soluong,dongia,giamgia,thanhtien)
VALUES ('HDN105','SP11',10 ,500000 ,0 ,5000000 );
INSERT INTO CHITIETHOADONNHAP(sohdn,magiaydep,soluong,dongia,giamgia,thanhtien)
VALUES ('HDN105','SP13',10 ,200000 ,0.1 ,1800000 );
INSERT INTO CHITIETHOADONNHAP(sohdn,magiaydep,soluong,dongia,giamgia,thanhtien)
VALUES ('HDN106','SP9',10 ,200000 ,0.1 ,1800000 );
INSERT INTO CHITIETHOADONNHAP(sohdn,magiaydep,soluong,dongia,giamgia,thanhtien)
VALUES ('HDN106','SP10',10 ,450000 ,0.1 ,4050000 );
INSERT INTO CHITIETHOADONNHAP(sohdn,magiaydep,soluong,dongia,giamgia,thanhtien)
VALUES ('HDN107','SP7',15 ,500000 ,0.15 ,6375000 );
INSERT INTO CHITIETHOADONNHAP(sohdn,magiaydep,soluong,dongia,giamgia,thanhtien)
VALUES ('HDN108','SP5',10 ,600000 ,0.1 ,5400000 );
INSERT INTO CHITIETHOADONNHAP(sohdn,magiaydep,soluong,dongia,giamgia,thanhtien)
VALUES ('HDN108','SP6',10 ,550000 ,0.1 ,4950000 );

--5, Th?ng kê các s?n ph?m ch?a bán ???c 
select *from sanpham;
select magiaydep, tengiaydep from sanpham 
where not exists (select magiaydep from chitiethoadonban where Chitiethoadonban.magiaydep=sanpham.magiaydep);
--6,  ??a ra t?ng s? ti?n ?ã nh?p m?t hàng có mã giày dép là SP3 ;
select sum(thanhtien) from chitiethoadonnhap where magiaydep='SP3';
--thong ke so tien nhap hang cua nha san xuat
select mancc,sum(tongtien) from hoadonnhap group by mancc;
--5. Nhan vien nao ban duoc nhieu san pham nhat va so luong la bn
select hoadonban.sohdb,sum(chitiethoadonban.soluong) from hoadonban join chitiethoadonban on hoadonban.sohdb=chitiethoadonban.sohdb  group by hoadonban.sohdb; 
--5 ??a vào mã nhân viên và cho bi?t s? l??ng s?n ph?m ?ã nhân viên ?ó ?ã bán ???c;
set serveroutput on 
declare
  ma_nv nhanvien.manv%type;
begin 
     ma_nv:='&ma_nv';
     for ds in (select sum(b.soluong) as num
                from hoadonban a join chitiethoadonban b on a.sohdb=b.sohdb
                where a.manv=ma_nv)
    loop
        Dbms_output.put_line('nhan vien ban duoc: '||ds.num||' san pham');
    end loop;
end;

set serveroutput on 
declare
  ma_nv nhanvien.manv%type;
  dem number;
begin 
     ma_nv:='&ma_nv';
     select count(manv) into dem from nhavien where manv=ma_nv;
     if(dem=0) then 
     dbms_output.put_line('khong ton tai nhan vien nay.');
     else
     for ds in (select sum(b.soluong) as num
                from hoadonban a join chitiethoadonban b on a.sohdb=b.sohdb
                where a.manv=ma_nv)
    loop
        Dbms_output.put_line('nhan vien ban duoc: '||ds.num||' san pham');
    end loop;
end;
  
--6. Báo cáo t?ng ti?n bán hàng theo Tháng ch?n tr??c.		
create or replace procedure
pro_hdtt (thang number,
        nam number)
is 
begin 
     for
          inra in (select sum(tongtien)as num from hoadonban where extract (month from ngayban)=thang and extract (year from ngayban)=nam)
     loop
          dbms_output.put_line('Tong tien: '||inra.num); 
     end loop;
end;
execute pro_hdtt('&thang','&nam');

-- trigger
--Hãy ??m b?o r?ng s? l??ng nh?p vào >= s? l??ng bán ra
create or replace trigger trig_ktra
before insert or update
on chitiethoadonban 
for each row
    begin
       if(:new.NgayRa < :new.NgayNhap) then
       raise_application_error(-20021,'Ngay ra vien phai lon hon ngay nhap vien');
       end if;
end;
select*from chitiethoadonnhap;
select*from sanpham;
set serveroutput on
declare
sl1 sanpham.soluong%type;
sl  sanpham.soluong%type;
ma sanpham.magiaydep%type;
begin
select sum(soluong) into sl1 from chitiethoadonnhap group by magiaydep having chitiethoadonnhap.magiaydep=ma;
update sanpham 
set soluong=soluong+sl1
where sanpham.magiaydep=ma;
end;
--where sanpham.magiaydep=chitiethoadonnhap.magiaydep;
select sum(soluong)from chitiethoadonnhap group by magiaydep;

create or replace trigger trig_nhap
after insert or update
on sanpham
for each row
declare
sl1 sanpham.soluong%type;
sl  sanpham.soluong%type;
ma sanpham.magiaydep%type;
begin
select sum(soluong) into sl1 from chitiethoadonnhap group by magiaydep having chitiethoadonnhap.magiaydep=ma;
update sanpham 
set soluong=soluong+sl1
where sanpham.magiaydep=ma;
end;
end;
select*from chitiethoadonban;
select*from sanpham;
--c?p nh?t hàng trong kho sau khi ??t hàng ho?c c?p nh?t 
CREATE TRIGGER trg_DatHang ON tbl_DatHang AFTER INSERT AS 
BEGIN
	UPDATE sanpham
	SET soluong = soluong + (
		SELECT soluong
		FROM chitiethoadonnhap
		WHERE MaHang = tbl_KhoHang.MaHang
	)
	FROM tbl_KhoHang
	JOIN inserted ON tbl_KhoHang.MaHang = inserted.MaHang
END
GO
/* c?p nh?t hàng trong kho sau khi c?p nh?t ??t hàng */
CREATE TRIGGER trg_CapNhatDatHang on tbl_DatHang after update AS
BEGIN
   UPDATE tbl_KhoHang SET SoLuongTon = SoLuongTon -
	   (SELECT SoLuongDat FROM inserted WHERE MaHang = tbl_KhoHang.MaHang) +
	   (SELECT SoLuongDat FROM deleted WHERE MaHang = tbl_KhoHang.MaHang)
   FROM tbl_KhoHang 
   JOIN deleted ON tbl_KhoHang.MaHang = deleted.MaHang
end
GO
/* c?p nh?t hàng trong kho sau khi h?y ??t hàng */
create TRIGGER trg_HuyDatHang ON tbl_DatHang FOR DELETE AS 
BEGIN
	UPDATE tbl_KhoHang
	SET SoLuongTon = SoLuongTon + (SELECT SoLuongDat FROM deleted WHERE MaHang = tbl_KhoHang.MaHang)
	FROM tbl_KhoHang 
	JOIN deleted ON tbl_KhoHang.MaHang = deleted.MaHang
END

select name from v$datafile;
CREATE TABLESPACE myspace1 --co du lieu it thay doi
DATAFILE 'D:\APP\HANKK\ORADATA\MANAGER\myspace1.DBF' SIZE 
100M 
autoextend on
next 100m maxsize 1024m
extent management local;

CREATE TABLESPACE myspace2 --có du lieu hay thay doi
DATAFILE 'D:\APP\HANKK\ORADATA\MANAGER\myspace2.DBF' SIZE 
100M 
autoextend on
next 100m maxsize 1024m
extent management local;

alter table chatlieu move tablespace myspace1;
alter table nhacungcap move tablespace myspace1;
alter table nhanvien move tablespace myspace1;
alter table sanpham move tablespace myspace1;
alter table congviec move tablespace myspace1;

alter table hoadonban move tablespace myspace2;
alter table hoadonnhap move tablespace myspace2;
alter table chitiethoadonnhap move tablespace myspace2;
alter table chitiethoadonban move tablespace myspace2;
alter table khachhang move tablespace myspace2;

--user
--2user quanly
Create USER quanly IDENTIFIED BY "Nhom6.iu.co.nhat";
Grant CONNECT,RESOURCE,DBA to quanly;
Alter user quanly quota unlimited on myspace1;
Alter user quanly quota unlimited on myspace2;
ALTER USER quanly
DEFAULT TABLESPACE users;
--T?o tablespace ?? tách d? li?u ng??i dùng kh?i tablespace SYSTEM (làm gi?m s? tranh ch?p gi?a các ??i t??ng t? ?i?n d? li?u và các ??i t??ng ng??i dùng cho các t?p d? li?u gi?ng nhau) (vd: tablespace USERS)
-- B?n có th? s? d?ng câu l?nh SQL CREATE TABLESPACE ?? t?o m?t tablespace m?c ??nh v?nh vi?n khác v?i SYSTEM t?i th?i ?i?m t?o c? s? d? li?u, ???c s? d?ng làm c? s? d? li?u m?c ??nh cho các ??i t??ng v?nh vi?n.
--Nên ch? ??nh tablespace c? th? (n?u có th?) ?? l?u tr? d? li?u ng??i dùng, không nên l?u trong tablespace SYSTEM ( ?? gi?m s? tranh ch?p)
ALTER USER quanly
TEMPORARY TABLESPACE temp;
--B?n nên gán cho m?i ng??i dùng m?t vùng b?ng t?m th?i.
--Khi ng??i dùng th?c hi?n m?t câu l?nh SQL yêu c?u m?t phân ?o?n t?m th?i, C? s? d? li?u Oracle s? l?u tr? phân ?o?n ?ó trong vùng b?ng t?m th?i c?a ng??i dùng. Các phân ?o?n t?m th?i này ???c t?o b?i h? th?ng khi th?c hi?n các thao tác s?p x?p ho?c n?i. Các phân ?o?n t?m th?i thu?c s? h?u c?a SYS, có ??c quy?n tài nguyên trong t?t c? các không gian b?ng.
--N?u b?n không ch? ??nh rõ ràng cho ng??i dùng m?t vùng b?ng t?m th?i, thì C? s? d? li?u 
Grant unlimited tablespace to quanly;--gan dung luong ko gioi han cho tablespace
--user nhanvien
Create user nhanvien identified by "5ae.siunhan";
Alter user nhanvien quota unlimited on myspace1;
Alter user nhanvien quota unlimited on myspace2;
Grant create session to nhanvien;
Grant create view to nhanvien;
Grant unlimited tablespace to nhanvien;
GRANT SELECT ANY TABLE TO nhanvien;
ALTER USER nhanvien
DEFAULT TABLESPACE users;
ALTER USER nhanvien
TEMPORARY TABLESPACE temp;
GRANT SELECT, ALTER, UPDATE ON hoadonban TO nhanvien;
GRANT SELECT, ALTER, UPDATE ON hoadonnhap TO nhanvien;
GRANT SELECT, ALTER, UPDATE ON chitiethoadonban TO nhanvien;
GRANT SELECT, ALTER, UPDATE ON chitiethoadonnhap TO nhanvien;
GRANT SELECT, ALTER, UPDATE ON khachhang TO nhanvien;

create or replace trigger trig_ktra
before insert or update
on chitiethoadonban 
for each row
    begin
       if(:new.NgayRa < :new.NgayNhap) then
       raise_application_error(-20021,'Ngay ra vien phai lon hon ngay nhap vien');
       end if;
end;






















