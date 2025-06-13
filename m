Return-Path: <linux-omap+bounces-3863-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F41EAD9145
	for <lists+linux-omap@lfdr.de>; Fri, 13 Jun 2025 17:28:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3AEA31BC40C3
	for <lists+linux-omap@lfdr.de>; Fri, 13 Jun 2025 15:28:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0E421E51FA;
	Fri, 13 Jun 2025 15:28:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="LoQ71uMo"
X-Original-To: linux-omap@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B51D61E5213;
	Fri, 13 Jun 2025 15:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749828488; cv=none; b=jwKzkPV2S1Mn8v1j0gkjXI7zaELXumLihrgXl8GVHmFCqUjZpK97lhcER1Y8joBHNRAiFfYkZNWxx4sNUzP7AOSjpBVylAKYVpeNksVIuuhQbqm8MNYEEieB1Z3Y3lNe/8Ivu89/LGGlDhv/AsomD4fMwyIAbMk7SlbPxVdgDtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749828488; c=relaxed/simple;
	bh=lZbjiI8BJRGFZREb8yB2aImrrLJURRAQA+9VZvg2vKQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CJ4XjrS6S4Z+6q8k++RZvihh79X55FB7FoSZLvJ+yILYwVEpu6gt3Ltxy10Kdv5hFWAcGhanbBxHe4MSiqBQtux/d52eHLShDDpFRsjE+PPsVWWkZRvBgLjILK+mYcX2mW9iWsK/Ag/iRvPhf9a9FQcV8gsM0gW53+IceTnTsrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=LoQ71uMo; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=fPFxp42Sz5bwGweJ0n3EfAQxzOWSYSCVdXzYHdKL0H4=; b=LoQ71uMoJ1/DM/ga
	n5aA+Quh+VC6y4ZnY0qNc3G0/tXbjYt/w9h8+LV2Qz4uJjjxo+V5/5GJNSYIOIuSKCScRvpyp/o7m
	Cc5qxHed74lDtDdbvlRptljCZ1mImG2Vrv3tJNNKexjFtZ6oGC38XcZf74qicwL1XJxoJpwQEfIrQ
	nb8kMI0YXnDXepCrXOTxwntBAtmg7ot4CN20IAmnhqdDjbzvT9Chxrx9MXUTeK6zwJSdsImrhiR07
	5FQ9W14cYuJzKbl9be0wyZ0z+a/5fQ+pNpAKUNVvm2T1PekKac+L+fzO2BOr1C3B/z5XfVn4dAUpt
	0/ybu1B6s5fTUNIVNQ==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1uQ6Ji-009V2x-11;
	Fri, 13 Jun 2025 15:27:42 +0000
Date: Fri, 13 Jun 2025 15:27:42 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Lee Jones <lee@kernel.org>
Cc: aaro.koskinen@iki.fi, andreas@kemnade.info, khilman@baylibre.com,
	rogerq@kernel.org, tony@atomide.com, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mfd: twl6030-irq: Remove unused twl6030_mmc_card_detect*
Message-ID: <aExDbkQBhK3ZubVo@gallifrey>
References: <20250607202232.265344-1-linux@treblig.org>
 <20250613143757.GL897353@google.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250613143757.GL897353@google.com>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-34-amd64 (x86_64)
X-Uptime: 15:25:58 up 46 days, 23:39,  1 user,  load average: 0.06, 0.02, 0.00
User-Agent: Mutt/2.2.12 (2023-09-09)

* Lee Jones (lee@kernel.org) wrote:
> On Sat, 07 Jun 2025, linux@treblig.org wrote:
> 
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > 
> > twl6030_mmc_card_detect() and twl6030_mmc_card_detect_config() have
> > been unused since 2013's
> > commit b2ff4790612b ("ARM: OMAP2+: Remove legacy
> > omap4_twl6030_hsmmc_init")
> 
> This formatting is driving the little OCD being that lives on my
> shoulder crazy!

Thanks, which bit?  I tend to put the commit .... on it's own
line, but then checkpatch really doesn't like long lines so I wrap
any word that starts after col 75.

> I'll fix-up and apply the patch.  Bear with.

Thanks!

Dave

> 
> > Remove them.
> > 
> > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> > ---
> >  drivers/mfd/twl6030-irq.c | 74 ---------------------------------------
> >  include/linux/mfd/twl.h   | 21 -----------
> >  2 files changed, 95 deletions(-)
> > 
> > diff --git a/drivers/mfd/twl6030-irq.c b/drivers/mfd/twl6030-irq.c
> > index 00b14cef1dfb..ffb4b98639c7 100644
> > --- a/drivers/mfd/twl6030-irq.c
> > +++ b/drivers/mfd/twl6030-irq.c
> > @@ -256,80 +256,6 @@ int twl6030_interrupt_mask(u8 bit_mask, u8 offset)
> >  }
> >  EXPORT_SYMBOL(twl6030_interrupt_mask);
> >  
> > -int twl6030_mmc_card_detect_config(void)
> > -{
> > -	int ret;
> > -	u8 reg_val = 0;
> > -
> > -	/* Unmasking the Card detect Interrupt line for MMC1 from Phoenix */
> > -	twl6030_interrupt_unmask(TWL6030_MMCDETECT_INT_MASK,
> > -						REG_INT_MSK_LINE_B);
> > -	twl6030_interrupt_unmask(TWL6030_MMCDETECT_INT_MASK,
> > -						REG_INT_MSK_STS_B);
> > -	/*
> > -	 * Initially Configuring MMC_CTRL for receiving interrupts &
> > -	 * Card status on TWL6030 for MMC1
> > -	 */
> > -	ret = twl_i2c_read_u8(TWL6030_MODULE_ID0, &reg_val, TWL6030_MMCCTRL);
> > -	if (ret < 0) {
> > -		pr_err("twl6030: Failed to read MMCCTRL, error %d\n", ret);
> > -		return ret;
> > -	}
> > -	reg_val &= ~VMMC_AUTO_OFF;
> > -	reg_val |= SW_FC;
> > -	ret = twl_i2c_write_u8(TWL6030_MODULE_ID0, reg_val, TWL6030_MMCCTRL);
> > -	if (ret < 0) {
> > -		pr_err("twl6030: Failed to write MMCCTRL, error %d\n", ret);
> > -		return ret;
> > -	}
> > -
> > -	/* Configuring PullUp-PullDown register */
> > -	ret = twl_i2c_read_u8(TWL6030_MODULE_ID0, &reg_val,
> > -						TWL6030_CFG_INPUT_PUPD3);
> > -	if (ret < 0) {
> > -		pr_err("twl6030: Failed to read CFG_INPUT_PUPD3, error %d\n",
> > -									ret);
> > -		return ret;
> > -	}
> > -	reg_val &= ~(MMC_PU | MMC_PD);
> > -	ret = twl_i2c_write_u8(TWL6030_MODULE_ID0, reg_val,
> > -						TWL6030_CFG_INPUT_PUPD3);
> > -	if (ret < 0) {
> > -		pr_err("twl6030: Failed to write CFG_INPUT_PUPD3, error %d\n",
> > -									ret);
> > -		return ret;
> > -	}
> > -
> > -	return irq_find_mapping(twl6030_irq->irq_domain,
> > -				 MMCDETECT_INTR_OFFSET);
> > -}
> > -EXPORT_SYMBOL(twl6030_mmc_card_detect_config);
> > -
> > -int twl6030_mmc_card_detect(struct device *dev, int slot)
> > -{
> > -	int ret = -EIO;
> > -	u8 read_reg = 0;
> > -	struct platform_device *pdev = to_platform_device(dev);
> > -
> > -	if (pdev->id) {
> > -		/* TWL6030 provide's Card detect support for
> > -		 * only MMC1 controller.
> > -		 */
> > -		pr_err("Unknown MMC controller %d in %s\n", pdev->id, __func__);
> > -		return ret;
> > -	}
> > -	/*
> > -	 * BIT0 of MMC_CTRL on TWL6030 provides card status for MMC1
> > -	 * 0 - Card not present ,1 - Card present
> > -	 */
> > -	ret = twl_i2c_read_u8(TWL6030_MODULE_ID0, &read_reg,
> > -						TWL6030_MMCCTRL);
> > -	if (ret >= 0)
> > -		ret = read_reg & STS_MMC;
> > -	return ret;
> > -}
> > -EXPORT_SYMBOL(twl6030_mmc_card_detect);
> > -
> >  static int twl6030_irq_map(struct irq_domain *d, unsigned int virq,
> >  			      irq_hw_number_t hwirq)
> >  {
> > diff --git a/include/linux/mfd/twl.h b/include/linux/mfd/twl.h
> > index 85dc406173db..b31e07fa4d51 100644
> > --- a/include/linux/mfd/twl.h
> > +++ b/include/linux/mfd/twl.h
> > @@ -205,27 +205,6 @@ int twl_get_hfclk_rate(void);
> >  int twl6030_interrupt_unmask(u8 bit_mask, u8 offset);
> >  int twl6030_interrupt_mask(u8 bit_mask, u8 offset);
> >  
> > -/* Card detect Configuration for MMC1 Controller on OMAP4 */
> > -#ifdef CONFIG_TWL4030_CORE
> > -int twl6030_mmc_card_detect_config(void);
> > -#else
> > -static inline int twl6030_mmc_card_detect_config(void)
> > -{
> > -	pr_debug("twl6030_mmc_card_detect_config not supported\n");
> > -	return 0;
> > -}
> > -#endif
> > -
> > -/* MMC1 Controller on OMAP4 uses Phoenix irq for Card detect */
> > -#ifdef CONFIG_TWL4030_CORE
> > -int twl6030_mmc_card_detect(struct device *dev, int slot);
> > -#else
> > -static inline int twl6030_mmc_card_detect(struct device *dev, int slot)
> > -{
> > -	pr_debug("Call back twl6030_mmc_card_detect not supported\n");
> > -	return -EIO;
> > -}
> > -#endif
> >  /*----------------------------------------------------------------------*/
> >  
> >  /*
> > -- 
> > 2.49.0
> > 
> 
> -- 
> Lee Jones [李琼斯]
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

