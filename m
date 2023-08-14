Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 597F377C3E5
	for <lists+linux-omap@lfdr.de>; Tue, 15 Aug 2023 01:21:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230102AbjHNXVG (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 14 Aug 2023 19:21:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233496AbjHNXUq (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 14 Aug 2023 19:20:46 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 192A4171B
        for <linux-omap@vger.kernel.org>; Mon, 14 Aug 2023 16:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692055241; x=1723591241;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6R3IlU4037oAS239BEeiCZLjKRvvjdnnateL0pbLzho=;
  b=grFmhi084z4HQC3SapjcFNrpAbj1XVtH4JS4pxzRf9fiyTHj5S31/bQh
   lknpXKcy77mtHjHkZS4T+AJnWg+OCza77PC+v7qDIxXAbNDjXMcYq3St7
   AXsQVj5RtYEgb+QuId1IhtF0ze+0iysocP192p0kKJ+2ytIEzI+ZCfsVZ
   kVp4CFOV4894UGSm+nysjN98jyv4lJRfl47ZqEgDcRAWfVN1IIpurMp0w
   yIRtelKEURfZB43GF7wYXstzkeAVJ6PrfHy466nE07GjrmWb8ULfe8fI0
   Ssz5prABl/Rvfkkfkld2mcDrHxM72Br9i50x8bQqifrn9d/mV+5sSmmOg
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="436051471"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="436051471"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2023 16:20:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10802"; a="823641357"
X-IronPort-AV: E=Sophos;i="6.01,173,1684825200"; 
   d="scan'208";a="823641357"
Received: from lkp-server02.sh.intel.com (HELO b5fb8d9e1ffc) ([10.239.97.151])
  by FMSMGA003.fm.intel.com with ESMTP; 14 Aug 2023 16:20:38 -0700
Received: from kbuild by b5fb8d9e1ffc with local (Exim 4.96)
        (envelope-from <lkp@intel.com>)
        id 1qVgrV-0000Ut-04;
        Mon, 14 Aug 2023 23:20:37 +0000
Date:   Tue, 15 Aug 2023 07:20:04 +0800
From:   kernel test robot <lkp@intel.com>
To:     Tony Lindgren <tony@atomide.com>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-omap@vger.kernel.org, Dhruva Gole <d-gole@ti.com>
Subject: [tmlind-omap:omap-for-v6.6/ti-sysc 3/5]
 drivers/bus/ti-sysc.c:3107:19: warning: cast to smaller integer type 'enum
 sysc_soc' from 'const void *'
Message-ID: <202308150723.ziuGCdM3-lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Tony,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git omap-for-v6.6/ti-sysc
head:   40a4f49cd32dbc641c706215c1fa6c5bd051428c
commit: 063dc0622705623b3a70739b9f33d5ea019882e6 [3/5] bus: ti-sysc: Build driver for TI K3 SoCs
config: arm64-randconfig-r006-20230815 (https://download.01.org/0day-ci/archive/20230815/202308150723.ziuGCdM3-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230815/202308150723.ziuGCdM3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308150723.ziuGCdM3-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/bus/ti-sysc.c:3107:19: warning: cast to smaller integer type 'enum sysc_soc' from 'const void *' [-Wvoid-pointer-to-enum-cast]
    3107 |                 sysc_soc->soc = (enum sysc_soc)match->data;
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
   1 warning generated.


vim +3107 drivers/bus/ti-sysc.c

feaa8baee82aba Tony Lindgren     2020-02-24  3073  
feaa8baee82aba Tony Lindgren     2020-02-24  3074  /*
9d881361206ebc Tony Lindgren     2021-09-21  3075   * One time init to detect the booted SoC, disable unavailable features
9d881361206ebc Tony Lindgren     2021-09-21  3076   * and initialize list for optional cpu_pm notifier.
9d881361206ebc Tony Lindgren     2021-09-21  3077   *
feaa8baee82aba Tony Lindgren     2020-02-24  3078   * Note that we initialize static data shared across all ti-sysc instances
feaa8baee82aba Tony Lindgren     2020-02-24  3079   * so ddata is only used for SoC type. This can be called from module_init
feaa8baee82aba Tony Lindgren     2020-02-24  3080   * once we no longer need to rely on platform data.
feaa8baee82aba Tony Lindgren     2020-02-24  3081   */
9d881361206ebc Tony Lindgren     2021-09-21  3082  static int sysc_init_static_data(struct sysc *ddata)
feaa8baee82aba Tony Lindgren     2020-02-24  3083  {
feaa8baee82aba Tony Lindgren     2020-02-24  3084  	const struct soc_device_attribute *match;
feaa8baee82aba Tony Lindgren     2020-02-24  3085  	struct ti_sysc_platform_data *pdata;
feaa8baee82aba Tony Lindgren     2020-02-24  3086  	unsigned long features = 0;
5f7259a578e9c6 Tony Lindgren     2021-03-08  3087  	struct device_node *np;
feaa8baee82aba Tony Lindgren     2020-02-24  3088  
feaa8baee82aba Tony Lindgren     2020-02-24  3089  	if (sysc_soc)
feaa8baee82aba Tony Lindgren     2020-02-24  3090  		return 0;
feaa8baee82aba Tony Lindgren     2020-02-24  3091  
feaa8baee82aba Tony Lindgren     2020-02-24  3092  	sysc_soc = kzalloc(sizeof(*sysc_soc), GFP_KERNEL);
feaa8baee82aba Tony Lindgren     2020-02-24  3093  	if (!sysc_soc)
feaa8baee82aba Tony Lindgren     2020-02-24  3094  		return -ENOMEM;
feaa8baee82aba Tony Lindgren     2020-02-24  3095  
feaa8baee82aba Tony Lindgren     2020-02-24  3096  	mutex_init(&sysc_soc->list_lock);
feaa8baee82aba Tony Lindgren     2020-02-24  3097  	INIT_LIST_HEAD(&sysc_soc->disabled_modules);
9d881361206ebc Tony Lindgren     2021-09-21  3098  	INIT_LIST_HEAD(&sysc_soc->restored_modules);
feaa8baee82aba Tony Lindgren     2020-02-24  3099  	sysc_soc->general_purpose = true;
feaa8baee82aba Tony Lindgren     2020-02-24  3100  
feaa8baee82aba Tony Lindgren     2020-02-24  3101  	pdata = dev_get_platdata(ddata->dev);
feaa8baee82aba Tony Lindgren     2020-02-24  3102  	if (pdata && pdata->soc_type_gp)
feaa8baee82aba Tony Lindgren     2020-02-24  3103  		sysc_soc->general_purpose = pdata->soc_type_gp();
feaa8baee82aba Tony Lindgren     2020-02-24  3104  
feaa8baee82aba Tony Lindgren     2020-02-24  3105  	match = soc_device_match(sysc_soc_match);
feaa8baee82aba Tony Lindgren     2020-02-24  3106  	if (match && match->data)
e1e1e9bb9d943e Tony Lindgren     2023-08-04 @3107  		sysc_soc->soc = (enum sysc_soc)match->data;
feaa8baee82aba Tony Lindgren     2020-02-24  3108  
5f7259a578e9c6 Tony Lindgren     2021-03-08  3109  	/*
5f7259a578e9c6 Tony Lindgren     2021-03-08  3110  	 * Check and warn about possible old incomplete dtb. We now want to see
5f7259a578e9c6 Tony Lindgren     2021-03-08  3111  	 * simple-pm-bus instead of simple-bus in the dtb for genpd using SoCs.
5f7259a578e9c6 Tony Lindgren     2021-03-08  3112  	 */
5f7259a578e9c6 Tony Lindgren     2021-03-08  3113  	switch (sysc_soc->soc) {
5f7259a578e9c6 Tony Lindgren     2021-03-08  3114  	case SOC_AM3:
5f7259a578e9c6 Tony Lindgren     2021-03-08  3115  	case SOC_AM4:
4adcf4c28f6dc1 Tony Lindgren     2021-03-12  3116  	case SOC_4430 ... SOC_4470:
4adcf4c28f6dc1 Tony Lindgren     2021-03-12  3117  	case SOC_5430:
4adcf4c28f6dc1 Tony Lindgren     2021-03-12  3118  	case SOC_DRA7:
5f7259a578e9c6 Tony Lindgren     2021-03-08  3119  		np = of_find_node_by_path("/ocp");
5f7259a578e9c6 Tony Lindgren     2021-03-08  3120  		WARN_ONCE(np && of_device_is_compatible(np, "simple-bus"),
5f7259a578e9c6 Tony Lindgren     2021-03-08  3121  			  "ti-sysc: Incomplete old dtb, please update\n");
5f7259a578e9c6 Tony Lindgren     2021-03-08  3122  		break;
5f7259a578e9c6 Tony Lindgren     2021-03-08  3123  	default:
5f7259a578e9c6 Tony Lindgren     2021-03-08  3124  		break;
5f7259a578e9c6 Tony Lindgren     2021-03-08  3125  	}
5f7259a578e9c6 Tony Lindgren     2021-03-08  3126  
4bba9bf08ff41d Tony Lindgren     2020-05-07  3127  	/* Ignore devices that are not available on HS and EMU SoCs */
4bba9bf08ff41d Tony Lindgren     2020-05-07  3128  	if (!sysc_soc->general_purpose) {
4bba9bf08ff41d Tony Lindgren     2020-05-07  3129  		switch (sysc_soc->soc) {
4bba9bf08ff41d Tony Lindgren     2020-05-07  3130  		case SOC_3430 ... SOC_3630:
4bba9bf08ff41d Tony Lindgren     2020-05-07  3131  			sysc_add_disabled(0x48304000);	/* timer12 */
4bba9bf08ff41d Tony Lindgren     2020-05-07  3132  			break;
a6d90e9f22328f Kevin Hilman      2021-07-20  3133  		case SOC_AM3:
a6d90e9f22328f Kevin Hilman      2021-07-20  3134  			sysc_add_disabled(0x48310000);  /* rng */
e879f855e590b4 Nathan Chancellor 2021-08-15  3135  			break;
4bba9bf08ff41d Tony Lindgren     2020-05-07  3136  		default:
4bba9bf08ff41d Tony Lindgren     2020-05-07  3137  			break;
52fbb5aabb5cf6 Yang Li           2021-02-02  3138  		}
4bba9bf08ff41d Tony Lindgren     2020-05-07  3139  	}
4bba9bf08ff41d Tony Lindgren     2020-05-07  3140  
feaa8baee82aba Tony Lindgren     2020-02-24  3141  	match = soc_device_match(sysc_soc_feat_match);
feaa8baee82aba Tony Lindgren     2020-02-24  3142  	if (!match)
feaa8baee82aba Tony Lindgren     2020-02-24  3143  		return 0;
feaa8baee82aba Tony Lindgren     2020-02-24  3144  
feaa8baee82aba Tony Lindgren     2020-02-24  3145  	if (match->data)
feaa8baee82aba Tony Lindgren     2020-02-24  3146  		features = (unsigned long)match->data;
feaa8baee82aba Tony Lindgren     2020-02-24  3147  
feaa8baee82aba Tony Lindgren     2020-02-24  3148  	/*
feaa8baee82aba Tony Lindgren     2020-02-24  3149  	 * Add disabled devices to the list based on the module base.
feaa8baee82aba Tony Lindgren     2020-02-24  3150  	 * Note that this must be done before we attempt to access the
feaa8baee82aba Tony Lindgren     2020-02-24  3151  	 * device and have module revision checks working.
feaa8baee82aba Tony Lindgren     2020-02-24  3152  	 */
feaa8baee82aba Tony Lindgren     2020-02-24  3153  	if (features & DIS_ISP)
feaa8baee82aba Tony Lindgren     2020-02-24  3154  		sysc_add_disabled(0x480bd400);
feaa8baee82aba Tony Lindgren     2020-02-24  3155  	if (features & DIS_IVA)
feaa8baee82aba Tony Lindgren     2020-02-24  3156  		sysc_add_disabled(0x5d000000);
feaa8baee82aba Tony Lindgren     2020-02-24  3157  	if (features & DIS_SGX)
feaa8baee82aba Tony Lindgren     2020-02-24  3158  		sysc_add_disabled(0x50000000);
feaa8baee82aba Tony Lindgren     2020-02-24  3159  
feaa8baee82aba Tony Lindgren     2020-02-24  3160  	return 0;
feaa8baee82aba Tony Lindgren     2020-02-24  3161  }
feaa8baee82aba Tony Lindgren     2020-02-24  3162  

:::::: The code at line 3107 was first introduced by commit
:::::: e1e1e9bb9d943ec690670a609a5f660ca10eaf85 bus: ti-sysc: Fix build warning for 64-bit build

:::::: TO: Tony Lindgren <tony@atomide.com>
:::::: CC: Tony Lindgren <tony@atomide.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
