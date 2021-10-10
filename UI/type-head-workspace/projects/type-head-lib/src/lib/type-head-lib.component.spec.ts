import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TypeHeadLibComponent } from './type-head-lib.component';

describe('TypeHeadLibComponent', () => {
  let component: TypeHeadLibComponent;
  let fixture: ComponentFixture<TypeHeadLibComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ TypeHeadLibComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(TypeHeadLibComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
