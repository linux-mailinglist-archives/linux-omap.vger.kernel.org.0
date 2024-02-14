Return-Path: <linux-omap+bounces-583-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A9D6854279
	for <lists+linux-omap@lfdr.de>; Wed, 14 Feb 2024 06:41:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7D93F1C2425C
	for <lists+linux-omap@lfdr.de>; Wed, 14 Feb 2024 05:41:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6752D2FF;
	Wed, 14 Feb 2024 05:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="VUYoomvE"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF4A10A01;
	Wed, 14 Feb 2024 05:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.50.62.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707889285; cv=none; b=HN7QYvPDokGgOukh7Tk1IjR55vM7R7uMTdJ+kS1QzrIzhEa/vgiCg95f+G+jhK5BZ+h+s85aOJpFH3J2+MU+axQd234BxqdQU9DO7IG5ceVFDqoJPwHj5eUbGs7iTsUptUZjVbjB36+pl+gQqx2a6c52dA8KE2DS2UfnGbJlhx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707889285; c=relaxed/simple;
	bh=0tB7VxJceoDK157Ny7pJ8vSDYDHhGqWHtOd2r/BfMP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nnAi9OKcZmpgyskZk8wcWWUemharfdV/ek/gqqd7J1xBMTtHElRQcYybh1KxzZu3FyYAnSnJ9v0CpJ/uhLDF8yd0hD9jGENkfPbZtObW9F0ItwV+388qOWvrE+zDXxam37ORczll1RateOlq60ctWXs730hlyWPC+ISDmfABHp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com; spf=fail smtp.mailfrom=atomide.com; dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b=VUYoomvE; arc=none smtp.client-ip=74.50.62.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=atomide.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=atomide.com
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 703546033F;
	Wed, 14 Feb 2024 05:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1707889281;
	bh=0tB7VxJceoDK157Ny7pJ8vSDYDHhGqWHtOd2r/BfMP8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VUYoomvE8Cwk0XGNeZ3c6zwZWKCG69N8YKgq17BJtb8pHTJI4KnJkyTVzuCotVrb/
	 citEi6ETPSGHO1a9GnsVAQaXOrrwccNTfNRQG8A0vr4qN9984LfgQei/H+Gk3bmuwh
	 Ju7DEtjGeBb/9gfEdL0iPrg6oA7n4l8aJI7qUV0GNi9PVb62OFrT7FAFoBkK8TkgW7
	 D6JUuv2Vw/TUKhtFZNj91uUSk2J7O6h4k0jqluq8sidfoPzbh1eItFWtnOjqSaaMqV
	 yTn12EqlzxNj/gorUdj5UfVoVm0ZWOr85JbYGXZvBdmJzkosqYWafc0ntEnHKvF5xi
	 kH5xM3mf9tmTg==
Date: Wed, 14 Feb 2024 07:40:44 +0200
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
Message-ID: <20240214054044.GK52537@atomide.com>
References: <20240213105730.5287-1-tony@atomide.com>
 <20240214001140.2abe0d80@aktux>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240214001140.2abe0d80@aktux>

* Andreas Kemnade <andreas@kemnade.info> [240213 23:11]:
> On Tue, 13 Feb 2024 12:56:40 +0200
> Tony Lindgren <tony@atomide.com> wrote:
> 
> > Hi all,
> > 
> > This series updates the clksel clocks to use the standard reg property
> > instead of ti,bit-shift.
> > 
> > I'd like to apply these before we make further use of the clksel clocks
> > to reduce the dtb check warnings.
> > 
> 
> hmm, we still have ti,bit-shift if these clocks are not used below a ti,clksel.
> Just wondering, can we completely deorbit ti,bit-shift if we used #address-cells = <2>;
> in those cases? I wait a bit with further txt->yaml conversions until
> this is settled.

No need to wait on the yaml conversion I think :) How about just tag the
ti,bit-shift property as deprecated? And add a comment saying it is only
needed for the remaining unconnected clocks.

Eventually we can move all the component clocks under clksel clocks, or the
related clock such as the dpll clock for the clkdcoldo clocks.

Regards,

Tony



