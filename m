Return-Path: <linux-omap+bounces-761-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 954F886C19D
	for <lists+linux-omap@lfdr.de>; Thu, 29 Feb 2024 08:07:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C51B11C216B2
	for <lists+linux-omap@lfdr.de>; Thu, 29 Feb 2024 07:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5B05446B6;
	Thu, 29 Feb 2024 07:07:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="ZMoJRLIo"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05FC42A9F;
	Thu, 29 Feb 2024 07:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709190420; cv=none; b=DbY8U56m7F6emjLPxvAkfVgXvwdBeKTUMZVXJ+1yqGR/DVT2lAfwdVjGSe29vUp6dWpGL5UpN0C6eUmQHHvaEnocQAXgi7H6Bogvxr85c/s//j0PNl264OuIF6D6IqFCvAzTMV3khesuCJmCdQiaPkoqNqMTkHrO0Nz/JxCx56Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709190420; c=relaxed/simple;
	bh=qyRnLPnhTL8rUNU/3pfTivd17CPsvJprQn8qnx/kGDw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mrp1tqNLk89YOUtmIE1TXDy/p2JLzMAtCT9nLuWfkkfbqkYnfxtY9JSCtyDyoLddQggZ1HbymTZE76U04yAIqynsuqiu7KBp2Nl6ARXEGc+uiIGMskt4kDe6AWBoHZjOM/NizPuemw1CABSxJOzX78j35ou7ZrGDzrsXJzs3u3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=ZMoJRLIo; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 88427604CD;
	Thu, 29 Feb 2024 07:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1709190412;
	bh=qyRnLPnhTL8rUNU/3pfTivd17CPsvJprQn8qnx/kGDw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZMoJRLIovy6WQbCr4hua3LFutykRxTJ8iJqHbxNzY4VQ3K4Dv7jwCId2lRZETHozG
	 W3nmgG4HniKR7KY9urcv8R1KAjU0bStM/bLPMUKwrhvVjHcyz8jPipRhKNVNtLDakr
	 S95yDZZatFBoy2GWT+RubQUbzmp7TEeGIImx3akbHfVxEUBiSV/nVC4IoHqzHXc2kA
	 zkkNATjXLjIiyIrCHlt+p2PVjdDWaGmfH8WFYhupfFXjL9VqsKPS5R8ECi5Ig0c0qx
	 i6YYc3nCCEABsArBzfsniHKbC2u3U0VANg9FM3ANiPFIJIfL7fw1ruuY2ntqMGuFjh
	 Onb5Rr6/10Ong==
Date: Thu, 29 Feb 2024 09:06:26 +0200
From: Tony Lindgren <tony@atomide.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Tero Kristo <kristo@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 0/4] Use reg instead of ti,bit-shift for clksel
Message-ID: <20240229070626.GH52537@atomide.com>
References: <20240213105730.5287-1-tony@atomide.com>
 <20240214001140.2abe0d80@aktux>
 <20240214054044.GK52537@atomide.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240214054044.GK52537@atomide.com>

* Tony Lindgren <tony@atomide.com> [240214 05:41]:
> * Andreas Kemnade <andreas@kemnade.info> [240213 23:11]:
> > On Tue, 13 Feb 2024 12:56:40 +0200
> > Tony Lindgren <tony@atomide.com> wrote:
> > 
> > > Hi all,
> > > 
> > > This series updates the clksel clocks to use the standard reg property
> > > instead of ti,bit-shift.
> > > 
> > > I'd like to apply these before we make further use of the clksel clocks
> > > to reduce the dtb check warnings.
> > > 
> > 
> > hmm, we still have ti,bit-shift if these clocks are not used below a ti,clksel.
> > Just wondering, can we completely deorbit ti,bit-shift if we used #address-cells = <2>;
> > in those cases? I wait a bit with further txt->yaml conversions until
> > this is settled.
> 
> No need to wait on the yaml conversion I think :) How about just tag the
> ti,bit-shift property as deprecated? And add a comment saying it is only
> needed for the remaining unconnected clocks.
> 
> Eventually we can move all the component clocks under clksel clocks, or the
> related clock such as the dpll clock for the clkdcoldo clocks.

Oh and yes, using #clock-cells = <2> would be nice eventually :) I think
the clkcel binding already supports that. But that still leaves the issue
of unconnected composite clocks.. I'm pretty sure they all have some real
parent like clksel for dpll though.

If you had some good idea in mind for the #address-cells = <2> for the
remaining unconnected composite clocks maybe clarify it a bit.

Regards,

Tony

