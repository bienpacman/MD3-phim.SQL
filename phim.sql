
CREATE TABLE `ticketfilm`.`tblphim` (
  `PhimID` INT NOT NULL,
  `Ten_Phim` VARCHAR(45) NULL,
  `Loai_Phim` VARCHAR(45) NULL,
  `Thoi_Gian` int NULL,
  PRIMARY KEY (`PhimID`));

CREATE TABLE `ticketfilm`.`tblphong` (
  `PhongID` INT NOT NULL,
  `Ten_Phong` VARCHAR(45) NULL,
  `Trang_Thai` VARCHAR(45) NULL,
  PRIMARY KEY (`PhongID`));

create table tblGhe(
GheID int primary key ,   
PhongID INT,
foreign key (PhongID) references tblphong(PhongID),
So_Ghe Varchar(255)
);

create table tblVe(
GheID int,
PhimID int,
primary key (GheID  , PhimID  ) ,   
Ngay_Chieu Date ,
Trang_Thai varchar(45)
);

INSERT INTO `ticketfilm`.`tblphim` (`PhimID`, `Ten_Phim`, `Loai_Phim`, `Thoi_Gian`) VALUES ('1', 'Em bé Hà Nôi', 'Tâm lý', 90);
INSERT INTO `ticketfilm`.`tblphim` (`PhimID`, `Ten_Phim`, `Loai_Phim`, `Thoi_Gian`) VALUES ('2', 'Nhiệm vụ bất khả thi', 'Hành động', 100);
INSERT INTO `ticketfilm`.`tblphim` (`PhimID`, `Ten_Phim`, `Loai_Phim`, `Thoi_Gian`) VALUES ('3', 'Dị nhân', 'Viễn tưởng', 90);
INSERT INTO `ticketfilm`.`tblphim` (`PhimID`, `Ten_Phim`, `Loai_Phim`, `Thoi_Gian`) VALUES ('4', 'Cuốn theo chiều gió', 'Tình cảm', 120);

INSERT INTO `ticketfilm`.`tblphong` (`PhongID`, `Ten_Phong`, `Trang_Thai`) VALUES ('1', 'Phòng chiếu 1', '1');
INSERT INTO `ticketfilm`.`tblphong` (`PhongID`, `Ten_Phong`, `Trang_Thai`) VALUES ('2', 'Phòng chiếu 2', '1');
INSERT INTO `ticketfilm`.`tblphong` (`PhongID`, `Ten_Phong`, `Trang_Thai`) VALUES ('3', 'Phòng chiếu 3', '0');


INSERT INTO `ticketfilm`.`tblve` (`GheID`, `PhimID`, `Ngay_Chieu`, `Trang_Thai`) VALUES ('1', '1', '2008-10-20', 'Đã bán');
INSERT INTO `ticketfilm`.`tblve` (`GheID`, `PhimID`, `Ngay_Chieu`, `Trang_Thai`) VALUES ('1', '3', '2008-11-20', 'Đã bán');
INSERT INTO `ticketfilm`.`tblve` (`GheID`, `PhimID`, `Ngay_Chieu`, `Trang_Thai`) VALUES ('1', '4', '2008-12-23', 'Đã bán');
INSERT INTO `ticketfilm`.`tblve` (`GheID`, `PhimID`, `Ngay_Chieu`, `Trang_Thai`) VALUES ('2', '1', '2009-02-14', 'Đã bán');
INSERT INTO `ticketfilm`.`tblve` (`GheID`, `PhimID`, `Ngay_Chieu`, `Trang_Thai`) VALUES ('3', '1', '2009-02-14', 'Đã bán');
INSERT INTO `ticketfilm`.`tblve` (`GheID`, `PhimID`, `Ngay_Chieu`, `Trang_Thai`) VALUES ('2', '5', '2009-03-08', 'Chưa bán');
INSERT INTO `ticketfilm`.`tblve` (`GheID`, `PhimID`, `Ngay_Chieu`, `Trang_Thai`) VALUES ('2', '3', '2009-03-08', 'Chưa bán');

INSERT INTO `ticketfilm`.`tblghe` (`GheID`, `PhongID`, `So_Ghe`) VALUES ('1', '1', 'A3');
INSERT INTO `ticketfilm`.`tblghe` (`GheID`, `PhongID`, `So_Ghe`) VALUES ('2', '1', 'B5');
INSERT INTO `ticketfilm`.`tblghe` (`GheID`, `PhongID`, `So_Ghe`) VALUES ('3', '2', 'A7');
INSERT INTO `ticketfilm`.`tblghe` (`GheID`, `PhongID`, `So_Ghe`) VALUES ('4', '2', 'D1');
INSERT INTO `ticketfilm`.`tblghe` (`GheID`, `PhongID`, `So_Ghe`) VALUES ('5', '3', 'T2');

-- Hiển thị danh sách các phim (chú ý: danh sách phải được sắp xếp theo trường Thoi_gian)	;
Create view DSPhim as
SELECT *  from tblphim
order by tblphim.Thoi_Gian Desc ;
select * from DSPhim; 

Create view DSPhim2 as
SELECT *  from tblphim
order by tblphim.Thoi_Gian  ;
select * from DSPhim2 ;

-- 3.Hiển thị Ten_phim có thời gian chiếu dài nhất
select DSPhim.Ten_Phim, DSPhim.Thoi_Gian  from DSPhim  
limit 1 ;

-- 4. Hiển thị Ten_Phim có thời gian chiếu ngắn nhất
select tblphim.Ten_Phim ,tblphim.Thoi_Gian
from tblphim
order by  tblphim.Thoi_Gian limit 2;

-- 5.Hiển thị danh sách So_Ghe mà bắt đầu bằng chữ ‘A’
select*
 from tblghe
where So_Ghe like '%A%';

-- 6.Sửa cột Trang_thai của bảng tblPhong sang kiểu nvarchar(25)	
alter table tblphong modify COLUMN Trang_Thai Varchar(25);

-- 7. Cập nhật giá trị cột Trang_thai của bảng tblPhong theo các luật sau:			
-- Nếu Trang_thai=0 thì gán Trang_thai=’Đang sửa’
-- Nếu Trang_thai=1 thì gán Trang_thai=’Đang sử dụng’
-- Nếu Trang_thai=null thì gán Trang_thai=’Unknow’
-- Sau đó hiển thị bảng tblPhong 

 select PhongID , Trang_Thai ,
 CASE 
 
 when Trang_Thai = 0 then 'Đang sửa'
 when Trang_Thai = 1 then 'Đang sửu dụng '
when   Trang_Thai = null  then 'Unknow'
 END As Phong 
 from tblphong;
 
-- 8.Hiển thị danh sách tên phim mà  có độ dài >15 và < 25 ký tự 	
select PhimID, Ten_Phim from tblphim 
where length(Ten_phim) >15 and length(Ten_phim) < 25;
-- 9.Hiển thị Ten_Phong và Trang_Thai trong bảng tblPhong  trong 1 cột với tiêu đề ‘Trạng thái phòng chiếu’
SELECT concat(ten_phong,' ',trang_thai) as 'trạng thái phòng chiếu'
FROM tblphong;

-- Tạo bảng mới có tên tblRank với các cột sau: STT(thứ hạng sắp xếp theo Ten_Phim), TenPhim, Thoi_gian
CREATE TABLE tblRank(
	STT int(4) AUTO_INCREMENT PRIMARY KEY ,
    Ten_Phim VARCHAR(50) not null,
    Thoi_gian int not null
    );
    INSERT INTO tblRank(Ten_Phim,Thoi_gian)
SELECT  Ten_Phim,thoi_gian
FROM tblphim
ORDER BY Ten_Phim;

-- 11. Trong bảng tblPhim :
-- Thêm trường Mo_ta kiểu nvarchar(max)						
-- Cập nhật trường Mo_ta: thêm chuỗi “Đây là bộ phim thể loại  ” + nội dung trường LoaiPhim										
-- Hiển thị bảng tblPhim sau khi cập nhật				
-- Hiển thị bảng tblPhim sau khi cập nhật	
ALTER TABLE tblphim 
ADD Mo_ta nvarchar(255) NOT NULL ;

UPDATE tblphim 
SET Mo_ta=concat('Đây là bộ phim thể loại ',Loai_phim)
WHERE PhimID>0;

UPDATE tblphim 
SET Mo_ta=replace(Mo_ta,'bộ phim','film')
WHERE PhimId>0;

-- 12 .Xóa tất cả các khóa ngoại trong các bảng trên.	
 ALTER TABLE tblghe 
DROP CONSTRAINT PhongID;

ALTER TABLE tblve
DROP CONSTRAINT GheID,
DROP CONSTRAINT PhimID;

-- 13 . Xóa dữ liệu ở bảng tblGhe
DELETE  FROM ghe 
WHERE iSlot>0;

-- 14 . Hiển thị ngày giờ hiện tại và ngày giờ hiện tại cộng thêm 5000 phút
SELECT date_add(now(),INTERVAL 5000 MINUTE) AS 'Thoi Gian Hien tai';