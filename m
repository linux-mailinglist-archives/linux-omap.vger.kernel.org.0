Return-Path: <linux-omap+bounces-3860-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 454D7AD8FB4
	for <lists+linux-omap@lfdr.de>; Fri, 13 Jun 2025 16:38:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0837517DB49
	for <lists+linux-omap@lfdr.de>; Fri, 13 Jun 2025 14:38:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BF0C1946AA;
	Fri, 13 Jun 2025 14:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JFXWfmJ7"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5A1190679;
	Fri, 13 Jun 2025 14:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749825481; cv=none; b=Zs272vm8rWFKHyXxwX6FdmavFTu9DbfHGp1jfieR4vpxjPkJekLURY+3cHltCPItoudmHPU/wm+J+oEg3Uvhp8s8ScAGBVDbflJhgQltqd0nVJ6kjDvqxTH5Xr016runYDxanDuWbNFvlk8O7fTXvLGTsGEAfnHAj1Ndj8gulr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749825481; c=relaxed/simple;
	bh=pZdd6mxUDEBX4oMEg0bqhdX7uu+hBumZdr+V9Q+PSos=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WiCobkLhaMyYbgxJiaNCnsvJlFwKu6BqF/mdtQLST5MOG5W/ujsT8UGv8ZafOb+UCc8/5X6VaIbKkVjwpSIWUTfiv6z/JzEODPXnq3bXAeGgxeIb5X/bepIX3vyKILk1ApNKNG9Vx3SJVoYT6yD359R+KAhqAysTp8ufno2EUI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JFXWfmJ7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4221C4CEE3;
	Fri, 13 Jun 2025 14:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749825481;
	bh=pZdd6mxUDEBX4oMEg0bqhdX7uu+hBumZdr+V9Q+PSos=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JFXWfmJ7PGyMNRkWH8uOb4Jh8Lz+5DsztE1BlxutfQOQepdEX/4+P7EVYxu+BFjA+
	 tCcV5YBlYh+jk1yfJ6bxboJZ0DKrUVwR0RWqbyzIP+ZruHn70712I0xpUA1b8wkNVD
	 NHwNcxvmRphdImd5l41MSK5Hk+Y/J0jpG8Yu+U5LOETf8vlgHA+GHV1OLnBNcPQeYU
	 aet9cHt+hmP7VffrfzQ26fYBO0cATaE5H9wUr1n4TlQairW993CPQePMdYKH/Pnjjw
	 ng93j4psCYUDs+N0rbxZJxNpRVL6DrNt6j19oZQ+a4UyYTSOZWGNIOnC8XWKhLFVJF
	 JUbyv2lfYQFKw==
Date: Fri, 13 Jun 2025 15:37:57 +0100
From: Lee Jones <lee@kernel.org>
To: linux@treblig.org
Cc: aaro.koskinen@iki.fi, andreas@kemnade.info, khilman@baylibre.com,
	rogerq@kernel.org, tony@atomide.com, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mfd: twl6030-irq: Remove unused twl6030_mmc_card_detect*
Message-ID: <20250613143757.GL897353@google.com>
References: <20250607202232.265344-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250607202232.265344-1-linux@treblig.org>

On Sat, 07 Jun 2025, linux@treblig.org wrote:

> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> twl6030_mmc_card_detect() and twl6030_mmc_card_detect_config() have
> been unused since 2013's
> commit b2ff4790612b ("ARM: OMAP2+: Remove legacy
> omap4_twl6030_hsmmc_init")

This formatting is driving the little OCD being that lives on my
shoulder crazy!  I'll fix-up and apply the patch.  Bear with.

> Remove them.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  drivers/mfd/twl6030-irq.c | 74 ---------------------------------------
>  include/linux/mfd/twl.h   | 21 -----------
>  2 files changed, 95 deletions(-)
> 
> diff --git a/drivers/mfd/twl6030-irq.c b/drivers/mfd/twl6030-irq.c
> index 00b14cef1dfb..ffb4b98639c7 100644
> --- a/drivers/mfd/twl6030-irq.c
> +++ b/drivers/mfd/twl6030-irq.c
> @@ -256,80 +256,6 @@ int twl6030_interrupt_mask(u8 bit_mask, u8 offset)
>  }
>  EXPORT_SYMBOL(twl6030_interrupt_mask);
>  
> -int twl6030_mmc_card_detect_config(void)
> -{
> -	int ret;
> -	u8 reg_val = 0;
> -
> -	/* Unmasking the Card detect Interrupt line for MMC1 from Phoenix */
> -	twl6030_interrupt_unmask(TWL6030_MMCDETECT_INT_MASK,
> -						REG_INT_MSK_LINE_B);
> -	twl6030_interrupt_unmask(TWL6030_MMCDETECT_INT_MASK,
> -						REG_INT_MSK_STS_B);
> -	/*
> -	 * Initially Configuring MMC_CTRL for receiving interrupts &
> -	 * Card status on TWL6030 for MMC1
> -	 */
> -	ret = twl_i2c_read_u8(TWL6030_MODULE_ID0, &reg_val, TWL6030_MMCCTRL);
> -	if (ret < 0) {
> -		pr_err("twl6030: Failed to read MMCCTRL, error %d\n", ret);
> -		return ret;
> -	}
> -	reg_val &= ~VMMC_AUTO_OFF;
> -	reg_val |= SW_FC;
> -	ret = twl_i2c_write_u8(TWL6030_MODULE_ID0, reg_val, TWL6030_MMCCTRL);
> -	if (ret < 0) {
> -		pr_err("twl6030: Failed to write MMCCTRL, error %d\n", ret);
> -		return ret;
> -	}
> -
> -	/* Configuring PullUp-PullDown register */
> -	ret = twl_i2c_read_u8(TWL6030_MODULE_ID0, &reg_val,
> -						TWL6030_CFG_INPUT_PUPD3);
> -	if (ret < 0) {
> -		pr_err("twl6030: Failed to read CFG_INPUT_PUPD3, error %d\n",
> -									ret);
> -		return ret;
> -	}
> -	reg_val &= ~(MMC_PU | MMC_PD);
> -	ret = twl_i2c_write_u8(TWL6030_MODULE_ID0, reg_val,
> -						TWL6030_CFG_INPUT_PUPD3);
> -	if (ret < 0) {
> -		pr_err("twl6030: Failed to write CFG_INPUT_PUPD3, error %d\n",
> -									ret);
> -		return ret;
> -	}
> -
> -	return irq_find_mapping(twl6030_irq->irq_domain,
> -				 MMCDETECT_INTR_OFFSET);
> -}
> -EXPORT_SYMBOL(twl6030_mmc_card_detect_config);
> -
> -int twl6030_mmc_card_detect(struct device *dev, int slot)
> -{
> -	int ret = -EIO;
> -	u8 read_reg = 0;
> -	struct platform_device *pdev = to_platform_device(dev);
> -
> -	if (pdev->id) {
> -		/* TWL6030 provide's Card detect support for
> -		 * only MMC1 controller.
> -		 */
> -		pr_err("Unknown MMC controller %d in %s\n", pdev->id, __func__);
> -		return ret;
> -	}
> -	/*
> -	 * BIT0 of MMC_CTRL on TWL6030 provides card status for MMC1
> -	 * 0 - Card not present ,1 - Card present
> -	 */
> -	ret = twl_i2c_read_u8(TWL6030_MODULE_ID0, &read_reg,
> -						TWL6030_MMCCTRL);
> -	if (ret >= 0)
> -		ret = read_reg & STS_MMC;
> -	return ret;
> -}
> -EXPORT_SYMBOL(twl6030_mmc_card_detect);
> -
>  static int twl6030_irq_map(struct irq_domain *d, unsigned int virq,
>  			      irq_hw_number_t hwirq)
>  {
> diff --git a/include/linux/mfd/twl.h b/include/linux/mfd/twl.h
> index 85dc406173db..b31e07fa4d51 100644
> --- a/include/linux/mfd/twl.h
> +++ b/include/linux/mfd/twl.h
> @@ -205,27 +205,6 @@ int twl_get_hfclk_rate(void);
>  int twl6030_interrupt_unmask(u8 bit_mask, u8 offset);
>  int twl6030_interrupt_mask(u8 bit_mask, u8 offset);
>  
> -/* Card detect Configuration for MMC1 Controller on OMAP4 */
> -#ifdef CONFIG_TWL4030_CORE
> -int twl6030_mmc_card_detect_config(void);
> -#else
> -static inline int twl6030_mmc_card_detect_config(void)
> -{
> -	pr_debug("twl6030_mmc_card_detect_config not supported\n");
> -	return 0;
> -}
> -#endif
> -
> -/* MMC1 Controller on OMAP4 uses Phoenix irq for Card detect */
> -#ifdef CONFIG_TWL4030_CORE
> -int twl6030_mmc_card_detect(struct device *dev, int slot);
> -#else
> -static inline int twl6030_mmc_card_detect(struct device *dev, int slot)
> -{
> -	pr_debug("Call back twl6030_mmc_card_detect not supported\n");
> -	return -EIO;
> -}
> -#endif
>  /*----------------------------------------------------------------------*/
>  
>  /*
> -- 
> 2.49.0
> 

-- 
Lee Jones [李琼斯]

