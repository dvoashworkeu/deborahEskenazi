import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class TypeAheadService {

  constructor(private http: HttpClient) { }

  textSelected(url:string, data: any) {
    return this.http.post<number>(url, data);
  }
}
