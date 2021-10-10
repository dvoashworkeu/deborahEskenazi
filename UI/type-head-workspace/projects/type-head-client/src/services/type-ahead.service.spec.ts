import { TestBed } from '@angular/core/testing';

import { TypeAheadService } from './type-ahead.service';

describe('TypeAheadService', () => {
  let service: TypeAheadService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(TypeAheadService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
