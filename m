Return-Path: <linux-omap+bounces-4005-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 901F0AEFCBD
	for <lists+linux-omap@lfdr.de>; Tue,  1 Jul 2025 16:37:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 67B8A7A80D8
	for <lists+linux-omap@lfdr.de>; Tue,  1 Jul 2025 14:35:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F768276026;
	Tue,  1 Jul 2025 14:37:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="YjeaziPx";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="edOjc+BM"
X-Original-To: linux-omap@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DCC26A09B;
	Tue,  1 Jul 2025 14:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751380625; cv=none; b=CqOAnQ5ufryzO6pl9RKsVLLYx8rutfqFqr6nogPxCl+r1FsiTUE4N4g8ajRP9+Rzjp2nR2DWS/AaTXx6DFfwWbQo6xRAleBsNt0cIm/rNeln87AGD0qOlW/2K4zjZk1CjEzH+u2XFXMhDSRUvLiHpkLShT1aYYfZJCcgz47r4+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751380625; c=relaxed/simple;
	bh=kGFWc3Xfs0UPbtTI9rxcdylNar0cECcgtKLOQFQAsXg=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=nvJm/TegkIOc+KgdoyXMk/tUE8qu/s2r6vEjQ4a4fGBuJm+lhHb3HoYcUw9dXBqfCDqkEekdz9SotD72vNWRFbGljdFrDjpyDST0I61cjB1HlWtW0Nz5wfbM0Cupbw36ScwUI21HYz+xBVbFoUmf2l+HEmjV/suY9IR5Eoa6FrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=YjeaziPx; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=edOjc+BM reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1751380621; x=1782916621;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=wNBtjKUlLDWI5QCJIIlgd/qmQpzHJefgRv3LMnnIJ9A=;
  b=YjeaziPx0FqLlAeAg2WcLDZbPtjdahLaM/rau/DZexYMGG6BIQyKl6WI
   YA0glSAv16PS0JX5JoAz8KSdQbrzxqZq1VIzBJNuJX+KwVyKPY3l03QAI
   IAxl66AOvgZVN1Z45cPWtNTtuC2VRz46lpISVLwNUqSDZx7mST9fWKVtn
   cQuV0hbazqL93+jEP+2v4GUy8zsZpeTOpuZ79FlzgOq4yZFINoxLTAwBf
   j7a0CBu7QR0MQ0DUzNSdMQL2vlvaUP6eCCeCCNCwLfMiKe+8Sk1hXvb16
   7k/a2Lg1aFcs46U2ZO9sXsi8gbhlXXT917152pmkF8V1hNQhrm/ONU8tw
   A==;
X-CSE-ConnectionGUID: I6shCYzBT6uk0MqV6WbtMQ==
X-CSE-MsgGUID: A/nYcXl1T4uoaw/aimzoLQ==
X-IronPort-AV: E=Sophos;i="6.16,279,1744063200"; 
   d="scan'208";a="44959539"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 01 Jul 2025 16:36:58 +0200
X-CheckPoint: {6863F28A-A-F34124BF-F8CE6E96}
X-MAIL-CPID: 3118CC2C005CAAB61C6EE39A9FF496E3_4
X-Control-Analysis: str=0001.0A00639F.6863F29D.004E,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DC32E16B4AE;
	Tue,  1 Jul 2025 16:36:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1751380614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wNBtjKUlLDWI5QCJIIlgd/qmQpzHJefgRv3LMnnIJ9A=;
	b=edOjc+BMIrQqdr6ui8S58aMjdBWOGa1mfh5XPg45NFJkbNCh+hXcD6JKCDoxEZPkIDuXnf
	f0fdy6Vk/uOLpxzlFjMtJl6mQ0H56LYYKcXl9rSDdKj24ssu4yuhItcacrmXjhhGweZrmf
	T+qxaLKCHNwN+x01XADJHyyMu8QuD6tOfhYMiACHbDwXjgCvuWERgwFoI19ZE9fJV2hUio
	NTdesBkxJtGCuhNtBpwGMFmLVvrWIEPBGLdSuyvqSGTsECHhTrCL0n0LgTyLetFcDOrzAF
	AHsR0w2t9G02buwnh6MuBY11bLfw+KDo6glzSAS1y0+MPvVKOtmM3VTRU7qW5w==
Message-ID: <f44c7074337b79df9ad67f62acbc268acc344a23.camel@ew.tq-group.com>
Subject: Re: [PATCH v2] arm64: Kconfig.platforms: remove useless select for
 ARCH_K3
From: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
To: Guillaume La Roque <glaroque@baylibre.com>
Cc: Andrew Davis <afd@ti.com>, vishalm@ti.com, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Catalin
 Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Nishanth
 Menon <nm@ti.com>,  linux@ew.tq-group.com
Date: Tue, 01 Jul 2025 16:36:52 +0200
In-Reply-To: <20250519-kconfig-v2-1-56c1a0137a0f@baylibre.com>
References: <20250519-kconfig-v2-1-56c1a0137a0f@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.3-0ubuntu1 
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3

On Mon, 2025-05-19 at 10:20 +0200, Guillaume La Roque wrote:
>=20
> After patch done on TI_MESSAGE_MANAGER[1] and TI_SCI_PROTOCOL[2] driver
> select on ARCH_K3 are not needed anymore.
> Select MAILBOX by default is not needed anymore[3],
> PM_GENERIC_DOMAIN if PM was enabled by default so not needed.

Hi,

what selects PM_GENERIC_DOMAIN in your configuration? linux-next fails to b=
oot
on our AM62x-based TQMa62xx if I don't (partially) revert this patch - I ha=
ve=20
not found a way to enable PM_GENERIC_DOMAIN and TI_SCI_PM_DOMAINS without
enabling other unneeded features to pull it in.

Best,
Matthias


>=20
> Remove it and give possibility to enable this driver in modules.
>=20
> [1] https://lore.kernel.org/all/20180828005311.8529-1-nm@ti.com/
> [2] https://lore.kernel.org/all/20250220-ti-firmware-v2-1-ff26883c6ce9@ba=
ylibre.com/
> [3] https://lore.kernel.org/all/20250507135213.g6li6ufp3cosxoys@stinging/
>=20
> Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
> ---
> Changes in v2:
> - Remove some other config after comment from Nishanth.=20
> - Link to v1: https://lore.kernel.org/r/20250504-kconfig-v1-1-ab0216f4fa9=
8@baylibre.com
> ---
>  arch/arm64/Kconfig.platforms | 4 ----
>  1 file changed, 4 deletions(-)
>=20
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index 8b76821f190f..bf9e3d76b4c0 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -135,11 +135,7 @@ config ARCH_SPARX5
> =20
>  config ARCH_K3
>  	bool "Texas Instruments Inc. K3 multicore SoC architecture"
> -	select PM_GENERIC_DOMAINS if PM
> -	select MAILBOX
>  	select SOC_TI
> -	select TI_MESSAGE_MANAGER
> -	select TI_SCI_PROTOCOL
>  	select TI_K3_SOCINFO
>  	help
>  	  This enables support for Texas Instruments' K3 multicore SoC
>=20
> ---
> base-commit: e8ab83e34bdc458b5cd77f201e4ed04807978fb1
> change-id: 20250504-kconfig-68f139fbf337
>=20
> Best regards,

--=20
TQ-Systems GmbH | M=C3=BChlstra=C3=9Fe 2, Gut Delling | 82229 Seefeld, Germ=
any
Amtsgericht M=C3=BCnchen, HRB 105018
Gesch=C3=A4ftsf=C3=BChrer: Detlef Schneider, R=C3=BCdiger Stahl, Stefan Sch=
neider
https://www.tq-group.com/

