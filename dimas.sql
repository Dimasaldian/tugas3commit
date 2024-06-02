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