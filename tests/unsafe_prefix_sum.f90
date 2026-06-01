program unsafe_prefix_sum

    integer :: i, j
    integer, dimension(5) :: a
    integer :: sum

    a = (/1, 2, 3, 4, 5/)

    do i = 1, 5

        sum = 0

        do j = i, 5
            sum = sum + a(j)
        end do

        a(i) = sum

    end do

end program unsafe_prefix_sum
