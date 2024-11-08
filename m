Return-Path: <linux-omap+bounces-2613-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C2BA99C1ADE
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2024 11:42:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F3DAD1C232C5
	for <lists+linux-omap@lfdr.de>; Fri,  8 Nov 2024 10:42:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3CF8F1E376E;
	Fri,  8 Nov 2024 10:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="vD/A1lcA"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7D8C197A82;
	Fri,  8 Nov 2024 10:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731062521; cv=none; b=PaePzozCz5aBaFXiuDrAzjLPxQF5+RZELnnw+Vogr+2yETTsbSn2anJtu8n4ARPYVJfPDpekqF0iUPlGj4XDzxo+kOzYr43OTlUNpWFbYgTut34cglQb7HwXvqu1jZ3Jel8Dm6NWHDp5oX48rokYWusjgasMucbVNEYRkxvVmjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731062521; c=relaxed/simple;
	bh=q1cN9YZqHMURLaSaiDQcupqG7++w1x/76Ek5kU5qj1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SjDoWxvVgWxdsljAPRNCBnUgyXQOMNny6h5715xkHhD0vDkUPH4v6O/iMuRCiGjzz6VCuVFUjRY8OYDSaws2iFY0E9FKbu8bLgACSb90B0GAqGdml+vgJTICm4KTBwg3R30rI8JwHtc0P8dVCu4kaMTv2VISw1OYbEYOmuC7j/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=vD/A1lcA; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=kcp6TGubow1Y3Bunjwto3FtIZsRMBDGowBaLzmkshpM=; b=vD/A1lcA7ZTArsJHFDiAm+IJXi
	7+Mh4zpxLOM3gLfOedjREgiAr3H30Kxn+KEWeFTG4D73onVAw/0xesrlQR9Vn40t5aYoeULxP7TWN
	7SUx1eDYlCgHjiW0C3m480I+8jAoLC+F8ky8bDVhYkDMyPkKPWwkdD9EK79/Np4A4BsHJtJ0OFlQ4
	SXpxn1nu1ew0O89bOgaf/ZbtkdRE9zZSXJmbWwOe1HQKRotXSTKHMjuSpFip6vUITdYVHOg2ix0b8
	hdK3zgDcdXp+VpNPNgLqDF11pSGCjvxWfKIm1OZmVq20SaY8SyTUvltpsQX6jEA6vVyKiGZNeetdg
	HNxRMHdg==;
Date: Fri, 8 Nov 2024 11:41:46 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Mithil Bavishi <bavishimithil@gmail.com>
Cc: aaro.koskinen@iki.fi, conor+dt@kernel.org, devicetree@vger.kernel.org,
 khilman@baylibre.com, krzk+dt@kernel.org, linux-hardening@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, robh@kernel.org,
 rogerq@kernel.org, tony@atomide.com
Subject: Re: [PATCH v2 2/6] arm/dts: Add common device tree for Samsung
 Galaxy Tab 2 series
Message-ID: <20241108114146.6bfed6bd@akair>
In-Reply-To: <20241108095107.5338-1-bavishimithil@gmail.com>
References: <20241103183636.40cc37fc@akair>
	<20241108095107.5338-1-bavishimithil@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Fri,  8 Nov 2024 09:51:07 +0000
schrieb Mithil Bavishi <bavishimithil@gmail.com>:

> > probably you did not notice an error in make dtbs and the old
> > devicetree on the device was still there and was used.  
> 
> I messed up my PowerVR tree with mainline, hence the problems. I've fixed
> it now locally.
> 
> > are not the ones you need to fix, so just the diff between old and new.  
> 
> Yeah, I ran the command for espresso and then panda for a comparision.
> The diff is what i worked on, but I have some doubts which I'd like to ask
> 
> dts/ti/omap/omap4-samsung-espresso7.dtb: /: irled@0: 'anyOf' conditional 
> 	failed, one must be fixed:
>         'reg' is a required property
>         'ranges' is a required property
>         from schema $id: http://devicetree.org/schemas/root-node.yaml# 
> 
> Documentation/devicetree/bindings/leds/irled/gpio-ir-tx.yaml does not say
> those properties to be required, is the node placed incorrectly?
> 
Well, anything with @ in the node nade needs reg as a property. So
probably best is led-ir since having reg does not make any sense here
since we are not on a bus with devices having addresses on that bus. 

> /home/mighty/linux/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb:
>  /: pwm@10: 'anyOf' conditional failed, one must be fixed:
>         'reg' is a required property
>         'ranges' is a required property
>         from schema $id: http://devicetree.org/schemas/root-node.yaml#
> 
> Similarly here as well.
> 
Same issue here, too.

> /home/mighty/linux/arch/arm/boot/dts/ti/omap/omap4-samsung-espresso7.dtb:
> current-sense-shunt: 'io-channel-ranges' does not match any of the 
> regexes: 'pinctrl-[0-9]+'
>         from schema $id: 
> 	http://devicetree.org/schemas/iio/afe/current-sense-shunt.yaml#
> 
> I tried searching the tree for "io-channel-ranges" which has only one
> example - ste-ux500-samsung-janice.dts. In that dts the node is same as
> in espresso.
> 
Not documented, so not allowed. There is code using it in kernel, but
that might only come into effect if current-sense-shunt has children
nodes. So drop it and check functionality.

Regards,
Andreas

