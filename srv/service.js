const cds = require('@sap/cds')

module.exports = class BookstoreService extends cds.ApplicationService { init() {

  const { Books } = cds.entities('BookstoreService')

  this.before ('READ', Books, async (req) => {
    console.log('Before READ Books')
  })
  this.after ('READ', Books, async (books, req) => {
    console.log('After READ Books' )
  })

  return super.init()
}}
