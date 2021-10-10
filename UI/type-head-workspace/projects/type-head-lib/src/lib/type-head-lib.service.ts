import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { catchError, retry } from 'rxjs/operators';
import { TypeheadResponseModel } from '../models/type-head-response.model';

@Injectable({
  providedIn: 'root'
})
export class TypeHeadLibService {

  constructor(private http: HttpClient) { }

  getSearchText(url:string) {
    return this.http.get<TypeheadResponseModel>(url);
  }
}
