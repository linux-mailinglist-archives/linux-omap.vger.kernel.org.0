Return-Path: <linux-omap+bounces-2756-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 991E69E143C
	for <lists+linux-omap@lfdr.de>; Tue,  3 Dec 2024 08:32:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A2F60B26BA7
	for <lists+linux-omap@lfdr.de>; Tue,  3 Dec 2024 07:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C4071A4F2F;
	Tue,  3 Dec 2024 07:31:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OsO859xh"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554FD18595B;
	Tue,  3 Dec 2024 07:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733211087; cv=none; b=jgNjaVkRBFj2GTSvVqGZ4XXNYpv20CoL4024BgnKVTKfwJ9RMbMZfA6i7oUFlVNTRitBHT+Vfd5RTxD2u7n4kVnQhKE88yPw9Zo3WkHkLKHlNFnFYJBqWbpV90XF2ESA+fCmIq7omknZQ+c6S+djHW3volCFOlr7BlKDAsLuIRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733211087; c=relaxed/simple;
	bh=D5fqM8228ZCQgYWcT58506QmX6FJ6ysTn5+z8NXCDaw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uOkOTjOZR9CMYC1CA5Ylg2PA+unI0LpYIFeHAUWGWvWanQNa+S043hInO+uCY0T/p8lr4zpxe9LEwzYW9G0yWu67hZXpEs+o0+uJAmmZ44r5i7jo+mFis7sISORmLZvaUUTVYF2xa3nkv0LpuoJ7nHs+3IRaQ0dglSxrjVgbk4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OsO859xh; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-724f42c1c38so4443855b3a.1;
        Mon, 02 Dec 2024 23:31:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733211084; x=1733815884; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kvz/og9RQrKAs/+4r09VFCsDYlnhieEbO6HJgfD9Dvc=;
        b=OsO859xhrorJflle4741DcXDt57MVhmkk+GfTS+s1rP8vzggU1M0hgws5ombNJo0Vb
         vCTZR7/YS3ccZF7LPUhmfzv5HFhtaEenGOBr0pO2ufFmmRsL8tlgZVMCMuvpjKa6rJz1
         3a4mD6r63dHkT1xj820gpny4f7afAGEtGa7UL/zceWVh5N/2f1llfi7Z0AVdBnGS5439
         s6dxD+fzJ2WtUAYqfLQcwoNWftgjabOnXoET4ePnCwcSA4MBUyZkR4xH0JyUhP8qGomy
         +BjMrSAW4O4sXlwZWfRUnmQXRI1IV+lo+qT1z7+G/E6ZVFdhJxNcA9BvkjIAStpRA5Hs
         IAuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733211084; x=1733815884;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kvz/og9RQrKAs/+4r09VFCsDYlnhieEbO6HJgfD9Dvc=;
        b=Wt2FQE+HGcM0y8os8+zbMW4nlgM7/ehRUU1oLd4Mfq9fFXulVeSLdKw4n0kLDQdvPI
         0LK6nmck7VWNxOUcsI9+jtHRnCKq7oXZ9ADc9IgCLnjGUNClkcAk+Nk5dceyXw+cyqu9
         VGLoeIsnN+PzN4LlDQs/aoMDchtQj0yc3CMizJtMF1X63Za4HhHUgK6KVL121Zo/BLdP
         DJpB6MmIYUV1MBBlY4XSOaQN+xAFPQDCErcQRKbHoXy9nPFI9crdQrxdCcMN3LQG/6Z+
         XokuhCLDxpJgpXmVtmlyk3j9TDu+aYlMlbzg2CypKrLgXo1eihqgsBSZBpPr9eI/FoDh
         21Vg==
X-Forwarded-Encrypted: i=1; AJvYcCXXXov1kHErCcVQpOAJx2Cp8izxcgtvdKacZpsrd9AzcgpIEJy2TlVtPbZ8/nwLHOF/1uwsGNQvvZPuzYE=@vger.kernel.org, AJvYcCXh8ySwkEXY4vtzuI5lWZgS7V8NaYsxcGUAn6kLzp6P1e07pXZBrRn9vHkeyP2dVSBQ1Nylq/0WBYkWkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YygQnSNzBcXFZ0YaS4lz41IntXFzx8YMpuys/Ps6+RKzvTrVXsH
	cmssR3Sl/vrkH0tvBQUyz77M4x0QjGMRtLALIL5BpSX4xaRzEoGG
X-Gm-Gg: ASbGncs/Ody4ly8+Ax9dyxx53lXU0SsULBQ7z0VckbUi+mTZMpwPo0K0oNhDJ7Zc6yM
	8vSUP6VX2nKePZqWKy4/dVoJXOOIu+F/AtQYkx00lbKx/Hbm/f++akhZRq4KaUJOLvQk89T3O3F
	iLC2tPS27jwqA8N4JbONauV6OvmQ2pGSJO4/y/oD1sxDQVZTjDl2yk7xvnjB9xfidVQ1ov5hiQB
	d8Y9u38wTAW8Jx39jll0y5GtVA4cMtKJidl3jr1MREpUd9S66RzreY=
X-Google-Smtp-Source: AGHT+IESVLH7jqm9YEeM9G+9hhrS3uggas0/DfQZDtzpONIcfNIYKZLYCVw9jS38zJxgiTo6GrUI5g==
X-Received: by 2002:a17:90a:e70c:b0:2ee:f440:53ed with SMTP id 98e67ed59e1d1-2ef0127597bmr1845597a91.31.1733211083194;
        Mon, 02 Dec 2024 23:31:23 -0800 (PST)
Received: from melbuntu ([2401:4900:1cb9:6d90:4398:1b59:5c22:1aa8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ee7c7b574asm5735142a91.22.2024.12.02.23.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 23:31:22 -0800 (PST)
Date: Tue, 3 Dec 2024 13:01:16 +0530
From: Dhruv Menon <dhruvmenon1104@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>
Cc: vigneshr@ti.com, andi.shyti@kernel.org, jmkrzyszt@gmail.com,
	tony@atomide.com, andreas@kemnade.info, khilman@baylibre.com,
	rogerq@kernel.org, linux-omap@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] i2c: omap: Cleaned up coding style and parameters
Message-ID: <Z06zxM3pREgrOvQA@melbuntu>
References: <Z04CA8fGCC-nyZIY@melbuntu>
 <Z04faeJUgZTydiMb@darkstar.musicnaut.iki.fi>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="1iVO1zdvjrUi1aXo"
Content-Disposition: inline
In-Reply-To: <Z04faeJUgZTydiMb@darkstar.musicnaut.iki.fi>


--1iVO1zdvjrUi1aXo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hello Aaro,	

I have updated the patch as requiested, splitting it two parts,

	1. [PATCH v2 1/2] i2c: omap: Cleaned up coding style
	2. [PATCH v2 2/2] i2c: omap: Removed unsed parameter

I have also removed the changes regarding msleep as the adjustment
was relatively minor. The change was initially considered based 
on "Timer's howto" documentation which recommends to change any
msleep(x) < 10ms to usleep_range(x*1000, x*2000) for better 
precision.

Thank you for the time and review. I look forward to your feedback

Regards
Dhruv Menon

On Mon, Dec 02, 2024 at 10:58:17PM +0200, Aaro Koskinen wrote:
> On Tue, Dec 03, 2024 at 12:22:51AM +0530, Dhruv Menon wrote:
> > This commit addresses the coding style issues present in i2c-omap.c,
> > identified by checkpatch.pl and removes unused parameters present in
> > two functions.
> > 
> > 1. Coding style issues includes Macro Utilization, alignnment
> >    correction, updating ms_sleep() < 20 to usleep_range().
> > 2. Removed unused parameters from omap_i2c_receive_data()
> >    and omap_i2c_transmit_data().
> > 
> > No functional changes have been introduced in this commit.
> 
> Not sure if that is correct as sleeps can be now shorter? I wouldn't
> touch them unless you can show some real benefit (checkpatch.pl warning
> isn't one for old driver code).
> 
> Maybe also changes should be split into separate patches for easier
> review.
> 
> A.
> 
> > 
> > Signed-off-by: Dhruv Menon <dhruvmenon1104@gmail.com>
> > ---
> >  drivers/i2c/busses/i2c-omap.c | 209 ++++++++++++++++------------------
> >  1 file changed, 101 insertions(+), 108 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
> > index 1d9ad25c89ae..eee1671edebd 100644
> > --- a/drivers/i2c/busses/i2c-omap.c
> > +++ b/drivers/i2c/busses/i2c-omap.c
> > @@ -78,39 +78,39 @@ enum {
> >  };
> >  
> >  /* I2C Interrupt Enable Register (OMAP_I2C_IE): */
> > -#define OMAP_I2C_IE_XDR		(1 << 14)	/* TX Buffer drain int enable */
> > -#define OMAP_I2C_IE_RDR		(1 << 13)	/* RX Buffer drain int enable */
> > -#define OMAP_I2C_IE_XRDY	(1 << 4)	/* TX data ready int enable */
> > -#define OMAP_I2C_IE_RRDY	(1 << 3)	/* RX data ready int enable */
> > -#define OMAP_I2C_IE_ARDY	(1 << 2)	/* Access ready int enable */
> > -#define OMAP_I2C_IE_NACK	(1 << 1)	/* No ack interrupt enable */
> > -#define OMAP_I2C_IE_AL		(1 << 0)	/* Arbitration lost int ena */
> > +#define OMAP_I2C_IE_XDR		BIT(14)	/* TX Buffer drain int enable */
> > +#define OMAP_I2C_IE_RDR		BIT(13)	/* RX Buffer drain int enable */
> > +#define OMAP_I2C_IE_XRDY	BIT(4)	/* TX data ready int enable */
> > +#define OMAP_I2C_IE_RRDY	BIT(3)	/* RX data ready int enable */
> > +#define OMAP_I2C_IE_ARDY	BIT(2)	/* Access ready int enable */
> > +#define OMAP_I2C_IE_NACK	BIT(1)	/* No ack interrupt enable */
> > +#define OMAP_I2C_IE_AL		BIT(0)	/* Arbitration lost int ena */
> >  
> >  /* I2C Status Register (OMAP_I2C_STAT): */
> > -#define OMAP_I2C_STAT_XDR	(1 << 14)	/* TX Buffer draining */
> > -#define OMAP_I2C_STAT_RDR	(1 << 13)	/* RX Buffer draining */
> > -#define OMAP_I2C_STAT_BB	(1 << 12)	/* Bus busy */
> > -#define OMAP_I2C_STAT_ROVR	(1 << 11)	/* Receive overrun */
> > -#define OMAP_I2C_STAT_XUDF	(1 << 10)	/* Transmit underflow */
> > -#define OMAP_I2C_STAT_AAS	(1 << 9)	/* Address as slave */
> > -#define OMAP_I2C_STAT_BF	(1 << 8)	/* Bus Free */
> > -#define OMAP_I2C_STAT_XRDY	(1 << 4)	/* Transmit data ready */
> > -#define OMAP_I2C_STAT_RRDY	(1 << 3)	/* Receive data ready */
> > -#define OMAP_I2C_STAT_ARDY	(1 << 2)	/* Register access ready */
> > -#define OMAP_I2C_STAT_NACK	(1 << 1)	/* No ack interrupt enable */
> > -#define OMAP_I2C_STAT_AL	(1 << 0)	/* Arbitration lost int ena */
> > +#define OMAP_I2C_STAT_XDR	BIT(14)	/* TX Buffer draining */
> > +#define OMAP_I2C_STAT_RDR	BIT(13)	/* RX Buffer draining */
> > +#define OMAP_I2C_STAT_BB	BIT(12)	/* Bus busy */
> > +#define OMAP_I2C_STAT_ROVR	BIT(11)	/* Receive overrun */
> > +#define OMAP_I2C_STAT_XUDF	BIT(10)	/* Transmit underflow */
> > +#define OMAP_I2C_STAT_AAS	BIT(9)	/* Address as slave */
> > +#define OMAP_I2C_STAT_BF	BIT(8)	/* Bus Free */
> > +#define OMAP_I2C_STAT_XRDY	BIT(4)	/* Transmit data ready */
> > +#define OMAP_I2C_STAT_RRDY	BIT(3)	/* Receive data ready */
> > +#define OMAP_I2C_STAT_ARDY	BIT(2)	/* Register access ready */
> > +#define OMAP_I2C_STAT_NACK	BIT(1)	/* No ack interrupt enable */
> > +#define OMAP_I2C_STAT_AL	BIT(0)	/* Arbitration lost int ena */
> >  
> >  /* I2C WE wakeup enable register */
> > -#define OMAP_I2C_WE_XDR_WE	(1 << 14)	/* TX drain wakup */
> > -#define OMAP_I2C_WE_RDR_WE	(1 << 13)	/* RX drain wakeup */
> > -#define OMAP_I2C_WE_AAS_WE	(1 << 9)	/* Address as slave wakeup*/
> > -#define OMAP_I2C_WE_BF_WE	(1 << 8)	/* Bus free wakeup */
> > -#define OMAP_I2C_WE_STC_WE	(1 << 6)	/* Start condition wakeup */
> > -#define OMAP_I2C_WE_GC_WE	(1 << 5)	/* General call wakeup */
> > -#define OMAP_I2C_WE_DRDY_WE	(1 << 3)	/* TX/RX data ready wakeup */
> > -#define OMAP_I2C_WE_ARDY_WE	(1 << 2)	/* Reg access ready wakeup */
> > -#define OMAP_I2C_WE_NACK_WE	(1 << 1)	/* No acknowledgment wakeup */
> > -#define OMAP_I2C_WE_AL_WE	(1 << 0)	/* Arbitration lost wakeup */
> > +#define OMAP_I2C_WE_XDR_WE	BIT(14)	/* TX drain wakup */
> > +#define OMAP_I2C_WE_RDR_WE	BIT(13)	/* RX drain wakeup */
> > +#define OMAP_I2C_WE_AAS_WE	BIT(9)	/* Address as slave wakeup*/
> > +#define OMAP_I2C_WE_BF_WE	BIT(8)	/* Bus free wakeup */
> > +#define OMAP_I2C_WE_STC_WE	BIT(6)	/* Start condition wakeup */
> > +#define OMAP_I2C_WE_GC_WE	BIT(5)	/* General call wakeup */
> > +#define OMAP_I2C_WE_DRDY_WE	BIT(3)	/* TX/RX data ready wakeup */
> > +#define OMAP_I2C_WE_ARDY_WE	BIT(2)	/* Reg access ready wakeup */
> > +#define OMAP_I2C_WE_NACK_WE	BIT(1)	/* No acknowledgment wakeup */
> > +#define OMAP_I2C_WE_AL_WE	BIT(0)	/* Arbitration lost wakeup */
> >  
> >  #define OMAP_I2C_WE_ALL		(OMAP_I2C_WE_XDR_WE | OMAP_I2C_WE_RDR_WE | \
> >  				OMAP_I2C_WE_AAS_WE | OMAP_I2C_WE_BF_WE | \
> > @@ -119,59 +119,59 @@ enum {
> >  				OMAP_I2C_WE_NACK_WE | OMAP_I2C_WE_AL_WE)
> >  
> >  /* I2C Buffer Configuration Register (OMAP_I2C_BUF): */
> > -#define OMAP_I2C_BUF_RDMA_EN	(1 << 15)	/* RX DMA channel enable */
> > -#define OMAP_I2C_BUF_RXFIF_CLR	(1 << 14)	/* RX FIFO Clear */
> > -#define OMAP_I2C_BUF_XDMA_EN	(1 << 7)	/* TX DMA channel enable */
> > -#define OMAP_I2C_BUF_TXFIF_CLR	(1 << 6)	/* TX FIFO Clear */
> > +#define OMAP_I2C_BUF_RDMA_EN	BIT(15)	/* RX DMA channel enable */
> > +#define OMAP_I2C_BUF_RXFIF_CLR	BIT(14)	/* RX FIFO Clear */
> > +#define OMAP_I2C_BUF_XDMA_EN	BIT(7)	/* TX DMA channel enable */
> > +#define OMAP_I2C_BUF_TXFIF_CLR	BIT(6)	/* TX FIFO Clear */
> >  
> >  /* I2C Configuration Register (OMAP_I2C_CON): */
> > -#define OMAP_I2C_CON_EN		(1 << 15)	/* I2C module enable */
> > -#define OMAP_I2C_CON_BE		(1 << 14)	/* Big endian mode */
> > -#define OMAP_I2C_CON_OPMODE_HS	(1 << 12)	/* High Speed support */
> > -#define OMAP_I2C_CON_STB	(1 << 11)	/* Start byte mode (master) */
> > -#define OMAP_I2C_CON_MST	(1 << 10)	/* Master/slave mode */
> > -#define OMAP_I2C_CON_TRX	(1 << 9)	/* TX/RX mode (master only) */
> > -#define OMAP_I2C_CON_XA		(1 << 8)	/* Expand address */
> > -#define OMAP_I2C_CON_RM		(1 << 2)	/* Repeat mode (master only) */
> > -#define OMAP_I2C_CON_STP	(1 << 1)	/* Stop cond (master only) */
> > -#define OMAP_I2C_CON_STT	(1 << 0)	/* Start condition (master) */
> > +#define OMAP_I2C_CON_EN		BIT(15)	/* I2C module enable */
> > +#define OMAP_I2C_CON_BE		BIT(14)	/* Big endian mode */
> > +#define OMAP_I2C_CON_OPMODE_HS	BIT(12)	/* High Speed support */
> > +#define OMAP_I2C_CON_STB	BIT(11)	/* Start byte mode (master) */
> > +#define OMAP_I2C_CON_MST	BIT(10)	/* Master/slave mode */
> > +#define OMAP_I2C_CON_TRX	BIT(9)	/* TX/RX mode (master only) */
> > +#define OMAP_I2C_CON_XA		BIT(8)	/* Expand address */
> > +#define OMAP_I2C_CON_RM		BIT(2)	/* Repeat mode (master only) */
> > +#define OMAP_I2C_CON_STP	BIT(1)	/* Stop cond (master only) */
> > +#define OMAP_I2C_CON_STT	BIT(0)	/* Start condition (master) */
> >  
> >  /* I2C SCL time value when Master */
> >  #define OMAP_I2C_SCLL_HSSCLL	8
> >  #define OMAP_I2C_SCLH_HSSCLH	8
> >  
> >  /* I2C System Test Register (OMAP_I2C_SYSTEST): */
> > -#define OMAP_I2C_SYSTEST_ST_EN		(1 << 15)	/* System test enable */
> > -#define OMAP_I2C_SYSTEST_FREE		(1 << 14)	/* Free running mode */
> > -#define OMAP_I2C_SYSTEST_TMODE_MASK	(3 << 12)	/* Test mode select */
> > -#define OMAP_I2C_SYSTEST_TMODE_SHIFT	(12)		/* Test mode select */
> > +#define OMAP_I2C_SYSTEST_ST_EN		BIT(15)	/* System test enable */
> > +#define OMAP_I2C_SYSTEST_FREE		BIT(14)	/* Free running mode */
> > +#define OMAP_I2C_SYSTEST_TMODE_MASK	GENMASK(13, 12)	/* Test mode select */
> > +#define OMAP_I2C_SYSTEST_TMODE_SHIFT	(12)	/* Test mode select */
> >  /* Functional mode */
> > -#define OMAP_I2C_SYSTEST_SCL_I_FUNC	(1 << 8)	/* SCL line input value */
> > -#define OMAP_I2C_SYSTEST_SCL_O_FUNC	(1 << 7)	/* SCL line output value */
> > -#define OMAP_I2C_SYSTEST_SDA_I_FUNC	(1 << 6)	/* SDA line input value */
> > -#define OMAP_I2C_SYSTEST_SDA_O_FUNC	(1 << 5)	/* SDA line output value */
> > +#define OMAP_I2C_SYSTEST_SCL_I_FUNC	BIT(8)	/* SCL line input value */
> > +#define OMAP_I2C_SYSTEST_SCL_O_FUNC	BIT(7)	/* SCL line output value */
> > +#define OMAP_I2C_SYSTEST_SDA_I_FUNC	BIT(6)	/* SDA line input value */
> > +#define OMAP_I2C_SYSTEST_SDA_O_FUNC	BIT(5)	/* SDA line output value */
> >  /* SDA/SCL IO mode */
> > -#define OMAP_I2C_SYSTEST_SCL_I		(1 << 3)	/* SCL line sense in */
> > -#define OMAP_I2C_SYSTEST_SCL_O		(1 << 2)	/* SCL line drive out */
> > -#define OMAP_I2C_SYSTEST_SDA_I		(1 << 1)	/* SDA line sense in */
> > -#define OMAP_I2C_SYSTEST_SDA_O		(1 << 0)	/* SDA line drive out */
> > +#define OMAP_I2C_SYSTEST_SCL_I		BIT(3)	/* SCL line sense in */
> > +#define OMAP_I2C_SYSTEST_SCL_O		BIT(2)	/* SCL line drive out */
> > +#define OMAP_I2C_SYSTEST_SDA_I		BIT(1)	/* SDA line sense in */
> > +#define OMAP_I2C_SYSTEST_SDA_O		BIT(0)	/* SDA line drive out */
> >  
> >  /* OCP_SYSSTATUS bit definitions */
> > -#define SYSS_RESETDONE_MASK		(1 << 0)
> > +#define SYSS_RESETDONE_MASK		BIT(0)
> >  
> >  /* OCP_SYSCONFIG bit definitions */
> > -#define SYSC_CLOCKACTIVITY_MASK		(0x3 << 8)
> > -#define SYSC_SIDLEMODE_MASK		(0x3 << 3)
> > -#define SYSC_ENAWAKEUP_MASK		(1 << 2)
> > -#define SYSC_SOFTRESET_MASK		(1 << 1)
> > -#define SYSC_AUTOIDLE_MASK		(1 << 0)
> > +#define SYSC_CLOCKACTIVITY_MASK		GENMASK(9, 8)
> > +#define SYSC_SIDLEMODE_MASK		GENMASK(4, 3)
> > +#define SYSC_ENAWAKEUP_MASK		BIT(2)
> > +#define SYSC_SOFTRESET_MASK		BIT(1)
> > +#define SYSC_AUTOIDLE_MASK		BIT(0)
> >  
> >  #define SYSC_IDLEMODE_SMART		0x2
> >  #define SYSC_CLOCKACTIVITY_FCLK		0x2
> >  
> >  /* Errata definitions */
> > -#define I2C_OMAP_ERRATA_I207		(1 << 0)
> > -#define I2C_OMAP_ERRATA_I462		(1 << 1)
> > +#define I2C_OMAP_ERRATA_I207		BIT(0)
> > +#define I2C_OMAP_ERRATA_I462		BIT(1)
> >  
> >  #define OMAP_I2C_IP_V2_INTERRUPTS_MASK	0x6FFF
> >  
> > @@ -277,7 +277,6 @@ static inline u16 omap_i2c_read_reg(struct omap_i2c_dev *omap, int reg)
> >  
> >  static void __omap_i2c_init(struct omap_i2c_dev *omap)
> >  {
> > -
> >  	omap_i2c_write_reg(omap, OMAP_I2C_CON_REG, 0);
> >  
> >  	/* Setup clock prescaler to obtain approx 12MHz I2C module clock: */
> > @@ -316,22 +315,22 @@ static int omap_i2c_reset(struct omap_i2c_dev *omap)
> >  
> >  		/* Disable I2C controller before soft reset */
> >  		omap_i2c_write_reg(omap, OMAP_I2C_CON_REG,
> > -			omap_i2c_read_reg(omap, OMAP_I2C_CON_REG) &
> > -				~(OMAP_I2C_CON_EN));
> > +				   omap_i2c_read_reg(omap, OMAP_I2C_CON_REG) &
> > +		~(OMAP_I2C_CON_EN));
> >  
> >  		omap_i2c_write_reg(omap, OMAP_I2C_SYSC_REG, SYSC_SOFTRESET_MASK);
> >  		/* For some reason we need to set the EN bit before the
> > -		 * reset done bit gets set. */
> > +		 * reset done bit gets set.
> > +		 */
> >  		timeout = jiffies + OMAP_I2C_TIMEOUT;
> >  		omap_i2c_write_reg(omap, OMAP_I2C_CON_REG, OMAP_I2C_CON_EN);
> >  		while (!(omap_i2c_read_reg(omap, OMAP_I2C_SYSS_REG) &
> >  			 SYSS_RESETDONE_MASK)) {
> >  			if (time_after(jiffies, timeout)) {
> > -				dev_warn(omap->dev, "timeout waiting "
> > -						"for controller reset\n");
> > +				dev_warn(omap->dev, "timeout waiting for controller reset\n");
> >  				return -ETIMEDOUT;
> >  			}
> > -			msleep(1);
> > +			usleep_range(1000, 2000);
> >  		}
> >  
> >  		/* SYSC register is cleared by the reset; rewrite it */
> > @@ -396,15 +395,13 @@ static int omap_i2c_init(struct omap_i2c_dev *omap)
> >  	}
> >  
> >  	if (!(omap->flags & OMAP_I2C_FLAG_SIMPLE_CLOCK)) {
> > -
> >  		/*
> >  		 * HSI2C controller internal clk rate should be 19.2 Mhz for
> >  		 * HS and for all modes on 2430. On 34xx we can use lower rate
> >  		 * to get longer filter period for better noise suppression.
> >  		 * The filter is iclk (fclk for HS) period.
> >  		 */
> > -		if (omap->speed > 400 ||
> > -			       omap->flags & OMAP_I2C_FLAG_FORCE_19200_INT_CLK)
> > +		if (omap->speed > 400 || omap->flags & OMAP_I2C_FLAG_FORCE_19200_INT_CLK)
> >  			internal_clk = 19200;
> >  		else if (omap->speed > 100)
> >  			internal_clk = 9600;
> > @@ -506,7 +503,7 @@ static int omap_i2c_wait_for_bb(struct omap_i2c_dev *omap)
> >  	while (omap_i2c_read_reg(omap, OMAP_I2C_STAT_REG) & OMAP_I2C_STAT_BB) {
> >  		if (time_after(jiffies, timeout))
> >  			return omap_i2c_recover_bus(omap);
> > -		msleep(1);
> > +		usleep_range(1000, 2000);
> >  	}
> >  
> >  	return 0;
> > @@ -595,7 +592,7 @@ static int omap_i2c_wait_for_bb_valid(struct omap_i2c_dev *omap)
> >  			return omap_i2c_recover_bus(omap);
> >  		}
> >  
> > -		msleep(1);
> > +		usleep_range(1000, 2000);
> >  	}
> >  
> >  	omap->bb_valid = 1;
> > @@ -616,7 +613,7 @@ static void omap_i2c_resize_fifo(struct omap_i2c_dev *omap, u8 size, bool is_rx)
> >  	 * then we might use draining feature to transfer the remaining bytes.
> >  	 */
> >  
> > -	omap->threshold = clamp(size, (u8) 1, omap->fifo_size);
> > +	omap->threshold = clamp(size, (u8)1, omap->fifo_size);
> >  
> >  	buf = omap_i2c_read_reg(omap, OMAP_I2C_BUF_REG);
> >  
> > @@ -636,7 +633,7 @@ static void omap_i2c_resize_fifo(struct omap_i2c_dev *omap, u8 size, bool is_rx)
> >  		omap->b_hw = 1; /* Enable hardware fixes */
> >  
> >  	/* calculate wakeup latency constraint for MPU */
> > -	if (omap->set_mpu_wkup_lat != NULL)
> > +	if (omap->set_mpu_wkup_lat)
> >  		omap->latency = (1000000 * omap->threshold) /
> >  			(1000 * omap->speed / 8);
> >  }
> > @@ -718,13 +715,13 @@ static int omap_i2c_xfer_msg(struct i2c_adapter *adap,
> >  	if (omap->b_hw && stop) {
> >  		unsigned long delay = jiffies + OMAP_I2C_TIMEOUT;
> >  		u16 con = omap_i2c_read_reg(omap, OMAP_I2C_CON_REG);
> > +
> >  		while (con & OMAP_I2C_CON_STT) {
> >  			con = omap_i2c_read_reg(omap, OMAP_I2C_CON_REG);
> >  
> >  			/* Let the user know if i2c is in a bad state */
> >  			if (time_after(jiffies, delay)) {
> > -				dev_err(omap->dev, "controller timed out "
> > -				"waiting for start condition to finish\n");
> > +				dev_err(omap->dev, "controller timed out waiting for start condition to finish\n");
> >  				return -ETIMEDOUT;
> >  			}
> >  			cpu_relax();
> > @@ -782,7 +779,6 @@ static int omap_i2c_xfer_msg(struct i2c_adapter *adap,
> >  	return -EIO;
> >  }
> >  
> > -
> >  /*
> >   * Prepare controller for a transaction and call omap_i2c_xfer_msg
> >   * to do the work during IRQ processing.
> > @@ -807,7 +803,7 @@ omap_i2c_xfer_common(struct i2c_adapter *adap, struct i2c_msg msgs[], int num,
> >  	if (r < 0)
> >  		goto out;
> >  
> > -	if (omap->set_mpu_wkup_lat != NULL)
> > +	if (omap->set_mpu_wkup_lat)
> >  		omap->set_mpu_wkup_lat(omap->dev, omap->latency);
> >  
> >  	for (i = 0; i < num; i++) {
> > @@ -822,7 +818,7 @@ omap_i2c_xfer_common(struct i2c_adapter *adap, struct i2c_msg msgs[], int num,
> >  
> >  	omap_i2c_wait_for_bb(omap);
> >  
> > -	if (omap->set_mpu_wkup_lat != NULL)
> > +	if (omap->set_mpu_wkup_lat)
> >  		omap->set_mpu_wkup_lat(omap->dev, -1);
> >  
> >  out:
> > @@ -875,18 +871,15 @@ static inline void i2c_omap_errata_i207(struct omap_i2c_dev *omap, u16 stat)
> >  	if (stat & OMAP_I2C_STAT_RDR) {
> >  		/* Step 1: If RDR is set, clear it */
> >  		omap_i2c_ack_stat(omap, OMAP_I2C_STAT_RDR);
> > -
> >  		/* Step 2: */
> >  		if (!(omap_i2c_read_reg(omap, OMAP_I2C_STAT_REG)
> >  						& OMAP_I2C_STAT_BB)) {
> > -
> >  			/* Step 3: */
> >  			if (omap_i2c_read_reg(omap, OMAP_I2C_STAT_REG)
> >  						& OMAP_I2C_STAT_RDR) {
> >  				omap_i2c_ack_stat(omap, OMAP_I2C_STAT_RDR);
> >  				dev_dbg(omap->dev, "RDR when bus is busy.\n");
> >  			}
> > -
> >  		}
> >  	}
> >  }
> > @@ -911,7 +904,7 @@ omap_i2c_omap1_isr(int this_irq, void *dev_id)
> >  		dev_err(omap->dev, "Arbitration lost\n");
> >  		omap_i2c_complete_cmd(omap, OMAP_I2C_STAT_AL);
> >  		break;
> > -	case 0x02:	/* No acknowledgement */
> > +	case 0x02:	/* No acknowledgment */
> >  		omap_i2c_complete_cmd(omap, OMAP_I2C_STAT_NACK);
> >  		omap_i2c_write_reg(omap, OMAP_I2C_CON_REG, OMAP_I2C_CON_STP);
> >  		break;
> > @@ -927,8 +920,9 @@ omap_i2c_omap1_isr(int this_irq, void *dev_id)
> >  				*omap->buf++ = w >> 8;
> >  				omap->buf_len--;
> >  			}
> > -		} else
> > +		} else {
> >  			dev_err(omap->dev, "RRDY IRQ while no data requested\n");
> > +		}
> >  		break;
> >  	case 0x05:	/* Transmit data ready */
> >  		if (omap->buf_len) {
> > @@ -939,8 +933,9 @@ omap_i2c_omap1_isr(int this_irq, void *dev_id)
> >  				omap->buf_len--;
> >  			}
> >  			omap_i2c_write_reg(omap, OMAP_I2C_DATA_REG, w);
> > -		} else
> > +		} else {
> >  			dev_err(omap->dev, "XRDY IRQ while no data to send\n");
> > +		}
> >  		break;
> >  	default:
> >  		return IRQ_NONE;
> > @@ -995,8 +990,7 @@ static int errata_omap3_i462(struct omap_i2c_dev *omap)
> >  	return 0;
> >  }
> >  
> > -static void omap_i2c_receive_data(struct omap_i2c_dev *omap, u8 num_bytes,
> > -		bool is_rdr)
> > +static void omap_i2c_receive_data(struct omap_i2c_dev *omap, u8 num_bytes)
> >  {
> >  	u16		w;
> >  
> > @@ -1016,8 +1010,7 @@ static void omap_i2c_receive_data(struct omap_i2c_dev *omap, u8 num_bytes,
> >  	}
> >  }
> >  
> > -static int omap_i2c_transmit_data(struct omap_i2c_dev *omap, u8 num_bytes,
> > -		bool is_xdr)
> > +static int omap_i2c_transmit_data(struct omap_i2c_dev *omap, u8 num_bytes)
> >  {
> >  	u16		w;
> >  
> > @@ -1133,7 +1126,7 @@ static int omap_i2c_xfer_data(struct omap_i2c_dev *omap)
> >  					OMAP_I2C_BUFSTAT_REG) >> 8) & 0x3F;
> >  			}
> >  
> > -			omap_i2c_receive_data(omap, num_bytes, true);
> > +			omap_i2c_receive_data(omap, num_bytes);
> >  			omap_i2c_ack_stat(omap, OMAP_I2C_STAT_RDR);
> >  			continue;
> >  		}
> > @@ -1144,7 +1137,7 @@ static int omap_i2c_xfer_data(struct omap_i2c_dev *omap)
> >  			if (omap->threshold)
> >  				num_bytes = omap->threshold;
> >  
> > -			omap_i2c_receive_data(omap, num_bytes, false);
> > +			omap_i2c_receive_data(omap, num_bytes);
> >  			omap_i2c_ack_stat(omap, OMAP_I2C_STAT_RRDY);
> >  			continue;
> >  		}
> > @@ -1156,7 +1149,7 @@ static int omap_i2c_xfer_data(struct omap_i2c_dev *omap)
> >  			if (omap->fifo_size)
> >  				num_bytes = omap->buf_len;
> >  
> > -			ret = omap_i2c_transmit_data(omap, num_bytes, true);
> > +			ret = omap_i2c_transmit_data(omap, num_bytes);
> >  			if (ret < 0)
> >  				break;
> >  
> > @@ -1171,7 +1164,7 @@ static int omap_i2c_xfer_data(struct omap_i2c_dev *omap)
> >  			if (omap->threshold)
> >  				num_bytes = omap->threshold;
> >  
> > -			ret = omap_i2c_transmit_data(omap, num_bytes, false);
> > +			ret = omap_i2c_transmit_data(omap, num_bytes);
> >  			if (ret < 0)
> >  				break;
> >  
> > @@ -1266,13 +1259,13 @@ static const struct of_device_id omap_i2c_of_match[] = {
> >  MODULE_DEVICE_TABLE(of, omap_i2c_of_match);
> >  #endif
> >  
> > -#define OMAP_I2C_SCHEME(rev)		((rev & 0xc000) >> 14)
> > +#define OMAP_I2C_SCHEME(rev)           (((rev) & 0xc000) >> 14)
> >  
> > -#define OMAP_I2C_REV_SCHEME_0_MAJOR(rev) (rev >> 4)
> > -#define OMAP_I2C_REV_SCHEME_0_MINOR(rev) (rev & 0xf)
> > +#define OMAP_I2C_REV_SCHEME_0_MAJOR(rev) (((rev) >> 4))
> > +#define OMAP_I2C_REV_SCHEME_0_MINOR(rev) (((rev) & 0xf))
> >  
> > -#define OMAP_I2C_REV_SCHEME_1_MAJOR(rev) ((rev & 0x0700) >> 7)
> > -#define OMAP_I2C_REV_SCHEME_1_MINOR(rev) (rev & 0x1f)
> > +#define OMAP_I2C_REV_SCHEME_1_MAJOR(rev) (((rev) & 0x0700) >> 7)
> > +#define OMAP_I2C_REV_SCHEME_1_MINOR(rev) (((rev) & 0x1f))
> >  #define OMAP_I2C_SCHEME_0		0
> >  #define OMAP_I2C_SCHEME_1		1
> >  
> > @@ -1383,7 +1376,7 @@ omap_i2c_probe(struct platform_device *pdev)
> >  		of_property_read_u32(node, "clock-frequency", &freq);
> >  		/* convert DT freq value in Hz into kHz for speed */
> >  		omap->speed = freq / 1000;
> > -	} else if (pdata != NULL) {
> > +	} else if (pdata) {
> >  		omap->speed = pdata->clkrate;
> >  		omap->flags = pdata->flags;
> >  		omap->set_mpu_wkup_lat = pdata->set_mpu_wkup_lat;
> > @@ -1434,7 +1427,7 @@ omap_i2c_probe(struct platform_device *pdev)
> >  	omap->errata = 0;
> >  
> >  	if (omap->rev >= OMAP_I2C_REV_ON_2430 &&
> > -			omap->rev < OMAP_I2C_REV_ON_4430_PLUS)
> > +	    omap->rev < OMAP_I2C_REV_ON_4430_PLUS)
> >  		omap->errata |= I2C_OMAP_ERRATA_I207;
> >  
> >  	if (omap->rev <= OMAP_I2C_REV_ON_3430_3530)
> > @@ -1459,7 +1452,7 @@ omap_i2c_probe(struct platform_device *pdev)
> >  			omap->b_hw = 1; /* Enable hardware fixes */
> >  
> >  		/* calculate wakeup latency constraint for MPU */
> > -		if (omap->set_mpu_wkup_lat != NULL)
> > +		if (omap->set_mpu_wkup_lat)
> >  			omap->latency = (1000000 * omap->fifo_size) /
> >  				       (1000 * omap->speed / 8);
> >  	}
> > @@ -1469,12 +1462,12 @@ omap_i2c_probe(struct platform_device *pdev)
> >  
> >  	if (omap->rev < OMAP_I2C_OMAP1_REV_2)
> >  		r = devm_request_irq(&pdev->dev, omap->irq, omap_i2c_omap1_isr,
> > -				IRQF_NO_SUSPEND, pdev->name, omap);
> > +				     IRQF_NO_SUSPEND, pdev->name, omap);
> >  	else
> >  		r = devm_request_threaded_irq(&pdev->dev, omap->irq,
> > -				omap_i2c_isr, omap_i2c_isr_thread,
> > -				IRQF_NO_SUSPEND | IRQF_ONESHOT,
> > -				pdev->name, omap);
> > +					      omap_i2c_isr, omap_i2c_isr_thread,
> > +							IRQF_NO_SUSPEND | IRQF_ONESHOT,
> > +							pdev->name, omap);
> >  
> >  	if (r) {
> >  		dev_err(omap->dev, "failure requesting irq %i\n", omap->irq);
> > -- 
> > 2.43.0
> > 
> > 

--1iVO1zdvjrUi1aXo
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment; filename="0000-cover-letter.patch"

From 39d6a5d0a065b0302d671eaa215fd952b69b1124 Mon Sep 17 00:00:00 2001
Message-ID: <cover.1733207006.git.dhruvmenon1104@gmail.com>
From: Dhruv Menon <dhruvmenon1104@gmail.com>
Date: Tue, 3 Dec 2024 11:53:26 +0530
Subject: [PATCH v2 0/2] i2c: omap: Refactored coding style

*** BLURB HERE ***

This patch series splits the original patch into multiple parts for 
better readability as per the suggestion from Aaro Koskinen. It 
refactors the coding style of the i2c-omap driver from checkpatch 
complains and removes few unused parameter present in the 
driver.

Changes in v2:
  1. Split the original patch into two parts for better readability
  2. removed the patch for changing msleep() to usleep_range().

Dhruv Menon (2):
  i2c: omap: Cleaned up coding style
  i2c: omap: remove unused parameter

 drivers/i2c/busses/i2c-omap.c | 203 ++++++++++++++++------------------
 1 file changed, 98 insertions(+), 105 deletions(-)


-- 
2.43.0


--1iVO1zdvjrUi1aXo
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0001-i2c-omap-Cleaned-up-coding-style.patch"

From 2f30d2cc271cf47044d1925314dcf381246bea04 Mon Sep 17 00:00:00 2001
Message-ID: <2f30d2cc271cf47044d1925314dcf381246bea04.1733207006.git.dhruvmenon1104@gmail.com>
In-Reply-To: <cover.1733207006.git.dhruvmenon1104@gmail.com>
References: <cover.1733207006.git.dhruvmenon1104@gmail.com>
From: Dhruv Menon <dhruvmenon1104@gmail.com>
Date: Tue, 3 Dec 2024 10:23:54 +0530
Subject: [PATCH v2 1/2] i2c: omap: Cleaned up coding style

This commit addresses the coding style issues present in i2c-omap.c,
identified by checkpatch.pl.

1. BIT Macros utilization
2. Spelling correction
3. Alignment correction
4. unnecessary blank lines removal

No functional changes have been introduced in this commit.

Signed-off-by: Dhruv Menon <dhruvmenon1104@gmail.com>
---
 drivers/i2c/busses/i2c-omap.c | 189 +++++++++++++++++-----------------
 1 file changed, 92 insertions(+), 97 deletions(-)

diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index 1d9ad25c89ae..df945ddfe089 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -78,39 +78,39 @@ enum {
 };
 
 /* I2C Interrupt Enable Register (OMAP_I2C_IE): */
-#define OMAP_I2C_IE_XDR		(1 << 14)	/* TX Buffer drain int enable */
-#define OMAP_I2C_IE_RDR		(1 << 13)	/* RX Buffer drain int enable */
-#define OMAP_I2C_IE_XRDY	(1 << 4)	/* TX data ready int enable */
-#define OMAP_I2C_IE_RRDY	(1 << 3)	/* RX data ready int enable */
-#define OMAP_I2C_IE_ARDY	(1 << 2)	/* Access ready int enable */
-#define OMAP_I2C_IE_NACK	(1 << 1)	/* No ack interrupt enable */
-#define OMAP_I2C_IE_AL		(1 << 0)	/* Arbitration lost int ena */
+#define OMAP_I2C_IE_XDR		BIT(14)	/* TX Buffer drain int enable */
+#define OMAP_I2C_IE_RDR		BIT(13)	/* RX Buffer drain int enable */
+#define OMAP_I2C_IE_XRDY	BIT(4)	/* TX data ready int enable */
+#define OMAP_I2C_IE_RRDY	BIT(3)	/* RX data ready int enable */
+#define OMAP_I2C_IE_ARDY	BIT(2)	/* Access ready int enable */
+#define OMAP_I2C_IE_NACK	BIT(1)	/* No ack interrupt enable */
+#define OMAP_I2C_IE_AL		BIT(0)	/* Arbitration lost int ena */
 
 /* I2C Status Register (OMAP_I2C_STAT): */
-#define OMAP_I2C_STAT_XDR	(1 << 14)	/* TX Buffer draining */
-#define OMAP_I2C_STAT_RDR	(1 << 13)	/* RX Buffer draining */
-#define OMAP_I2C_STAT_BB	(1 << 12)	/* Bus busy */
-#define OMAP_I2C_STAT_ROVR	(1 << 11)	/* Receive overrun */
-#define OMAP_I2C_STAT_XUDF	(1 << 10)	/* Transmit underflow */
-#define OMAP_I2C_STAT_AAS	(1 << 9)	/* Address as slave */
-#define OMAP_I2C_STAT_BF	(1 << 8)	/* Bus Free */
-#define OMAP_I2C_STAT_XRDY	(1 << 4)	/* Transmit data ready */
-#define OMAP_I2C_STAT_RRDY	(1 << 3)	/* Receive data ready */
-#define OMAP_I2C_STAT_ARDY	(1 << 2)	/* Register access ready */
-#define OMAP_I2C_STAT_NACK	(1 << 1)	/* No ack interrupt enable */
-#define OMAP_I2C_STAT_AL	(1 << 0)	/* Arbitration lost int ena */
+#define OMAP_I2C_STAT_XDR	BIT(14)	/* TX Buffer draining */
+#define OMAP_I2C_STAT_RDR	BIT(13)	/* RX Buffer draining */
+#define OMAP_I2C_STAT_BB	BIT(12)	/* Bus busy */
+#define OMAP_I2C_STAT_ROVR	BIT(11)	/* Receive overrun */
+#define OMAP_I2C_STAT_XUDF	BIT(10)	/* Transmit underflow */
+#define OMAP_I2C_STAT_AAS	BIT(9)	/* Address as slave */
+#define OMAP_I2C_STAT_BF	BIT(8)	/* Bus Free */
+#define OMAP_I2C_STAT_XRDY	BIT(4)	/* Transmit data ready */
+#define OMAP_I2C_STAT_RRDY	BIT(3)	/* Receive data ready */
+#define OMAP_I2C_STAT_ARDY	BIT(2)	/* Register access ready */
+#define OMAP_I2C_STAT_NACK	BIT(1)	/* No ack interrupt enable */
+#define OMAP_I2C_STAT_AL	BIT(0)	/* Arbitration lost int ena */
 
 /* I2C WE wakeup enable register */
-#define OMAP_I2C_WE_XDR_WE	(1 << 14)	/* TX drain wakup */
-#define OMAP_I2C_WE_RDR_WE	(1 << 13)	/* RX drain wakeup */
-#define OMAP_I2C_WE_AAS_WE	(1 << 9)	/* Address as slave wakeup*/
-#define OMAP_I2C_WE_BF_WE	(1 << 8)	/* Bus free wakeup */
-#define OMAP_I2C_WE_STC_WE	(1 << 6)	/* Start condition wakeup */
-#define OMAP_I2C_WE_GC_WE	(1 << 5)	/* General call wakeup */
-#define OMAP_I2C_WE_DRDY_WE	(1 << 3)	/* TX/RX data ready wakeup */
-#define OMAP_I2C_WE_ARDY_WE	(1 << 2)	/* Reg access ready wakeup */
-#define OMAP_I2C_WE_NACK_WE	(1 << 1)	/* No acknowledgment wakeup */
-#define OMAP_I2C_WE_AL_WE	(1 << 0)	/* Arbitration lost wakeup */
+#define OMAP_I2C_WE_XDR_WE	BIT(14)	/* TX drain wakup */
+#define OMAP_I2C_WE_RDR_WE	BIT(13)	/* RX drain wakeup */
+#define OMAP_I2C_WE_AAS_WE	BIT(9)	/* Address as slave wakeup*/
+#define OMAP_I2C_WE_BF_WE	BIT(8)	/* Bus free wakeup */
+#define OMAP_I2C_WE_STC_WE	BIT(6)	/* Start condition wakeup */
+#define OMAP_I2C_WE_GC_WE	BIT(5)	/* General call wakeup */
+#define OMAP_I2C_WE_DRDY_WE	BIT(3)	/* TX/RX data ready wakeup */
+#define OMAP_I2C_WE_ARDY_WE	BIT(2)	/* Reg access ready wakeup */
+#define OMAP_I2C_WE_NACK_WE	BIT(1)	/* No acknowledgment wakeup */
+#define OMAP_I2C_WE_AL_WE	BIT(0)	/* Arbitration lost wakeup */
 
 #define OMAP_I2C_WE_ALL		(OMAP_I2C_WE_XDR_WE | OMAP_I2C_WE_RDR_WE | \
 				OMAP_I2C_WE_AAS_WE | OMAP_I2C_WE_BF_WE | \
@@ -119,59 +119,59 @@ enum {
 				OMAP_I2C_WE_NACK_WE | OMAP_I2C_WE_AL_WE)
 
 /* I2C Buffer Configuration Register (OMAP_I2C_BUF): */
-#define OMAP_I2C_BUF_RDMA_EN	(1 << 15)	/* RX DMA channel enable */
-#define OMAP_I2C_BUF_RXFIF_CLR	(1 << 14)	/* RX FIFO Clear */
-#define OMAP_I2C_BUF_XDMA_EN	(1 << 7)	/* TX DMA channel enable */
-#define OMAP_I2C_BUF_TXFIF_CLR	(1 << 6)	/* TX FIFO Clear */
+#define OMAP_I2C_BUF_RDMA_EN	BIT(15)	/* RX DMA channel enable */
+#define OMAP_I2C_BUF_RXFIF_CLR	BIT(14)	/* RX FIFO Clear */
+#define OMAP_I2C_BUF_XDMA_EN	BIT(7)	/* TX DMA channel enable */
+#define OMAP_I2C_BUF_TXFIF_CLR	BIT(6)	/* TX FIFO Clear */
 
 /* I2C Configuration Register (OMAP_I2C_CON): */
-#define OMAP_I2C_CON_EN		(1 << 15)	/* I2C module enable */
-#define OMAP_I2C_CON_BE		(1 << 14)	/* Big endian mode */
-#define OMAP_I2C_CON_OPMODE_HS	(1 << 12)	/* High Speed support */
-#define OMAP_I2C_CON_STB	(1 << 11)	/* Start byte mode (master) */
-#define OMAP_I2C_CON_MST	(1 << 10)	/* Master/slave mode */
-#define OMAP_I2C_CON_TRX	(1 << 9)	/* TX/RX mode (master only) */
-#define OMAP_I2C_CON_XA		(1 << 8)	/* Expand address */
-#define OMAP_I2C_CON_RM		(1 << 2)	/* Repeat mode (master only) */
-#define OMAP_I2C_CON_STP	(1 << 1)	/* Stop cond (master only) */
-#define OMAP_I2C_CON_STT	(1 << 0)	/* Start condition (master) */
+#define OMAP_I2C_CON_EN		BIT(15)	/* I2C module enable */
+#define OMAP_I2C_CON_BE		BIT(14)	/* Big endian mode */
+#define OMAP_I2C_CON_OPMODE_HS	BIT(12)	/* High Speed support */
+#define OMAP_I2C_CON_STB	BIT(11)	/* Start byte mode (master) */
+#define OMAP_I2C_CON_MST	BIT(10)	/* Master/slave mode */
+#define OMAP_I2C_CON_TRX	BIT(9)	/* TX/RX mode (master only) */
+#define OMAP_I2C_CON_XA		BIT(8)	/* Expand address */
+#define OMAP_I2C_CON_RM		BIT(2)	/* Repeat mode (master only) */
+#define OMAP_I2C_CON_STP	BIT(1)	/* Stop cond (master only) */
+#define OMAP_I2C_CON_STT	BIT(0)	/* Start condition (master) */
 
 /* I2C SCL time value when Master */
 #define OMAP_I2C_SCLL_HSSCLL	8
 #define OMAP_I2C_SCLH_HSSCLH	8
 
 /* I2C System Test Register (OMAP_I2C_SYSTEST): */
-#define OMAP_I2C_SYSTEST_ST_EN		(1 << 15)	/* System test enable */
-#define OMAP_I2C_SYSTEST_FREE		(1 << 14)	/* Free running mode */
-#define OMAP_I2C_SYSTEST_TMODE_MASK	(3 << 12)	/* Test mode select */
-#define OMAP_I2C_SYSTEST_TMODE_SHIFT	(12)		/* Test mode select */
+#define OMAP_I2C_SYSTEST_ST_EN		BIT(15)	/* System test enable */
+#define OMAP_I2C_SYSTEST_FREE		BIT(14)	/* Free running mode */
+#define OMAP_I2C_SYSTEST_TMODE_MASK	GENMASK(13, 12)	/* Test mode select */
+#define OMAP_I2C_SYSTEST_TMODE_SHIFT	(12)	/* Test mode select */
 /* Functional mode */
-#define OMAP_I2C_SYSTEST_SCL_I_FUNC	(1 << 8)	/* SCL line input value */
-#define OMAP_I2C_SYSTEST_SCL_O_FUNC	(1 << 7)	/* SCL line output value */
-#define OMAP_I2C_SYSTEST_SDA_I_FUNC	(1 << 6)	/* SDA line input value */
-#define OMAP_I2C_SYSTEST_SDA_O_FUNC	(1 << 5)	/* SDA line output value */
+#define OMAP_I2C_SYSTEST_SCL_I_FUNC	BIT(8)	/* SCL line input value */
+#define OMAP_I2C_SYSTEST_SCL_O_FUNC	BIT(7)	/* SCL line output value */
+#define OMAP_I2C_SYSTEST_SDA_I_FUNC	BIT(6)	/* SDA line input value */
+#define OMAP_I2C_SYSTEST_SDA_O_FUNC	BIT(5)	/* SDA line output value */
 /* SDA/SCL IO mode */
-#define OMAP_I2C_SYSTEST_SCL_I		(1 << 3)	/* SCL line sense in */
-#define OMAP_I2C_SYSTEST_SCL_O		(1 << 2)	/* SCL line drive out */
-#define OMAP_I2C_SYSTEST_SDA_I		(1 << 1)	/* SDA line sense in */
-#define OMAP_I2C_SYSTEST_SDA_O		(1 << 0)	/* SDA line drive out */
+#define OMAP_I2C_SYSTEST_SCL_I		BIT(3)	/* SCL line sense in */
+#define OMAP_I2C_SYSTEST_SCL_O		BIT(2)	/* SCL line drive out */
+#define OMAP_I2C_SYSTEST_SDA_I		BIT(1)	/* SDA line sense in */
+#define OMAP_I2C_SYSTEST_SDA_O		BIT(0)	/* SDA line drive out */
 
 /* OCP_SYSSTATUS bit definitions */
-#define SYSS_RESETDONE_MASK		(1 << 0)
+#define SYSS_RESETDONE_MASK		BIT(0)
 
 /* OCP_SYSCONFIG bit definitions */
-#define SYSC_CLOCKACTIVITY_MASK		(0x3 << 8)
-#define SYSC_SIDLEMODE_MASK		(0x3 << 3)
-#define SYSC_ENAWAKEUP_MASK		(1 << 2)
-#define SYSC_SOFTRESET_MASK		(1 << 1)
-#define SYSC_AUTOIDLE_MASK		(1 << 0)
+#define SYSC_CLOCKACTIVITY_MASK		GENMASK(9, 8)
+#define SYSC_SIDLEMODE_MASK		GENMASK(4, 3)
+#define SYSC_ENAWAKEUP_MASK		BIT(2)
+#define SYSC_SOFTRESET_MASK		BIT(1)
+#define SYSC_AUTOIDLE_MASK		BIT(0)
 
 #define SYSC_IDLEMODE_SMART		0x2
 #define SYSC_CLOCKACTIVITY_FCLK		0x2
 
 /* Errata definitions */
-#define I2C_OMAP_ERRATA_I207		(1 << 0)
-#define I2C_OMAP_ERRATA_I462		(1 << 1)
+#define I2C_OMAP_ERRATA_I207		BIT(0)
+#define I2C_OMAP_ERRATA_I462		BIT(1)
 
 #define OMAP_I2C_IP_V2_INTERRUPTS_MASK	0x6FFF
 
@@ -277,7 +277,6 @@ static inline u16 omap_i2c_read_reg(struct omap_i2c_dev *omap, int reg)
 
 static void __omap_i2c_init(struct omap_i2c_dev *omap)
 {
-
 	omap_i2c_write_reg(omap, OMAP_I2C_CON_REG, 0);
 
 	/* Setup clock prescaler to obtain approx 12MHz I2C module clock: */
@@ -316,19 +315,19 @@ static int omap_i2c_reset(struct omap_i2c_dev *omap)
 
 		/* Disable I2C controller before soft reset */
 		omap_i2c_write_reg(omap, OMAP_I2C_CON_REG,
-			omap_i2c_read_reg(omap, OMAP_I2C_CON_REG) &
-				~(OMAP_I2C_CON_EN));
+				   omap_i2c_read_reg(omap, OMAP_I2C_CON_REG) &
+		~(OMAP_I2C_CON_EN));
 
 		omap_i2c_write_reg(omap, OMAP_I2C_SYSC_REG, SYSC_SOFTRESET_MASK);
 		/* For some reason we need to set the EN bit before the
-		 * reset done bit gets set. */
+		 * reset done bit gets set.
+		 */
 		timeout = jiffies + OMAP_I2C_TIMEOUT;
 		omap_i2c_write_reg(omap, OMAP_I2C_CON_REG, OMAP_I2C_CON_EN);
 		while (!(omap_i2c_read_reg(omap, OMAP_I2C_SYSS_REG) &
 			 SYSS_RESETDONE_MASK)) {
 			if (time_after(jiffies, timeout)) {
-				dev_warn(omap->dev, "timeout waiting "
-						"for controller reset\n");
+				dev_warn(omap->dev, "timeout waiting for controller reset\n");
 				return -ETIMEDOUT;
 			}
 			msleep(1);
@@ -396,15 +395,13 @@ static int omap_i2c_init(struct omap_i2c_dev *omap)
 	}
 
 	if (!(omap->flags & OMAP_I2C_FLAG_SIMPLE_CLOCK)) {
-
 		/*
 		 * HSI2C controller internal clk rate should be 19.2 Mhz for
 		 * HS and for all modes on 2430. On 34xx we can use lower rate
 		 * to get longer filter period for better noise suppression.
 		 * The filter is iclk (fclk for HS) period.
 		 */
-		if (omap->speed > 400 ||
-			       omap->flags & OMAP_I2C_FLAG_FORCE_19200_INT_CLK)
+		if (omap->speed > 400 || omap->flags & OMAP_I2C_FLAG_FORCE_19200_INT_CLK)
 			internal_clk = 19200;
 		else if (omap->speed > 100)
 			internal_clk = 9600;
@@ -616,7 +613,7 @@ static void omap_i2c_resize_fifo(struct omap_i2c_dev *omap, u8 size, bool is_rx)
 	 * then we might use draining feature to transfer the remaining bytes.
 	 */
 
-	omap->threshold = clamp(size, (u8) 1, omap->fifo_size);
+	omap->threshold = clamp(size, (u8)1, omap->fifo_size);
 
 	buf = omap_i2c_read_reg(omap, OMAP_I2C_BUF_REG);
 
@@ -636,7 +633,7 @@ static void omap_i2c_resize_fifo(struct omap_i2c_dev *omap, u8 size, bool is_rx)
 		omap->b_hw = 1; /* Enable hardware fixes */
 
 	/* calculate wakeup latency constraint for MPU */
-	if (omap->set_mpu_wkup_lat != NULL)
+	if (omap->set_mpu_wkup_lat)
 		omap->latency = (1000000 * omap->threshold) /
 			(1000 * omap->speed / 8);
 }
@@ -718,13 +715,13 @@ static int omap_i2c_xfer_msg(struct i2c_adapter *adap,
 	if (omap->b_hw && stop) {
 		unsigned long delay = jiffies + OMAP_I2C_TIMEOUT;
 		u16 con = omap_i2c_read_reg(omap, OMAP_I2C_CON_REG);
+
 		while (con & OMAP_I2C_CON_STT) {
 			con = omap_i2c_read_reg(omap, OMAP_I2C_CON_REG);
 
 			/* Let the user know if i2c is in a bad state */
 			if (time_after(jiffies, delay)) {
-				dev_err(omap->dev, "controller timed out "
-				"waiting for start condition to finish\n");
+				dev_err(omap->dev, "controller timed out waiting for start condition to finish\n");
 				return -ETIMEDOUT;
 			}
 			cpu_relax();
@@ -782,7 +779,6 @@ static int omap_i2c_xfer_msg(struct i2c_adapter *adap,
 	return -EIO;
 }
 
-
 /*
  * Prepare controller for a transaction and call omap_i2c_xfer_msg
  * to do the work during IRQ processing.
@@ -807,7 +803,7 @@ omap_i2c_xfer_common(struct i2c_adapter *adap, struct i2c_msg msgs[], int num,
 	if (r < 0)
 		goto out;
 
-	if (omap->set_mpu_wkup_lat != NULL)
+	if (omap->set_mpu_wkup_lat)
 		omap->set_mpu_wkup_lat(omap->dev, omap->latency);
 
 	for (i = 0; i < num; i++) {
@@ -822,7 +818,7 @@ omap_i2c_xfer_common(struct i2c_adapter *adap, struct i2c_msg msgs[], int num,
 
 	omap_i2c_wait_for_bb(omap);
 
-	if (omap->set_mpu_wkup_lat != NULL)
+	if (omap->set_mpu_wkup_lat)
 		omap->set_mpu_wkup_lat(omap->dev, -1);
 
 out:
@@ -875,18 +871,15 @@ static inline void i2c_omap_errata_i207(struct omap_i2c_dev *omap, u16 stat)
 	if (stat & OMAP_I2C_STAT_RDR) {
 		/* Step 1: If RDR is set, clear it */
 		omap_i2c_ack_stat(omap, OMAP_I2C_STAT_RDR);
-
 		/* Step 2: */
 		if (!(omap_i2c_read_reg(omap, OMAP_I2C_STAT_REG)
 						& OMAP_I2C_STAT_BB)) {
-
 			/* Step 3: */
 			if (omap_i2c_read_reg(omap, OMAP_I2C_STAT_REG)
 						& OMAP_I2C_STAT_RDR) {
 				omap_i2c_ack_stat(omap, OMAP_I2C_STAT_RDR);
 				dev_dbg(omap->dev, "RDR when bus is busy.\n");
 			}
-
 		}
 	}
 }
@@ -911,7 +904,7 @@ omap_i2c_omap1_isr(int this_irq, void *dev_id)
 		dev_err(omap->dev, "Arbitration lost\n");
 		omap_i2c_complete_cmd(omap, OMAP_I2C_STAT_AL);
 		break;
-	case 0x02:	/* No acknowledgement */
+	case 0x02:	/* No acknowledgment */
 		omap_i2c_complete_cmd(omap, OMAP_I2C_STAT_NACK);
 		omap_i2c_write_reg(omap, OMAP_I2C_CON_REG, OMAP_I2C_CON_STP);
 		break;
@@ -927,8 +920,9 @@ omap_i2c_omap1_isr(int this_irq, void *dev_id)
 				*omap->buf++ = w >> 8;
 				omap->buf_len--;
 			}
-		} else
+		} else {
 			dev_err(omap->dev, "RRDY IRQ while no data requested\n");
+		}
 		break;
 	case 0x05:	/* Transmit data ready */
 		if (omap->buf_len) {
@@ -939,8 +933,9 @@ omap_i2c_omap1_isr(int this_irq, void *dev_id)
 				omap->buf_len--;
 			}
 			omap_i2c_write_reg(omap, OMAP_I2C_DATA_REG, w);
-		} else
+		} else {
 			dev_err(omap->dev, "XRDY IRQ while no data to send\n");
+		}
 		break;
 	default:
 		return IRQ_NONE;
@@ -1266,13 +1261,13 @@ static const struct of_device_id omap_i2c_of_match[] = {
 MODULE_DEVICE_TABLE(of, omap_i2c_of_match);
 #endif
 
-#define OMAP_I2C_SCHEME(rev)		((rev & 0xc000) >> 14)
+#define OMAP_I2C_SCHEME(rev)           (((rev) & 0xc000) >> 14)
 
-#define OMAP_I2C_REV_SCHEME_0_MAJOR(rev) (rev >> 4)
-#define OMAP_I2C_REV_SCHEME_0_MINOR(rev) (rev & 0xf)
+#define OMAP_I2C_REV_SCHEME_0_MAJOR(rev) (((rev) >> 4))
+#define OMAP_I2C_REV_SCHEME_0_MINOR(rev) (((rev) & 0xf))
 
-#define OMAP_I2C_REV_SCHEME_1_MAJOR(rev) ((rev & 0x0700) >> 7)
-#define OMAP_I2C_REV_SCHEME_1_MINOR(rev) (rev & 0x1f)
+#define OMAP_I2C_REV_SCHEME_1_MAJOR(rev) (((rev) & 0x0700) >> 7)
+#define OMAP_I2C_REV_SCHEME_1_MINOR(rev) (((rev) & 0x1f))
 #define OMAP_I2C_SCHEME_0		0
 #define OMAP_I2C_SCHEME_1		1
 
@@ -1383,7 +1378,7 @@ omap_i2c_probe(struct platform_device *pdev)
 		of_property_read_u32(node, "clock-frequency", &freq);
 		/* convert DT freq value in Hz into kHz for speed */
 		omap->speed = freq / 1000;
-	} else if (pdata != NULL) {
+	} else if (pdata) {
 		omap->speed = pdata->clkrate;
 		omap->flags = pdata->flags;
 		omap->set_mpu_wkup_lat = pdata->set_mpu_wkup_lat;
@@ -1434,7 +1429,7 @@ omap_i2c_probe(struct platform_device *pdev)
 	omap->errata = 0;
 
 	if (omap->rev >= OMAP_I2C_REV_ON_2430 &&
-			omap->rev < OMAP_I2C_REV_ON_4430_PLUS)
+	    omap->rev < OMAP_I2C_REV_ON_4430_PLUS)
 		omap->errata |= I2C_OMAP_ERRATA_I207;
 
 	if (omap->rev <= OMAP_I2C_REV_ON_3430_3530)
@@ -1459,7 +1454,7 @@ omap_i2c_probe(struct platform_device *pdev)
 			omap->b_hw = 1; /* Enable hardware fixes */
 
 		/* calculate wakeup latency constraint for MPU */
-		if (omap->set_mpu_wkup_lat != NULL)
+		if (omap->set_mpu_wkup_lat)
 			omap->latency = (1000000 * omap->fifo_size) /
 				       (1000 * omap->speed / 8);
 	}
@@ -1469,12 +1464,12 @@ omap_i2c_probe(struct platform_device *pdev)
 
 	if (omap->rev < OMAP_I2C_OMAP1_REV_2)
 		r = devm_request_irq(&pdev->dev, omap->irq, omap_i2c_omap1_isr,
-				IRQF_NO_SUSPEND, pdev->name, omap);
+				     IRQF_NO_SUSPEND, pdev->name, omap);
 	else
 		r = devm_request_threaded_irq(&pdev->dev, omap->irq,
-				omap_i2c_isr, omap_i2c_isr_thread,
-				IRQF_NO_SUSPEND | IRQF_ONESHOT,
-				pdev->name, omap);
+					      omap_i2c_isr, omap_i2c_isr_thread,
+							IRQF_NO_SUSPEND | IRQF_ONESHOT,
+							pdev->name, omap);
 
 	if (r) {
 		dev_err(omap->dev, "failure requesting irq %i\n", omap->irq);
-- 
2.43.0


--1iVO1zdvjrUi1aXo
Content-Type: text/x-diff; charset=us-ascii
Content-Disposition: attachment;
	filename="0002-i2c-omap-remove-unused-parameter.patch"

From 39d6a5d0a065b0302d671eaa215fd952b69b1124 Mon Sep 17 00:00:00 2001
Message-ID: <39d6a5d0a065b0302d671eaa215fd952b69b1124.1733207006.git.dhruvmenon1104@gmail.com>
In-Reply-To: <cover.1733207006.git.dhruvmenon1104@gmail.com>
References: <cover.1733207006.git.dhruvmenon1104@gmail.com>
From: Dhruv Menon <dhruvmenon1104@gmail.com>
Date: Tue, 3 Dec 2024 10:47:16 +0530
Subject: [PATCH v2 2/2] i2c: omap: remove unused parameter

The parameters `is_rdr` in `omap_i2c_receive_data` and `is_xdr` in
`omap_i2c_transmit_data` were unused in the function implementations.
This commit removes these parameters.

Signed-off-by: Dhruv Menon <dhruvmenon1104@gmail.com>
---
 drivers/i2c/busses/i2c-omap.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/i2c/busses/i2c-omap.c b/drivers/i2c/busses/i2c-omap.c
index df945ddfe089..9838d89df385 100644
--- a/drivers/i2c/busses/i2c-omap.c
+++ b/drivers/i2c/busses/i2c-omap.c
@@ -990,8 +990,7 @@ static int errata_omap3_i462(struct omap_i2c_dev *omap)
 	return 0;
 }
 
-static void omap_i2c_receive_data(struct omap_i2c_dev *omap, u8 num_bytes,
-		bool is_rdr)
+static void omap_i2c_receive_data(struct omap_i2c_dev *omap, u8 num_bytes)
 {
 	u16		w;
 
@@ -1011,8 +1010,7 @@ static void omap_i2c_receive_data(struct omap_i2c_dev *omap, u8 num_bytes,
 	}
 }
 
-static int omap_i2c_transmit_data(struct omap_i2c_dev *omap, u8 num_bytes,
-		bool is_xdr)
+static int omap_i2c_transmit_data(struct omap_i2c_dev *omap, u8 num_bytes)
 {
 	u16		w;
 
@@ -1128,7 +1126,7 @@ static int omap_i2c_xfer_data(struct omap_i2c_dev *omap)
 					OMAP_I2C_BUFSTAT_REG) >> 8) & 0x3F;
 			}
 
-			omap_i2c_receive_data(omap, num_bytes, true);
+			omap_i2c_receive_data(omap, num_bytes);
 			omap_i2c_ack_stat(omap, OMAP_I2C_STAT_RDR);
 			continue;
 		}
@@ -1139,7 +1137,7 @@ static int omap_i2c_xfer_data(struct omap_i2c_dev *omap)
 			if (omap->threshold)
 				num_bytes = omap->threshold;
 
-			omap_i2c_receive_data(omap, num_bytes, false);
+			omap_i2c_receive_data(omap, num_bytes);
 			omap_i2c_ack_stat(omap, OMAP_I2C_STAT_RRDY);
 			continue;
 		}
@@ -1151,7 +1149,7 @@ static int omap_i2c_xfer_data(struct omap_i2c_dev *omap)
 			if (omap->fifo_size)
 				num_bytes = omap->buf_len;
 
-			ret = omap_i2c_transmit_data(omap, num_bytes, true);
+			ret = omap_i2c_transmit_data(omap, num_bytes);
 			if (ret < 0)
 				break;
 
@@ -1166,7 +1164,7 @@ static int omap_i2c_xfer_data(struct omap_i2c_dev *omap)
 			if (omap->threshold)
 				num_bytes = omap->threshold;
 
-			ret = omap_i2c_transmit_data(omap, num_bytes, false);
+			ret = omap_i2c_transmit_data(omap, num_bytes);
 			if (ret < 0)
 				break;
 
-- 
2.43.0


--1iVO1zdvjrUi1aXo--

