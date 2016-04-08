  program getPOSCARVolume

! Written by Patrick Avery - 2016
! Reads a POSCAR file and prints the volume

  use datatypes
  implicit none

! Local variables
  character(MAX_PATH_LEN) :: filename
  integer :: openStatus, u

  character(MAX_PATH_LEN) :: title
  real(dp) :: scalingFactor
  real(dp) :: latticeVecs(3,3)
  real(dp) :: vol, volume

  if (iargc() .ne. 1) then
    write (*,"(A)", advance="no") "Please enter the name of the POSCAR as a"
    write (*,*) "single argument after the name of the executable"
    call exit(-1)
  end if

  call getarg(1, filename)

! Let's try to open the file
  u = 1
  open(unit = u, file = filename, status = 'old', iostat = openStatus, &
       action = 'read', position = 'rewind')

! Check and make sure we opened it successfully
  if ( openStatus /= 0 ) then
    print *, 'Could not open ', trim(filename),' for reading.', &
    'unit =', u
    call exit(-1)
  endif

! Read the file
  read(u,*) title
  read(u,*) scalingFactor
  read(u,*) latticeVecs(1,1), latticeVecs(1,2), latticeVecs(1,3)
  read(u,*) latticeVecs(2,1), latticeVecs(2,2), latticeVecs(2,3)
  read(u,*) latticeVecs(3,1), latticeVecs(3,2), latticeVecs(3,3)

! Close the file
  close(unit = u)

! Calculate and print the volume

  vol = volume(latticeVecs)

  write(*,*) "Volume is: ", vol, " Angstroms"

  end program
