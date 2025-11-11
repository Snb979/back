# Importaciones necesarias
from fastapi import FastAPI, Depends
from sqlalchemy.orm import Session
from fastapi.middleware.cors import CORSMiddleware
from database import SessionLocal, engine, Base
from models import Product
from utils.response import build_response
from schemas import ProductCreate, ProductOut
from crud import (
    create_product,
    get_products,
    get_product_by_id,
    update_product,
    delete_product,
    filter_products_by_price
)
from utils.validators import (
    validate_name,
    validate_price,
    validate_quantity,
    validate_description
)

# Crear tablas en la base de datos
Base.metadata.create_all(bind=engine)

# Inicializar la app FastAPI
app = FastAPI()

# Configurar CORS
app.add_middleware(
    CORSMiddleware,
    allow_origins=["http://localhost:4200"],
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"],
)

# Dependencia para obtener sesión de base de datos
def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()

# Crear producto
@app.post("/products/", response_model=dict)
def create_product_endpoint(product: ProductCreate, db: Session = Depends(get_db)):
    try:
        # Validaciones
        if not validate_name(product.name):
            raise ValueError("El nombre no puede estar vacío")

        if not validate_price(product.price):
            raise ValueError("El precio debe ser cero o mayor")

        if not validate_quantity(product.quantity):
            raise ValueError("La cantidad debe ser cero o mayor")

        if not validate_description(product.description):
            raise ValueError("La descripción no puede estar vacía")

        new_product = create_product(db, product)
        return build_response(
            status=201,
            type_="success",
            title="Producto creado",
            message="El producto fue creado correctamente",
            data=ProductOut.from_orm(new_product)
        )
    except Exception as e:
        return build_response(
            status=500,
            type_="error",
            title="Error al crear producto",
            message="No se pudo crear el producto",
            error=str(e)
        )

# Listar productos
@app.get("/products/", response_model=dict)
def list_products(db: Session = Depends(get_db)):
    try:
        products = get_products(db)
        serialized = [ProductOut.from_orm(p) for p in products]
        return build_response(
            title="Listado de productos",
            message="Productos obtenidos correctamente",
            data=serialized
        )
    except Exception as e:
        return build_response(
            type_="error",
            title="Error al obtener productos",
            message="No se pudo obtener el listado",
            error=str(e)
        )

# Filtrar productos por precio mínimo
@app.get("/products/filter", response_model=dict)
def filter_products(min_price: float, db: Session = Depends(get_db)):
    try:
        filtered = filter_products_by_price(db, min_price)
        serialized = [ProductOut.from_orm(p) for p in filtered]
        return build_response(
            title="Productos filtrados",
            message="Productos filtrados correctamente",
            data=serialized
        )
    except Exception as e:
        return build_response(
            type_="error",
            title="Error al filtrar productos",
            message="No se pudo filtrar productos",
            error=str(e)
        )

# Obtener producto por ID
@app.get("/products/{product_id}", response_model=dict)
def read_product(product_id: int, db: Session = Depends(get_db)):
    try:
        product = get_product_by_id(db, product_id)
        if not product:
            return build_response(
                status=404,
                type_="error",
                title="Producto no encontrado",
                message="No existe un producto con ese ID"
            )
        return build_response(
            title="Producto obtenido",
            message="Producto obtenido correctamente",
            data=ProductOut.from_orm(product)
        )
    except Exception as e:
        return build_response(
            type_="error",
            title="Error al obtener producto",
            message="No se pudo obtener el producto",
            error=str(e)
        )

# Actualizar producto
@app.put("/products/{product_id}", response_model=dict)
def update_product_endpoint(product_id: int, product_data: ProductCreate, db: Session = Depends(get_db)):
    try:
        # Validaciones
        if not validate_name(product_data.name):
            raise ValueError("El nombre no puede estar vacío")

        if not validate_price(product_data.price):
            raise ValueError("El precio debe ser cero o mayor")

        if not validate_quantity(product_data.quantity):
            raise ValueError("La cantidad debe ser cero o mayor")

        if not validate_description(product_data.description):
            raise ValueError("La descripción no puede estar vacía")

        updated = update_product(db, product_id, product_data)
        if not updated:
            return build_response(
                status=404,
                type_="error",
                title="Producto no encontrado",
                message="No existe un producto con ese ID"
            )
        return build_response(
            title="Producto actualizado",
            message="Producto actualizado correctamente",
            data=ProductOut.from_orm(updated)
        )
    except Exception as e:
        return build_response(
            type_="error",
            title="Error al actualizar producto",
            message="No se pudo actualizar el producto",
            error=str(e)
        )

# Eliminar producto
@app.delete("/products/{product_id}", response_model=dict)
def delete_product_endpoint(product_id: int, db: Session = Depends(get_db)):
    try:
        deleted = delete_product(db, product_id)
        if not deleted:
            return build_response(
                status=404,
                type_="error",
                title="Producto no encontrado",
                message="No existe un producto con ese ID"
            )
        return build_response(
            title="Producto eliminado",
            message="Producto eliminado correctamente",
            data=True
        )
    except Exception as e:
        return build_response(
            type_="error",
            title="Error al eliminar producto",
            message="No se pudo eliminar el producto",
            error=str(e)
        )
