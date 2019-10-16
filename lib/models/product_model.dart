class ProductModel {
// Field
  String name, detail, pathImage, qrCode;

// Constructor
  ProductModel(this.name, this.detail, this.pathImage, this.qrCode);

  ProductModel.fromFireStore(Map<String, dynamic> mapFireStore) {
    name = mapFireStore['Name'];
    detail = mapFireStore['detail'];
    pathImage = mapFireStore['PathImage'];
    qrCode = mapFireStore['QRcode'];
  }
}
