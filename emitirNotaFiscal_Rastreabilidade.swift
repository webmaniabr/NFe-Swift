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
  "ID": 1137,
  "url_notificacao": "http://meudominio.com/retorno.php",
  "operacao": 1,
  "natureza_operacao": "Venda de produção do estabelecimento",
  "modelo": 1,
  "finalidade": 1,
  "ambiente": 2,
  "cliente": [
    "cpf": "000.000.000-00",
    "nome_completo": "Nome do Cliente",
    "endereco": "Av. Brg. Faria Lima",
    "complemento": "Escritório",
    "numero": 1000,
    "bairro": "Itaim Bibi",
    "cidade": "São Paulo",
    "uf": "SP",
    "cep": "00000-000",
    "telefone": "(00) 0000-0000",
    "email": "nome@email.com"
  ],
  "produtos": [
    [
      "nome": "Nome do produto",
      "codigo": "nome-do-produto",
      "ncm": "6109.10.00",
      "cest": "28.038.00",
      "quantidade": 3,
      "unidade": "UN",
      "peso": "0.800",
      "origem": "",
      "subtotal": "44.90",
      "total": "134.70",
      "classe_imposto": "REF2892",
      "rastro": [
        "lote": "000001",
        "quantidade": "100",
        "data_fabricacao": "2018-01-01",
        "data_validade": "2020-01-01"
      ]
    ]
  ],
  "pedido": [
    "pagamento": "",
    "presenca": 2,
    "modalidade_frete": "",
    "frete": "12.56",
    "desconto": "10.00",
    "total": "174.60"
  ]
] as [String : Any]

let postData = JSONSerialization.data(withJSONObject: parameters, options: [])

let request = NSMutableURLRequest(url: NSURL(string: "https://webmaniabr.com/api/1/nfe/emissao/")! as URL,
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