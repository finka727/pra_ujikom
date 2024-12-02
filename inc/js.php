<!-- build:js assets/vendor/js/core.js -->
<script src="assets/assets/vendor/libs/jquery/jquery.js"></script>
<script src="assets/assets/vendor/libs/popper/popper.js"></script>
<script src="assets/assets/vendor/js/bootstrap.js"></script>
<script src="assets/assets/vendor/libs/perfect-scrollbar/perfect-scrollbar.js"></script>

<script src="assets/assets/vendor/js/menu.js"></script>
<!-- endbuild -->

<!-- Vendors JS -->
<script src="assets/assets/vendor/libs/apex-charts/apexcharts.js"></script>

<!-- Main JS -->
<script src="assets/assets/js/main.js"></script>

<!-- Page JS -->
<script src="assets/assets/js/dashboards-analytics.js"></script>

<!-- Place this tag in your head or just before your close body tag. -->
<script async defer src="https://buttons.github.io/buttons.js"></script>

<script>
    let counter = 1
    $('.add-row').click(function(e) {
        let nama_paket = $('#id_service').find('option:selected').text(),
            id_paket = $('#id_service').val(),
            harga = $('#id_service').find('option:selected').data('price'),
            qty = $('.qty').val(),
            subtotal = parseInt(harga) * parseInt(qty);

        e.preventDefault()
        let newRow = `<tr>
                                <td>${counter}</td>
                                <td>${nama_paket}<input type="hidden" name="id_service[]" class="form-control" placeholder="Nama Paket" value="${id_paket}" /></td>
                                <td>${harga}<input type="hidden" name="harga[]" class="form-control harga" placeholder="Harga" value="${harga}" /></td>
                                <td>${qty}<input type="hidden" name="qty[]" class="form-control qty" placeholder="Qty" value="${qty}" /></td>
                                <td>${subtotal}<input type="hidden" name="subtotal[]" class="form-control subtotal" placeholder="Subtotal" value="${subtotal}" readonly /></td>
                              </tr>`

        $('.tbody-parent').append(newRow);
        counter++;

        let total = 0
        $('.subtotal').each(function() {
            let totalHarga = parseFloat($(this).val()) || 0
            total += totalHarga
        })
        $('.total-harga').val(total)
        $('#id_paket').val("")

        $('body').on('input', 'input[name="order_pay"]', function() {
            let total = parseFloat($('.total-harga').val()) || 0;
            let payment = parseFloat($(this).val()) || 0;
            let change = payment - total;
            $('input[name="order_change"]').val(change >= 0 ? change : 0);
        });
    })
</script>