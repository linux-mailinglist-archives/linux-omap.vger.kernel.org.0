Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C79D677C738
	for <lists+linux-omap@lfdr.de>; Tue, 15 Aug 2023 07:48:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234738AbjHOFr7 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 15 Aug 2023 01:47:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234918AbjHOFpt (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 15 Aug 2023 01:45:49 -0400
Received: from muru.com (muru.com [72.249.23.125])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 64A6E1986
        for <linux-omap@vger.kernel.org>; Mon, 14 Aug 2023 22:45:30 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id B0E3E80E1;
        Tue, 15 Aug 2023 05:45:29 +0000 (UTC)
Date:   Tue, 15 Aug 2023 08:45:28 +0300
From:   Tony Lindgren <tony@atomide.com>
To:     kernel test robot <lkp@intel.com>
Cc:     llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        linux-omap@vger.kernel.org, Dhruva Gole <d-gole@ti.com>,
        Nishanth Menon <nm@ti.com>
Subject: Re: [tmlind-omap:omap-for-v6.6/ti-sysc 3/5]
 drivers/bus/ti-sysc.c:3107:19: warning: cast to smaller integer type 'enum
 sysc_soc' from 'const void *'
Message-ID: <20230815054528.GQ11676@atomide.com>
References: <202308150723.ziuGCdM3-lkp@intel.com>
 <20230815053948.GP11676@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230815053948.GP11676@atomide.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

* Tony Lindgren <tony@atomide.com> [230815 08:39]:
> * kernel test robot <lkp@intel.com> [230814 23:20]:
> > Hi Tony,
> > 
> > First bad commit (maybe != root cause):
> > 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tmlind/linux-omap.git omap-for-v6.6/ti-sysc
> > head:   40a4f49cd32dbc641c706215c1fa6c5bd051428c
> > commit: 063dc0622705623b3a70739b9f33d5ea019882e6 [3/5] bus: ti-sysc: Build driver for TI K3 SoCs
> > config: arm64-randconfig-r006-20230815 (https://download.01.org/0day-ci/archive/20230815/202308150723.ziuGCdM3-lkp@intel.com/config)
> > compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
> > reproduce: (https://download.01.org/0day-ci/archive/20230815/202308150723.ziuGCdM3-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202308150723.ziuGCdM3-lkp@intel.com/
> > 
> > All warnings (new ones prefixed by >>):
> > 
> > >> drivers/bus/ti-sysc.c:3107:19: warning: cast to smaller integer type 'enum sysc_soc' from 'const void *' [-Wvoid-pointer-to-enum-cast]
> >     3107 |                 sysc_soc->soc = (enum sysc_soc)match->data;
> >          |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
> >    1 warning generated.
> 
> Thanks seems we need to do (enum sysc_soc)(unsigned long)match->data or just
> (unsigned long)match->data.

Actually seems (enum sysc_soc)(uintptr_t)match->data is what is used in
similar places based on git grep " = (enum " | grep ')('.

Regards,

Tony
