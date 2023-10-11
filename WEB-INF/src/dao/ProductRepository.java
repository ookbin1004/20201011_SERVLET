package dao;
import java.util.ArrayList;
import dto.Product;

public class ProductRepository {
    private ArrayList<Product> listOfProducts = new ArrayList<Product>();
    private static ProductRepository instance = new ProductRepository();
    
    public static ProductRepository getInstance(){
        return instance;
    }
    
    public ProductRepository(){
        Product phone = new Product("P1234", "Galaxy S22+", 200000);
		phone.setDescription("6.6-inch, 2340X1080 Dynamic Display, 50 million pixel Camera");
		phone.setCategory("Smart Phone");
		phone.setManufacturer("Samsung");
		phone.setUnitsInStock(1000);
		phone.setCondition("Old");
        phone.setFilename("P1234.jpg");
        
        Product pad = new Product("P5678", "iPad", 600000);
        pad.setDescription("8.3-inch, 2266X1488 Liquid Retina Display");
        pad.setCategory("iPad");
        pad.setManufacturer("Apple");
        pad.setUnitsInStock(1000);
        pad.setCondition("New");
        pad.setFilename("P5678.jpg");
        
        Product Headphone = new Product("P9012", "AirPods Max", 800000);
        Headphone.setDescription("Bluetooth 5.0, Noise Canceling, 134.5g");
        Headphone.setCategory("Headphone");
        Headphone.setManufacturer("Apple");
        Headphone.setUnitsInStock(1000);
        Headphone.setCondition("New");
        Headphone.setFilename("P9012.jpg");
        
        listOfProducts.add(phone);
        listOfProducts.add(pad);
        listOfProducts.add(Headphone);
    }
    
    public ArrayList <Product> getAllProducts(){
            return listOfProducts;
        }
    
    public Product getProductById(String productId){
        Product productById =null;
        
        for (int i=0; i<listOfProducts.size(); i++){
            Product product = listOfProducts.get(i);
            if (product != null && product.getProductId() != null && product.getProductId().equals(productId)){
                productById = product;
                break;
            }
        }
        return productById;
    }
    
    public void addProduct(Product product){
        listOfProducts.add(product);
    }
}