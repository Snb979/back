# app/utils/response.py

def build_response(
    status: int = 200,
    type_: str = "success",
    title: str = "",
    message: str = "",
    data=None,
    error: str = ""
):
    return {
        "status": status,
        "type": type_,
        "title": title,
        "message": message,
        "data": data,
        "error": error
    }
