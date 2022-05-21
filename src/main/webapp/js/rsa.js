
function BarrettMu(e){this.modulus=biCopy(e),this.k=biHighIndex(this.modulus)+1;var t=new BigInt;t.digits[2*this.k]=1,this.mu=biDivide(t,this.modulus),this.bkplus1=new BigInt,this.bkplus1.digits[this.k+1]=1,this.modulo=BarrettMu_modulo,this.multiplyMod=BarrettMu_multiplyMod,this.powMod=BarrettMu_powMod}function BarrettMu_modulo(e){var t=biDivideByRadixPower(e,this.k-1),n=biMultiply(t,this.mu),i=biDivideByRadixPower(n,this.k+1),r=biModuloByRadixPower(e,this.k+1),o=biMultiply(i,this.modulus),a=biModuloByRadixPower(o,this.k+1),s=biSubtract(r,a);if(s.isNeg)s=biAdd(s,this.bkplus1);for(var u=biCompare(s,this.modulus)>=0;u;)s=biSubtract(s,this.modulus),u=biCompare(s,this.modulus)>=0;return s}function BarrettMu_multiplyMod(e,t){var n=biMultiply(e,t);return this.modulo(n)}function BarrettMu_powMod(e,t){var n=new BigInt;n.digits[0]=1;for(var i=e,r=t;;){if(0!=(1&r.digits[0]))n=this.multiplyMod(n,i);if(r=biShiftRight(r,1),0==r.digits[0]&&0==biHighIndex(r))break;i=this.multiplyMod(i,i)}return n}function setMaxDigits(e){maxDigits=e,ZERO_ARRAY=new Array(maxDigits);for(var t=0;t<ZERO_ARRAY.length;t++)ZERO_ARRAY[t]=0;bigZero=new BigInt,bigOne=new BigInt,bigOne.digits[0]=1}function BigInt(e){if("boolean"==typeof e&&1==e)this.digits=null;else this.digits=ZERO_ARRAY.slice(0);this.isNeg=!1}function biFromDecimal(e){for(var t,n="-"==e.charAt(0),i=n?1:0;i<e.length&&"0"==e.charAt(i);)++i;if(i==e.length)t=new BigInt;else{var r=e.length-i,o=r%dpl10;if(0==o)o=dpl10;for(t=biFromNumber(Number(e.substr(i,o))),i+=o;i<e.length;)t=biAdd(biMultiply(t,lr10),biFromNumber(Number(e.substr(i,dpl10)))),i+=dpl10;t.isNeg=n}return t}function biCopy(e){var t=new BigInt(!0);return t.digits=e.digits.slice(0),t.isNeg=e.isNeg,t}function biFromNumber(e){var t=new BigInt;t.isNeg=0>e,e=Math.abs(e);for(var n=0;e>0;)t.digits[n++]=e&maxDigitVal,e=Math.floor(e/biRadix);return t}function reverseStr(e){for(var t="",n=e.length-1;n>-1;--n)t+=e.charAt(n);return t}function biToString(e,t){var n=new BigInt;n.digits[0]=t;for(var i=biDivideModulo(e,n),r=hexatrigesimalToChar[i[1].digits[0]];1==biCompare(i[0],bigZero);)i=biDivideModulo(i[0],n),digit=i[1].digits[0],r+=hexatrigesimalToChar[i[1].digits[0]];return(e.isNeg?"-":"")+reverseStr(r)}function biToDecimal(e){var t=new BigInt;t.digits[0]=10;for(var n=biDivideModulo(e,t),i=String(n[1].digits[0]);1==biCompare(n[0],bigZero);)n=biDivideModulo(n[0],t),i+=String(n[1].digits[0]);return(e.isNeg?"-":"")+reverseStr(i)}function digitToHex(e){var t=15,n="";for(i=0;i<4;++i)n+=hexToChar[e&t],e>>>=4;return reverseStr(n)}function biToHex(e){for(var t="",n=(biHighIndex(e),biHighIndex(e));n>-1;--n)t+=digitToHex(e.digits[n]);return t}function charToHex(e){var t,n=48,i=n+9,r=97,o=r+25,a=65,s=90;if(e>=n&&i>=e)t=e-n;else if(e>=a&&s>=e)t=10+e-a;else if(e>=r&&o>=e)t=10+e-r;else t=0;return t}function hexToDigit(e){for(var t=0,n=Math.min(e.length,4),i=0;n>i;++i)t<<=4,t|=charToHex(e.charCodeAt(i));return t}function biFromHex(e){for(var t=new BigInt,n=e.length,i=n,r=0;i>0;i-=4,++r)t.digits[r]=hexToDigit(e.substr(Math.max(i-4,0),Math.min(i,4)));return t}function biFromString(e,t){var n="-"==e.charAt(0),i=n?1:0,r=new BigInt,o=new BigInt;o.digits[0]=1;for(var a=e.length-1;a>=i;a--){var s=e.charCodeAt(a),u=charToHex(s),l=biMultiplyDigit(o,u);r=biAdd(r,l),o=biMultiplyDigit(o,t)}return r.isNeg=n,r}function biDump(e){return(e.isNeg?"-":"")+e.digits.join(" ")}function biAdd(e,t){var n;if(e.isNeg!=t.isNeg)t.isNeg=!t.isNeg,n=biSubtract(e,t),t.isNeg=!t.isNeg;else{n=new BigInt;for(var i,r=0,o=0;o<e.digits.length;++o)i=e.digits[o]+t.digits[o]+r,n.digits[o]=i%biRadix,r=Number(i>=biRadix);n.isNeg=e.isNeg}return n}function biSubtract(e,t){var n;if(e.isNeg!=t.isNeg)t.isNeg=!t.isNeg,n=biAdd(e,t),t.isNeg=!t.isNeg;else{n=new BigInt;var i,r;r=0;for(var o=0;o<e.digits.length;++o){if(i=e.digits[o]-t.digits[o]+r,n.digits[o]=i%biRadix,n.digits[o]<0)n.digits[o]+=biRadix;r=0-Number(0>i)}if(-1==r){r=0;for(var o=0;o<e.digits.length;++o){if(i=0-n.digits[o]+r,n.digits[o]=i%biRadix,n.digits[o]<0)n.digits[o]+=biRadix;r=0-Number(0>i)}n.isNeg=!e.isNeg}else n.isNeg=e.isNeg}return n}function biHighIndex(e){for(var t=e.digits.length-1;t>0&&0==e.digits[t];)--t;return t}function biNumBits(e){var t,n=biHighIndex(e),i=e.digits[n],r=(n+1)*bitsPerDigit;for(t=r;t>r-bitsPerDigit&&0==(32768&i);--t)i<<=1;return t}function biMultiply(e,t){for(var n,i,r,o=new BigInt,a=biHighIndex(e),s=biHighIndex(t),u=0;s>=u;++u){for(n=0,r=u,j=0;j<=a;++j,++r)i=o.digits[r]+e.digits[j]*t.digits[u]+n,o.digits[r]=i&maxDigitVal,n=i>>>biRadixBits;o.digits[u+a+1]=n}return o.isNeg=e.isNeg!=t.isNeg,o}function biMultiplyDigit(e,t){var n,i,r;result=new BigInt,n=biHighIndex(e),i=0;for(var o=0;n>=o;++o)r=result.digits[o]+e.digits[o]*t+i,result.digits[o]=r&maxDigitVal,i=r>>>biRadixBits;return result.digits[1+n]=i,result}function arrayCopy(e,t,n,i,r){for(var o=Math.min(t+r,e.length),a=t,s=i;o>a;++a,++s)n[s]=e[a]}function biShiftLeft(e,t){var n=Math.floor(t/bitsPerDigit),i=new BigInt;arrayCopy(e.digits,0,i.digits,n,i.digits.length-n);for(var r=t%bitsPerDigit,o=bitsPerDigit-r,a=i.digits.length-1,s=a-1;a>0;--a,--s)i.digits[a]=i.digits[a]<<r&maxDigitVal|(i.digits[s]&highBitMasks[r])>>>o;return i.digits[0]=i.digits[a]<<r&maxDigitVal,i.isNeg=e.isNeg,i}function biShiftRight(e,t){var n=Math.floor(t/bitsPerDigit),i=new BigInt;arrayCopy(e.digits,n,i.digits,0,e.digits.length-n);for(var r=t%bitsPerDigit,o=bitsPerDigit-r,a=0,s=a+1;a<i.digits.length-1;++a,++s)i.digits[a]=i.digits[a]>>>r|(i.digits[s]&lowBitMasks[r])<<o;return i.digits[i.digits.length-1]>>>=r,i.isNeg=e.isNeg,i}function biMultiplyByRadixPower(e,t){var n=new BigInt;return arrayCopy(e.digits,0,n.digits,t,n.digits.length-t),n}function biDivideByRadixPower(e,t){var n=new BigInt;return arrayCopy(e.digits,t,n.digits,0,n.digits.length-t),n}function biModuloByRadixPower(e,t){var n=new BigInt;return arrayCopy(e.digits,0,n.digits,0,t),n}function biCompare(e,t){if(e.isNeg!=t.isNeg)return 1-2*Number(e.isNeg);for(var n=e.digits.length-1;n>=0;--n)if(e.digits[n]!=t.digits[n])if(e.isNeg)return 1-2*Number(e.digits[n]>t.digits[n]);else return 1-2*Number(e.digits[n]<t.digits[n]);return 0}function biDivideModulo(e,t){var n,i,r=biNumBits(e),o=biNumBits(t),a=t.isNeg;if(o>r){if(e.isNeg)n=biCopy(bigOne),n.isNeg=!t.isNeg,e.isNeg=!1,t.isNeg=!1,i=biSubtract(t,e),e.isNeg=!0,t.isNeg=a;else n=new BigInt,i=biCopy(e);return new Array(n,i)}n=new BigInt,i=e;for(var s=Math.ceil(o/bitsPerDigit)-1,u=0;t.digits[s]<biHalfRadix;)t=biShiftLeft(t,1),++u,++o,s=Math.ceil(o/bitsPerDigit)-1;i=biShiftLeft(i,u),r+=u;for(var l=Math.ceil(r/bitsPerDigit)-1,c=biMultiplyByRadixPower(t,l-s);-1!=biCompare(i,c);)++n.digits[l-s],i=biSubtract(i,c);for(var d=l;d>s;--d){var f=d>=i.digits.length?0:i.digits[d],p=d-1>=i.digits.length?0:i.digits[d-1],h=d-2>=i.digits.length?0:i.digits[d-2],g=s>=t.digits.length?0:t.digits[s],m=s-1>=t.digits.length?0:t.digits[s-1];if(f==g)n.digits[d-s-1]=maxDigitVal;else n.digits[d-s-1]=Math.floor((f*biRadix+p)/g);for(var v=n.digits[d-s-1]*(g*biRadix+m),y=f*biRadixSquared+(p*biRadix+h);v>y;)--n.digits[d-s-1],v=n.digits[d-s-1]*(g*biRadix|m),y=f*biRadix*biRadix+(p*biRadix+h);if(c=biMultiplyByRadixPower(t,d-s-1),i=biSubtract(i,biMultiplyDigit(c,n.digits[d-s-1])),i.isNeg)i=biAdd(i,c),--n.digits[d-s-1]}if(i=biShiftRight(i,u),n.isNeg=e.isNeg!=a,e.isNeg){if(a)n=biAdd(n,bigOne);else n=biSubtract(n,bigOne);t=biShiftRight(t,u),i=biSubtract(t,i)}if(0==i.digits[0]&&0==biHighIndex(i))i.isNeg=!1;return new Array(n,i)}function biDivide(e,t){return biDivideModulo(e,t)[0]}function biModulo(e,t){return biDivideModulo(e,t)[1]}function biMultiplyMod(e,t,n){return biModulo(biMultiply(e,t),n)}function biPow(e,t){for(var n=bigOne,i=e;;){if(0!=(1&t))n=biMultiply(n,i);if(t>>=1,0==t)break;i=biMultiply(i,i)}return n}function biPowMod(e,t,n){for(var i=bigOne,r=e,o=t;;){if(0!=(1&o.digits[0]))i=biMultiplyMod(i,r,n);if(o=biShiftRight(o,1),0==o.digits[0]&&0==biHighIndex(o))break;r=biMultiplyMod(r,r,n)}return i}function RSAKeyPair(e,t,n){this.e=biFromHex(e),this.d=biFromHex(t),this.m=biFromHex(n),this.chunkSize=2*biHighIndex(this.m),this.radix=16,this.barrett=new BarrettMu(this.m)}function twoDigit(e){return(10>e?"0":"")+String(e)}function encryptedString(e,t){for(var n=new Array,i=t.length,r=0;i>r;)n[r]=t.charCodeAt(r),r++;for(;n.length%e.chunkSize!=0;)n[r++]=0;var o,a,s,u=n.length,l="";for(r=0;u>r;r+=e.chunkSize){for(s=new BigInt,o=0,a=r;a<r+e.chunkSize;++o)s.digits[o]=n[a++],s.digits[o]+=n[a++]<<8;var c=e.barrett.powMod(s,e.e),d=16==e.radix?biToHex(c):biToString(c,e.radix);l+=d+" "}return l.substring(0,l.length-1)}function decryptedString(e,t){var n,i,r,o=t.split(" "),a="";for(n=0;n<o.length;++n){var s;if(16==e.radix)s=biFromHex(o[n]);else s=biFromString(o[n],e.radix);for(r=e.barrett.powMod(s,e.d),i=0;i<=biHighIndex(r);++i)a+=String.fromCharCode(255&r.digits[i],r.digits[i]>>8)}if(0==a.charCodeAt(a.length-1))a=a.substring(0,a.length-1);return a}function getRsaResult(e){var t=130;setMaxDigits(t);var n="10001",i="93b2b4a59fe63cdc1a65c6e006d2a710de3d8bcfe93cb601f1af2c49946b80dfa1e607195b0ee8969e24544153fc12b84acdfbba53949f0a0d6c6f665dce4c37";key=new RSAKeyPair(n,"",i);var r=encryptedString(key,e);return r}var biRadixBase=2,biRadixBits=16,bitsPerDigit=biRadixBits,biRadix=65536,biHalfRadix=biRadix>>>1,biRadixSquared=biRadix*biRadix,maxDigitVal=biRadix-1,maxInteger=9999999999999998,maxDigits,ZERO_ARRAY,bigZero,bigOne;setMaxDigits(20);var dpl10=15,lr10=biFromNumber(1e15),hexatrigesimalToChar=new Array("0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z"),hexToChar=new Array("0","1","2","3","4","5","6","7","8","9","a","b","c","d","e","f"),highBitMasks=new Array(0,32768,49152,57344,61440,63488,64512,65024,65280,65408,65472,65504,65520,65528,65532,65534,65535),lowBitMasks=new Array(0,1,3,7,15,31,63,127,255,511,1023,2047,4095,8191,16383,32767,65535);