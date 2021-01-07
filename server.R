server <- function(input, output) {
    
    observeEvent(input$openModal, {
        showModal(
            modalDialog(title = "Source",)
        )
    })
}