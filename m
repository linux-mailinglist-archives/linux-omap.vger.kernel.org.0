Return-Path: <linux-omap+bounces-3831-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F900AD67C2
	for <lists+linux-omap@lfdr.de>; Thu, 12 Jun 2025 08:14:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BCBF23AD3D0
	for <lists+linux-omap@lfdr.de>; Thu, 12 Jun 2025 06:14:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0B0D20C49E;
	Thu, 12 Jun 2025 06:13:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="6Tnk2zpk"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE0720C031;
	Thu, 12 Jun 2025 06:13:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749708805; cv=none; b=pyxMTfd59ozq/mANlFRtyES5VJ8+BdfWfuxZXSoenNzPI+gTKw0H1HZ8rgyG37dSfrz2nvqAlyYqMCsobntvISq+B0EXV6AREGVup3Do6W/MLhO1H8LlENLpjJLNoKhGhu70CIvhXVXuQwDMzw5H54jGQheZZxCgYQToeerlrxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749708805; c=relaxed/simple;
	bh=oCkNsF4jAbINksOx0fvr5p8N08HQ7Tk5Wej95Tovdlg=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SixSy7MD8TGFTGeTJtU+/c18y1umLLLu6POfpTKmZomeRqLDcpgifz4HvaFDAYFW1RpIibM2A0X9ym3DWJrHud7GwtYtiznFaN+VT2+wArBZ4ErlktLgt8HTqNahY18RQeFjyjjpACgjyerT35qgbpBUvREslBLyU6JZrnkdK0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=6Tnk2zpk; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=d0ztJlo825I13kb3bxddMAoPs02kBnZ14ol1fnruaBk=; b=6Tnk2zpkgi0x5+D82Lxct/AdoC
	iaw89WEFQKaSURM/9N0G/vYHbWPR9syN8Lce4kYsIaHls/rp9AZHk6GIg4yPviQ5BaKOJPzss2E2b
	zkscX4co+YmrV2qUBBUQrTIlQvK4G2etPhd69AE6xW0gYWthmxZTrgkOJsGgp3CGSZphCn55JLtAZ
	vWMzvomzcm5v8y89ZxPFFYSeJDY4JqAsmel/43USago5qpkoU+xmXx0ekee6RRzRJNK/R/SDLtei6
	bE4f14YN7R6E7jJuWc0gSAjM80i2v1UsuEgN884lOfdqJp99+mO93lBpeTsfSgEhWMIBLB3DgbMgK
	uAOEWfNQ==;
Date: Thu, 12 Jun 2025 08:12:55 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Andrew Davis <afd@ti.com>
Cc: Kory Maincent <kory.maincent@bootlin.com>, Tony Lindgren
 <tony@atomide.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Aaro Koskinen
 <aaro.koskinen@iki.fi>, Kevin Hilman <khilman@baylibre.com>, Roger Quadros
 <rogerq@kernel.org>, Russell King <linux@armlinux.org.uk>, Bajjuri Praneeth
 <praneeth@ti.com>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown
 <broonie@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 <linux-omap@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v2 5/5] arm: omap2plus_defconfig: Enable TPS65219
 regulator
Message-ID: <20250612081255.255be21e@akair>
In-Reply-To: <1d87fa3b-c3b9-44fd-9e61-7f1ffadcfb0c@ti.com>
References: <20250609-bbg-v2-0-5278026b7498@bootlin.com>
	<20250609-bbg-v2-5-5278026b7498@bootlin.com>
	<1d87fa3b-c3b9-44fd-9e61-7f1ffadcfb0c@ti.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Wed, 11 Jun 2025 16:13:05 -0500
schrieb Andrew Davis <afd@ti.com>:

> On 6/9/25 10:43 AM, Kory Maincent wrote:
> > Enable the TPS65219 regulator in the defconfig, as the TPS65214
> > variant is used by the newly introduced BeagleBoard Green Eco board.
> > 
> > Reviewed-by: Andreas Kemnade <andreas@kemnade.info>
> > Signed-off-by: Kory Maincent <kory.maincent@bootlin.com>
> > ---
> >   arch/arm/configs/omap2plus_defconfig | 3 +++
> >   1 file changed, 3 insertions(+)
> > 
> > diff --git a/arch/arm/configs/omap2plus_defconfig b/arch/arm/configs/omap2plus_defconfig
> > index 9f9780c8e62a..2ad669f7b202 100644
> > --- a/arch/arm/configs/omap2plus_defconfig
> > +++ b/arch/arm/configs/omap2plus_defconfig  
> 
> Why omap2plus_defconfig? OMAP3 and newer are all ARMv7 and
> boards with those can/should use multi_v7_defconfig.
> 
if there are enough drivers enabled there, it would work, but it is not.
So there need to be a bunch of patches to add the missing stuff.
omap2plus_defconfig is there and support for boards are added.

So I think until multi_v7_defconfig is really usable for OMAP3+, we
should stick with the name omap2plus_defconfig and add stuff.
If we rename omap2plus_defconfig to omap2_defconfig, we should imho
disable OMAP3/4/5 there to avoid confusion.

Regards,
Andreas

