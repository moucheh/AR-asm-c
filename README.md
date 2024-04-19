# AR-asm-c repozitorij

Moguce je preuzeti citav repozitorij unosenjem komande ispod u terminal:

     git clone https://github.com/moucheh/AR-asm-c.git

Za koristenje prethodne komande, potreban je alat git, koji je moguce preuzeti pomocu nekog od package managera:

>Ubuntu, Mint, Debian
>
>     sudo apt install git
>

>Fedora, CentOS, RHEL
>
>     sudo dnf install git
>

>Windows (PowerShell i winget)
>
>     winget install --id Git.Git -e --source winget
>

Azuriranje repozitorija je moguce komandom (terminal mora biti otvoren u direktoriju u kojem je repozitorij sacuvan):
>     
>     git pull
>

## Cheatsheet

Bash funckija koja kompajlira assembler/c kod i pokrece debugger na portu 1234

>         
>      run_mips_db () {
>	     ecc -g -target mips32r2el-linux $1 -o $2
>	     qemu-mipsel -g 1234 $2&
>	     gdb-multiarch -q $2
>     }
>

Bash funckija koja kompajlira assembler/cpp kod i pokrece debugger na portu 1234

>     
>     run_mips_cpp_db () {
>	     ecc++ -std=c++11 -g -target mips32r2el-linux $1 -o $2
>	     qemu-mipsel -g 1234 $2&
>	     gdb-multiarch -q $2
>     }

Bash funckija koja kompajlira assembler/c kod

>     
>     compile_mips () {
>	     ecc $1 -target mips32r2el-linux -o $2
>     }
>

Bash funckija koja kompajlira assembler/cpp kod



>     
>     compile_mips_cpp () {
>	     ecc++ -std=c++11 $1 -target mips32r2el-linux -o $2
>     }
>

- $1 -- oznacava koji se fajl(ovi) daje(u) lancu za kompajliranje, ukoliko je to vise fajlova potrebno ih je navesti pod dvostrukim navodnicima
- $2 -- oznacava kako ce se zvati konacni ELF fajl
- Primjer poziva __run_mips_db/run_mips_cpp_db__:
     - run_mips_cpp_db main.cpp main
     - run_mips_db "main.c fib.s" main
          - target remote :1234   # spojimo se na port 1234 s debuggerom
          - b main                # postavka breakpointa na neku labelu
          - c                     # pokretanje programa
          - layout src            # prikaz source code-a u terminalu 
          - layout r              # prikaz registara u terminalu
          - ni n                  # next instruction, pomjera se za n instrukcija, podrazumijeva se jedna instrukcija ako se n izostavi

- Primjer poziva __compile_mips/compile_mips_cpp__:
     - compile_mips_cpp "main.cpp isPalindrome.s" main
     - compile_mips "main.c transform.s mytoupper.s" main
     - qemu-mipsel main           # pokretanje programa u qemu emulatoru za mips platformu

- Ukoliko zelite koristiti ove funkcije, potrebno ih je dodati na dno __.bashrc__ fajla
     - otvorite .bashrc s nekim od editora, npr. gedit ~/.bashrc ili gnome-text-editor ~/.bashrc
     - na dnu zalijepite funckije koje vam trebaju
     - restartujete terminal i tada cete moci ih koristiti kao u primjeru poziva navedenom iznad
- Napomena: potrebno je imati otvoren __fet_ar__ container, ukoliko nemate nativno instaliran ellcc lanac za kompajliranje
