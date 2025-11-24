# app/crud.py

from sqlalchemy.orm import Session
from models import Product
from schemas import ProductCreate
from utils.validators import (
    validate_name,
    validate_price,
    validate_quantity,
    validate_description
)

def create_product(db: Session, product: ProductCreate):
    # Validaciones
    if not validate_name(product.name):
        raise ValueError("El nombre no puede estar vacío")

    if not validate_price(product.price):
        raise ValueError("El precio debe ser cero o mayor")

    if not validate_quantity(product.quantity):
        raise ValueError("La cantidad debe ser cero o mayor")

    if not validate_description(product.description):
        raise ValueError("La descripción no puede estar vacía")

    db_product = Product(**product.dict())
    db.add(db_product)
    db.commit()
    db.refresh(db_product)
    return db_product

def get_products(db: Session):
    return db.query(Product).all()

def get_product_by_id(db: Session, product_id: int):
    return db.query(Product).filter(Product.id == product_id).first()

def update_product(db: Session, product_id: int, updated_data: ProductCreate):
    product = get_product_by_id(db, product_id)
    if not product:
        return None

    # Validaciones
    if not validate_name(updated_data.name):
        raise ValueError("El nombre no puede estar vacío")

    if not validate_price(updated_data.price):
        raise ValueError("El precio debe ser cero o mayor")

    if not validate_quantity(updated_data.quantity):
        raise ValueError("La cantidad debe ser cero o mayor")

    if not validate_description(updated_data.description):
        raise ValueError("La descripción no puede estar vacía")

    for key, value in updated_data.dict().items():
        setattr(product, key, value)

    db.commit()
    db.refresh(product)
    return product

def delete_product(db: Session, product_id: int):
    product = get_product_by_id(db, product_id)
    if not product:
        return None
    db.delete(product)
    db.commit()
    return product

def filter_products_by_price(db: Session, min_price: float):
    return db.query(Product).filter(Product.price >= min_price).all()
