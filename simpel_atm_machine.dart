import 'dart:io';

void main() {
  // name declare
  stdout.write('Nama anda : ');
  var usrName = stdin.readLineSync();
  eWallet nasabah = new eWallet('$usrName');
  print('Selamat datang,' + nasabah.getNama);

  // program
  print('--------------------');
  print('*    Bank Shat     *');
  print('--------------------');
  print('     Transaksi      ');
  print('   Saldo anda : 0   ');
  print('--------------------');
  print('1. Transfer');
  print('2. Request');
  print('--------------------');

  // input
  stdout.write('Masukkan Opsi : ');
  int opt = int.parse(stdin.readLineSync()!);
  if (opt == 1) {
    // nyimpan nilai saldo!
    stdout.write('Top up saldo : ');
    int debit = int.parse(stdin.readLineSync()!);
    nasabah.request(debit);
    nasabah.getSaldo; // <= tempat saldo

    // eksekusi
    print('\nSaldo anda $debit');
    stdout.write('Masukkan nominal yang ingin di transfer! : ');
    int nom = int.parse(stdin.readLineSync()!);
    nom = nasabah.getSaldo - nom;

    // validation conditional
    var valid = (nom < nasabah.getSaldo && nom - nasabah.getSaldo == 0)
        ? 'Kurang'
        : 'Berhasil';
    var valid2 = (nom < nasabah.getSaldo && nom - nasabah.getSaldo == 0)
        ? 'Transaksi dibatalkan, Saldo anda tidak mencukupi'
        : int.parse('$nom');

    // output
    print('\n**|| Struk ||**');
    print('Status : $valid');
    print('Sisa saldo anda : $valid2');
    print('\nMutasi rekening');
    print('Transfer : $nom \nTop Up : $debit');
  } else if (opt == 2) {
    // input
    stdout.write('\nTop up saldo : ');
    int debit = int.parse(stdin.readLineSync()!);
    nasabah.saldo;
    nasabah.saldo + debit;

    print('\nSaldo berhasil di tambahkan!');
    print('Mutasi!');
    print('Top up : $debit');
  }
}

// for class eWallet
class eWallet {
  late String namaOwner;
  late String namaBank;
  late int saldo = 0;
  late List mutasi = [];

  // get
  get getNama {
    return namaOwner;
  }

  get getSaldo {
    return saldo;
  }

  get getMutasi {
    return mutasi; //< mutasi
  }

  // set
  set setNama(String nama1) {
    this.namaOwner = nama1;
  }

  setSaldo(int newSaldo) {
    this.saldo = newSaldo;
  }

  setMutasi(List transaksi) {
    this.mutasi = mutasi;
  }

  eWallet(this.namaOwner);
  // transfer function
  transfer(int nominal) {
    saldo -= nominal;
    addMutasi('Trasnfer $nominal');
  }

  // request
  request(int nominal) {
    saldo = saldo + nominal;
    addMutasi('Request $nominal');
  }

  addMutasi(String transaksi) {
    mutasi.add(transaksi);
  }
}
