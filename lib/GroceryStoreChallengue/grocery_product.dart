class GroceryProduct {
  const GroceryProduct({
    this.price,
    this.name,
    this.description,
    this.image,
    this.weight,
  });

  final double price;
  final String name;
  final String description;
  final String image;
  final String weight;
}

const groceryProducts = <GroceryProduct>[
  GroceryProduct(
    price: 1.25,
    name: 'Palta',
    description: 'Fruto natural, calido y delicioso',
    image: 'assets/grocery_products/palta.jpg',
    weight: '125g',
  ),
  GroceryProduct(
    price: 12.40,
    name: 'Pollo',
    description: 'Pollo fresco de calidad',
    image: 'assets/grocery_products/pollo.jpg',
    weight: '1000g',
  ),
  GroceryProduct(
    price: 2.50,
    name: 'Maracuya',
    description: 'Perfecto refresco y fruta ideal para el verano',
    image: 'assets/grocery_products/maracuya.jpg',
    weight: '145g',
  ),
  GroceryProduct(
    price: 4.00,
    name: 'Palta',
    description: 'Excelente fuente de vitamina C',
    image: 'assets/grocery_products/naranjas.jpg',
    weight: '250g',
  ),
  GroceryProduct(
    price: 2.00,
    name: 'Papas Nativas',
    description: 'Tuberculo Peruano por excelencia',
    image: 'assets/grocery_products/papas.jpg',
    weight: '500g',
  ),
  GroceryProduct(
    price: 5.20,
    name: 'Piña',
    description: 'Vive en una piña debajo del mar...',
    image: 'assets/grocery_products/piña.jpg',
    weight: '750g',
  ),
  GroceryProduct(
    price: 3.50,
    name: 'Platanos',
    description: 'Fuente de energia natural y sana',
    image: 'assets/grocery_products/platanos.jpg',
    weight: '240g',
  ),
  GroceryProduct(
    price: 4.50,
    name: 'Zanahorias',
    description: 'El conejo come...',
    image: 'assets/grocery_products/zanahorias.jpg',
    weight: '450g',
  ),
];
