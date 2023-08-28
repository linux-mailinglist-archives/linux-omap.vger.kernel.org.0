Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F167878AEA2
	for <lists+linux-omap@lfdr.de>; Mon, 28 Aug 2023 13:19:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230077AbjH1LSw (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 28 Aug 2023 07:18:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230312AbjH1LSl (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 28 Aug 2023 07:18:41 -0400
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9730BF;
        Mon, 28 Aug 2023 04:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693221519; x=1724757519;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8HXKp/inQDffchp6EaQ3/ZoKimmXB5o7B47QXBNoGSQ=;
  b=Woo+oUDLYQKZg/ZpoNEbt69pjfzUWwy2w+FxhI9J422YxUflFBr7LW6t
   f59PaFfCqJQUty2slMt0GYNI10PtyGKHFX6TmqmelsXUCdjIto0A4pOh+
   cHGS/Fq9t1oAHuagf1hLVL42hEZ5GGQq6etUSsVCJkAYtfZngVXpZu7Qo
   YsATx+8BIl2E+eiTipfWWsoYYGnOWJpoE8VkwJAx79SjsaKuVp5c7u0v8
   OL1h14erFS5Ducbt3ROaXolG/RHZhrGDYdWdSMrhpL1rnQL+FvWZqnFAb
   LVA2cZ4QoDxshcTeV2P85Q2db4MALR43Aq2/D6a5y5Dru5VFL4jWJR/VP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="360072475"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="360072475"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 04:18:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="1069001125"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="1069001125"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga005.fm.intel.com with ESMTP; 28 Aug 2023 04:18:36 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qaaGR-00Fr4m-0Q;
        Mon, 28 Aug 2023 14:18:35 +0300
Date:   Mon, 28 Aug 2023 14:18:34 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>,
        linux-omap@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] mfd: palmas: Constify .data in OF table and
 {palmas,tps65917}_irq_chip
Message-ID: <ZOyCil+zMwRqYzgU@smile.fi.intel.com>
References: <20230826082217.41967-1-biju.das.jz@bp.renesas.com>
 <20230826082217.41967-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230826082217.41967-2-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, Aug 26, 2023 at 09:22:16AM +0100, Biju Das wrote:
> Constify .data in OF table and {palmas,tps65917}_irq_chip and replace
> the variable *features->features in struct palmas_driver_data and
> drop the {palmas,tps659038}_features variables and use their values
> directly in the named initialization.
> 
> While at it, drop the inner leading commas for OF match table.

...and nothing here about the main advantage, i.e. constification of the data...

-- 
With Best Regards,
Andy Shevchenko


