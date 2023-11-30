Return-Path: <linux-omap+bounces-76-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A70A67FF12B
	for <lists+linux-omap@lfdr.de>; Thu, 30 Nov 2023 15:05:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 39DC1B20F50
	for <lists+linux-omap@lfdr.de>; Thu, 30 Nov 2023 14:05:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37B27487B1;
	Thu, 30 Nov 2023 14:05:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jSBJceYP"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2DC39848
	for <linux-omap@vger.kernel.org>; Thu, 30 Nov 2023 14:05:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDFACC433C8;
	Thu, 30 Nov 2023 14:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701353153;
	bh=zvxGJDY8FCc6wODfCKIaIRyB/6ybh+E3orrkZkhrxnw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jSBJceYPB59omKA3n5QjQzqrPZNUgVCHxzp5A3/bSBWrPoxkr4+DhXk2G31qLw5OK
	 Op4prX027Qi26OkpeMBbTt9Q55dSFuiw+Uut1ScNa9fSyrGQK443sxPBcR9QkWQiS1
	 yghMT2eiiKU+MbV8tGiH/jtGaZLjwkfC9UhNj1kQAAUG54oep0QTIV6fhG8C18J9dQ
	 JyuTEuZ/VX2RJfmRPAyYbJPjNTGfunnj7/124YXkvBTgTibrqmgnfaDhNA0lh9VhuX
	 wmsr84L1MGtbviIEWT/bTEmQ0qPGKxQVXCL1raNBv3EsPsxcV68JBzy7yxwzmTT14l
	 /JbCJjr9Gk8/A==
Date: Thu, 30 Nov 2023 14:05:48 +0000
From: Lee Jones <lee@kernel.org>
To: =?iso-8859-1?Q?P=E9ter?= Ujfalusi <peter.ujfalusi@gmail.com>
Cc: tony@atomide.com, robh@kernel.org, wens@csie.org,
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mfd: twl6030-irq: Revert to use of_match_device()
Message-ID: <20231130140548.GL1470173@google.com>
References: <20231029114843.15553-1-peter.ujfalusi@gmail.com>
 <20231123103756.GD1184245@google.com>
 <20231123104108.GF1184245@google.com>
 <74b0b808-7b97-4e53-a1a4-6e2e1274ecff@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <74b0b808-7b97-4e53-a1a4-6e2e1274ecff@gmail.com>

On Thu, 23 Nov 2023, Péter Ujfalusi wrote:

> 
> 
> On 23/11/2023 12:41, Lee Jones wrote:
> >>> @@ -368,10 +368,10 @@ int twl6030_init_irq(struct device *dev, int irq_num)
> >>>  	int			nr_irqs;
> >>>  	int			status;
> >>>  	u8			mask[3];
> >>> -	const int		*irq_tbl;
> >>> +	const struct of_device_id *of_id;
> >>>  
> >>> -	irq_tbl = device_get_match_data(dev);
> >>> -	if (!irq_tbl) {
> >>> +	of_id = of_match_device(twl6030_of_match, dev);
> >>
> >> I think you just dropped support for ACPI.
> > 
> > Ah, scrap that.  I was looking at the wrong part of 1e0c866887f4.
> > 
> > So what about the other drivers changed in the aforementioned commit?
> 
> Looking back at it again, I think only this patch is needed.
> This is not a real driver, it is using the twl core's device.
> The twl6030 is for sure broken, let me reply to the twl4030-power in a sec.
> 
> > Ideally we'd have a call that covers all of the various probing APIs.
> > 
> >> Rob, care to follow-up?

Rob, last chance to state your case before I apply it.

-- 
Lee Jones [李琼斯]

