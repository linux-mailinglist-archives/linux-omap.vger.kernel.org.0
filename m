Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED23B78AEA9
	for <lists+linux-omap@lfdr.de>; Mon, 28 Aug 2023 13:20:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229843AbjH1LU0 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 28 Aug 2023 07:20:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229593AbjH1LT4 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 28 Aug 2023 07:19:56 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8197EBF;
        Mon, 28 Aug 2023 04:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693221594; x=1724757594;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UM9ZR3G2k2SMiw9WsDnrkyXtx4P4MvmHfk7S9bz4PLc=;
  b=HC22+qnNqRD+L4sS1eKRRm1gqDtY+7bsnpxp7CqqQ6H4n/09yQcK+iY+
   4ASoGN4XKqLlNbLpv20HkJWvidLTk2n/haWeRwGM0YzxM1bTp0K3AllXs
   8harwGVCMZvHNY2KhwlNdBFwBIeYG1koX9mPtGOyP0OgeYjx/15djsHyk
   keUPn8wkBoyRadaS6KTZQWvsyt+fGsBjo6FdQ2j31Mm3G4/hG37CwX0yW
   DwmZJiweEzksbgzyo0dtLAleYxt6geU9AY/tTPq+cRez4JcGkXIkQU7kQ
   okRrP1aPaB01l+I7ELOtdMfU4LcrI5cUuvcpTagbgozk4JW1eRnUobPPv
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="461447904"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="461447904"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2023 04:19:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10815"; a="808248540"
X-IronPort-AV: E=Sophos;i="6.02,207,1688454000"; 
   d="scan'208";a="808248540"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga004.fm.intel.com with ESMTP; 28 Aug 2023 04:19:52 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1qaaHe-00Ftdh-1l;
        Mon, 28 Aug 2023 14:19:50 +0300
Date:   Mon, 28 Aug 2023 14:19:50 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Biju Das <biju.das.jz@bp.renesas.com>
Cc:     Tony Lindgren <tony@atomide.com>, Lee Jones <lee@kernel.org>,
        linux-omap@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 2/2] mfd: palmas: Make similar OF and ID table
Message-ID: <ZOyC1q+3Fk/weRjn@smile.fi.intel.com>
References: <20230826082217.41967-1-biju.das.jz@bp.renesas.com>
 <20230826082217.41967-3-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230826082217.41967-3-biju.das.jz@bp.renesas.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Sat, Aug 26, 2023 at 09:22:17AM +0100, Biju Das wrote:
> Make similar OF and ID table to extend support for ID match using
> i2c_match_data(). Currently it works only for OF match tables as the
> driver_data is wrong for ID match.

...

> -static const struct i2c_device_id palmas_i2c_id[] = {
> -	{ "palmas", },
> -	{ "twl6035", },
> -	{ "twl6037", },
> -	{ "tps65913", },
> -	{ /* end */ }
> -};
> -MODULE_DEVICE_TABLE(i2c, palmas_i2c_id);

Why do you move it up?
The first user of the table is below this code.

-- 
With Best Regards,
Andy Shevchenko


