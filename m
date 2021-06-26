Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DCD93B4B7C
	for <lists+linux-omap@lfdr.de>; Sat, 26 Jun 2021 02:24:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229885AbhFZA0n (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 25 Jun 2021 20:26:43 -0400
Received: from mga06.intel.com ([134.134.136.31]:24272 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229831AbhFZA0n (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Fri, 25 Jun 2021 20:26:43 -0400
IronPort-SDR: wUs2ytBsfMfItvjB+7UBi3b/z+hYPaRRiJLKAUcYIGZmb+It1V0bKijhcfNLMjcA0X45BLTG6P
 gfY5E1h1dptA==
X-IronPort-AV: E=McAfee;i="6200,9189,10026"; a="268889957"
X-IronPort-AV: E=Sophos;i="5.83,300,1616482800"; 
   d="gz'50?scan'50,208,50";a="268889957"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2021 17:24:21 -0700
IronPort-SDR: EybVK64917pz5Z0TIgmFokaiYYDwvJI81xbEKIDdNpD9VAKJNJIbb6MvPRgY2t21JcY7FvZvrG
 vPDK5+49deYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,300,1616482800"; 
   d="gz'50?scan'50,208,50";a="557847019"
Received: from lkp-server01.sh.intel.com (HELO 4aae0cb4f5b5) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 25 Jun 2021 17:24:17 -0700
Received: from kbuild by 4aae0cb4f5b5 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1lww7M-0007T2-Ts; Sat, 26 Jun 2021 00:24:16 +0000
Date:   Sat, 26 Jun 2021 08:23:18 +0800
From:   kernel test robot <lkp@intel.com>
To:     13145886936@163.com, tony@atomide.com, linux@armlinux.org.uk,
        linux-arm-kernel@lists.infradead.org
Cc:     kbuild-all@lists.01.org, clang-built-linux@googlegroups.com,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        gushengxian <gushengxian@yulong.com>
Subject: Re: [PATCH] ARM: omap2: remove unneeded variable: "errata"
Message-ID: <202106260825.x0gPCYmM-lkp@intel.com>
References: <20210624032751.24315-1-13145886936@163.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="NzB8fVQJ5HfG6fxh"
Content-Disposition: inline
In-Reply-To: <20210624032751.24315-1-13145886936@163.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org


--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on omap/for-next]
[also build test ERROR on v5.13-rc7 next-20210625]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/13145886936-163-com/ARM-omap2-remove-unneeded-variable-errata/20210624-112929
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git for-next
config: arm-randconfig-r004-20210625 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 9ca0171a9ffdef5fdb1511d197a3fd72490362de)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # https://github.com/0day-ci/linux/commit/d29c977cd4692b7db84c7fa336de0bfe8941584e
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review 13145886936-163-com/ARM-omap2-remove-unneeded-variable-errata/20210624-112929
        git checkout d29c977cd4692b7db84c7fa336de0bfe8941584e
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross ARCH=arm 

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> arch/arm/mach-omap2/dma.c:112:3: error: use of undeclared identifier 'errata'
                   SET_DMA_ERRATA(DMA_ERRATA_IFRAME_BUFFERING);
                   ^
   include/linux/omap-dma.h:105:30: note: expanded from macro 'SET_DMA_ERRATA'
   #define SET_DMA_ERRATA(id)              (errata |= (id))
                                            ^
   arch/arm/mach-omap2/dma.c:113:3: error: use of undeclared identifier 'errata'
                   SET_DMA_ERRATA(DMA_ERRATA_PARALLEL_CHANNELS);
                   ^
   include/linux/omap-dma.h:105:30: note: expanded from macro 'SET_DMA_ERRATA'
   #define SET_DMA_ERRATA(id)              (errata |= (id))
                                            ^
   arch/arm/mach-omap2/dma.c:122:3: error: use of undeclared identifier 'errata'
                   SET_DMA_ERRATA(DMA_ERRATA_i378);
                   ^
   include/linux/omap-dma.h:105:30: note: expanded from macro 'SET_DMA_ERRATA'
   #define SET_DMA_ERRATA(id)              (errata |= (id))
                                            ^
   arch/arm/mach-omap2/dma.c:133:3: error: use of undeclared identifier 'errata'
                   SET_DMA_ERRATA(DMA_ERRATA_i541);
                   ^
   include/linux/omap-dma.h:105:30: note: expanded from macro 'SET_DMA_ERRATA'
   #define SET_DMA_ERRATA(id)              (errata |= (id))
                                            ^
   arch/arm/mach-omap2/dma.c:142:3: error: use of undeclared identifier 'errata'
                   SET_DMA_ERRATA(DMA_ERRATA_i88);
                   ^
   include/linux/omap-dma.h:105:30: note: expanded from macro 'SET_DMA_ERRATA'
   #define SET_DMA_ERRATA(id)              (errata |= (id))
                                            ^
   arch/arm/mach-omap2/dma.c:148:2: error: use of undeclared identifier 'errata'
           SET_DMA_ERRATA(DMA_ERRATA_3_3);
           ^
   include/linux/omap-dma.h:105:30: note: expanded from macro 'SET_DMA_ERRATA'
   #define SET_DMA_ERRATA(id)              (errata |= (id))
                                            ^
   arch/arm/mach-omap2/dma.c:158:3: error: use of undeclared identifier 'errata'
                   SET_DMA_ERRATA(DMA_ROMCODE_BUG);
                   ^
   include/linux/omap-dma.h:105:30: note: expanded from macro 'SET_DMA_ERRATA'
   #define SET_DMA_ERRATA(id)              (errata |= (id))
                                            ^
   7 errors generated.


vim +/errata +112 arch/arm/mach-omap2/dma.c

f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20   82  
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20   83  	/*
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20   84  	 * Errata applicable for OMAP2430ES1.0 and all omap2420
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20   85  	 *
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20   86  	 * I.
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20   87  	 * Erratum ID: Not Available
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20   88  	 * Inter Frame DMA buffering issue DMA will wrongly
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20   89  	 * buffer elements if packing and bursting is enabled. This might
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20   90  	 * result in data gets stalled in FIFO at the end of the block.
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20   91  	 * Workaround: DMA channels must have BUFFERING_DISABLED bit set to
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20   92  	 * guarantee no data will stay in the DMA FIFO in case inter frame
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20   93  	 * buffering occurs
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20   94  	 *
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20   95  	 * II.
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20   96  	 * Erratum ID: Not Available
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20   97  	 * DMA may hang when several channels are used in parallel
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20   98  	 * In the following configuration, DMA channel hanging can occur:
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20   99  	 * a. Channel i, hardware synchronized, is enabled
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  100  	 * b. Another channel (Channel x), software synchronized, is enabled.
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  101  	 * c. Channel i is disabled before end of transfer
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  102  	 * d. Channel i is reenabled.
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  103  	 * e. Steps 1 to 4 are repeated a certain number of times.
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  104  	 * f. A third channel (Channel y), software synchronized, is enabled.
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  105  	 * Channel x and Channel y may hang immediately after step 'f'.
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  106  	 * Workaround:
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  107  	 * For any channel used - make sure NextLCH_ID is set to the value j.
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  108  	 */
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  109  	if (cpu_is_omap2420() || (cpu_is_omap2430() &&
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  110  				(omap_type() == OMAP2430_REV_ES1_0))) {
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  111  
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20 @112  		SET_DMA_ERRATA(DMA_ERRATA_IFRAME_BUFFERING);
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  113  		SET_DMA_ERRATA(DMA_ERRATA_PARALLEL_CHANNELS);
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  114  	}
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  115  
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  116  	/*
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  117  	 * Erratum ID: i378: OMAP2+: sDMA Channel is not disabled
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  118  	 * after a transaction error.
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  119  	 * Workaround: SW should explicitely disable the channel.
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  120  	 */
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  121  	if (cpu_class_is_omap2())
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  122  		SET_DMA_ERRATA(DMA_ERRATA_i378);
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  123  
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  124  	/*
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  125  	 * Erratum ID: i541: sDMA FIFO draining does not finish
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  126  	 * If sDMA channel is disabled on the fly, sDMA enters standby even
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  127  	 * through FIFO Drain is still in progress
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  128  	 * Workaround: Put sDMA in NoStandby more before a logical channel is
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  129  	 * disabled, then put it back to SmartStandby right after the channel
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  130  	 * finishes FIFO draining.
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  131  	 */
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  132  	if (cpu_is_omap34xx())
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  133  		SET_DMA_ERRATA(DMA_ERRATA_i541);
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  134  
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  135  	/*
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  136  	 * Erratum ID: i88 : Special programming model needed to disable DMA
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  137  	 * before end of block.
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  138  	 * Workaround: software must ensure that the DMA is configured in No
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  139  	 * Standby mode(DMAx_OCP_SYSCONFIG.MIDLEMODE = "01")
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  140  	 */
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  141  	if (omap_type() == OMAP3430_REV_ES1_0)
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  142  		SET_DMA_ERRATA(DMA_ERRATA_i88);
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  143  
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  144  	/*
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  145  	 * Erratum 3.2/3.3: sometimes 0 is returned if CSAC/CDAC is
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  146  	 * read before the DMA controller finished disabling the channel.
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  147  	 */
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  148  	SET_DMA_ERRATA(DMA_ERRATA_3_3);
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  149  
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  150  	/*
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  151  	 * Erratum ID: Not Available
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  152  	 * A bug in ROM code leaves IRQ status for channels 0 and 1 uncleared
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  153  	 * after secure sram context save and restore.
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  154  	 * Work around: Hence we need to manually clear those IRQs to avoid
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  155  	 * spurious interrupts. This affects only secure devices.
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  156  	 */
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  157  	if (cpu_is_omap34xx() && (omap_type() != OMAP2_DEVICE_TYPE_GP))
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  158  		SET_DMA_ERRATA(DMA_ROMCODE_BUG);
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  159  
d29c977cd4692b gushengxian           2021-06-23  160  	return 0;
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  161  }
f31cc9622d75c1 G, Manjunath Kondaiah 2010-12-20  162  

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--NzB8fVQJ5HfG6fxh
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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
AA==

--NzB8fVQJ5HfG6fxh--
