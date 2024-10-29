Return-Path: <linux-omap+bounces-2503-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 776EE9B5307
	for <lists+linux-omap@lfdr.de>; Tue, 29 Oct 2024 21:02:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F59D1F23CA9
	for <lists+linux-omap@lfdr.de>; Tue, 29 Oct 2024 20:02:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96D4F2071FC;
	Tue, 29 Oct 2024 20:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="tDYgHkvG"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57BDE1940B3;
	Tue, 29 Oct 2024 20:02:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730232162; cv=none; b=CBBWNMIe7PRUgWTIXeUdJAyFr9A+heOqQDoJd3MEeJZU+hOCOI5c56zNRra90RnuP/2/a/cAEFk4VBBNLHpK5JGzY6pf3bSOtApbAKoBDOrK2w/8+OaZoGzrScwRCfmcu9ESapGZ1aISGC+7y+FDbZERmXn2LK8RVaRzPftwbbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730232162; c=relaxed/simple;
	bh=f3UuPOeTZD4/EqjwCyUXIfeYlRaYApjvPjNvGd90k78=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ItWE5WKAVQ6zkibFS4lPoyeup1vtCoNR36J0IxroNy3vJXkF1b3glORxqLMAnyvD84oLRF7hEvDA0Lv/NoGgE8Pp4Jzt/6ZPMkE03FNgGfpZgdvo6aEmw0kHgOGt2SvQn1EEFA2viHp+38V0D4juIVIXBTwKlvJ+UTPF5O/us10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=tDYgHkvG; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=4OcGl0KWTU3dE20CCOU72pTkjwMEmHgpOFmz9ZwbjCY=; b=tDYgHkvGew+c1P8rkg5Y4/g87J
	GKZJMUOHNPhJdKvoD5vcYEBCk1tGPcwqxE7F7w2NTv7cVN/eFG6on0e57m74Mng1wvl47OkS3lNkx
	N5r92+cpnoNTN1BJ76ssekUmXkyOzoDWb5BxdkTodlBoOKjgBK2dubX2eskLC426EpPGTH1C35Y5u
	HrNSaqAF1Zni7609ZB0Ko4fj3JMOcg9rNtg0PiDbGNAwSNubOIJ+Qr1KaZ7RKJt40FQ4gWKpBHdIg
	9bF1CqPB90k3F2qzqKKZRWYj3Ntlrv/kcZc7p7xoSma7e8lT+Osciwet4VeFQ/oZDbHXY/VT3/Nrb
	UtGDVw9A==;
Date: Tue, 29 Oct 2024 21:02:28 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Mighty <bavishimithil@gmail.com>
Cc: =?UTF-8?B?QmVub8OudA==?= Cousson <bcousson@baylibre.com>, Tony Lindgren
 <tony@atomide.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ARM: dts: twl6032: Add DTS file for TWL6032 PMIC
Message-ID: <20241029210228.3c517751@akair>
In-Reply-To: <20240626095056.12607-1-bavishimithil@gmail.com>
References: <20240626095056.12607-1-bavishimithil@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Am Wed, 26 Jun 2024 15:20:56 +0530
schrieb Mighty <bavishimithil@gmail.com>:

> From: Mithil Bavishi <bavishimithil@gmail.com>
> 
> Add a dedicated DTS file for the TWL6032 PMIC (Phoenix Lite). Already
> has driver support with TWL6030 (Phoenix) since both of them are so
> similar, some nodes can be reused from TWL6030 as well.
> 
> This can be included in the board files like twl6030.
> Example:
> ...
> &i2c1 {
>     twl: twl@48 {
>         reg = <0x48>;
>         interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
>         interrupt-controller;
>         interrupt-parent = <&gic>;
>     };
> };
> 
> /include/ "twl6032.dtsi"
> ...
> 
> Used in devices like samsung-espresso, amazon-jem, epson-embt2ws etc.
> 
Well, no, the file is not used at the moment, I do not think it makes
sense to have it in without an actual in-tree user.

Regards,
Andreas

