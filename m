Return-Path: <linux-omap+bounces-78-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C410B8003D7
	for <lists+linux-omap@lfdr.de>; Fri,  1 Dec 2023 07:26:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EC440B211D7
	for <lists+linux-omap@lfdr.de>; Fri,  1 Dec 2023 06:26:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E143DDC8;
	Fri,  1 Dec 2023 06:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=atomide.com header.i=@atomide.com header.b="edUlIFBJ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail5.25mail.st (mail5.25mail.st [74.50.62.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5ED68199D;
	Thu, 30 Nov 2023 22:26:00 -0800 (PST)
Received: from localhost (91-158-86-216.elisa-laajakaista.fi [91.158.86.216])
	by mail5.25mail.st (Postfix) with ESMTPSA id 0CC2560862;
	Fri,  1 Dec 2023 06:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=atomide.com;
	s=25mailst; t=1701411959;
	bh=ZJAwNvSXMC8cowLrTynxRvpm84SZ2cxEGo3qzsfogxc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=edUlIFBJaucLIgcQi96n2pKUElAOdQ/fXOnxG0qKWCPJ9JQ0Jjm8W1O18a+0A1QO3
	 2zMAUaNhOUU3guy1IwJSeLNWHF/nmqfUmAIBvLwVZHcKi6yLF1DGDC0mFqIJH62y5Z
	 7mJV0MKk9WcRFntz6lcb/gaJ+K+6oX8I4hYKhCsFdDuUws3Lv2X7KvpsDK0yViIglT
	 9+72fo1SA9hDFHH7ziOZLzb/xEJKyJxsnjHkw8XPVXdblbJSBRWhse8hQy7CtMVaul
	 XeVqX2i8+G9hKbPALyZdD4lcQ2r0SSFldOEeFdr860M9d46Jl8YUnTHeU8PLHObtrv
	 Q1opwUMqdJ3Mw==
Date: Fri, 1 Dec 2023 08:25:38 +0200
From: Tony Lindgren <tony@atomide.com>
To: Andreas Kemnade <andreas@kemnade.info>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	bcousson@baylibre.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ARM: dts: omap4-embt2ws: Add Bluetooth
Message-ID: <20231201062538.GF5169@atomide.com>
References: <20231004070309.2408745-1-andreas@kemnade.info>
 <6b4968d9-80d3-4a5a-b42e-3982825e45e9@linaro.org>
 <20231007070015.GS34982@atomide.com>
 <20231007072442.GW34982@atomide.com>
 <20231130183555.1b329b78@aktux>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231130183555.1b329b78@aktux>

* Andreas Kemnade <andreas@kemnade.info> [231130 17:36]:
> On Sat, 7 Oct 2023 10:24:42 +0300
> Tony Lindgren <tony@atomide.com> wrote:
> > arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts:457.17-462.4: Warning (clocks_property):
> > /ocp/interconnect@48000000/segment@0/target-module@6c000/serial@0/bluetooth-gnss:
> > Missing property '#clock-cells' in node /ocp/interconnect@48000000/segment@0/targe
> >
> 
> I do not get this warning on top of omap-for-v6.8/dt. So I think the
> time is really there for this patch.

OK thanks applying into omap-for-v6.8/dt.

Tony

