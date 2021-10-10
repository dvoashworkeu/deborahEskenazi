import { Component } from '@angular/core';
import { TypeHeadLibComponent } from 'type-head-lib';
import { TypeAheadService } from '../services/type-ahead.service';
import { environment } from './../environments/environment';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.less']
})
export class AppComponent {
  typheadUrl: string = environment.apiUrl + '/Typehead?filterText=';
  typheadSelectedUrl: string = environment.apiUrl + '/Typehead/TypeaheadSelected';
  title = 'type head client';
  
  constructor(private service: TypeAheadService) { }

  onItemSelected(item:any) {
   
    this.service.textSelected(this.typheadSelectedUrl, item)
      .subscribe((data: any) => {
          console.log(data);
      });
    console.log(item);
  }
}
