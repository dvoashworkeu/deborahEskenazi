import { TestBed } from '@angular/core/testing';

import { TypeHeadLibService } from './type-head-lib.service';

describe('TypeHeadLibService', () => {
  let service: TypeHeadLibService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(TypeHeadLibService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
