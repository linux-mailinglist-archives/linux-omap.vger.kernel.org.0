Return-Path: <linux-omap+bounces-2305-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F31F98FDF9
	for <lists+linux-omap@lfdr.de>; Fri,  4 Oct 2024 09:41:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 119921F22FC1
	for <lists+linux-omap@lfdr.de>; Fri,  4 Oct 2024 07:41:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2CD6613A3FF;
	Fri,  4 Oct 2024 07:41:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="DudPDvJG"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D6481AB4;
	Fri,  4 Oct 2024 07:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728027697; cv=none; b=A/kmPuUplODt6Zcba1aWVhgdv6lbJj8+VXkxvVTagXeJtQukR4JyQX8FLgbhSjmC4RrCRDFp7YEAXHh76NR/dAfxb7z63FZDj1WiEHXk9hdzkTZmmdJC/6I/Ql5DFxw4EnXBGMTZW1GRZ2CTz6/cMs2e8jXmcMYcEFCuNFdOybY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728027697; c=relaxed/simple;
	bh=7x5oaqKNm9fzzIVj3sGF2E1qvsKH6Te4wVR9BrWq/wQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fnr3fgY0nIeNxYl7GW6M+TNW/zL69PF1kjsbPsdWl7MvL9ay9l/nZk8BulM0aX7bRY9uC1Lb0q3DEP7x/PRgTZF/mkakmBiEXN3L9ZB6AguU9GsOnJTyHPntBdAw6f1Bk8T4QOIwI+FNI7Nz3LyIiyVxtyL1w2TrPBNdPZ30cWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=DudPDvJG; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=C/akXsAuA4lvqwOPwxkIDhFyhVuPjA8UxoZPSkDsbgY=; b=DudPDvJGJOZeadblFUiUMPUUGf
	bLCQ9TpmDrwrzkir3h/JBGmabNPYwG0LvsnVBlSXxELA98xzCQius8cawoFnd8prrXKGIQoIBp5Mq
	+Dj/CCZ6PzGM8Vi1XKo/iwOLDLwPOcCfuNIqzOx5ZHSIxpLemrvEDx28i5mYKY1u/KaVLDAkCKis0
	U2qWJpI2rLdxelCHDLtAPhrF/2sHK4UzKCJH9hULJk1/STJiUJU7wAxbInNwYs5sa/R183lYrKz4H
	r/XfU0rtbsGKdCcVSSKwf7fWkTOD6Dn2nXnE7ofXdRNXCmD07T9Q1yMexBkpXXTL4ouo4VdQBivJE
	XDbPtP7g==;
Date: Fri, 4 Oct 2024 09:41:17 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Roger Quadros <rogerq@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, Rob Herring
 <robh@kernel.org>, khilman@baylibre.com, devicetree@vger.kernel.org,
 tony@atomide.com, aaro.koskinen@iki.fi, linux-omap@vger.kernel.org
Subject: Re: [PATCH 1/4] ARM: dts: omap: omap4-epson-embt2ws: define GPIO
 regulators
Message-ID: <20241004094117.51c8adcd@akair>
In-Reply-To: <3c83c399-708c-41e2-988d-4ccec63c6042@kernel.org>
References: <20240930213008.159647-1-andreas@kemnade.info>
	<20240930213008.159647-2-andreas@kemnade.info>
	<3c83c399-708c-41e2-988d-4ccec63c6042@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Fri, 4 Oct 2024 10:24:32 +0300
schrieb Roger Quadros <rogerq@kernel.org>:

> On 01/10/2024 00:30, Andreas Kemnade wrote:
> > To properly have things running after cold boot, define
> > GPIO regulators. Naming is based on board file.
> > 
> > In the vendor kernel they are enabled in a function
> > called bt2ws_dcdc_init() if the system is not booted just
> > to charge the battery.
> > 
> > Signed-off-by: Andreas Kemnade <andreas@kemnade.info>
> > ---
> >  .../boot/dts/ti/omap/omap4-epson-embt2ws.dts  | 73
> > +++++++++++++++++++ 1 file changed, 73 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts
> > b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts index
> > 339e52ba3614..d6b0abba19f6 100644 ---
> > a/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts +++
> > b/arch/arm/boot/dts/ti/omap/omap4-epson-embt2ws.dts @@ -29,6 +29,42
> > @@ backlight-right { power-supply = <&unknown_supply>;
> >  	};
> >  
> > +	cb_v18: cb-v18 {  
> 
> https://devicetree-specification.readthedocs.io/en/v0.3/devicetree-basics.html#generic-names-recommendation
> 
> 
> So regulator@n
> where n is some index if it can't be address.
> 
No, no @n. The above link says: "If the node has no reg property, the
@unit-address must be omitted and the node-name alone differentiates
the node from other nodes at the same level in the tree." So
probably regulator-cb-v18.

Regards,
Andreas

