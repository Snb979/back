import { Component, OnInit } from '@angular/core';
import { ApiService } from '../core/api.service';

@Component({
  selector: 'app-inventory',
  templateUrl: './inventory.component.html',
  styleUrls: ['./inventory.component.css']
})
export class InventoryComponent implements OnInit {
  items: any[] = []; // Lista completa de productos
  filteredItems: any[] = []; // Lista filtrada (búsqueda)
  paginatedItems: any[] = []; // Lista visible por página
  newItem = { name: '', description: '', price: 0, quantity: 0 };

  // 🔹 Paginación
  currentPage = 1;
  itemsPerPage = 5;

  // 🔹 Búsqueda
  searchTerm = '';

  constructor(private api: ApiService) {}

  ngOnInit() {
    this.loadItems(); // ✅ Cargar productos al iniciar la página
  }

  // 🔸 Cargar todos los productos desde el backend
  loadItems() {
    this.api.getItems().subscribe({
      next: (response: any) => {
        console.log('Respuesta del backend:', response);
        this.items = response.data || [];
        this.filteredItems = [...this.items];
        this.updatePaginatedItems(); // ✅ Inicializa la primera página
      },
      error: (error) => {
        console.error('Error al cargar productos:', error);
        this.items = [];
        this.filteredItems = [];
        this.paginatedItems = [];
      }
    });
  }

  // 🔸 Agregar un nuevo producto
  addItem() {
    if (!this.newItem.name || !this.newItem.description) return;
    this.api.addItem(this.newItem).subscribe({
      next: () => {
        this.newItem = { name: '', description: '', price: 0, quantity: 0 };
        this.loadItems();
        this.currentPage = 1;
      },
      error: (error) => {
        console.error('Error al agregar producto:', error);
      }
    });
  }

  // 🔸 Eliminar un producto
  deleteItem(id: number) {
    this.api.deleteItem(id).subscribe({
      next: () => {
        this.loadItems();
        this.currentPage = 1;
      },
      error: (error) => {
        console.error('Error al eliminar producto:', error);
      }
    });
  }

  // 🔸 Filtro de búsqueda
  applyFilter(): void {
    const term = (this.searchTerm || '').toLowerCase().trim();

    if (!term) {
      this.filteredItems = [...this.items];
    } else {
      this.filteredItems = this.items.filter(item =>
        (item.name || '').toLowerCase().includes(term) ||
        (item.description || '').toLowerCase().includes(term)
      );
    }

    this.currentPage = 1;
    this.updatePaginatedItems();
  }

  // 🔸 Actualizar los ítems visibles según la página actual
  updatePaginatedItems() {
    const start = (this.currentPage - 1) * this.itemsPerPage;
    const end = start + this.itemsPerPage;
    this.paginatedItems = this.filteredItems.slice(start, end);
  }

  // 🔸 Paginación
  totalPages() {
    return Math.ceil(this.filteredItems.length / this.itemsPerPage);
  }

  nextPage() {
    if (this.currentPage < this.totalPages()) {
      this.currentPage++;
      this.updatePaginatedItems();
    }
  }

  prevPage() {
    if (this.currentPage > 1) {
      this.currentPage--;
      this.updatePaginatedItems();
    }
  }

  goToPage(page: number) {
    if (page >= 1 && page <= this.totalPages()) {
      this.currentPage = page;
      this.updatePaginatedItems();
    }
  }
}
