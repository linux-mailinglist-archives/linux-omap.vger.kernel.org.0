Return-Path: <linux-omap+bounces-851-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD83876089
	for <lists+linux-omap@lfdr.de>; Fri,  8 Mar 2024 10:01:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F21311C228DF
	for <lists+linux-omap@lfdr.de>; Fri,  8 Mar 2024 09:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53F2453399;
	Fri,  8 Mar 2024 09:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="fbIRTiHB"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D18853377;
	Fri,  8 Mar 2024 09:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709888449; cv=none; b=dTAYLKfTjeYv1iZz6DQB5fgZUgN/vggBi/OH4E/ImzhXEZXuUIrgoWu2BOyopofW/gsEIQespNvGksOIANT3FkbVWlZFGFv/pXyhFlabyOEQIq0ArfHbLnylGpxqOtCfwkFKabrJob6qc9ZBS9SbtkaZmnmUUbTquLvnplsVcpU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709888449; c=relaxed/simple;
	bh=4sSenehhaYaQsoE2KHPabtFy95+KqecPE4OZ8yBlm+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RtuFJy1DElaJVvIuc6rJwEgevw0R3X683VZNs3U9BY+GqNrp7H2pqtWznroofjxy+qb4vgWnjEcYgWKXB/BFbFF2sfIKPQNLNsQUKW5Ri3UdYojZa8zH+U+Whwl86mzpOcuiIt5T2H+pE/Xva28GdfO0lWFFx2NOk0LBjRlmVMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=fbIRTiHB; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 9EC7060852;
	Fri,  8 Mar 2024 09:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1709888446;
	bh=4sSenehhaYaQsoE2KHPabtFy95+KqecPE4OZ8yBlm+k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fbIRTiHBqIxu2UsIl/X1cpC0eXHI8mPMSYhy6aUYC66EyFV7d/nhnNufVN+yuv2WF
	 my9ed/KRh9WJTwkD3hUENH1ET82XYIsbkHWR0fu6J9kBFu/utjl8wHgnqnCgiOtYFy
	 h0CH1EtZkXD7BCZFQZzN8mDTPVayzHDqfgsM1pUi/qZTLPjdVG9Kg2RYa/X2PfyyUx
	 1O/nKk1XW1Ddy3LEGurjFpjLFmsOYPvONfmk9E3dVDU1xc9I7ZRhQeoPDCg+1zLD41
	 6az18mIDfe82tJnICcRQeWu+0DjhUOIq9sbNG+m4NkD/nCXrdtSPeiVJdnKtXqy2k3
	 SPM4t4I0FZJlw==
Date: Fri, 8 Mar 2024 11:00:21 +0200
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
Message-ID: <20240308090021.GL52537@atomide.com>
References: <20240213105730.5287-1-tony@atomide.com>
 <20240214001140.2abe0d80@aktux>
 <20240214054044.GK52537@atomide.com>
 <20240229070626.GH52537@atomide.com>
 <20240302201813.06fc09d7@aktux>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240302201813.06fc09d7@aktux>

* Andreas Kemnade <andreas@kemnade.info> [240302 19:18]:
> Tony Lindgren <tony@atomide.com> wrote:
> > If you had some good idea in mind for the #address-cells = <2> for the
> > remaining unconnected composite clocks maybe clarify it a bit.
> > 
> I was just wondering whether we could do reg = <register bit> then.

Yeah sure nothing stopping us from doing that too if it helps :)

Regards,

Tony

