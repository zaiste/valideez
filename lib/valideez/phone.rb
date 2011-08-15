module Valideez
  class Phone < Valideez::Base
    include Valideez::Common

    def initialize(val, options = {})
      super val

      assign({ 
        :mobile => false, 
        :format => /\A\d{9}\Z/, 
      }.merge(options))
    end

    private

    def validate_mobile
      %w(500 501 502 503 504 505 506 507 508 509 510 511 512 513 514 515 516 517 518 519
      530 531 532 533 534 535 600 601 602 603 604 605 606 607 608 609 660 661 662 663
      664 665 666 667 668 669 690 691 692 693 694 695 696 697 698 699 720 721 722 723
      724 725 726 727 728 729 780 781 782 783 784 785 786 787 788 789 790 791 792 793
      794 795 796 797 798 799 881 882 882 883 883 884 885 886 887 888 889).include?(@val[0..2])
    end
  end
end