Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CF2AD745F4C
	for <lists+linux-omap@lfdr.de>; Mon,  3 Jul 2023 17:00:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229653AbjGCPAV (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 3 Jul 2023 11:00:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230374AbjGCPAU (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 3 Jul 2023 11:00:20 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54B7CE6B
        for <linux-omap@vger.kernel.org>; Mon,  3 Jul 2023 08:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688396416; x=1719932416;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/SC299MI8hD9SblfQRCs0VfwFMe1NbrckktWFQkiWMQ=;
  b=nWEGFeGMqYrN8YDZCSXMWRnvEaFeBRIxA/DYD+5oWJqtN2xygSFGf4ig
   lLh0LxvirnmAqBEM3ca0J1Iz0l3O41XFWsTsDLxAXIwixAoXdr1DEbU8Q
   VgusMcPcFBFBDfWwSWJfeHCvzg5fFJeaDq4aeodItu4Er8qef+lOvwho3
   ZypFPP87e5QpiYEmXpIZoBJPCeq0gxtT7SDCSaCrzkqn8pDAFwLUAQ/DD
   5IKsICsp4AItUTJmjeXGRaG8PHn6Z8KAyyeHoFn3/OnMsmB3LFr7YOalI
   3X6fcs/enFvQ0jrYxpU+xFqXdzyNq4RxzLf+9eho1l9BtTS1b1ykUHPaW
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="343235542"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="343235542"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2023 08:00:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10760"; a="965206484"
X-IronPort-AV: E=Sophos;i="6.01,178,1684825200"; 
   d="scan'208";a="965206484"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 03 Jul 2023 08:00:13 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qGL2C-000HQj-1g;
        Mon, 03 Jul 2023 15:00:12 +0000
Date:   Mon, 3 Jul 2023 22:59:41 +0800
From:   kernel test robot <lkp@intel.com>
To:     Guo Mengqi <guomengqi3@huawei.com>, tony@atomide.com,
        haojian.zhuang@linaro.org, linus.walleij@linaro.org
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org,
        guomengqi3@huawei.com
Subject: Re: [PATCH] pinctrl: single: Fix memleak in pcs_dt_node_to_map
Message-ID: <202307032226.op2VP7X5-lkp@intel.com>
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
[also build test ERROR on linusw-pinctrl/for-next linus/master v6.4]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Guo-Mengqi/pinctrl-single-Fix-memleak-in-pcs_dt_node_to_map/20230703-162502
base:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
patch link:    https://lore.kernel.org/r/20230703081716.15810-1-guomengqi3%40huawei.com
patch subject: [PATCH] pinctrl: single: Fix memleak in pcs_dt_node_to_map
config: i386-randconfig-i011-20230703 (https://download.01.org/0day-ci/archive/20230703/202307032226.op2VP7X5-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230703/202307032226.op2VP7X5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307032226.op2VP7X5-lkp@intel.com/

All errors (new ones prefixed by >>, old ones prefixed by <<):

>> ERROR: modpost: "pinmux_func_name_to_selector" [drivers/pinctrl/pinctrl-single.ko] undefined!

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
