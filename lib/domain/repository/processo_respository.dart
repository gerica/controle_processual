import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:controle_processual/domain/model/processo.dart';

import 'base_repository.dart';

class ProcessoRepository extends BaseRepository {
  final storeProcessos = FirebaseFirestore.instance.collection('processos');

  Future<void> salvar(Processo processo) async {
    if (processo.id == null) {
      await storeProcessos.add(processo.toJson());
    } else {
      await storeProcessos.doc(processo.id).update(processo.toJson());
    }

    // await Future.delayed(Duration(seconds: 1), () {
    //   print('ProcessoRepository.salvar: ${processo}');
    // });
  }

  Future<List<Processo>> recuperarTodos() async {
    List<Processo> result = [];
    QuerySnapshot querySnapshot = await storeProcessos.get();

    for (int i = 0; i < querySnapshot.docs.length; i++) {
      var pro = querySnapshot.docs[i];
      result.add(Processo.fromJson(pro.data() as Map<String, dynamic>, pro.id));
    }

    // final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
    //
    // allData.forEach((pro) => result.add(Processo.fromJson(pro as Map<String, dynamic>)));

    return result;
  }

  Future<void> delete(Processo processo) async {
    await storeProcessos.doc(processo.id).delete();
  }
}
