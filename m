Return-Path: <linux-omap+bounces-2722-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F2C9D6AFB
	for <lists+linux-omap@lfdr.de>; Sat, 23 Nov 2024 20:02:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A54F28201D
	for <lists+linux-omap@lfdr.de>; Sat, 23 Nov 2024 19:02:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C815C155C8C;
	Sat, 23 Nov 2024 19:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="kRjs/mEI"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EBE3182C5;
	Sat, 23 Nov 2024 19:02:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732388542; cv=none; b=AGsRIHrAvmNP3eEeXb5gV/FdzbI+ijjw9df0RbndMExL9Sux1Kn1v8xWti+OAy2LH94b2AqduFb1W17y7fH6KjYdfkZTbn8sPYdHaP+JSTMC3nPfPiJthvpP79fLRq48OBvBwPX8kgYB4HMHKJgsogif37Ea+bmLpx1zUBrNcoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732388542; c=relaxed/simple;
	bh=+JDRYomU6ddZd09XJpOjydkJa21L4ORP64zWXQHJwFw=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PHwkU9YiJSMW4DQP/0ryUqDDaUEwzLPzZ1lxt4ooOJfGE7lujY4798RnO+5gla8grRbMk7aM3morpblklaGD4RHZyxy8dgWggMrWOib9nMgek5TufpUnxQCSG4CTCG8YrLM20yGNuYWbzeKMfdZm9RmZvV6AE5KIhe/KOIrQoBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=kRjs/mEI; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=3/idsCltb7XExEF3zfCfI1F96Qrzn3w6Pf9qRmMeZ88=; b=kRjs/mEI8quU8JR51yWzV6vCk9
	mwjzJZfb+f7ARjptBHmf9PxbReYerWhmgwFWPdU0k8tK6HE5/mb4vT0bf5S5rwpu+YU6nqW2p2NXf
	gMK3k5ioVQYiiDgR1c105K4r5p9p/pktb1R6a2yldjfchH9c2VIfoNexZmI3IVcFTo05BF5Li0wnd
	ZDn2PlybuUhPq3Q/WeVuzMT88Y4TTyLq1YYhZaquhUDNbC/Ggh4RqoibbDst/VTZKRifeh/9tomvo
	Yo+mwPdtUgSi7cQUtNc+CxrHUnEIG+tGfxataUsC0pQXiFcUQSMVoKszy4Xayh9xJ/04gnN64VNKz
	LQMN9KwA==;
Date: Sat, 23 Nov 2024 20:02:02 +0100
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
Message-ID: <20241123200202.684d8bc5@akair>
In-Reply-To: <20241123175259.775-1-bavishimithil@gmail.com>
References: <20241112114818.1eb238e9@akair>
	<20241123175259.775-1-bavishimithil@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Sat, 23 Nov 2024 17:52:58 +0000
schrieb Mithil Bavishi <bavishimithil@gmail.com>:

> > > +&i2c3 {
> > > +	touchscreen: synaptics-rmi4-i2c@20 {  
> >
> > touchscreen@20  
> Fixed, generic node names right!
> 
> > > +		avdd-supply = <&reg_touch_ldo_en>;  
> > not known in schema  
> I cannot seem to find the "vio-supply" shown in the bindings. There is
> only mention of avdd-supply and vdd-supply. I am not sure if avdd and
> vio are equivalent, hence the confusion.
> What should be the solution here?
> 
well, look at the schematics and see how it is wired ;-) 
Without schematic, it is a bit tricky. So you can look how it is used.
vdd-supply sounds like something to make the chip fully functional.
vio-supply seems to be for the io lines.  As the vendor kernel seem to
set i2c to gpio mode, so probably because the vio-supply is powered
down according to the board file you posted.
So it might be vio-supply only or vio and vdd-supply combined.
In any case document what you have seen in the vendor kernel.

> > Documentation/devicetree/bindings/input/touchscreen/touchscreen.yaml:
> > horizontal resolution of touchscreen (maximum x coordinate reported + 1)  
> 
> > So this touchscreen reports max 1278?  
> 
> Fixed it as well, 1280 and 800 respectively.
> https://github.com/Unlegacy-Android/android_kernel_ti_omap4/blob/3.4/common/arch/arm/mach-omap2/board-espresso-input.c#L264
> 
> > And these things belong below rm4-f11 according to
> > Documentation/devicetree/bindings/input/syna,rmi4.yaml  
> 
> I did not quite understand what you mean by this. I checked the bindings 
> and a few examples, there is nothing "below" rmi4-f11.
> 
this part of the binding description
patternProperties:
  "^rmi4-f1[12]@1[12]$":
    type: object
    unevaluatedProperties: false
    $ref: /schemas/input/touchscreen/touchscreen.yaml#
    description:

basically says that standard touchscreen properties are accepted below
rmi4-f11. 

In the example you have:
           rmi4-f11@11 {
                reg = <0x11>;
                touchscreen-inverted-y;
                syna,sensor-type = <2>;
            };

Regards,
Andreas

