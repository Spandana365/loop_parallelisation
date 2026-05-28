program safe
integer :: i
integer :: a(10), b(10)

do i = 1,10
    a(i)=b(i)+1
end do

end program safe