program tubes;
uses crt, sysutils; {Library (kumpulan prosedur dan fuction) yang tinggal kita pakai}

        type
                namaagenrecord = record
                        namaagen1: string;
                        pakethaji: string;
                        paketumrah: string;
                        deskripsi: string;
        end;
var

        id, menuagen1,pilih, pilihan, datacari, hpaket: string;
        namaagen: array [1..1000] of namaagenrecord;
        f: file of namaagenrecord;
        i, x, j, flag, pass, k: integer;
        label 1;
        label 2;

procedure load;
begin
          assign(f,'namaagen.dat');
          reset(f);
                while not eof(f) do begin
                        inc(i);
                        read(f, namaagen[i]);
                        writeln(i);
                end;
                close(f);
end;

procedure save;
begin
        assign(f,'namaagen.dat');
        rewrite(f);
        for x:=1 to i do
                write(f, namaagen[x]);
        close(f);
end;

procedure tambahagen();
        begin
                clrscr;
                repeat
                inc(i);
                write('Masukan Nama agen : '); readln(namaagen[i].namaagen1);
                write('Paket Haji : '); readln(namaagen[i].pakethaji);
                write('Paket Umrah : '); readln(namaagen[i].paketumrah);
                write('Deskripsi : '); readln(namaagen[i].deskripsi);
                writeln;
                repeat
                clrscr;
                write('Input lagi?, [y/n] : '); 
                readln(pilih);
                until (pilih='y') or (pilih='n');
                until pilih= 'n' ;


        end;

procedure viewagen;
begin
                clrscr;
                flag:=1; x:=1;
                while x <= i do
                        begin
                                if flag <= 2 then
                                        begin
                                                flag:=flag+1;
                                                writeln('====================');
                                                writeln('Daftar Agen ke - ',x);
                                                writeln;
                                                write('Nama Agen : '); writeln(namaagen[x].namaagen1);
                                                write('Paket Haji : '); writeln(namaagen[x].pakethaji);
                                                write('Paket Umrah : '); writeln(namaagen[x].paketumrah);
                                                write('Deskripsi : '); writeln(namaagen[x].deskripsi);
                                                inc(x);

                                        end
                                else
                                        begin
                                                flag:=1;
                                                writeln;
                                                write('tekan apa saja untuk selanjutnya'); readln;
                                                clrscr;
                                        end;
                        end;
                readln;
        end;

procedure edit;
var
        idx : integer;
        pilih : char;
begin
        clrscr;
                write('masukan index yang di edit : '); readln(idx);
        clrscr;

        writeln('Nama Agen : ', namaagen[idx].namaagen1);
        writeln('Paket Haji : ', namaagen[idx].pakethaji);
        writeln('Paket Umrah : ', namaagen[idx].paketumrah);
        writeln('Deskripsi : ', namaagen[idx].deskripsi);
        writeln;
        write('Pilih : [y/n] : ');
        repeat 
        readln(pilih);
        until (pilih='y') or (pilih='n');
                if pilih = 'y' then
                begin
                        write('Masukan Nama agen : '); readln(namaagen[idx].namaagen1);
                        write('Paket Haji : '); readln(namaagen[idx].pakethaji);
                        write('Paket Umrah : '); readln(namaagen[idx].paketumrah);
                        write('Deskripsi : '); readln(namaagen[idx].deskripsi);
                end;
end;

procedure delete;
var
        idx: integer;
        pilih, keluar: string;
        y: integer;

begin
        repeat
        clrscr;
        write('Masukan index agen haji/umrah yang akan di delete : '); readln(idx);
        clrscr;
        writeln('Delete?');
                        writeln('Nama Agen : ', namaagen[idx].namaagen1);
                        writeln('Paket Haji : ', namaagen[idx].pakethaji);
                        writeln('Paket Umrah : ', namaagen[idx].paketumrah);
                        writeln('Deskripsi : ', namaagen[idx].deskripsi);
                        writeln;
                        write('Pilih : [y/n] : ');
                        repeat 
                        readln(pilih);
                        until (pilih='y') or (pilih='n');
                        begin
                                if pilih= 'y' then
                                        begin
                                                for y:= idx to i do
                                                namaagen[y]:=namaagen[y+1];
                                                dec(i);
                                        end;

                        end;
                        clrscr;
                        write('Delete lagi? [y/n]: ');
                        repeat
                        readln(keluar);
                        until (keluar='y') or (keluar='n');
                        until (keluar= 'n');

end;

procedure menuagen;
        begin
                clrscr;
                repeat
                clrscr;
                writeln('1. Tambah Agen ');
                writeln('2. Edit Agen ' );
                writeln('3. Delete Agen ');
                writeln('4. View Agen');
                writeln('5. Kembali');
                writeln;
                write('masukan pilihan : ');
                repeat
                readln(menuagen1);
                if menuagen1='1' then
                        tambahagen
                else if menuagen1= '2' then
                        edit
                else if menuagen1='3' then
                        delete
                else if menuagen1='4' then
                        viewagen;
                until (menuagen1='1') or (menuagen1='2') or (menuagen1='3') or (menuagen1='4') or (menuagen1='5');
                until (menuagen1 = '5');
        end;
procedure insertion();
var
    tmp: namaagenrecord;
    l, pass: integer;
begin
    pass:=1;
    l:=1;
    while pass<= i-1 do
        begin    
            l:=pass+1;
            tmp:= namaagen[l];
            while tmp.namaagen1 < namaagen[l-1].namaagen1 do
            begin
                namaagen[l]:=namaagen[l-1];
                l:=l-1
            end;
            namaagen[l]:=tmp;
            pass:= pass+1
        end;
end;
procedure selection();
var
        tmp: namaagenrecord;
        a, pass, i_min: integer;
begin
    a:=1;
    pass:=1;
    while pass <= (i-1) do
        begin
            i_min:=pass;
            a:= pass + 1;
                while a <= i do
                    begin
                    if (StrToInt(namaagen[i_min].paketumrah)) > (StrToInt(namaagen[a].paketumrah)) then
                        i_min:=a;
                    a:=a+1;
                    end;
                tmp:= namaagen[i_min];
                namaagen[i_min]:= namaagen[pass];
                namaagen[pass]:=tmp;
                pass:=pass+1;
        end;
end;

procedure buble();
    var
        tmp:namaagenrecord;
begin
    pass:=1;
    while pass<= i-1 do
       begin
           k:=1;
           while k<= i-1 do
           begin
               if (StrToInt(namaagen[k].pakethaji)) > (StrToInt(namaagen[k+1].pakethaji)) then 
               begin
                   tmp := namaagen[k];
                   namaagen[k] := namaagen[k+1];
                   namaagen[k+1] := tmp;
               end;
           k:=k+1;
       end; 
       pass:=pass+1;
    end;
end;

function binary(): Integer;
var
    kiri, kanan, tengah: Integer;
    found: Boolean;
begin
    write('Masukan harga yang di cari : '); readln(datacari);
            kiri := 1; tengah := 0; kanan := i;
            found := false;
            while (kiri <= kanan) and (found = false) do
                begin
                tengah := (kiri+kanan) div 2;
                if (datacari > namaagen[tengah].paketumrah) then
                kiri := tengah+1
                else if (datacari < namaagen[tengah].paketumrah) then
                kanan := tengah-1
                else
                found := true;
     end;
     binary := tengah;
end;  


function squen(): Integer;
begin
    write('Masukan harga yang di cari : '); readln(datacari);
    j:=1;
    while j <= i do
        begin
            if datacari = namaagen[j].pakethaji then
            begin
               squen:=j;
            end;
            j:=j+1;
            
        end;        
end;
procedure cariharga();
var
    fbinary, fsquen : Integer;

begin
    clrscr;
    writeln('1. Cari harga paket haji'); 
    writeln('2. Cari harga paket umrah');
    writeln;
    write('Masukan pilihan : ');
    readln(hpaket);
    if hpaket = '1' then begin
    clrscr;
        fsquen := squen;
         write('nama agen : '); writeln(namaagen[fsquen].namaagen1);
         write('paket haji : '); writeln(namaagen[fsquen].pakethaji);
         write('paket umrah : '); writeln(namaagen[fsquen].paketumrah);
         write('deskripsi : '); writeln(namaagen[fsquen].deskripsi);
         writeln;
         readln;
        end
    else if hpaket ='2' then 
        begin
        clrscr;
           fbinary := binary;
            write('nama agen : '); writeln(namaagen[fbinary].namaagen1);
            write('paket haji : '); writeln(namaagen[fbinary].pakethaji);
            write('paket umrah : '); writeln(namaagen[fbinary].paketumrah);
            write('deskripsi : '); writeln(namaagen[fbinary].deskripsi);
            writeln;
            readln;
end;
end;

procedure menuuser;
begin
                repeat
                clrscr;
                flag:=1; x:=1;
                while x <= i do
                        begin
                                if flag <= 2 then
                                        begin
                                                flag:=flag+1;
                                                writeln('====================');
                                                writeln('Daftar Agen ke - ',x);
                                                writeln;
                                                write('Nama Agen : '); writeln(namaagen[x].namaagen1);
                                                write('Paket Haji : '); writeln(namaagen[x].pakethaji);
                                                write('Paket Umrah : '); writeln(namaagen[x].paketumrah);
                                                write('Deskripsi : '); writeln(namaagen[x].deskripsi);
                                                inc(x)
                                        end
                                else
                                        begin
                                                flag:=1;
                                                writeln;
                                                write('tekan apa saja untuk selanjutnya'); readln;
                                                clrscr;
                                        end;
                        
                        end;
                        writeln;
                        writeln('1. Cari harga'); 
                        writeln('2. Urutkan Data (Harga Haji)');
                        writeln('3. Urutkan Data (Harga Umrah)');
                        writeln('4. Urutkan Data (Abjad)');
                        writeln('5. Kembali');
                        writeln;
                        write('Masukan pilihan : ');
                        repeat    
                        readln(pilihan);
                        if pilihan = '1' then
                            cariharga
                        else if pilihan = '2' then
                            buble
                        else if pilihan = '3' then
                            selection
                        else if pilihan = '4' then
                            insertion;
                        until (pilihan='1')or(pilihan='2')or(pilihan='3')or(pilihan='4')or(pilihan='5');
                        until (pilihan= '5');

end;



begin
         clrscr;
         load;
         repeat
         1:     clrscr;
                writeln(' - - - - - - - - - - - - - ');
                writeln('| Aplikasi Haji dan Umrah |');
                writeln(' - - - - - - - - - - - - - ');
                writeln;
                writeln('1. Agen ');
                writeln('2. User ');
                writeln('3. Keluar');
                writeln;
                write('masukan pilihan : ');
                readln(id);
                until ((id='1') or (id='2') or (id='3'));
                if id='1' then
                        menuagen
                else if id='2' then
                        menuuser
                else if id='3' then
                        goto 2;
                goto 1;
       2: clrscr;
       save;
       writeln('THANK YOU');
       readln;
end.
