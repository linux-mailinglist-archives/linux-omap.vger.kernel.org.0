Return-Path: <linux-omap+bounces-1794-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D198893F15F
	for <lists+linux-omap@lfdr.de>; Mon, 29 Jul 2024 11:39:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56A372847AE
	for <lists+linux-omap@lfdr.de>; Mon, 29 Jul 2024 09:39:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01AA586AE9;
	Mon, 29 Jul 2024 09:39:42 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CD72C801;
	Mon, 29 Jul 2024 09:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722245981; cv=none; b=alGJJKzAqbnYrhZH1yGY7COO3M29txVSau3Nga5u/POnY0unMk5iVjgIQbiWNmeN8YFYS5hY5I3EugoN7KiboAnmZMrsJ3aEOyZRuD6Uu7CfQr1ngtYfm9QAAmApA9ZXz9Ue/MLup4aQxcsTtYkPQmcD6V8MIrI/Wkei4JeOFUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722245981; c=relaxed/simple;
	bh=KD6zWRejPvF7LTdfhQeeB7JcLj3nUrWUr3j0t9g+skw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FZmINsuG/COIK7w3shSrDp8/bS/yPMdk954THKowJqgaVeHfWu4AopAn9ELKTcQAEjKn/zFT3oU1oBcvb7Km8h8Xqp8zvYmpjhqsT/DdJyLgraHiE8SXqYu7g0/UnMc21XVWdBK6T3sDBLJXgYVOKcqoO3kf90AbeT1nYD5vGJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7AD4BFEC;
	Mon, 29 Jul 2024 02:40:03 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AEAC83F766;
	Mon, 29 Jul 2024 02:39:34 -0700 (PDT)
Date: Mon, 29 Jul 2024 10:39:29 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: tglx@linutronix.de, maz@kernel.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@tuxon.dev,
	shc_work@mail.ru, linusw@kernel.org, kaloz@openwrt.org,
	aaro.koskinen@iki.fi, andreas@kemnade.info, khilman@baylibre.com,
	rogerq@kernel.org, tony@atomide.com, joey.gouly@arm.com,
	catalin.marinas@arm.com, will@kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH v2] irqchip: Remove asmlinkage for *handle_irq() functions
Message-ID: <ZqdjUZCiQFl-_UMM@J2N7QTR9R3>
References: <20240729024752.1250618-1-ruanjinjie@huawei.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240729024752.1250618-1-ruanjinjie@huawei.com>

On Mon, Jul 29, 2024 at 10:47:52AM +0800, Jinjie Ruan wrote:
> Since commit 064dbfb41691 ("arm64: entry: convert IRQ+FIQ handlers to C"),
> the gic_handle_irq() is only called by C functions.
> 
> And since commit a7b0872e964c ("irq: arm: perform irqentry in entry code"),
> aic_handle(), aic5_handle(), clps711x_irqh(), davinci_cp_intc_handle_irq(),
> ft010_irqchip_handle_irq(), ixp4xx_handle_irq(), omap_intc_handle_irq(),
> sa1100_handle_irq() and fpga_handle_irq() are only called by C functions.
> 
> So remove the asmlinkages.

This commit message isn't quite right -- GICv3 can also be used on 32-bit arm,
and so even after commit 064dbfb41691 it could be called from assembly until
commit a7b0872e964c.

I think it'd be better to say:

  Currently, all architectures with set_handle_irq() call the root irqchip
  handler from C code, so there's no need for these to be asmlinkage.

  Remove asmlinkage for all handlers registered with set_handle_irq().

> Fixes: 064dbfb41691 ("arm64: entry: convert IRQ+FIQ handlers to C")
> Fixes: a7b0872e964c ("irq: arm: perform irqentry in entry code")

This is a cleanup, not a fix. Please don't add Fixes tags unless this
fixes a real functional issue.

> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> Suggested-by: Thomas Gleixner <tglx@linutronix.de>

With the commit message cleaned up and the fixes tags gone:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
> v2:
> - Also fix for arm32 irqchip as Thomas suggested.
> - Add Suggested-by.
> ---
>  drivers/irqchip/irq-atmel-aic.c       | 3 +--
>  drivers/irqchip/irq-atmel-aic5.c      | 3 +--
>  drivers/irqchip/irq-clps711x.c        | 2 +-
>  drivers/irqchip/irq-davinci-cp-intc.c | 3 +--
>  drivers/irqchip/irq-ftintc010.c       | 2 +-
>  drivers/irqchip/irq-gic-v3.c          | 2 +-
>  drivers/irqchip/irq-ixp4xx.c          | 3 +--
>  drivers/irqchip/irq-omap-intc.c       | 3 +--
>  drivers/irqchip/irq-sa11x0.c          | 3 +--
>  drivers/irqchip/irq-versatile-fpga.c  | 2 +-
>  10 files changed, 10 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/irqchip/irq-atmel-aic.c b/drivers/irqchip/irq-atmel-aic.c
> index 4631f6847953..3839ad79ad31 100644
> --- a/drivers/irqchip/irq-atmel-aic.c
> +++ b/drivers/irqchip/irq-atmel-aic.c
> @@ -57,8 +57,7 @@
>  
>  static struct irq_domain *aic_domain;
>  
> -static asmlinkage void __exception_irq_entry
> -aic_handle(struct pt_regs *regs)
> +static void __exception_irq_entry aic_handle(struct pt_regs *regs)
>  {
>  	struct irq_domain_chip_generic *dgc = aic_domain->gc;
>  	struct irq_chip_generic *gc = dgc->gc[0];
> diff --git a/drivers/irqchip/irq-atmel-aic5.c b/drivers/irqchip/irq-atmel-aic5.c
> index 145535bd7560..c0f55dc7b050 100644
> --- a/drivers/irqchip/irq-atmel-aic5.c
> +++ b/drivers/irqchip/irq-atmel-aic5.c
> @@ -67,8 +67,7 @@
>  
>  static struct irq_domain *aic5_domain;
>  
> -static asmlinkage void __exception_irq_entry
> -aic5_handle(struct pt_regs *regs)
> +static void __exception_irq_entry aic5_handle(struct pt_regs *regs)
>  {
>  	struct irq_chip_generic *bgc = irq_get_domain_generic_chip(aic5_domain, 0);
>  	u32 irqnr;
> diff --git a/drivers/irqchip/irq-clps711x.c b/drivers/irqchip/irq-clps711x.c
> index e731e0784f7e..806ebb1de201 100644
> --- a/drivers/irqchip/irq-clps711x.c
> +++ b/drivers/irqchip/irq-clps711x.c
> @@ -69,7 +69,7 @@ static struct {
>  	struct irq_domain_ops	ops;
>  } *clps711x_intc;
>  
> -static asmlinkage void __exception_irq_entry clps711x_irqh(struct pt_regs *regs)
> +static void __exception_irq_entry clps711x_irqh(struct pt_regs *regs)
>  {
>  	u32 irqstat;
>  
> diff --git a/drivers/irqchip/irq-davinci-cp-intc.c b/drivers/irqchip/irq-davinci-cp-intc.c
> index 7482c8ed34b2..f4f8e9fadbbf 100644
> --- a/drivers/irqchip/irq-davinci-cp-intc.c
> +++ b/drivers/irqchip/irq-davinci-cp-intc.c
> @@ -116,8 +116,7 @@ static struct irq_chip davinci_cp_intc_irq_chip = {
>  	.flags		= IRQCHIP_SKIP_SET_WAKE,
>  };
>  
> -static asmlinkage void __exception_irq_entry
> -davinci_cp_intc_handle_irq(struct pt_regs *regs)
> +static void __exception_irq_entry davinci_cp_intc_handle_irq(struct pt_regs *regs)
>  {
>  	int gpir, irqnr, none;
>  
> diff --git a/drivers/irqchip/irq-ftintc010.c b/drivers/irqchip/irq-ftintc010.c
> index 359efc1d1be7..b91c358ea6db 100644
> --- a/drivers/irqchip/irq-ftintc010.c
> +++ b/drivers/irqchip/irq-ftintc010.c
> @@ -125,7 +125,7 @@ static struct irq_chip ft010_irq_chip = {
>  /* Local static for the IRQ entry call */
>  static struct ft010_irq_data firq;
>  
> -static asmlinkage void __exception_irq_entry ft010_irqchip_handle_irq(struct pt_regs *regs)
> +static void __exception_irq_entry ft010_irqchip_handle_irq(struct pt_regs *regs)
>  {
>  	struct ft010_irq_data *f = &firq;
>  	int irq;
> diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
> index c19083bfb943..0efa3443c323 100644
> --- a/drivers/irqchip/irq-gic-v3.c
> +++ b/drivers/irqchip/irq-gic-v3.c
> @@ -930,7 +930,7 @@ static void __gic_handle_irq_from_irqsoff(struct pt_regs *regs)
>  	__gic_handle_nmi(irqnr, regs);
>  }
>  
> -static asmlinkage void __exception_irq_entry gic_handle_irq(struct pt_regs *regs)
> +static void __exception_irq_entry gic_handle_irq(struct pt_regs *regs)
>  {
>  	if (unlikely(gic_supports_nmi() && !interrupts_enabled(regs)))
>  		__gic_handle_irq_from_irqsoff(regs);
> diff --git a/drivers/irqchip/irq-ixp4xx.c b/drivers/irqchip/irq-ixp4xx.c
> index 5fba907b9052..f23b02f62a5c 100644
> --- a/drivers/irqchip/irq-ixp4xx.c
> +++ b/drivers/irqchip/irq-ixp4xx.c
> @@ -105,8 +105,7 @@ static void ixp4xx_irq_unmask(struct irq_data *d)
>  	}
>  }
>  
> -static asmlinkage void __exception_irq_entry
> -ixp4xx_handle_irq(struct pt_regs *regs)
> +static void __exception_irq_entry ixp4xx_handle_irq(struct pt_regs *regs)
>  {
>  	struct ixp4xx_irq *ixi = &ixirq;
>  	unsigned long status;
> diff --git a/drivers/irqchip/irq-omap-intc.c b/drivers/irqchip/irq-omap-intc.c
> index dc82162ba763..ad84a2f03368 100644
> --- a/drivers/irqchip/irq-omap-intc.c
> +++ b/drivers/irqchip/irq-omap-intc.c
> @@ -325,8 +325,7 @@ static int __init omap_init_irq(u32 base, struct device_node *node)
>  	return ret;
>  }
>  
> -static asmlinkage void __exception_irq_entry
> -omap_intc_handle_irq(struct pt_regs *regs)
> +static void __exception_irq_entry omap_intc_handle_irq(struct pt_regs *regs)
>  {
>  	extern unsigned long irq_err_count;
>  	u32 irqnr;
> diff --git a/drivers/irqchip/irq-sa11x0.c b/drivers/irqchip/irq-sa11x0.c
> index 31c202a1ae62..9d0b80271949 100644
> --- a/drivers/irqchip/irq-sa11x0.c
> +++ b/drivers/irqchip/irq-sa11x0.c
> @@ -127,8 +127,7 @@ static int __init sa1100irq_init_devicefs(void)
>  
>  device_initcall(sa1100irq_init_devicefs);
>  
> -static asmlinkage void __exception_irq_entry
> -sa1100_handle_irq(struct pt_regs *regs)
> +static void __exception_irq_entry sa1100_handle_irq(struct pt_regs *regs)
>  {
>  	uint32_t icip, icmr, mask;
>  
> diff --git a/drivers/irqchip/irq-versatile-fpga.c b/drivers/irqchip/irq-versatile-fpga.c
> index 5018a06060e6..ca471c6fee99 100644
> --- a/drivers/irqchip/irq-versatile-fpga.c
> +++ b/drivers/irqchip/irq-versatile-fpga.c
> @@ -128,7 +128,7 @@ static int handle_one_fpga(struct fpga_irq_data *f, struct pt_regs *regs)
>   * Keep iterating over all registered FPGA IRQ controllers until there are
>   * no pending interrupts.
>   */
> -static asmlinkage void __exception_irq_entry fpga_handle_irq(struct pt_regs *regs)
> +static void __exception_irq_entry fpga_handle_irq(struct pt_regs *regs)
>  {
>  	int i, handled;
>  
> -- 
> 2.34.1
> 

