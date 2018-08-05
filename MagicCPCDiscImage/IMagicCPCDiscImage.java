//I need someting similar
//But
//For different formats... Copy files from dsk to pc or from pc to dsk
//Functions:
String[] getDir(){
....
}

byte[] getFile(String filename){
...
}
void putFile(String filename, String filenameOnDSK){
...
]
int getSize(String filename){
}
int getDiskSize(){
}
//possible?
//For several formats... DATA 40, DATA 80, ROMDOS formats etc
void setUser(String filename, int user){
}
void protectFile(String filename, boolean protect){
...
}
void systemFile(String filename, boolean system){
...
}

//system = hidden file
//CPCXFS does the same... But I only have C source (And I dont understand any)
// http://cpctech.cpc-live.com/download/cpcxfs.zip