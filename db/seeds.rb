# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

merchant_1 = Merchant.create(name:    "Oomba",
                             address: "9840 Irvine Center Drive",
                             city:    "Irvine",
                             state:   "CA",
                             zip:     92618)
merchant_2 = Merchant.create(name:    "Kozmo",
                             address: "80 Broad Street 14th Floor",
                             city:    "New York",
                             state:   "NY",
                             zip:     10004)

item_1 = Item.create(name:        'Firefly',
                     description: 'a soft-bodied beetle related to the glowworm',
                     price:       52.80,
                     image:       'https://upload.wikimedia.org/wikipedia/commons/thumb/5/52/Photuris_lucicrescens.jpg/440px-Photuris_lucicrescens.jpg',
                     status:      'active',
                     inventory:   7,
                     merchant_id: merchant_1.id)
item_2 = Item.create(name:        'Foxfire',
                     description: 'phosphorescent light emitted by certain fungi in decaying wood',
                     price:       1609.34,
                     image:       'https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/PanellusStipticusAug12_2009.jpg/440px-PanellusStipticusAug12_2009.jpg',
                     status:      'active',
                     inventory:   12,
                     merchant_id: merchant_1.id)
