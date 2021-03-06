open React

module TimeSignature = {
  /* Others are 2/2 9/8 3/2 12/8 and 4/2 */
  type t =
    | TwoFour
    | ThreeFour
    | FourFour
    | SixEight
  
  let toString = x =>
    switch x {
    | TwoFour => "2/4"
    | ThreeFour => "3/4"
    | FourFour => "4/4"
    | SixEight => "6/8"
    }
}

@react.component
let make = () => {
  let options = {
    open TimeSignature
    list{TwoFour, ThreeFour, FourFour, SixEight}
  }
  
  <label className="flex items-center">
    <div className="pr-2 font-bold text-gray-400 text-lg"> {"Signature"->string} </div>
    <select
      id="country"
      className="transition duration-150 ease-in-out sm:text-sm sm:leading-5 border-none font-bold text-2xl text-gray-600 bg-transparent">
      {options->Belt.List.map(option =>
        <option key={option->TimeSignature.toString}>
          {option->TimeSignature.toString->string}
        </option>
      )->Belt.List.toArray->array}
    </select>
    <svg
      viewBox="0 0 24 24"
      width="24"
      height="24"
      stroke="currentColor"
      strokeWidth="2"
      fill="none"
      strokeLinecap="round"
      strokeLinejoin="round"
      className="text-gray-400">
      <polyline points="6 9 12 15 18 9" />
    </svg>
  </label>
}
