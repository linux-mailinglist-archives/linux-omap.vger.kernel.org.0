Return-Path: <linux-omap+bounces-2755-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E93439E0E19
	for <lists+linux-omap@lfdr.de>; Mon,  2 Dec 2024 22:48:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 13B62B2CC2E
	for <lists+linux-omap@lfdr.de>; Mon,  2 Dec 2024 20:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F8D71DF242;
	Mon,  2 Dec 2024 20:58:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b="mpc+5xcp"
X-Original-To: linux-omap@vger.kernel.org
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [185.185.170.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8F219BBA;
	Mon,  2 Dec 2024 20:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=185.185.170.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733173107; cv=pass; b=rRlfayfSz9LGYBBS9Vjw6lsSpyz7vpDsdjjPYINUe4er3Rd1gJraYgU4lQBYfM/B7Y7CWZKNn54eDHlhWq5X1WkoRthLYADpQKcIapDuc95SC9i7Z+m6ASvytduGhCMZcUZc+7fIV9GP2b+nPSxVi0MRNLjdRb+L2HE6UezPXKY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733173107; c=relaxed/simple;
	bh=7u6Hx1uxDz54nFXxXDWIUeGlnviOM/BmXWQ1zojWEGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RtfKaLH9x3ZsJg5g1R9hfkrJr2mufS02G9gVaxscGIlIAjbkgTAyLWfX4QBN+B6Q3M+XKa6n1qMN/zKEtf7NvLH7nA4SAUKB//Zb70XAyx/96hKG+emV/2Z8Dxz82s3WdP4P9XzRxiPwhbO9cRxoj/n48DpiF9ls6ePK/SKUpR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi; spf=pass smtp.mailfrom=iki.fi; dkim=pass (2048-bit key) header.d=iki.fi header.i=@iki.fi header.b=mpc+5xcp; arc=pass smtp.client-ip=185.185.170.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iki.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iki.fi
Received: from darkstar.musicnaut.iki.fi (85-76-149-70-nat.elisa-mobile.fi [85.76.149.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: aaro.koskinen)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4Y2GMt6DVVz49PsJ;
	Mon,  2 Dec 2024 22:58:18 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1733173100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3hlKEeJd6muZEMzKDjhE1G35fL6+arbOx28m+GXEZuo=;
	b=mpc+5xcpudQV1gGkd+eEIvezmDqOxYricWT9punByA6gj01CG9Z4A5IDFYkB6lBYZhVECb
	eCyq15d5WYwSy6zS2WpeyXn7XRvfe/HPRRvevCOm3XSTDGU48SkBpBTeIaPHAwbWpLLpR+
	mLfGMEMKM6D3LUBXGwF+P4c6XU58ngVKLL708V4s22qlnis2SNgVOAWdIpNpxxoCBQ476c
	XM2ChnpV2irTpssNtkORDrYuN4xBqfszwQ9pYGNJbUWfXNpzCl5mUPOeJl9gFqjAaLDEag
	04m3T0OMA3YvT58dgs8GwBJGz3eH2213RA7IQwIML7Ic1xbo/fAcni431nB7UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1733173100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3hlKEeJd6muZEMzKDjhE1G35fL6+arbOx28m+GXEZuo=;
	b=l9Rh1BYqGJJFMG97csAO6nCTa8nEQuCByrB3GLW91aiFd2y2LFzLrZsJR69yuJZnli5G9t
	6sdQZfwHQ5Qe0MvEbFfQ3hIYNRw2AF2OBhSmk1k7yiRs4SpNQWBviGqWvXVbKhe7mWGc1d
	mVYwrUTq6WxLTWUtRa7ePfLqSk7S7Od+gq+2tNu/96hjvubUbRiiDZv7s2sODy1FtMnvyq
	LWF7hLlonbcdvwClRADeOoTnYWyng8WfQCp20qA6heSig4yIRcNgxNniukxFkoBJuXsOLK
	EZwjL6BFToZuqSx4GCleffgfTZAlp0CO8Q1ceDzhWY/Kd+KsZi0Zkm32wYv67A==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1733173100; a=rsa-sha256;
	cv=none;
	b=a1YM7bQF/IHJHwBmgUykUKWL/bXuAMSkjcVGxwE+RJ2hwZGAtUgx+U3mVPxVCuDxmGBNaV
	IU0G/X41aop6kChVW9kVYBgirLFdWWXcramVZhjdRjR9z1WdfBSyjjkdf2y1aHDDUcv/10
	wHP5X7tbmLC+5A1n3frw4FCxbMuzN0LXQATxpGBCcLfxs3J+/B50fm29wz7zDqFDnOxxkM
	t8ReKupIuCNF5M67LdsIQw5tbpFk4mkxV7QskxG2r0CJPyBW9A1b98OGqhTd0idp/tNA7z
	ACXABPNegaZVBxsjyv2E4jb7pNHYjcfloXvRwxnlk6OU+/1TuRi3NybMAUiV0A==
Date: Mon, 2 Dec 2024 22:58:17 +0200
From: Aaro Koskinen <aaro.koskinen@iki.fi>
To: Dhruv Menon <dhruvmenon1104@gmail.com>
Cc: vigneshr@ti.com, andi.shyti@kernel.org, jmkrzyszt@gmail.com,
	tony@atomide.com, andreas@kemnade.info, khilman@baylibre.com,
	rogerq@kernel.org, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] i2c: omap: Cleaned up coding style and parameters
Message-ID: <Z04faeJUgZTydiMb@darkstar.musicnaut.iki.fi>
References: <Z04CA8fGCC-nyZIY@melbuntu>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z04CA8fGCC-nyZIY@melbuntu>

On Tue, Dec 03, 2024 at 12:22:51AM +0530, Dhruv Menon wrote:
> This commit addresses the coding style issues present in i2c-omap.c,
> identified by checkpatch.pl and removes unused parameters present in
> two functions.
> 
> 1. Coding style issues includes Macro Utilization, alignnment
>    correction, updating ms_sleep() < 20 to usleep_range().
> 2. Removed unused parameters from omap_i2c_receive_data()
>    and omap_i2c_transmit_data().
> 
> No functional changes have been introduced in this commit.

Not sure if that is correct as sleeps can be now shorter? I wouldn't
touch them unless you can show some real benefit (checkpatch.pl warning
isn't one for old driver code).

Maybe also changes should be split into separate patches for easier
review.

A.

> 
> Signed-off-by: Dhruv Menon <dhruvmenon1104@gmail.com>
> ---
>  drivers/i2c/busses/i2c-omap.c | 209 ++++++++++++++++------------------
>  1 file changed, 101 insertions(+), 108 deletions(-)
> 
> diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
> index 1d9ad25c89ae..eee1671edebd 100644
> --- a/drivers/i2c/busses/i2c-omap.c
> +++ b/drivers/i2c/busses/i2c-omap.c
> @@ -78,39 +78,39 @@ enum {
>  };
>  
>  /* I2C Interrupt Enable Register (OMAP_I2C_IE): */
> -#define OMAP_I2C_IE_XDR		(1 << 14)	/* TX Buffer drain int enable */
> -#define OMAP_I2C_IE_RDR		(1 << 13)	/* RX Buffer drain int enable */
> -#define OMAP_I2C_IE_XRDY	(1 << 4)	/* TX data ready int enable */
> -#define OMAP_I2C_IE_RRDY	(1 << 3)	/* RX data ready int enable */
> -#define OMAP_I2C_IE_ARDY	(1 << 2)	/* Access ready int enable */
> -#define OMAP_I2C_IE_NACK	(1 << 1)	/* No ack interrupt enable */
> -#define OMAP_I2C_IE_AL		(1 << 0)	/* Arbitration lost int ena */
> +#define OMAP_I2C_IE_XDR		BIT(14)	/* TX Buffer drain int enable */
> +#define OMAP_I2C_IE_RDR		BIT(13)	/* RX Buffer drain int enable */
> +#define OMAP_I2C_IE_XRDY	BIT(4)	/* TX data ready int enable */
> +#define OMAP_I2C_IE_RRDY	BIT(3)	/* RX data ready int enable */
> +#define OMAP_I2C_IE_ARDY	BIT(2)	/* Access ready int enable */
> +#define OMAP_I2C_IE_NACK	BIT(1)	/* No ack interrupt enable */
> +#define OMAP_I2C_IE_AL		BIT(0)	/* Arbitration lost int ena */
>  
>  /* I2C Status Register (OMAP_I2C_STAT): */
> -#define OMAP_I2C_STAT_XDR	(1 << 14)	/* TX Buffer draining */
> -#define OMAP_I2C_STAT_RDR	(1 << 13)	/* RX Buffer draining */
> -#define OMAP_I2C_STAT_BB	(1 << 12)	/* Bus busy */
> -#define OMAP_I2C_STAT_ROVR	(1 << 11)	/* Receive overrun */
> -#define OMAP_I2C_STAT_XUDF	(1 << 10)	/* Transmit underflow */
> -#define OMAP_I2C_STAT_AAS	(1 << 9)	/* Address as slave */
> -#define OMAP_I2C_STAT_BF	(1 << 8)	/* Bus Free */
> -#define OMAP_I2C_STAT_XRDY	(1 << 4)	/* Transmit data ready */
> -#define OMAP_I2C_STAT_RRDY	(1 << 3)	/* Receive data ready */
> -#define OMAP_I2C_STAT_ARDY	(1 << 2)	/* Register access ready */
> -#define OMAP_I2C_STAT_NACK	(1 << 1)	/* No ack interrupt enable */
> -#define OMAP_I2C_STAT_AL	(1 << 0)	/* Arbitration lost int ena */
> +#define OMAP_I2C_STAT_XDR	BIT(14)	/* TX Buffer draining */
> +#define OMAP_I2C_STAT_RDR	BIT(13)	/* RX Buffer draining */
> +#define OMAP_I2C_STAT_BB	BIT(12)	/* Bus busy */
> +#define OMAP_I2C_STAT_ROVR	BIT(11)	/* Receive overrun */
> +#define OMAP_I2C_STAT_XUDF	BIT(10)	/* Transmit underflow */
> +#define OMAP_I2C_STAT_AAS	BIT(9)	/* Address as slave */
> +#define OMAP_I2C_STAT_BF	BIT(8)	/* Bus Free */
> +#define OMAP_I2C_STAT_XRDY	BIT(4)	/* Transmit data ready */
> +#define OMAP_I2C_STAT_RRDY	BIT(3)	/* Receive data ready */
> +#define OMAP_I2C_STAT_ARDY	BIT(2)	/* Register access ready */
> +#define OMAP_I2C_STAT_NACK	BIT(1)	/* No ack interrupt enable */
> +#define OMAP_I2C_STAT_AL	BIT(0)	/* Arbitration lost int ena */
>  
>  /* I2C WE wakeup enable register */
> -#define OMAP_I2C_WE_XDR_WE	(1 << 14)	/* TX drain wakup */
> -#define OMAP_I2C_WE_RDR_WE	(1 << 13)	/* RX drain wakeup */
> -#define OMAP_I2C_WE_AAS_WE	(1 << 9)	/* Address as slave wakeup*/
> -#define OMAP_I2C_WE_BF_WE	(1 << 8)	/* Bus free wakeup */
> -#define OMAP_I2C_WE_STC_WE	(1 << 6)	/* Start condition wakeup */
> -#define OMAP_I2C_WE_GC_WE	(1 << 5)	/* General call wakeup */
> -#define OMAP_I2C_WE_DRDY_WE	(1 << 3)	/* TX/RX data ready wakeup */
> -#define OMAP_I2C_WE_ARDY_WE	(1 << 2)	/* Reg access ready wakeup */
> -#define OMAP_I2C_WE_NACK_WE	(1 << 1)	/* No acknowledgment wakeup */
> -#define OMAP_I2C_WE_AL_WE	(1 << 0)	/* Arbitration lost wakeup */
> +#define OMAP_I2C_WE_XDR_WE	BIT(14)	/* TX drain wakup */
> +#define OMAP_I2C_WE_RDR_WE	BIT(13)	/* RX drain wakeup */
> +#define OMAP_I2C_WE_AAS_WE	BIT(9)	/* Address as slave wakeup*/
> +#define OMAP_I2C_WE_BF_WE	BIT(8)	/* Bus free wakeup */
> +#define OMAP_I2C_WE_STC_WE	BIT(6)	/* Start condition wakeup */
> +#define OMAP_I2C_WE_GC_WE	BIT(5)	/* General call wakeup */
> +#define OMAP_I2C_WE_DRDY_WE	BIT(3)	/* TX/RX data ready wakeup */
> +#define OMAP_I2C_WE_ARDY_WE	BIT(2)	/* Reg access ready wakeup */
> +#define OMAP_I2C_WE_NACK_WE	BIT(1)	/* No acknowledgment wakeup */
> +#define OMAP_I2C_WE_AL_WE	BIT(0)	/* Arbitration lost wakeup */
>  
>  #define OMAP_I2C_WE_ALL		(OMAP_I2C_WE_XDR_WE | OMAP_I2C_WE_RDR_WE | \
>  				OMAP_I2C_WE_AAS_WE | OMAP_I2C_WE_BF_WE | \
> @@ -119,59 +119,59 @@ enum {
>  				OMAP_I2C_WE_NACK_WE | OMAP_I2C_WE_AL_WE)
>  
>  /* I2C Buffer Configuration Register (OMAP_I2C_BUF): */
> -#define OMAP_I2C_BUF_RDMA_EN	(1 << 15)	/* RX DMA channel enable */
> -#define OMAP_I2C_BUF_RXFIF_CLR	(1 << 14)	/* RX FIFO Clear */
> -#define OMAP_I2C_BUF_XDMA_EN	(1 << 7)	/* TX DMA channel enable */
> -#define OMAP_I2C_BUF_TXFIF_CLR	(1 << 6)	/* TX FIFO Clear */
> +#define OMAP_I2C_BUF_RDMA_EN	BIT(15)	/* RX DMA channel enable */
> +#define OMAP_I2C_BUF_RXFIF_CLR	BIT(14)	/* RX FIFO Clear */
> +#define OMAP_I2C_BUF_XDMA_EN	BIT(7)	/* TX DMA channel enable */
> +#define OMAP_I2C_BUF_TXFIF_CLR	BIT(6)	/* TX FIFO Clear */
>  
>  /* I2C Configuration Register (OMAP_I2C_CON): */
> -#define OMAP_I2C_CON_EN		(1 << 15)	/* I2C module enable */
> -#define OMAP_I2C_CON_BE		(1 << 14)	/* Big endian mode */
> -#define OMAP_I2C_CON_OPMODE_HS	(1 << 12)	/* High Speed support */
> -#define OMAP_I2C_CON_STB	(1 << 11)	/* Start byte mode (master) */
> -#define OMAP_I2C_CON_MST	(1 << 10)	/* Master/slave mode */
> -#define OMAP_I2C_CON_TRX	(1 << 9)	/* TX/RX mode (master only) */
> -#define OMAP_I2C_CON_XA		(1 << 8)	/* Expand address */
> -#define OMAP_I2C_CON_RM		(1 << 2)	/* Repeat mode (master only) */
> -#define OMAP_I2C_CON_STP	(1 << 1)	/* Stop cond (master only) */
> -#define OMAP_I2C_CON_STT	(1 << 0)	/* Start condition (master) */
> +#define OMAP_I2C_CON_EN		BIT(15)	/* I2C module enable */
> +#define OMAP_I2C_CON_BE		BIT(14)	/* Big endian mode */
> +#define OMAP_I2C_CON_OPMODE_HS	BIT(12)	/* High Speed support */
> +#define OMAP_I2C_CON_STB	BIT(11)	/* Start byte mode (master) */
> +#define OMAP_I2C_CON_MST	BIT(10)	/* Master/slave mode */
> +#define OMAP_I2C_CON_TRX	BIT(9)	/* TX/RX mode (master only) */
> +#define OMAP_I2C_CON_XA		BIT(8)	/* Expand address */
> +#define OMAP_I2C_CON_RM		BIT(2)	/* Repeat mode (master only) */
> +#define OMAP_I2C_CON_STP	BIT(1)	/* Stop cond (master only) */
> +#define OMAP_I2C_CON_STT	BIT(0)	/* Start condition (master) */
>  
>  /* I2C SCL time value when Master */
>  #define OMAP_I2C_SCLL_HSSCLL	8
>  #define OMAP_I2C_SCLH_HSSCLH	8
>  
>  /* I2C System Test Register (OMAP_I2C_SYSTEST): */
> -#define OMAP_I2C_SYSTEST_ST_EN		(1 << 15)	/* System test enable */
> -#define OMAP_I2C_SYSTEST_FREE		(1 << 14)	/* Free running mode */
> -#define OMAP_I2C_SYSTEST_TMODE_MASK	(3 << 12)	/* Test mode select */
> -#define OMAP_I2C_SYSTEST_TMODE_SHIFT	(12)		/* Test mode select */
> +#define OMAP_I2C_SYSTEST_ST_EN		BIT(15)	/* System test enable */
> +#define OMAP_I2C_SYSTEST_FREE		BIT(14)	/* Free running mode */
> +#define OMAP_I2C_SYSTEST_TMODE_MASK	GENMASK(13, 12)	/* Test mode select */
> +#define OMAP_I2C_SYSTEST_TMODE_SHIFT	(12)	/* Test mode select */
>  /* Functional mode */
> -#define OMAP_I2C_SYSTEST_SCL_I_FUNC	(1 << 8)	/* SCL line input value */
> -#define OMAP_I2C_SYSTEST_SCL_O_FUNC	(1 << 7)	/* SCL line output value */
> -#define OMAP_I2C_SYSTEST_SDA_I_FUNC	(1 << 6)	/* SDA line input value */
> -#define OMAP_I2C_SYSTEST_SDA_O_FUNC	(1 << 5)	/* SDA line output value */
> +#define OMAP_I2C_SYSTEST_SCL_I_FUNC	BIT(8)	/* SCL line input value */
> +#define OMAP_I2C_SYSTEST_SCL_O_FUNC	BIT(7)	/* SCL line output value */
> +#define OMAP_I2C_SYSTEST_SDA_I_FUNC	BIT(6)	/* SDA line input value */
> +#define OMAP_I2C_SYSTEST_SDA_O_FUNC	BIT(5)	/* SDA line output value */
>  /* SDA/SCL IO mode */
> -#define OMAP_I2C_SYSTEST_SCL_I		(1 << 3)	/* SCL line sense in */
> -#define OMAP_I2C_SYSTEST_SCL_O		(1 << 2)	/* SCL line drive out */
> -#define OMAP_I2C_SYSTEST_SDA_I		(1 << 1)	/* SDA line sense in */
> -#define OMAP_I2C_SYSTEST_SDA_O		(1 << 0)	/* SDA line drive out */
> +#define OMAP_I2C_SYSTEST_SCL_I		BIT(3)	/* SCL line sense in */
> +#define OMAP_I2C_SYSTEST_SCL_O		BIT(2)	/* SCL line drive out */
> +#define OMAP_I2C_SYSTEST_SDA_I		BIT(1)	/* SDA line sense in */
> +#define OMAP_I2C_SYSTEST_SDA_O		BIT(0)	/* SDA line drive out */
>  
>  /* OCP_SYSSTATUS bit definitions */
> -#define SYSS_RESETDONE_MASK		(1 << 0)
> +#define SYSS_RESETDONE_MASK		BIT(0)
>  
>  /* OCP_SYSCONFIG bit definitions */
> -#define SYSC_CLOCKACTIVITY_MASK		(0x3 << 8)
> -#define SYSC_SIDLEMODE_MASK		(0x3 << 3)
> -#define SYSC_ENAWAKEUP_MASK		(1 << 2)
> -#define SYSC_SOFTRESET_MASK		(1 << 1)
> -#define SYSC_AUTOIDLE_MASK		(1 << 0)
> +#define SYSC_CLOCKACTIVITY_MASK		GENMASK(9, 8)
> +#define SYSC_SIDLEMODE_MASK		GENMASK(4, 3)
> +#define SYSC_ENAWAKEUP_MASK		BIT(2)
> +#define SYSC_SOFTRESET_MASK		BIT(1)
> +#define SYSC_AUTOIDLE_MASK		BIT(0)
>  
>  #define SYSC_IDLEMODE_SMART		0x2
>  #define SYSC_CLOCKACTIVITY_FCLK		0x2
>  
>  /* Errata definitions */
> -#define I2C_OMAP_ERRATA_I207		(1 << 0)
> -#define I2C_OMAP_ERRATA_I462		(1 << 1)
> +#define I2C_OMAP_ERRATA_I207		BIT(0)
> +#define I2C_OMAP_ERRATA_I462		BIT(1)
>  
>  #define OMAP_I2C_IP_V2_INTERRUPTS_MASK	0x6FFF
>  
> @@ -277,7 +277,6 @@ static inline u16 omap_i2c_read_reg(struct omap_i2c_dev *omap, int reg)
>  
>  static void __omap_i2c_init(struct omap_i2c_dev *omap)
>  {
> -
>  	omap_i2c_write_reg(omap, OMAP_I2C_CON_REG, 0);
>  
>  	/* Setup clock prescaler to obtain approx 12MHz I2C module clock: */
> @@ -316,22 +315,22 @@ static int omap_i2c_reset(struct omap_i2c_dev *omap)
>  
>  		/* Disable I2C controller before soft reset */
>  		omap_i2c_write_reg(omap, OMAP_I2C_CON_REG,
> -			omap_i2c_read_reg(omap, OMAP_I2C_CON_REG) &
> -				~(OMAP_I2C_CON_EN));
> +				   omap_i2c_read_reg(omap, OMAP_I2C_CON_REG) &
> +		~(OMAP_I2C_CON_EN));
>  
>  		omap_i2c_write_reg(omap, OMAP_I2C_SYSC_REG, SYSC_SOFTRESET_MASK);
>  		/* For some reason we need to set the EN bit before the
> -		 * reset done bit gets set. */
> +		 * reset done bit gets set.
> +		 */
>  		timeout = jiffies + OMAP_I2C_TIMEOUT;
>  		omap_i2c_write_reg(omap, OMAP_I2C_CON_REG, OMAP_I2C_CON_EN);
>  		while (!(omap_i2c_read_reg(omap, OMAP_I2C_SYSS_REG) &
>  			 SYSS_RESETDONE_MASK)) {
>  			if (time_after(jiffies, timeout)) {
> -				dev_warn(omap->dev, "timeout waiting "
> -						"for controller reset\n");
> +				dev_warn(omap->dev, "timeout waiting for controller reset\n");
>  				return -ETIMEDOUT;
>  			}
> -			msleep(1);
> +			usleep_range(1000, 2000);
>  		}
>  
>  		/* SYSC register is cleared by the reset; rewrite it */
> @@ -396,15 +395,13 @@ static int omap_i2c_init(struct omap_i2c_dev *omap)
>  	}
>  
>  	if (!(omap->flags & OMAP_I2C_FLAG_SIMPLE_CLOCK)) {
> -
>  		/*
>  		 * HSI2C controller internal clk rate should be 19.2 Mhz for
>  		 * HS and for all modes on 2430. On 34xx we can use lower rate
>  		 * to get longer filter period for better noise suppression.
>  		 * The filter is iclk (fclk for HS) period.
>  		 */
> -		if (omap->speed > 400 ||
> -			       omap->flags & OMAP_I2C_FLAG_FORCE_19200_INT_CLK)
> +		if (omap->speed > 400 || omap->flags & OMAP_I2C_FLAG_FORCE_19200_INT_CLK)
>  			internal_clk = 19200;
>  		else if (omap->speed > 100)
>  			internal_clk = 9600;
> @@ -506,7 +503,7 @@ static int omap_i2c_wait_for_bb(struct omap_i2c_dev *omap)
>  	while (omap_i2c_read_reg(omap, OMAP_I2C_STAT_REG) & OMAP_I2C_STAT_BB) {
>  		if (time_after(jiffies, timeout))
>  			return omap_i2c_recover_bus(omap);
> -		msleep(1);
> +		usleep_range(1000, 2000);
>  	}
>  
>  	return 0;
> @@ -595,7 +592,7 @@ static int omap_i2c_wait_for_bb_valid(struct omap_i2c_dev *omap)
>  			return omap_i2c_recover_bus(omap);
>  		}
>  
> -		msleep(1);
> +		usleep_range(1000, 2000);
>  	}
>  
>  	omap->bb_valid = 1;
> @@ -616,7 +613,7 @@ static void omap_i2c_resize_fifo(struct omap_i2c_dev *omap, u8 size, bool is_rx)
>  	 * then we might use draining feature to transfer the remaining bytes.
>  	 */
>  
> -	omap->threshold = clamp(size, (u8) 1, omap->fifo_size);
> +	omap->threshold = clamp(size, (u8)1, omap->fifo_size);
>  
>  	buf = omap_i2c_read_reg(omap, OMAP_I2C_BUF_REG);
>  
> @@ -636,7 +633,7 @@ static void omap_i2c_resize_fifo(struct omap_i2c_dev *omap, u8 size, bool is_rx)
>  		omap->b_hw = 1; /* Enable hardware fixes */
>  
>  	/* calculate wakeup latency constraint for MPU */
> -	if (omap->set_mpu_wkup_lat != NULL)
> +	if (omap->set_mpu_wkup_lat)
>  		omap->latency = (1000000 * omap->threshold) /
>  			(1000 * omap->speed / 8);
>  }
> @@ -718,13 +715,13 @@ static int omap_i2c_xfer_msg(struct i2c_adapter *adap,
>  	if (omap->b_hw && stop) {
>  		unsigned long delay = jiffies + OMAP_I2C_TIMEOUT;
>  		u16 con = omap_i2c_read_reg(omap, OMAP_I2C_CON_REG);
> +
>  		while (con & OMAP_I2C_CON_STT) {
>  			con = omap_i2c_read_reg(omap, OMAP_I2C_CON_REG);
>  
>  			/* Let the user know if i2c is in a bad state */
>  			if (time_after(jiffies, delay)) {
> -				dev_err(omap->dev, "controller timed out "
> -				"waiting for start condition to finish\n");
> +				dev_err(omap->dev, "controller timed out waiting for start condition to finish\n");
>  				return -ETIMEDOUT;
>  			}
>  			cpu_relax();
> @@ -782,7 +779,6 @@ static int omap_i2c_xfer_msg(struct i2c_adapter *adap,
>  	return -EIO;
>  }
>  
> -
>  /*
>   * Prepare controller for a transaction and call omap_i2c_xfer_msg
>   * to do the work during IRQ processing.
> @@ -807,7 +803,7 @@ omap_i2c_xfer_common(struct i2c_adapter *adap, struct i2c_msg msgs[], int num,
>  	if (r < 0)
>  		goto out;
>  
> -	if (omap->set_mpu_wkup_lat != NULL)
> +	if (omap->set_mpu_wkup_lat)
>  		omap->set_mpu_wkup_lat(omap->dev, omap->latency);
>  
>  	for (i = 0; i < num; i++) {
> @@ -822,7 +818,7 @@ omap_i2c_xfer_common(struct i2c_adapter *adap, struct i2c_msg msgs[], int num,
>  
>  	omap_i2c_wait_for_bb(omap);
>  
> -	if (omap->set_mpu_wkup_lat != NULL)
> +	if (omap->set_mpu_wkup_lat)
>  		omap->set_mpu_wkup_lat(omap->dev, -1);
>  
>  out:
> @@ -875,18 +871,15 @@ static inline void i2c_omap_errata_i207(struct omap_i2c_dev *omap, u16 stat)
>  	if (stat & OMAP_I2C_STAT_RDR) {
>  		/* Step 1: If RDR is set, clear it */
>  		omap_i2c_ack_stat(omap, OMAP_I2C_STAT_RDR);
> -
>  		/* Step 2: */
>  		if (!(omap_i2c_read_reg(omap, OMAP_I2C_STAT_REG)
>  						& OMAP_I2C_STAT_BB)) {
> -
>  			/* Step 3: */
>  			if (omap_i2c_read_reg(omap, OMAP_I2C_STAT_REG)
>  						& OMAP_I2C_STAT_RDR) {
>  				omap_i2c_ack_stat(omap, OMAP_I2C_STAT_RDR);
>  				dev_dbg(omap->dev, "RDR when bus is busy.\n");
>  			}
> -
>  		}
>  	}
>  }
> @@ -911,7 +904,7 @@ omap_i2c_omap1_isr(int this_irq, void *dev_id)
>  		dev_err(omap->dev, "Arbitration lost\n");
>  		omap_i2c_complete_cmd(omap, OMAP_I2C_STAT_AL);
>  		break;
> -	case 0x02:	/* No acknowledgement */
> +	case 0x02:	/* No acknowledgment */
>  		omap_i2c_complete_cmd(omap, OMAP_I2C_STAT_NACK);
>  		omap_i2c_write_reg(omap, OMAP_I2C_CON_REG, OMAP_I2C_CON_STP);
>  		break;
> @@ -927,8 +920,9 @@ omap_i2c_omap1_isr(int this_irq, void *dev_id)
>  				*omap->buf++ = w >> 8;
>  				omap->buf_len--;
>  			}
> -		} else
> +		} else {
>  			dev_err(omap->dev, "RRDY IRQ while no data requested\n");
> +		}
>  		break;
>  	case 0x05:	/* Transmit data ready */
>  		if (omap->buf_len) {
> @@ -939,8 +933,9 @@ omap_i2c_omap1_isr(int this_irq, void *dev_id)
>  				omap->buf_len--;
>  			}
>  			omap_i2c_write_reg(omap, OMAP_I2C_DATA_REG, w);
> -		} else
> +		} else {
>  			dev_err(omap->dev, "XRDY IRQ while no data to send\n");
> +		}
>  		break;
>  	default:
>  		return IRQ_NONE;
> @@ -995,8 +990,7 @@ static int errata_omap3_i462(struct omap_i2c_dev *omap)
>  	return 0;
>  }
>  
> -static void omap_i2c_receive_data(struct omap_i2c_dev *omap, u8 num_bytes,
> -		bool is_rdr)
> +static void omap_i2c_receive_data(struct omap_i2c_dev *omap, u8 num_bytes)
>  {
>  	u16		w;
>  
> @@ -1016,8 +1010,7 @@ static void omap_i2c_receive_data(struct omap_i2c_dev *omap, u8 num_bytes,
>  	}
>  }
>  
> -static int omap_i2c_transmit_data(struct omap_i2c_dev *omap, u8 num_bytes,
> -		bool is_xdr)
> +static int omap_i2c_transmit_data(struct omap_i2c_dev *omap, u8 num_bytes)
>  {
>  	u16		w;
>  
> @@ -1133,7 +1126,7 @@ static int omap_i2c_xfer_data(struct omap_i2c_dev *omap)
>  					OMAP_I2C_BUFSTAT_REG) >> 8) & 0x3F;
>  			}
>  
> -			omap_i2c_receive_data(omap, num_bytes, true);
> +			omap_i2c_receive_data(omap, num_bytes);
>  			omap_i2c_ack_stat(omap, OMAP_I2C_STAT_RDR);
>  			continue;
>  		}
> @@ -1144,7 +1137,7 @@ static int omap_i2c_xfer_data(struct omap_i2c_dev *omap)
>  			if (omap->threshold)
>  				num_bytes = omap->threshold;
>  
> -			omap_i2c_receive_data(omap, num_bytes, false);
> +			omap_i2c_receive_data(omap, num_bytes);
>  			omap_i2c_ack_stat(omap, OMAP_I2C_STAT_RRDY);
>  			continue;
>  		}
> @@ -1156,7 +1149,7 @@ static int omap_i2c_xfer_data(struct omap_i2c_dev *omap)
>  			if (omap->fifo_size)
>  				num_bytes = omap->buf_len;
>  
> -			ret = omap_i2c_transmit_data(omap, num_bytes, true);
> +			ret = omap_i2c_transmit_data(omap, num_bytes);
>  			if (ret < 0)
>  				break;
>  
> @@ -1171,7 +1164,7 @@ static int omap_i2c_xfer_data(struct omap_i2c_dev *omap)
>  			if (omap->threshold)
>  				num_bytes = omap->threshold;
>  
> -			ret = omap_i2c_transmit_data(omap, num_bytes, false);
> +			ret = omap_i2c_transmit_data(omap, num_bytes);
>  			if (ret < 0)
>  				break;
>  
> @@ -1266,13 +1259,13 @@ static const struct of_device_id omap_i2c_of_match[] = {
>  MODULE_DEVICE_TABLE(of, omap_i2c_of_match);
>  #endif
>  
> -#define OMAP_I2C_SCHEME(rev)		((rev & 0xc000) >> 14)
> +#define OMAP_I2C_SCHEME(rev)           (((rev) & 0xc000) >> 14)
>  
> -#define OMAP_I2C_REV_SCHEME_0_MAJOR(rev) (rev >> 4)
> -#define OMAP_I2C_REV_SCHEME_0_MINOR(rev) (rev & 0xf)
> +#define OMAP_I2C_REV_SCHEME_0_MAJOR(rev) (((rev) >> 4))
> +#define OMAP_I2C_REV_SCHEME_0_MINOR(rev) (((rev) & 0xf))
>  
> -#define OMAP_I2C_REV_SCHEME_1_MAJOR(rev) ((rev & 0x0700) >> 7)
> -#define OMAP_I2C_REV_SCHEME_1_MINOR(rev) (rev & 0x1f)
> +#define OMAP_I2C_REV_SCHEME_1_MAJOR(rev) (((rev) & 0x0700) >> 7)
> +#define OMAP_I2C_REV_SCHEME_1_MINOR(rev) (((rev) & 0x1f))
>  #define OMAP_I2C_SCHEME_0		0
>  #define OMAP_I2C_SCHEME_1		1
>  
> @@ -1383,7 +1376,7 @@ omap_i2c_probe(struct platform_device *pdev)
>  		of_property_read_u32(node, "clock-frequency", &freq);
>  		/* convert DT freq value in Hz into kHz for speed */
>  		omap->speed = freq / 1000;
> -	} else if (pdata != NULL) {
> +	} else if (pdata) {
>  		omap->speed = pdata->clkrate;
>  		omap->flags = pdata->flags;
>  		omap->set_mpu_wkup_lat = pdata->set_mpu_wkup_lat;
> @@ -1434,7 +1427,7 @@ omap_i2c_probe(struct platform_device *pdev)
>  	omap->errata = 0;
>  
>  	if (omap->rev >= OMAP_I2C_REV_ON_2430 &&
> -			omap->rev < OMAP_I2C_REV_ON_4430_PLUS)
> +	    omap->rev < OMAP_I2C_REV_ON_4430_PLUS)
>  		omap->errata |= I2C_OMAP_ERRATA_I207;
>  
>  	if (omap->rev <= OMAP_I2C_REV_ON_3430_3530)
> @@ -1459,7 +1452,7 @@ omap_i2c_probe(struct platform_device *pdev)
>  			omap->b_hw = 1; /* Enable hardware fixes */
>  
>  		/* calculate wakeup latency constraint for MPU */
> -		if (omap->set_mpu_wkup_lat != NULL)
> +		if (omap->set_mpu_wkup_lat)
>  			omap->latency = (1000000 * omap->fifo_size) /
>  				       (1000 * omap->speed / 8);
>  	}
> @@ -1469,12 +1462,12 @@ omap_i2c_probe(struct platform_device *pdev)
>  
>  	if (omap->rev < OMAP_I2C_OMAP1_REV_2)
>  		r = devm_request_irq(&pdev->dev, omap->irq, omap_i2c_omap1_isr,
> -				IRQF_NO_SUSPEND, pdev->name, omap);
> +				     IRQF_NO_SUSPEND, pdev->name, omap);
>  	else
>  		r = devm_request_threaded_irq(&pdev->dev, omap->irq,
> -				omap_i2c_isr, omap_i2c_isr_thread,
> -				IRQF_NO_SUSPEND | IRQF_ONESHOT,
> -				pdev->name, omap);
> +					      omap_i2c_isr, omap_i2c_isr_thread,
> +							IRQF_NO_SUSPEND | IRQF_ONESHOT,
> +							pdev->name, omap);
>  
>  	if (r) {
>  		dev_err(omap->dev, "failure requesting irq %i\n", omap->irq);
> -- 
> 2.43.0
> 
> 

