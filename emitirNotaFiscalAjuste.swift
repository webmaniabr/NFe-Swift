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
  "operacao": 1,
  "natureza_operacao": "CREDITO ICMS S/ ESTOQUE",
  "codigo_cfop": 2.949,
  "valor_icms": 1000,
  "ambiente": 2,
  "cliente": [
    "cpf": "000.000.000-00",
    "nome_completo": "Nome completo",
    "endereco": "Av. Brg. Faria Lima",
    "complemento": "Escritório",
    "numero": 1000,
    "bairro": "Itaim Bibi",
    "cidade": "São Paulo",
    "uf": "SP",
    "cep": "00000-000",
    "telefone": "(00) 0000-0000",
    "email": "nome@email.com"
  ]
] as [String : Any]

let postData = JSONSerialization.data(withJSONObject: parameters, options: [])

let request = NSMutableURLRequest(url: NSURL(string: "https://webmaniabr.com/api/1/nfe/ajuste/")! as URL,
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