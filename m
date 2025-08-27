Return-Path: <linux-omap+bounces-4359-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDA0B37A21
	for <lists+linux-omap@lfdr.de>; Wed, 27 Aug 2025 08:05:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2B5996854E2
	for <lists+linux-omap@lfdr.de>; Wed, 27 Aug 2025 06:05:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0088730BBB1;
	Wed, 27 Aug 2025 06:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b="KVP4mbjA";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="AWlqQm+C"
X-Original-To: linux-omap@vger.kernel.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCCA229B02;
	Wed, 27 Aug 2025 06:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.104.207.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756274734; cv=none; b=gqrvCvbrZy2Iws29/spbDtdwOCnjkw0V2EkElFOOQ5OHWudtPVUs3pl0RZQu+z05ezyhXLO47iscXzskZWxoWOc/OUVgCOkQvFc6VU+lB+Ib9C6SX0yR50csf2lzEoIyjHaR9uldq2WxJgpzGUSquzpX8wQek445s8Lme0i0zVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756274734; c=relaxed/simple;
	bh=X/XL5E08GrftlL+vyyezmGTt2F2l9gPi40UF6aXVRlE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=paE4YEyd9oo83XfFYTGEx+MpYx7fNNHzayH/zCYWGuiYkI/ke7M0mML3esFvXVpul6Ey1JbQGcbDPl3O/JuW5yiyHqWU43vuskP6SOev4R6z4G5qrKCPzf+fedw9Ah1W8RdUKcBJqZ7SXupdm1k5R9FGDRGRAXJexXIHNNT/slA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=tq-group.com header.i=@tq-group.com header.b=KVP4mbjA; dkim=fail (0-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=AWlqQm+C reason="key not found in DNS"; arc=none smtp.client-ip=93.104.207.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1756274731; x=1787810731;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SraBzl14dwdbvHczbRUzFku/OVp3S46NSQS1cFchqxs=;
  b=KVP4mbjA0magKnYLf3fmeKCiEVEdvB47VIfJXUgp6MCzU9xnOrsS58l2
   m3lYVydooD7yU5ivpi3VoRrKI4MtOw+Pe8Fb18TwZWcsfCWbAEB+p2mto
   6c06iJBlrx7aoVEIwvDBgTIgSElPgorNAjT8pkyYkbr9hjBzdL807TN90
   5kGzhW9fCCLYIBdbD1N682fblXFTkbuCrzEwWg0JLgRThGdRkfyVGpPSw
   ypKmpOisQR84+vyM5yQLLBaImdCBMbMNNX8lx++/5yoEov1SCSmsuFqBE
   TclhAiBaejF4pUbN2Sq0t1gL1Yag8siqKoCnf6h4U9vE6HSsfJqnbaZWj
   g==;
X-CSE-ConnectionGUID: SDgzamR3RQmgXXCz5aX2Qg==
X-CSE-MsgGUID: MrdUEKDRRQKnJpKpqV61Qw==
X-IronPort-AV: E=Sophos;i="6.18,214,1751234400"; 
   d="scan'208";a="45925398"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 27 Aug 2025 08:05:27 +0200
X-CheckPoint: {68AEA026-5A-20CAA7DA-EC9DC758}
X-MAIL-CPID: 6C356AE48836A2E580B12F91A4067FD5_0
X-Control-Analysis: str=0001.0A00210C.68AE9FE5.0046,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 41C3A1683F7;
	Wed, 27 Aug 2025 08:05:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1756274722;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=SraBzl14dwdbvHczbRUzFku/OVp3S46NSQS1cFchqxs=;
	b=AWlqQm+CFJeSYIsWKAJIQm61kglEr+AKrBrogd2SjDn8vzSHAo4g4oP8WjHwdSvPfXqDBw
	d63N7AhrCfAsuUhshYC8cr3ytWeYnO6OBykHL+FpcKFxLdqpwohQ4u+tzwe9EkkXw/kN3Q
	D++iSd9ILRXjWFqJtRVit5kT/4AxFWJf2HIKgAJWqMpZF+6lr+2KEIAdS1j38nKt/ZxDW3
	vjcE2udcegM7hINzEmiu6z08HCeMaEtLCJo1LunQe8X4QLuzg6fX1onFMMq6VCqK+DkXeS
	29gQE4jBbhgtuGhVZP0PR4bRJbK3mfHkqpnac7bqvA3C5ekSD2JpES8x1ujxwA==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ARM: dts: tps65910: Add gpio & interrupt properties
Date: Wed, 27 Aug 2025 08:05:21 +0200
Message-ID: <3011247.e9J7NaK4W3@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20250826134259.2564191-1-alexander.stein@ew.tq-group.com>
References: <20250826134259.2564191-1-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3

Am Dienstag, 26. August 2025, 15:42:57 CEST schrieb Alexander Stein:
> The binding document ti,tps65910.yaml requires the controller and
> cells properties for both gpio and interrupts. As they have const and
> fixed values a default can be provided for all users.
>=20
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  arch/arm/boot/dts/tps65910.dtsi | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/tps65910.dtsi b/arch/arm/boot/dts/tps65910=
=2Edtsi
> index a941d1e623280..161ce31085d1e 100644
> --- a/arch/arm/boot/dts/tps65910.dtsi
> +++ b/arch/arm/boot/dts/tps65910.dtsi
> @@ -10,6 +10,10 @@
> =20
>  &tps {
>  	compatible =3D "ti,tps65910";
> +	interrupt-controller;
> +	#interrupt-cells =3D <1>;

Meh, this should obviously be <2>. Will fix in v2.

Best regards,
Alexander

> +	gpio-controller;
> +	#gpio-cells =3D <2>;
> =20
>  	regulators {
>  		#address-cells =3D <1>;
>=20


=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



