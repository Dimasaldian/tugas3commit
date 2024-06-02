CREATE DATABASE dbpraUAS2371020006;

USE dbpraUAS2371020006;

CREATE TABLE tblanggota
(id_anggota VARCHAR(4) NOT NULL,
nama VARCHAR(30) NOT NULL,
tgl_lahir DATE,
kota VARCHAR(15),
nohp VARCHAR(12),
PRIMARY KEY (id_anggota));

CREATE TABLE tblbuku
(kodebuku VARCHAR(5) NOT NULL,
judul VARCHAR(30) NOT NULL,
pengarang VARCHAR(15),
penerbit VARCHAR(15),
tahunterbit VARCHAR(4),
PRIMARY KEY (kodebuku));

CREATE TABLE tblpinjam
(no_pinjam VARCHAR(10),
id_anggota VARCHAR(4),
kodebuku VARCHAR(5),
tgl_pinjam DATE,
tgl_kembali DATE,
FOREIGN KEY (id_anggota) REFERENCES tblanggota(id_anggota));


SELECT * FROM tblbuku

ALTER TABLE tblanggota
ADD jenisKelamin INT NOT NULL AFTER tgl_lahir;

ALTER TABLE tblbuku
ADD keluar INT NOT NULL;

ALTER TABLE tblpinjam
ADD PRIMARY KEY(no_pinjam);

ALTER TABLE tblpinjam
ADD FOREIGN KEY(kodebuku) REFERENCES tblbuku(kodebuku);

ALTER TABLE tblanggota
CHANGE jenisKelamin gender CHAR(2);

ALTER TABLE tblbuku RENAME COLUMN pengarang TO penulis;

ALTER TABLE tblanggota
DROP COLUMN nohp;

ALTER TABLE tblbuku
DROP COLUMN keluar;

INSERT INTO tblanggota(id_anggota,nama,tgl_lahir,gender,kota)
VALUES ('A001','Multazam G','2000-02-20','Lk','Bojonegoro')

INSERT INTO tblanggota(id_anggota,nama,tgl_lahir,gender,kota)
VALUES ('A002','Galbie Elinour','1997-06-16','Pr','Malang')

INSERT INTO tblanggota(id_anggota,nama,tgl_lahir,gender,kota)
VALUES ('A003','Alfan Cahyo','1998-10-13','Lk','Malang')

INSERT INTO tblbuku(kodebuku,judul,penulis,penerbit,tahunterbit)
VALUES ('BK005','Mahir Corel Draw','Yuli Kristanto S','Izuka Komp','2008')

INSERT INTO tblbuku(kodebuku,judul,penulis,penerbit,tahunterbit)
VALUES ('BK007','Teknik Photoshop CS3','Rahmat Widiyanto','Elex Media','2009')

INSERT INTO tblbuku(kodebuku,judul,penulis,penerbit,tahunterbit)
VALUES ('BK009','Jago SEO','Hidayat Rahmad','Elex Media','2011')

INSERT INTO tblbuku(kodebuku,judul,penulis,penerbit,tahunterbit)
VALUES ('BK012','Hacking Wireless Network','Suryatama Udin','Jasakom','2012')

SELECT * FROM tblbuku

INSERT INTO tblpinjam(no_pinjam,kodebuku,id_anggota,tgl_pinjam,tgl_kembali)
VALUES ('P17062301','BK005','A002','2022-06-23','2022-06-25')

INSERT INTO tblpinjam(no_pinjam,kodebuku,id_anggota,tgl_pinjam,tgl_kembali)
VALUES ('P17062302','BK007','A003','2022-06-23','2022-06-25')

INSERT INTO tblpinjam(no_pinjam,kodebuku,id_anggota,tgl_pinjam,tgl_kembali)
VALUES ('P17062401','BK007','A001','2022-06-24','2022-06-27')

INSERT INTO tblpinjam(no_pinjam,kodebuku,id_anggota,tgl_pinjam,tgl_kembali)
VALUES ('P17062402','BK009','A003','2022-06-24','2022-06-27')

INSERT INTO tblpinjam(no_pinjam,kodebuku,id_anggota,tgl_pinjam,tgl_kembali)
VALUES ('P17062404','BK012','A003','2022-06-24','2022-06-30')

UPDATE tblanggota
SET 	nama='Husnun Afifa',
		tgl_lahir='2002-02-02',
		kota='Malang'
		WHERE id_anggota='A002'


UPDATE tblbuku
SET 	judul='Basis Data',
		penerbit='Tiga Serangkai'
		WHERE tahunterbit='2012';
		
UPDATE tblpinjam
SET	tgl_pinjam='2022-06-26',
		kodebuku='BK007'
		WHERE no_pinjam='P17062404'

SELECT * FROM tblbuku
SELECT * FROM tblpinjam

SELECT * FROM tblanggota
WHERE gender='Lk'
AND kota='Malang'

SELECT * FROM tblbuku
WHERE tahunterbit='2009'

SELECT * FROM tblanggota
WHERE kota='Malang'
AND YEAR(tgl_lahir) >= 2000;

SELECT * FROM tblanggota
INNER JOIN tblbuku
INNER JOIN tblpinjam
WHERE penerbit='Elex Media'
AND kota='Malang'

DELETE FROM tblpinjam
WHERE id_anggota IN (
    SELECT id_anggota
    FROM tblanggota
    WHERE YEAR(tgl_lahir) BETWEEN 1990 AND 2000
);

DELETE FROM tblanggota
WHERE YEAR(tgl_lahir) BETWEEN 1990 AND 2000;

DELETE FROM tblbuku
WHERE penerbit='Elex Media'
AND penulis LIKE '%d';

DELETE FROM tblpinjam
WHERE DAY(tgl_kembali) > 30
AND kodebuku != 'BK009';