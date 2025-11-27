from pydantic import BaseModel
from typing import Optional

class ProductCreate(BaseModel):
    name: str
    description: str | None = None
    price: float
    quantity: int
    status: str = "Activo"
    
class ProductUpdateStatus(BaseModel):
    status: str
    
class ProductOut(BaseModel):
    id: int
    name: str
    description: str
    price: float
    quantity: int
    status: str

    class Config:
        from_attributes = True
        orm_mode = True


