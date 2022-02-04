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

  Future<List<Processo>> recuperarAtivos() async {
    List<Processo> result = [];
    QuerySnapshot querySnapshot =
        await storeProcessos.where('deleted', isEqualTo: false).where('completed', isEqualTo: false).get();

    for (int i = 0; i < querySnapshot.docs.length; i++) {
      var pro = querySnapshot.docs[i];
      result.add(Processo.fromJson(pro.data() as Map<String, dynamic>, pro.id));
    }

    return result;
  }

  Future<List<Processo>> recuperarTodos() async {
    List<Processo> result = [];
    QuerySnapshot querySnapshot = await storeProcessos.get();

    for (int i = 0; i < querySnapshot.docs.length; i++) {
      var pro = querySnapshot.docs[i];
      result.add(Processo.fromJson(pro.data() as Map<String, dynamic>, pro.id));
    }

    return result;
  }

  /**
   * Faz a exclusão lógica
   */
  Future<void> delete(Processo processo) async {
    // await storeProcessos.doc(processo.id).delete();
    await storeProcessos.doc(processo.id).update({'deleted': true});
  }

  Future<void> finalizar(Processo processo) async {
    await storeProcessos.doc(processo.id).update({'completed': true});
  }
}
