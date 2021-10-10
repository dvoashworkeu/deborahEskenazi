import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { CommonModule } from "@angular/common";
import { Injectable } from '@angular/core';
import { TypeheadResponseModel } from '../models/type-head-response.model';
import { TypeHeadLibService } from './type-head-lib.service';

@Component({
  selector: 'lib-type-head',
  templateUrl: './type-head-lib.component.html',
  styleUrls: ['./type-head-lib.component.less']
})
export class TypeHeadLibComponent implements OnInit {

  constructor(private service: TypeHeadLibService) { }

  @Input()
  url: string = "";
  @Input()
  idField: string = "";
  @Input()
  displayField: string = "";
  text: string = "";
  resultsList: Array<any> = [];
  selectedItem: any = {}
  isListOpen: boolean = false;
  minTypingLength:number = 3;
  subscription:any = false;

  @Output() onItemSelectedCallback: EventEmitter<any> = new EventEmitter();
  
  onItemSelected(item:any) { // appending the updated value to the variable
    console.log("onItemSelected")
    var param = JSON.parse(JSON.stringify(item));
    param[this.displayField] = this.text;
    this.onItemSelectedCallback.emit(param);
    this.selectedItem = item;
    this.text = this.selectedItem[this.displayField];
    this.isListOpen = false;

  }

  onKeyUp(x:any) { // appending the updated value to the variable
    this.text = x.target.value;
    this.selectedItem = {};
    this.getSearchText();
  }

  onFocus(x:any) { // appending the updated value to the variable
    this.isListOpen = true;
  }

  onFocusOut(x:any) { // appending the updated value to the variable
    setTimeout(()=>{ this.isListOpen = false; }, 100)
  }

  getSearchText() {
    if(this.text.length < this.minTypingLength)
    {
      this.resultsList = [];
      this.isListOpen = false;
      return;
    }
      
  if ( this.subscription ) {
      this.subscription.unsubscribe();
   }
   this.subscription = this.service.getSearchText(this.url + this.text)
      .subscribe((data: TypeheadResponseModel) => {
          console.log(data);
          this.resultsList = data.SearchDataList;
        
          if(data != null && data.SearchDataList != undefined && data.SearchDataList != null && data.SearchDataList.length > 0)
            this.isListOpen = true;
          else
            this.isListOpen = false;
      });
  }

  ngOnInit(): void {
  }

}
