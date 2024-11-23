Return-Path: <linux-omap+bounces-2725-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id BB10C9D6BA4
	for <lists+linux-omap@lfdr.de>; Sat, 23 Nov 2024 22:32:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8085F28193F
	for <lists+linux-omap@lfdr.de>; Sat, 23 Nov 2024 21:32:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E3B519F115;
	Sat, 23 Nov 2024 21:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="79uBzN66"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFFBE7CF16;
	Sat, 23 Nov 2024 21:32:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732397525; cv=none; b=RpioYeu3DqeuEliLuvklLDzj7LyXlz6Y4XNX4LpuOlVNR2Wr3ig5NXzJ0xnZHKZwgrN6xpZ1Mrywk29re6PGscLKKBngeACUESjuFM5PgQ/lfq9ipFt/YceXjnfLLfiHPIzDvZxD61eFZmSdC4vHVtJCijJawYlMN3PSGrY+4I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732397525; c=relaxed/simple;
	bh=gHwJmvzf21afgQoTvb2Bj0IrycV+YiiikoPnuvfjgsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VgWLjgssXIJ6SdUeJ6dI0txVfF4PSRLgxUyrgsmttJrQhTPxSwGbvjR8yLyVCbeERSxYrfDKjO5G6eS1DDX6Ot6Dug5QTmHU84tDhmYEUFDIaiGpK6r35OY+s9DW4ICiIilD7WBvx4Sjt+rO0k4jt0Im8tCb/5pSCmtgdv4euI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=79uBzN66; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=zXUvUoL/OnaPQoLr5nrWhyhwl+PNI5Cabcfe7EiPBO0=; b=79uBzN66XDG3kLDz/RGUmS2Tfg
	KsgILZO6wuZiDIuY2XJaHEyPjrIlrh309mXHfmBxhWllYKNiHdmEeMu7ouFMPCVVHL3JNJt0NgJXA
	N/av56wGSxpZcnd8/7b2VaCGWeG15pLgKzanI+6Aq4g2+7lK9eItwqH3D8M06BXbZcn6V/bIeaU2b
	2DncUejHN/IS/oNaBgvzaLMFsqoEsR/EymHYm/nfy4BGyc0/auYaRlOxBzdxetAYCCoNzLvZqPZcI
	YqeR5CzuAUAsl6Ux78hvvPINAIXVvF7ehDopYjdXeIE42UnAhKIjvqEZyv80l2FT+Tt9hBjILl9ve
	qFKomYFg==;
Date: Sat, 23 Nov 2024 22:31:50 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Mithil Bavishi <bavishimithil@gmail.com>
Cc: Laurent.pinchart@ideasonboard.com, aaro.koskinen@iki.fi,
 airlied@gmail.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 khilman@baylibre.com, krzk+dt@kernel.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 neil.armstrong@linaro.org, prabhakar.mahadev-lad.rj@bp.renesas.com,
 quic_jesszhan@quicinc.com, rfoss@kernel.org, robh@kernel.org,
 rogerq@kernel.org, simona@ffwll.ch, thierry.reding@gmail.com,
 tony@atomide.com, tzimmermann@suse.de
Subject: Re: [PATCH v3 10/10] ARM: dts: ti: omap: samsung-espresso10: Add
 initial support for Galaxy Tab 2 10.1
Message-ID: <20241123223150.28d4002b@akair>
In-Reply-To: <20241123192633.2049-1-bavishimithil@gmail.com>
References: <20241123200202.684d8bc5@akair>
	<20241123192633.2049-1-bavishimithil@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Sat, 23 Nov 2024 19:26:33 +0000
schrieb Mithil Bavishi <bavishimithil@gmail.com>:

> > well, look at the schematics and see how it is wired ;-)  
> 
> Schematic mentions vddtx, vdda, vdd and vbus, so unsure about that.
> VDDTX is the one with 2.8V, VDD and VBUS are at 1.8V and VDDA is grounded,
> it just gets the input from GDNA from the same touch sensor.
> 
> > As the vendor kernel seem to
> > set i2c to gpio mode, so probably because the vio-supply is powered
> > down according to the board file you posted.
> > So it might be vio-supply only or vio and vdd-supply combined.
> > In any case document what you have seen in the vendor kernel.  
> 
> https://github.com/Unlegacy-Android/android_kernel_ti_omap4/blob/3.4/common/arch/arm/mach-omap2/board-espresso-input.c
> This just makes it more confusing. Very confused on what is what now xD.
> reg_touch_ldo_en is 2.8V which goes to VDDTX, it is gpmc_nwp.gpio_54 - TSP_LDO_ON
> ldo6 is 1.8V presumably ldo6 (VAP_IO_1.8V) which goes to VDD, VBUS.
> 
well, I think I2C bus runs at 1.8V, and there is IO_1.8V in the name,
so vio-supply should be something at 1.8V, so probably ldo6 is
vio-supply. Maybe add a remark in the comments. But then it might be
not a good idea to turn that off in suspend. if the other regulator is
kept on.

> > basically says that standard touchscreen properties are accepted below
> > rmi4-f11.   
> 
> But we do not use any of those properties. If you're talking about the
> touchscreen-size-x/y, even in the examples those are out of rmi4-f11, in
> the parent node.
>
Where do you see those examples? Here touchscreen-invert-y is below
rmi4-f11.
https://elixir.bootlin.com/linux/v6.12/source/Documentation/devicetree/bindings/input/syna,rmi4.yaml#L269

We have also the warning from dtbs_check:
arch/arm/boot/dts/ti/omap/omap4-samsung-espresso10.dtb:
synaptics-rmi4-i2c@20: Unevaluated properties are not allowed
('avdd-supply', 'touchscreen-size-x', 'touchscreen-size-y' were
unexpected)

Regards,
Andreas

