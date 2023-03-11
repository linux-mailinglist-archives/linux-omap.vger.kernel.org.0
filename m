Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3E8E66B5835
	for <lists+linux-omap@lfdr.de>; Sat, 11 Mar 2023 05:41:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229637AbjCKElp (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 10 Mar 2023 23:41:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbjCKElo (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 10 Mar 2023 23:41:44 -0500
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 410E01C303;
        Fri, 10 Mar 2023 20:41:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1678509703; x=1710045703;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=C+Y5bxY9qe45ry63psa0DIaiA7c2eI/wBZK0raAHYVQ=;
  b=Duo1TnOZ4UAMdph5almpr8MOKGBcF7dCNbi5lf+2lAeQZdYETiUl7aly
   DIDAI2jhMI/Oj3TDRAQ4P2cvTm3wFaJT/d6qb1FQP+1/8TgFIkKiiGA6P
   /kXSePdF8Sl2ZMp+L94V2XHlS/fkpJSDvrMSLMoZ+qL5RTOlarr03rMoL
   PndSgQ4vIzc+ZjzgYlj7Wc+g+dJld6Kl5xeLO+CEoPYW3nvysNa9Fb0BV
   x00a/PIy1kia/+n+uS63JTIOB0ii/OKI3x5ZUns+Zra9PXZga9Jj0j+qR
   SgEASVVimtQenwA47Pxl4W4DYZwnTEr/wyaWmsblFcUSysrk0O3P7yE0R
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="316522271"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; 
   d="scan'208";a="316522271"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2023 20:41:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10645"; a="680435840"
X-IronPort-AV: E=Sophos;i="5.98,251,1673942400"; 
   d="scan'208";a="680435840"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 10 Mar 2023 20:41:40 -0800
Received: from kbuild by b613635ddfff with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1par35-0004Kd-2k;
        Sat, 11 Mar 2023 04:41:39 +0000
Date:   Sat, 11 Mar 2023 12:40:53 +0800
From:   kernel test robot <lkp@intel.com>
To:     Rob Herring <robh@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        Helge Deller <deller@gmx.de>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH] fbdev: Use of_property_present() for testing DT property
 presence
Message-ID: <202303111229.3Uuc8JQV-lkp@intel.com>
References: <20230310144729.1545943-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230310144729.1545943-1-robh@kernel.org>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_PASS,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Rob,

I love your patch! Yet something to improve:

[auto build test ERROR on drm-misc/drm-misc-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Rob-Herring/fbdev-Use-of_property_present-for-testing-DT-property-presence/20230310-225754
base:   git://anongit.freedesktop.org/drm/drm-misc drm-misc-next
patch link:    https://lore.kernel.org/r/20230310144729.1545943-1-robh%40kernel.org
patch subject: [PATCH] fbdev: Use of_property_present() for testing DT property presence
config: arm64-randconfig-r032-20230310 (https://download.01.org/0day-ci/archive/20230311/202303111229.3Uuc8JQV-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project 67409911353323ca5edf2049ef0df54132fa1ca7)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/c013f4111f36b0b4327e7fbf46c0dd93399e9209
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Rob-Herring/fbdev-Use-of_property_present-for-testing-DT-property-presence/20230310-225754
        git checkout c013f4111f36b0b4327e7fbf46c0dd93399e9209
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/video/fbdev/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303111229.3Uuc8JQV-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/video/fbdev/amba-clcd.c:857:6: error: call to undeclared function 'of_property_present'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
           if (of_property_present(node, "memory-region")) {
               ^
   drivers/video/fbdev/amba-clcd.c:857:6: note: did you mean 'fwnode_property_present'?
   include/linux/property.h:59:6: note: 'fwnode_property_present' declared here
   bool fwnode_property_present(const struct fwnode_handle *fwnode,
        ^
   1 error generated.


vim +/of_property_present +857 drivers/video/fbdev/amba-clcd.c

   843	
   844	static struct clcd_board *clcdfb_of_get_board(struct amba_device *dev)
   845	{
   846		struct clcd_board *board = devm_kzalloc(&dev->dev, sizeof(*board),
   847				GFP_KERNEL);
   848		struct device_node *node = dev->dev.of_node;
   849	
   850		if (!board)
   851			return NULL;
   852	
   853		board->name = of_node_full_name(node);
   854		board->caps = CLCD_CAP_ALL;
   855		board->check = clcdfb_check;
   856		board->decode = clcdfb_decode;
 > 857		if (of_property_present(node, "memory-region")) {
   858			board->setup = clcdfb_of_vram_setup;
   859			board->mmap = clcdfb_of_vram_mmap;
   860			board->remove = clcdfb_of_vram_remove;
   861		} else {
   862			board->setup = clcdfb_of_dma_setup;
   863			board->mmap = clcdfb_of_dma_mmap;
   864			board->remove = clcdfb_of_dma_remove;
   865		}
   866	
   867		return board;
   868	}
   869	#else
   870	static struct clcd_board *clcdfb_of_get_board(struct amba_device *dev)
   871	{
   872		return NULL;
   873	}
   874	#endif
   875	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
