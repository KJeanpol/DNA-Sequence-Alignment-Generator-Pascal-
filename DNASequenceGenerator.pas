program DNASequenceGenerator;
uses //useful libraries
 Sysutils,
 crt;
var
    DNAlength:integer;
    fileType:string[200];

//creates the DNA random sequence
function generateRamdonDNA(StringLen:Integer):String;
var  str:String;
begin
    Randomize;
    //string with all possible chars to generate DNA
    str:='ACTG';
    Result:='';
    repeat
        Result:=Result+str[Random(Length(str))+1];
    until(Length(Result)=StringLen)
end;

//creates a new file with the DNA random sequence
procedure generateDNAFile(SequenceLen:Integer;FileName:string);
var
    DNAFile:textfile;

begin
    if (SequenceLen<7) OR (SequenceLen>1000000) then
       begin
         writeln('The length specified must be between 7 and 1000000')
       end
    else
      begin
         assignfile(DNAFile,FileName);  //creates a new file
         rewrite(DNAFile);              //open the file in order to write
         writeln(DNAFile,(generateRamdonDNA(SequenceLen)));  //writes the DNA sequence
         close(DNAFile);
      end;
    end;

begin
  writeln('Specify the length of the DNA sequence: ');
  readln(DNAlength);
  writeln('Type the name of the file: ');
  readln(fileType);
  generateDNAFile(DNAlength,fileType);
end.
