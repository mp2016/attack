type SumRequest:void {
  .x:int
  .y:int
}

type SumResponse:void {
  .result:int
}

type AnySubNodes:void { ? }

interface MyIface {
RequestResponse:
  opUntyped(AnySubNodes)(AnySubNodes),
  opTyped(SumRequest)(SumResponse)
}
