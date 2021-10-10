import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { TypeHeadLibModule } from 'type-head-lib';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { HttpClientModule } from '@angular/common/http';

@NgModule({
  declarations: [
    AppComponent
  ],
  imports: [
    BrowserModule,
    TypeHeadLibModule,
    AppRoutingModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
