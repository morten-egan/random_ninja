create or replace package body computer_data

as

begin

  -- Init data structures.
  mountpoints := computertypes_list(null);
  mountpoints.extend(2);
  filetypes := computertypes_list(null);
  filetypes.extend(21);
  mimetypes := computertypes_list(null);
  mimetypes.extend(6);

  -- Mimetypes.
  mimetypes(1).c_category := 'Audio';
  mimetypes(1).c_types := 'audio/aiff,audio/x-aiff,audio/midi,audio/mpeg,audio/x-mpequrl,audio/x-midi,audio/x-mpeg,audio/mpeg3,audio/x-mpeg-3';
  mimetypes(2).c_category := 'Video';
  mimetypes(2).c_types := 'video/x-ms-asf,video/avi,video/x-dv,video/gl,video/x-gl,video/mpeg,video/quicktime,video/x-mpeg,';
  mimetypes(3).c_category := 'Image';
  mimetypes(3).c_types := 'image/bmp,image/gif,image/x-icon,image/jpeg,image/png,image/x-tiff,image/tiff';
  mimetypes(4).c_category := 'Text';
  mimetypes(4).c_types := 'text/html,text/asp,text/plain,text/css,text/x-script,text/x-java-source,text/javascript,text/x-script.perl,text/x-script.phyton,text/richtext,text/sgml,text/xml';
  mimetypes(5).c_category := 'Application';
  mimetypes(5).c_types := 'application/octet-stream,application/postscript,application/octet-stream,application/x-binary,application/pkix-cert,application/java,application/x-x509-ca-cert,application/msword,application/x-gzip,application/javascript,application/pdf,application/mspowerpoint,application/x-compressed,application/excel';
  mimetypes(6).c_category := 'Multipart';
  mimetypes(6).c_types := 'multipart/x-gzip,multipart/x-zip';

  -- Mount points.
  mountpoints(1).c_category := 'Windows';
  mountpoints(1).c_types := 'C:,D:,E:,F:,G:,H:,I:,J:,K:,L:,M:,N:,U:,X:,Y:';
  mountpoints(2).c_category := 'Unix';
  mountpoints(2).c_types := '/,/usr,/proc,/var,/opt,/tmp,/usr,/home';

  -- Filetypes and extensions.
  filetypes(1).c_category := 'Archive';
  filetypes(1).c_types := 'cab,7z,aac,alz,apk,arc,arj,bin,bkf,bzip2,deb,dmg,egg,gzip,jar,lzh,lzip,pak,rar,rpm,npg,tar,tgz,Z,zip';
  filetypes(2).c_category := 'Image';
  filetypes(2).c_types := 'iso,img,sdi,mds,dmg,cif';
  filetypes(3).c_category := 'CAD';
  filetypes(3).c_types := '3mf,acp,aec,ar,dwf,dwg,f3d,ipn,scad,';
  filetypes(4).c_category := 'Database';
  filetypes(4).c_types := '4dd,accdb,db,dbf,frm,mdb,mde,mdf,myd,nsf,sqlite,';
  filetypes(5).c_category := 'Publishing';
  filetypes(5).c_types := 'ai,cdr,psd,pdf,pmd,pub,qxd,fm,';
  filetypes(6).c_category := 'Document';
  filetypes(6).c_types := 'abw,cwk,doc,docx,epub,fdx,gdoc,md,odt,pages,pdf,rtf,tex,txt,';
  filetypes(7).c_category := 'Finance';
  filetypes(7).c_types := 'myob,tax,ynab,ifx,ofx,qfx,qif';
  filetypes(8).c_category := 'Graphics';
  filetypes(8).c_types := 'act,pal,ase,bmp,cpt,cr2,exif,gif,ico,jpg,png,psd,psp,raw,tiff,xcf,ai,svg,blend,cal3d,max,skp';
  filetypes(9).c_category := 'Mathmatical';
  filetypes(9).c_types := 'mml,odf,sxm';
  filetypes(10).c_category := 'Executable';
  filetypes(10).c_types := 'apk,app,bpl,class,com,ear,elf,exe,ipa,jar,xpi,war,vbx';
  filetypes(11).c_category := 'Presentation';
  filetypes(11).c_types := 'keynote,nb,odp,pez,ppt,pptx,sdd';
  filetypes(12).c_category := 'Scientific';
  filetypes(12).c_types := 'fits,silo,spc,ost,ccp4,sdf,cdf,grib,mol,g6,bcf,sam,sbml,dicom,nii,mnc,acq,edf';
  filetypes(13).c_category := 'Script';
  filetypes(13).c_types := 'ahk,as,bat,bas,cljs,cmd,coffee,egg,erb,hta,js,lua,m,php,pl,ps1,py,r,rb,sh,tcl,vbs,sql';
  filetypes(14).c_category := 'Security';
  filetypes(14).c_types := 'ssh,pub,ppk,cer,crt,der,p7b,p12,pfx,pem,kdb,kdbx';
  filetypes(15).c_category := 'Audio';
  filetypes(15).c_types := 'aif,au,raw,wav,flac,la,pac,m4a,mp2,mp3,wma,aac,m4p,aac,ra,rm,midi,m3u,pls';
  filetypes(16).c_category := 'Source';
  filetypes(16).c_types := 'ada,adb,asm,bas,c,clj,cls,cob,cbl,cpp,cc,cs,d,for,go,h,hpp,java,lisp,m,php,pl,py,r,rb,scala,tcl,vb,';
  filetypes(17).c_category := 'Spreadsheet';
  filetypes(17).c_types := '123,csv,gsheet,numbers,ods,sdc,tsv,xls,xlsx';
  filetypes(18).c_category := 'Video';
  filetypes(18).c_types := 'aaf,3gp,gif,asf,avi,flv,mpeg1,mpeg2,m1v,m2v,m4v,mkv,mpg,mpe,ogg,wmv';
  filetypes(19).c_category := 'Virtual';
  filetypes(19).c_types := 'vhd,vmc,vsv,vmdk,vmsn,vmx,vdi,hdd';
  filetypes(20).c_category := 'Web';
  filetypes(20).c_types := 'dtd,html,xhtml,mhtml,asp,aspx,jsp,pl,php,atom,json,rss,md,psp';
  filetypes(21).c_category := 'Generic';
  filetypes(21).c_types := 'csv,html,css,ini,json,tsv,xml,yaml,txt,bak,bin,dat,conf,cfg,log,temp,tmp';

  dbms_application_info.set_client_info('computer_data');
  dbms_session.set_identifier('computer_data');

end computer_data;
/
