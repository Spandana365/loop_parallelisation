program unsafe

integer :: i
integer :: a(100)
integer :: sum
integer :: x
integer :: global_count

! Array Dependency
do i = 2,100
    a(i) = a(i-1) + 1
end do

! Shared Scalar Dependency
do i = 1,100
    x = x + i
end do

! Reduction Dependency
do i = 1,100
    sum = sum + a(i)
end do

! Output Dependency
do i = 1,100
    print *, i
end do

! File Write Dependency
do i = 1,100
    write(10,*) a(i)
end do

! Function Side Effect Dependency
do i = 1,100
    call update_global(i)
end do

! Global State Dependency
do i = 1,100
    global_count = global_count + 1
end do

end program unsafe