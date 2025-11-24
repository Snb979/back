# app/utils/validators.py

def validate_name(name: str) -> bool:
    """
    Verifica que el nombre no esté vacío ni contenga solo espacios.
    """
    return bool(name.strip())


def validate_price(price: float) -> bool:
    """
    Verifica que el precio sea cero o positivo.
    """
    return price >= 0


def validate_quantity(quantity: int) -> bool:
    """
    Verifica que la cantidad sea cero o positiva.
    """
    return quantity >= 0


def validate_description(description: str | None) -> bool:
    """
    Verifica que la descripción sea válida si se proporciona.
    Permite None, pero no cadenas vacías o con solo espacios.
    """
    return description is None or bool(description.strip())
