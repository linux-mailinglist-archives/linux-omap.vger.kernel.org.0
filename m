Return-Path: <linux-omap+bounces-2310-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E3DB699021E
	for <lists+linux-omap@lfdr.de>; Fri,  4 Oct 2024 13:33:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9A2671F24661
	for <lists+linux-omap@lfdr.de>; Fri,  4 Oct 2024 11:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FF6F15821A;
	Fri,  4 Oct 2024 11:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="bj18ZsoE"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5873113D503;
	Fri,  4 Oct 2024 11:33:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728041603; cv=none; b=l9P4wQqb34REGIySZcd03Xylcari7OGGuAW0k7ipQbaAqTeAC9hMdjEx7Otkvau6Jt7p/hxYfRMyi379PMnIa5mZ0dXi+7QPTIpe2kQehDp00OlSuMfYCPpxEVMSS+ZGd5jvRdmO3L+gm+x75EiGmWFZH5x58JCGNnm1zm2Xz5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728041603; c=relaxed/simple;
	bh=n2DQGx6sLpxG7m4RhOiPABl3mL/dfUc4rZyw9Plq7Nc=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=asE1vBP+U6aR7wCwBB9nz97l4Gu9ARWPwVIuyL3LuHLYYjEmNTfmBRVKTJYZZVZxoa/adXeVsIwWi0OmZxO0k8xGjpXqXoGV9tbJLmiV6w7V9ihYFa9Yu7o7fLJ4wQKDTuVsEVOHxxb6AITHsDUtL1q/FY/V3F5b6NlK8g3QS/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=bj18ZsoE; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=CR/nAxuulTVBoX6b+47+Ns0Bly6gE/me/kF5jIfzXlQ=; b=bj18ZsoEzyqF24zq8DG6noP1nM
	faVVaSMpOqZdTAkXo+x0utyqtFPPtG3yK8tD6nuZfBhO934kZvjmW9wuHuBz5rMbSedIHGh0yv9dz
	bc6sCwSeQtMiSER8psjKaJycR90fqDwLzJHiImqtmnQTpbopquthykF/o3tK0tWfh0+OGrOGNsUaF
	H+ty8RY63Lg5c3azmy7Zu/v6brH/JRL1L49l4MGa4uLUJripQdMlelcrh90hcYu89qUgDvX1UJJtc
	RPUZ1MOfAjR2nkAbq1OB/GOwdfB6U5dYpryNRmy4XtqwGjY1p56VLMGl6lRhvMGi2MpyPAa63PMeQ
	neMxqjIg==;
Date: Fri, 4 Oct 2024 13:33:11 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Roger Quadros <rogerq@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring
 <robh@kernel.org>, khilman@baylibre.com, devicetree@vger.kernel.org,
 tony@atomide.com, aaro.koskinen@iki.fi, linux-omap@vger.kernel.org
Subject: Re: [PATCH 3/4] ARM: dts: omap: omap4-epson-embt2ws: add unknown
 gpio outputs
Message-ID: <20241004133311.116ee074@akair>
In-Reply-To: <7fc3cf75-bf48-4bcc-8c74-09fb89655a72@kernel.org>
References: <20240930213008.159647-1-andreas@kemnade.info>
	<20240930213008.159647-4-andreas@kemnade.info>
	<7fc3cf75-bf48-4bcc-8c74-09fb89655a72@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Fri, 4 Oct 2024 10:53:57 +0300
schrieb Roger Quadros <rogerq@kernel.org>:

> On 01/10/2024 00:30, Andreas Kemnade wrote:
> > Set them to the state seen in a running system, initialized
> > by vendor u-boot or kernel. Add line names where they are defined
> > in the vendor kernel.
> > gpio15 resets something in the display, otherwise meaning of the
> > gpios is not known.
> > 
> > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > ---
> >  .../boot/dts/ti/omap/omap4-epson-embt2ws.dts  | 84
> > +++++++++++++++++++ 1 file changed, 84 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
> > b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts index
> > cc1b6080bf95..c8205ae89840 100644 ---
> > a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts +++
> > b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts @@ -115,6
> > +115,65 @@ wl12xx_vmmc: wl12xx-vmmc { };
> >  };  
> >  > +&gpio1 {  
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&gpio1_hog_pins &gpio1wk_hog_pins>;
> > +
> > +	lb-reset-hog {
> > +		gpio-hog;
> > +		gpios = <9 GPIO_ACTIVE_HIGH>;
> > +		output-low;
> > +		line-name = "lb_reset";
> > +	};  
> 
> Just curious, what does lb stand for.
> 
me too. Maybe b is the same as in cb 

static struct gpio bt2ws_lb_gpios[] = {
        {BLC_L_GPIO,   GPIOF_OUT_INIT_LOW,  "gpio_blc_l"   },
        {BLC_R_GPIO,   GPIOF_OUT_INIT_LOW,  "gpio_blc_r"   },
        {LB_RESET_GPIO,GPIOF_OUT_INIT_LOW,  "gpio_lb_reset"},
        {POWER_EN_GPIO,GPIOF_OUT_INIT_HIGH, "gpio_power_en"},
        {PANEL_POWER_EN_GPIO,GPIOF_OUT_INIT_LOW, "gpio_panel_power_en"},
};

That is what is in the vendor kernel and matches 

> > +
> > +	power-en-hog {
> > +		gpio-hog;
> > +		gpios = <10 GPIO_ACTIVE_HIGH>;
> > +		output-high;
> > +		line-name = "power_en";
> > +	};
> > +
> > +	panel-power-en-hog {
> > +		gpio-hog;
> > +		gpios = <14 GPIO_ACTIVE_HIGH>;
> > +		output-low;
> > +		line-name = "panel_power_en";
> > +	};  
> 
> Is panel always enabled? I didn't see a panel driver
> else it could be hooked to panel regulator?
> 
Panels are behind two dsi to dpi converters.
I have a driver. At the moment, I boot into vendor
v3.0 kernel, reprogram boot order, warm reboot into mainline u-boot +
kernel to get display working. I can read registers via dsi at least
after blanking the panel for the first time. Blanking/unblanking seems
to work.
With a low pulse on gpio15 I can reset something in the display which
the vendor kernel can recover from but not my mainline driver. Then no
communication with the display seem to work.

About gpio 10/14 I know only the name (from the possibly kernel sources
and matching /sys/kernel/debug/gpio). And that knowledge I want to
forward into the formal hardware description, the device tree.

$ grep -R PANEL_POWER_EN *
arch/arm/mach-omap2/board-bt2ws.c:
{PANEL_POWER_EN_GPIO,GPIOF_OUT_INIT_LOW, "gpio_panel_power_en"},
arch/arm/mach-omap2/board-bt2ts.c:
{PANEL_POWER_EN_GPIO,GPIOF_OUT_INIT_LOW, "gpio_panel_power_en"},
include/video/omap-panel-bt2.h:#define PANEL_POWER_EN_GPIO 14	// GPIO

But I did not get the supposed vendor kernel to fully boot. I have the verdict
that I do not have the exact sources of the kernel which is running.
I also did not notice any change in behaviour when toggling these gpios.
So either they are a leftover from another board revision or something
gets supplied by some parasitic ways.

I think the best is to explain the situation more in the comments.
What is a bit difficult is here is that there is something done in the m3
processors but apparently nothing vital to having display output (tried
with an initrd without any m3 firmware), probably
doing something camera-related, so the kernel sources do not give a full
picture of the hardware anyways.

BTW: do you know how to best trace gpio changes done by the vendor kernel
without recompiling it? I managed to write a module deviating the master_xfre
function for i2c to log things.

> > +
> > +	blc-r-hog {
> > +		gpio-hog;
> > +		gpios = <17 GPIO_ACTIVE_HIGH>;
> > +		output-low;
> > +		line-name = "blc_r";
> > +	};  
> 
> this should be modeled as a gpio regulator and paried to backlight
> left?
> 
Discussed in patch 2.

Regards,
Andreas

