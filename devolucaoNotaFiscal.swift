import Foundation

let headers = [
  "cache-control": "no-cache",
  "content-type": "application/json",
  "x-consumer-key": "SEU_CONSUMER_KEY",
  "x-consumer-secret": "SEU_CONSUMER_SECRET",
  "x-access-token": "SEU_ACCESS_TOKEN",
  "x-access-token-secret": "SEU_ACCESS_TOKEN_SECRET"
]
let parameters = [
  "chave": "45150819652219000198550990000000011442380343",
  "natureza_operacao": "Devolução de venda de produção do estabelecimento",
  "codigo_cfop": "1.202",
  "produtos": [2, 3],
  "ambiente": "1"
] as [String : Any]

let postData = JSONSerialization.data(withJSONObject: parameters, options: [])

let request = NSMutableURLRequest(url: NSURL(string: "https://webmaniabr.com/api/1/nfe/devolucao/")! as URL,
                                        cachePolicy: .useProtocolCachePolicy,
                                    timeoutInterval: 10.0)
request.httpMethod = "POST"
request.allHTTPHeaderFields = headers
request.httpBody = postData as Data

let session = URLSession.shared
let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
  if (error != nil) {
    print(error)
  } else {
    let httpResponse = response as? HTTPURLResponse
    print(httpResponse)
  }
})

dataTask.resume()
