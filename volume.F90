  function volume(mat)

! Written by Patrick Avery - 2016

! Returns the volume of a cell that is defined by a 3x3 matrix of
! lattice vectors
  use datatypes
  implicit none

! Passed variables
  real(dp), intent(in) :: mat(3,3)
  real(dp) :: volume

! Local variables
  real(dp) :: v11, v12, v13, &
              v21, v22, v23, &
              v31, v32, v33

  real(dp) :: vol

  v11 = mat(1,1)
  v12 = mat(1,2)
  v13 = mat(1,3)
  v21 = mat(2,1)
  v22 = mat(2,2)
  v23 = mat(2,3)
  v31 = mat(3,1)
  v32 = mat(3,2)
  v33 = mat(3,3)
  vol = v11*(v22*v33 - v23*v32) + v12*(v31*v23 - v33*v21) + v13*(v21*v32 - v22*v31)
  volume = abs(vol)
  return
  end
