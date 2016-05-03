type SumRequest:void {
  .x:int
  .y:int
}

type SumResponse:void {
  .result:int
}

interface MyIface {
RequestResponse:
  opUntyped(undefined)(undefined),
  opTyped(SumRequest)(SumResponse)
}
