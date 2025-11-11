import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable } from 'rxjs';
import { environment } from '../../environments/environment';

@Injectable({
  providedIn: 'root'
})
export class ApiService {
  private baseUrl = `${environment.apiUrl}/products`; // ← debe decir products

  constructor(private http: HttpClient) {}

  getItems(): Observable<any> {
    return this.http.get(this.baseUrl);
  }

  addItem(item: any): Observable<any> {
    return this.http.post(this.baseUrl, item);
  }

  deleteItem(id: number): Observable<any> {
    return this.http.delete(`${this.baseUrl}/${id}`);
  }
}