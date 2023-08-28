Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4602D78AEA6
	for <lists+linux-omap@lfdr.de>; Mon, 28 Aug 2023 13:19:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbjH1LTW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 28 Aug 2023 07:19:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232446AbjH1LTR (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 28 Aug 2023 07:19:17 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1C69F7;
        Mon, 28 Aug 2023 04:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693221554; x=1724757554;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2YgIzdRBUVe2D+JqhLIa5pv646Gfhsc7L+w0b2jwano=;
  b=Y8Ta7a7P5snxMkH9ZqxM5q8v3nn8OYhs2sB9xuxthddL37Wls4c15O2o
   b0rHYo36KR+a4E/Qzn/iOvEo0FLUgHFjGHhFRrSiNmcZWUKfy+5lyIGGm
   xDJnMBn058CHeTZz9Ji3rUSlKU0DXt92evKvpAOmTLQyBFBxeqwX66w5P
   rfRtw0LW1bs7VZQOAAyr9xOMpcWmEZ7IRoDr4bBZsFW0rBu269O6+1I+8
   oXv/2JBczSrQmJhHabr1F244VUentH49RjHRGcF7qqmDyzmA9VHHtYBBI
   N+XgdbjbUnygDlN3p11toK7+AySa+fDpg5fK3jz1Qw7GRffmfPHbU+xFN
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="372482993"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="372482993"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 04:19:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="741351662"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="741351662"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga007.fm.intel.com with ESMTP; 28 Aug 2023 04:19:03 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qaaGr-00FryU-2f;
        Mon, 28 Aug 2023 14:19:01 +0300
Date:   Mon, 28 Aug 2023 14:19:01 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>,
        linux-omap@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] mfd: palmas: Constify .data in OF table and
 {palmas,tps65917}_irq_chip
Message-ID: <ZOyCpQ/lcrKeiwcV@smile.fi.intel.com>
References: <20230826082217.41967-1-biju.das.jz@bp.renesas.com>
 <20230826082217.41967-2-biju.das.jz@bp.renesas.com>
 <ZOyCil+zMwRqYzgU@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZOyCil+zMwRqYzgU@smile.fi.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Aug 28, 2023 at 02:18:35PM +0300, Andy Shevchenko wrote:
> On Sat, Aug 26, 2023 at 09:22:16AM +0100, Biju Das wrote:
> > Constify .data in OF table and {palmas,tps65917}_irq_chip and replace
> > the variable *features->features in struct palmas_driver_data and
> > drop the {palmas,tps659038}_features variables and use their values
> > directly in the named initialization.
> > 
> > While at it, drop the inner leading commas for OF match table.
> 
> ...and nothing here about the main advantage, i.e. constification of the data...

Ah, sorry, it is a very first word there :)

-- 
With Best Regards,
Andy Shevchenko


