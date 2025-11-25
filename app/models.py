from sqlalchemy import Column, Integer, String, Float, Enum
from database import Base
import enum

class StatusEnum(str, enum.Enum):
    Activo = "Activo"
    Inactivo = "Inactivo"
    
class Product(Base):
    __tablename__ = "products"

    id = Column(Integer, primary_key=True, index=True)
    name = Column(String(100), nullable=False)
    description = Column(String(255))
    price = Column(Float, nullable=False)
    quantity = Column(Integer, default=0)
    status = Column(Enum(StatusEnum), default=StatusEnum.Activo)