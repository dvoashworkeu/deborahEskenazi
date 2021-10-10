import { NgModule } from '@angular/core';
import { TypeHeadLibComponent } from './type-head-lib.component';
import { HttpClientModule } from '@angular/common/http';
import { CommonModule } from '@angular/common';
import { FormsModule } from '@angular/forms';

@NgModule({
  declarations: [
    TypeHeadLibComponent
  ],
  imports: [
        HttpClientModule,
        CommonModule,
        FormsModule
  ],
  exports: [
    TypeHeadLibComponent
  ]
})
export class TypeHeadLibModule { }
