
.global copy_and_swap
copy_and_swap:
lr.w t0, (a0)          # Load original value.
bne t0, a1, fail       # Doesn’t match, so fail.
sc.w t0, a2, (a0)      # Try to update.
bnez t0, copy_and_swap # Retry if store-conditional failed.
li a0, 0               # Set return to success.
jr ra                  # Return.
fail:
li a0, 1               # Set return to failure.
