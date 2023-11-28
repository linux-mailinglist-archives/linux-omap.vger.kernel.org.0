Return-Path: <linux-omap+bounces-50-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2E37FB847
	for <lists+linux-omap@lfdr.de>; Tue, 28 Nov 2023 11:43:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EBE7CB21C91
	for <lists+linux-omap@lfdr.de>; Tue, 28 Nov 2023 10:43:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 738453FB32;
	Tue, 28 Nov 2023 10:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="SfHUHZD8"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C7D41A5;
	Tue, 28 Nov 2023 02:43:37 -0800 (PST)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id A89946086E;
	Tue, 28 Nov 2023 10:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1701168216;
	bh=o617uNhOvw3Vu+eRSs1W8/UqKPoU/B9IfoVIbQuRnCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SfHUHZD8Ii8XGRTnm9DAGobgeC1l8WZoBabIgGA4wyWEeDVkCp6jaK4/3tqggtzbs
	 ffDZ2ja1ef6OXetd1WjT3kMh1eZQN8Rc7u//EG4n5Zo3v12/zRGt1nXPzQaZgZ5rNA
	 0erJaEOVziSGN/z4c0Yk4gtDioSzqY7AZU12PwuTRdny4zCD6mJFxhU0ff2ewqupxz
	 uXSFVS5+zn8BTnWhr3Gyj9L7iK4LShq52qf4UBlMCynbEOROexYPW2pmbhZBqGFQuL
	 xk4oTauzv+/3IdzgXFytannM0KGZKwH+0HUdJMJE7j7zv2OAHdrJbQaCxkJUzjUeY9
	 ehRM5MW3LndoA==
Date: Tue, 28 Nov 2023 12:43:10 +0200
From: Tony Lindgren <tony@atomide.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Andreas Kemnade <andreas@kemnade.info>, mturquette@baylibre.com,
	sboyd@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	kristo@kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clock: ti: Convert interface.txt to
 json-schema
Message-ID: <20231128104310.GS5169@atomide.com>
References: <20231127202359.145778-1-andreas@kemnade.info>
 <7a62ed8a-b0e3-4881-90d7-b8f5d38e482e@linaro.org>
 <20231128093241.707a4fa0@aktux>
 <7361082a-f271-4ef4-9dad-06ee7445c749@linaro.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7361082a-f271-4ef4-9dad-06ee7445c749@linaro.org>

* Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> [231128 08:41]:
> On 28/11/2023 09:32, Andreas Kemnade wrote:
> > On Tue, 28 Nov 2023 09:00:16 +0100
> > Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:
> > 
> >>> +required:
> >>> +  - compatible
> >>> +  - clocks
> >>> +  - '#clock-cells'  
> >>
> >> reg is required. Device cannot take "reg" from parent, DTS does not work
> >> like this.
> > 
> > Well, apparently they do... and I am just dealing with status quo and not
> > how it should be.
> > Look at commit 31fc1c63c2ae4a542e3c7ac572a10a59ece45c24
> 
> Who designed clock-controller binding with a device node per each clock?
> This is ridiculous (although of course not your fault here)! Looking at
> omap3xxx-clocks.dtsi - all its children should be just defined by the
> driver, not by DTSI.

Earlier all the clocks were separate nodes, the ti,clksel binding made
things a bit better by grouping the seprate clock nodes so we don't have
multiple nodes with the same reg.. But yeah clksel instance clocks should
be clock@6 with reg = <6> if the clock bits are at bit 6. That would be
fairly easy to do if that helps, but in general I doubt anybody's going
to spend much effort to fix the omap3 legacy clocks atthis point.

For omap4 and later, things are a bit better as they use the clkctrl clocks:

Documentation/devicetree/bindings/clock/ti-clkctrl.txt

I don't think omap3 has any clkctrl clocks but if it does then that could
be used.

Regards,

Tony

