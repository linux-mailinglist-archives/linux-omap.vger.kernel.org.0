Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BC12745C47
	for <lists+linux-omap@lfdr.de>; Mon,  3 Jul 2023 14:33:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230052AbjGCMdI (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 3 Jul 2023 08:33:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229793AbjGCMdH (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 3 Jul 2023 08:33:07 -0400
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C641194
        for <linux-omap@vger.kernel.org>; Mon,  3 Jul 2023 05:33:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688387587; x=1719923587;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fU/QG6pc0BirOf5sX3bW9ERTsqh7E1ut80wR4Gp6F6k=;
  b=g7QSDJyo6BYGdTSTyx0p9svU4cBENiSK7E2ZBCBhMY2TQNEkvvBNUzgf
   gl9ujo17qo1NwzzKGPBYGrs/wUDSlvmVvQA+cuuH8gNeZR+5NVM2qg1t6
   D9gh19H+dJT0oJt2TGHmtoh5ewyw/m3atCQJtY0Bkg8ZPuyFiBY44fgrr
   dh4o7o+xNDnlPIlDTtguEgdoHcgtCvSbIOx06fXN/G5KJRPCQhqyfYvEL
   MovmGjLFhADrw3myQ8wthYtCWlHxLzBYwOgNrWw0z+BH/a7Jby4Rm4u2z
   7PI4RvB4yx/GaDxEE/n1kiF/rrCLInKAWFPcK2Uao77ZlZmDb2GImFLBk
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="426554463"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="426554463"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 05:33:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10759"; a="753734134"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="753734134"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 03 Jul 2023 05:33:04 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qGIjn-000HN5-2f;
        Mon, 03 Jul 2023 12:33:03 +0000
Date:   Mon, 3 Jul 2023 20:32:36 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guo Mengqi <guomengqi3@huawei.com>, tony@atomide.com,
        haojian.zhuang@linaro.org, linus.walleij@linaro.org
Cc:     oe-kbuild-all@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        guomengqi3@huawei.com
Subject: Re: [PATCH] pinctrl: single: Fix memleak in pcs_dt_node_to_map
Message-ID: <202307032015.Tba9DLXz-lkp@intel.com>
References: <20230703081716.15810-1-guomengqi3@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230703081716.15810-1-guomengqi3@huawei.com>
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Guo,

kernel test robot noticed the following build errors:

[auto build test ERROR on linusw-pinctrl/devel]
[also build test ERROR on linusw-pinctrl/for-next linus/master v6.4 next-20230703]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Guo-Mengqi/pinctrl-single-Fix-memleak-in-pcs_dt_node_to_map/20230703-162502
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20230703081716.15810-1-guomengqi3%40huawei.com
patch subject: [PATCH] pinctrl: single: Fix memleak in pcs_dt_node_to_map
config: riscv-allmodconfig (https://download.01.org/0day-ci/archive/20230703/202307032015.Tba9DLXz-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230703/202307032015.Tba9DLXz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307032015.Tba9DLXz-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "pinmux_func_name_to_selector" [drivers/pinctrl/pinctrl-single.ko] undefined!

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for IOMMU_IO_PGTABLE_LPAE
   Depends on [n]: IOMMU_SUPPORT [=y] && (ARM || ARM64 || COMPILE_TEST [=n]) && !GENERIC_ATOMIC64 [=n]
   Selected by [y]:
   - IPMMU_VMSA [=y] && IOMMU_SUPPORT [=y] && (ARCH_RENESAS [=y] || COMPILE_TEST [=n]) && !GENERIC_ATOMIC64 [=n]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
