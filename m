Return-Path: <linux-omap+bounces-2375-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FDF998276
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 11:37:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4CB16281A81
	for <lists+linux-omap@lfdr.de>; Thu, 10 Oct 2024 09:37:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 68B161C2439;
	Thu, 10 Oct 2024 09:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="fWirJMJB"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 773CE1BC9FE;
	Thu, 10 Oct 2024 09:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728552970; cv=none; b=XFENMGqhOBsdxwzweqWHOkg0hSyhdqX7wopPrh4BSphEVlRCOVehOqPpCC5ksXnue+FB5fvdo1htEW3brlTeJqonLuCLrK4cEskH7WRwYJF04hrjKyTI88rZU8bwwy071Go0brmk+DCuZCpb6ofmSla0/ElsJ6BE6LWGDa5lfro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728552970; c=relaxed/simple;
	bh=uYXEr1Z89kmAttCLdkPheh3zvnlkWUNbdaNaUYJQzgs=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bqDZ2OMVRr1lp2aeURxA8jJBxdN7Uw+NFfMpVfZ+eWefm8BI0yqJ3O5telb3DSaoeoH9WGxmNevTykPRSxjbJEh6Qgb5LOEhlrjBAUyuH5tr+26hbDhSJlsya1XstvtsOlWa2VR7id9fEbujr6+fpj2i37InhJoqcknMiStYLRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=fWirJMJB; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=NeUFTYaEM1aQRYKUzV4CLhrw7q0+SneYVNTrMPH7tuM=; b=fWirJMJBnfllY8zgWvciOL+yEV
	ebBEI1zhPdMPs21ARAP9wFuviagximww3WUorDxOQ4c9YF6S025OXfrh3IS+2CznwsW2zXx8/aUTe
	dTyXMwMdAlsZ47K4nVfiJNF+AAF3ETknej2Cu96fcbNyg4Otia0qEXdNHawjapYLMpNjBnTGOmEjU
	qMq5yqN0Metu5xc6GAWnymAAH7Z2jg8s7+YwP3aO242lO0TeLDPmWjiFTf+rIxkg6OseythcmUusg
	XTsiF7f0ap4AcQ7auY/xoU2Yxl+83cCGPdN8mgb6ptQhjzQZC4vkMzlM5hixyatU6uaEzMpvNs4rF
	gcDqdBig==;
Date: Thu, 10 Oct 2024 11:35:57 +0200
From: Andreas Kemnade <andreas@kemnade.info>
To: Roger Quadros <rogerq@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Tony Lindgren <tony@atomide.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Enric Balletbo i Serra
 <eballetbo@gmail.com>, Javier Martinez Canillas <javier@dowhile0.org>,
 Nishanth Menon <nm@ti.com>, srk@ti.com, linux-omap@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 0/3] ARM: dts: ti: omap: fix dtbs_check warnings for
 ti,gpmc-nand and ti,gpmc-onenend
Message-ID: <20241010113557.1c987754@akair>
In-Reply-To: <20241009-gpmc-omap-dtbx-v2-0-fc68124a090a@kernel.org>
References: <20241009-gpmc-omap-dtbx-v2-0-fc68124a090a@kernel.org>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Wed, 09 Oct 2024 16:16:53 +0300
schrieb Roger Quadros <rogerq@kernel.org>:

> This series fixes dtbs_check warnings on OMAP platforms
> for ti,gpmc-nand and ti,gpmc-onenand.
> 
> The following warnings are fixed
> - "nand@0,0: Unevaluated properties are not allowed ('linux,mtd-name'
> was unexpected)"
> - "nand@0,0: Unevaluated properties are not allowed
> ('gpmc,device-nand' was unexpected)"
> - "omap3430-sdp.dtb: onenand@2,0: Unevaluated properties are not
> allowed ('linux,mtd-name' was unexpected)"
> 
> Signed-off-by: Roger Quadros <rogerq@kernel.org>
> ---
> Changes in v2:
> - Rebased on v6.12-rc1
> - Link to v1:
> https://lore.kernel.org/r/20240903-gpmc-dtb-v1-0-380952952e34@kernel.org
> 
hmm, v1 seems to be applied. 
see
https://git.kernel.org/pub/scm/linux/kernel/git/khilman/linux-omap.git/commit/?h=for-next&id=ea453dc2d4d6b7bed89386fe76916252993676ab
Kevin seems to only have pushed the for-next branch and not the
individual topic-6.13 branches.

Regards,
Andreas

