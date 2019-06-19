Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B77BF4BA06
	for <lists+linux-omap@lfdr.de>; Wed, 19 Jun 2019 15:32:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730835AbfFSNc2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Wed, 19 Jun 2019 09:32:28 -0400
Received: from foss.arm.com ([217.140.110.172]:39914 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727129AbfFSNc2 (ORCPT <rfc822;linux-omap@vger.kernel.org>);
        Wed, 19 Jun 2019 09:32:28 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 520DB344;
        Wed, 19 Jun 2019 06:32:27 -0700 (PDT)
Received: from localhost (unknown [10.37.6.20])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C838B3F738;
        Wed, 19 Jun 2019 06:32:26 -0700 (PDT)
Date:   Wed, 19 Jun 2019 14:32:25 +0100
From:   Andrew Murray <andrew.murray@arm.com>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     arm@kernel.org, Paul Walmsley <paul@pwsan.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
        Nathan Chancellor <natechancellor@gmail.com>,
        linux-omap@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ARM: omap2: remove incorrect __init annotation
Message-ID: <20190619133224.GX20984@e119886-lin.cambridge.arm.com>
References: <20190619130529.1502322-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190619130529.1502322-1-arnd@arndb.de>
User-Agent: Mutt/1.10.1+81 (426a6c1) (2018-08-26)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, Jun 19, 2019 at 03:04:54PM +0200, Arnd Bergmann wrote:
> omap3xxx_prm_enable_io_wakeup() is marked __init, but its caller is not, so
> we get a warning with clang-8:
> 
> WARNING: vmlinux.o(.text+0x343c8): Section mismatch in reference from the function omap3xxx_prm_late_init() to the function .init.text:omap3xxx_prm_enable_io_wakeup()
> The function omap3xxx_prm_late_init() references
> the function __init omap3xxx_prm_enable_io_wakeup().
> This is often because omap3xxx_prm_late_init lacks a __init
> annotation or the annotation of omap3xxx_prm_enable_io_wakeup is wrong.
> 

That's unfortunate, both omap3xxx_prm_enable_io_wakeup and
omap3xxx_prm_late_init are only ever called at init time (by prm_late_init
which is also __init annotated). However the omap3xxx_prm_ll_data
structure containing the late_init has a life beyond init. Otherwise I
would have suggested annotating omap3xxx_prm_late_init.

Reviewed-by: Andrew Murray <andrew.murray@arm.com>

> When building with gcc, omap3xxx_prm_enable_io_wakeup() is always
> inlined, so we never noticed in the past.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Reviewed-by: Nathan Chancellor <natechancellor@gmail.com>
> Acked-by: Tony Lindgren <tony@atomide.com>
> ---
>  arch/arm/mach-omap2/prm3xxx.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm/mach-omap2/prm3xxx.c b/arch/arm/mach-omap2/prm3xxx.c
> index 05858f966f7d..dfa65fc2c82b 100644
> --- a/arch/arm/mach-omap2/prm3xxx.c
> +++ b/arch/arm/mach-omap2/prm3xxx.c
> @@ -433,7 +433,7 @@ static void omap3_prm_reconfigure_io_chain(void)
>   * registers, and omap3xxx_prm_reconfigure_io_chain() must be called.
>   * No return value.
>   */
> -static void __init omap3xxx_prm_enable_io_wakeup(void)
> +static void omap3xxx_prm_enable_io_wakeup(void)
>  {
>  	if (prm_features & PRM_HAS_IO_WAKEUP)
>  		omap2_prm_set_mod_reg_bits(OMAP3430_EN_IO_MASK, WKUP_MOD,
> -- 
> 2.20.0
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
