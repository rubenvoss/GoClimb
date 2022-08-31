# PgSearch.multisearch_options = {
#   using: [:tsearch, :trigram],
#   ignoring: :accents
# }


# include PgSearch::Model
PgSearch.multisearch_options = {
  using: {
    tsearch: { prefix: true }
  }
}


# PgSearch.multisearch_options = { :using => { :tsearch => { :prefix => true },
#                                              :trigram => {},
#                                              :dmetaphone => {} },
#                                  :ignoring => :accents }

# pg_search_scope :search_by_title_and_synopsis,
#   against: [ :title, :synopsis ],

#   using: {
#     tsearch: { prefix: true } # <-- now `superman batm` will return something!
#   }
