Return-Path: <linux-omap+bounces-2247-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E34299856FF
	for <lists+linux-omap@lfdr.de>; Wed, 25 Sep 2024 12:12:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1F1011C22FE0
	for <lists+linux-omap@lfdr.de>; Wed, 25 Sep 2024 10:12:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D39B183CA1;
	Wed, 25 Sep 2024 10:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="EhvSPEZL"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685BB15B966;
	Wed, 25 Sep 2024 10:12:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727259147; cv=none; b=jRupnAuLfnlkv0AtqhFrXQ4kJM9JnU/OVr49qboNQLNraAYuouAbveE9B00W9lkAUus+9ixVQl3fF20BsexqmWG9/hr8egxFeYlyyhmLMKV2LABLVKEiXNHkqbJo/LrjNPzdpFhKdyjOnpT1HJWawL341rkfyMuCjyqyThwQ8CU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727259147; c=relaxed/simple;
	bh=3q9s6Vw7uH+PCgqxX0aWg6g2gWqXS1lHc1WrlVHoEUI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lIK0firnnvh6HmXTqky93+H4OHtHr5DLKU3E1x76EeOc/SHHbAi11Bbi0HSkdaEVsEpWb0srS495Kr1CVCtneNM84Cip5wgdDaLNLM7Rmc5bfHrFYHuRy8HjWccgsqahK9mT152NXPcsGcneq+l4a6WiQxUsIu2uxqwx5XwPdYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=EhvSPEZL; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=S/Mnn3eVQ+O1lmZHAuc1mutxHotBW3h1Bj4uCFY1CU8=; b=EhvSPEZLef6O0Y8aVlARJnBF6f
	NGbQuY+02uSoNi6XkvcZSUoY3TtaouVaR4Hfavg06pLMIkPCNk2awXVVkR+VBM8VT0Ly3S28oJbiA
	ZPxUCkS8kQS0Oun54v9pBX4Lz5kBFoUROCrXT3PNoy15mxuKBUpxX+zruWF4isFy/A9syM384FvN4
	uYHP1y3i7CqHbeuVlh9Rt9olAdSvkcRUoqKmNquxypJ2V4U/QEGRqGTopqPHekj8hJE2XJo/f8ZMD
	JhTvyyV5COWbm1lnNiAFgQeNJNxcKOKVLt9LxhN64vd8ooKv0w93XZikRoBpYdVkjNSjPDRKgBnlf
	bzGigpdQ==;
Date: Wed, 25 Sep 2024 12:12:17 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Roger Quadros <rogerq@kernel.org>
Cc: linux-omap@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, Kevin
 Hilman <khilman@baylibre.com>, Michael Turquette <mturquette@baylibre.com>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, linux-kernel@vger.kernel.org, Lee
 Jones <lee@kernel.org>, Tony Lindgren <tony@atomide.com>,
 linux-clk@vger.kernel.org
Subject: Re: [PATCH 2/2] clk: twl: add TWL6030 support
Message-ID: <20240925121217.0aa54808@akair>
In-Reply-To: <9b7f6995-586e-44ee-a73b-9baf1bf23a69@kernel.org>
References: <20240924103609.12513-1-andreas@kemnade.info>
	<20240924103609.12513-3-andreas@kemnade.info>
	<9b7f6995-586e-44ee-a73b-9baf1bf23a69@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Wed, 25 Sep 2024 10:07:29 +0300
schrieb Roger Quadros <rogerq@kernel.org>:

[...]
> > +static void twl6030_clks_unprepare(struct clk_hw *hw)
> > +{
> > +	struct twl_clock_info *cinfo = to_twl_clks_info(hw);
> > +
> > +	twlclk_write(cinfo, TWL_MODULE_PM_RECEIVER, VREG_STATE,
> > +		     ALL_GRP << TWL6030_CFG_STATE_GRP_SHIFT |  
> 
> Why are you unpreparing ALL_GRP? In prepare you only used VREG_GRP.
>
well, if we want control, then I think using every group to turn it off
into a defined state is a good idea.


> > +		     TWL6030_CFG_STATE_OFF);
> > +}
> > +
> > +static int twl6030_clks_is_prepared(struct clk_hw *hw)
> > +{
> > +	struct twl_clock_info *cinfo = to_twl_clks_info(hw);
> > +	int val;
> > +
> > +	val = twlclk_read(cinfo, TWL_MODULE_PM_RECEIVER, VREG_GRP);
> > +	if (val < 0)
> > +		return val;
> > +
> > +	if (!(val & P1_GRP))
> > +		return 0;
> > +
> > +	val = twlclk_read(cinfo, TWL_MODULE_PM_RECEIVER,
> > VREG_STATE);
> > +	if (val < 0)
> > +		return val;
> > +
> > +	val = TWL6030_CFG_STATE_APP(val);
> > +	return val == TWL6030_CFG_STATE_ON  
> 
> Is there a possibility that after calling twl6030_clks_prepare()
> the clock can still remain OFF?

I do not see a reason. 

> If not then we could just use a private flag to indicate clock
> prepared status and return that instead of reading the registers
> again.
>
The clock core already uses prepare_count if no is_prepared() is
defined.
So this prepare functions can just be dropped.

> 
> > +}
> > +
> >  static int twl6032_clks_prepare(struct clk_hw *hw)
> >  {
> >  	struct twl_clock_info *cinfo = to_twl_clks_info(hw);
> > @@ -93,6 +148,13 @@ static int twl6032_clks_is_prepared(struct
> > clk_hw *hw) return val == TWL6030_CFG_STATE_ON;
> >  }
> >  
> > +static const struct clk_ops twl6030_clks_ops = {
> > +	.prepare	= twl6030_clks_prepare,
> > +	.unprepare	= twl6030_clks_unprepare,
> > +	.is_prepared	= twl6030_clks_is_prepared,
> > +	.recalc_rate	= twl_clks_recalc_rate,
> > +};  
> 
> Instead of re-defining all the clock ops can't we just reuse the
> existing twl6032 clock ops?
> 
> We just need to tackle the twl6030 specific stuff inside the ops
> based on some platform driver data flag.
> 
a big if (driver_data == TWL6032) in each of the ops might be ok, since
we have an int and not a pointer there anyways might be the easiest way
to go.

Regards,
Andreas

