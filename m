Return-Path: <linux-omap+bounces-3514-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 95C9DA75AF6
	for <lists+linux-omap@lfdr.de>; Sun, 30 Mar 2025 18:39:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C40361887A93
	for <lists+linux-omap@lfdr.de>; Sun, 30 Mar 2025 16:39:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0F381D7E5B;
	Sun, 30 Mar 2025 16:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b="WJxMleBG"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6904D1922F4
	for <linux-omap@vger.kernel.org>; Sun, 30 Mar 2025 16:38:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.117.254.33
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743352743; cv=none; b=mhLV51svPpHXj5lQp4/lwpXOUghGLjcHF3ox5PgtnIHGgWQa1zoYEElrbUaQwnkNpNkQYqTSxap1wxtV//P5FSpW2HTCBvtNKw+9ytT6He3FpTZOvW+oZydoQx30rCdhkE1H6+4tqbsb/8Zxnpa3TifK6Al+gk3bWSEyJIDc9Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743352743; c=relaxed/simple;
	bh=KWmaPEBCcVep6ivy67YpcIJ9fVWG8k2+ksMu4Ozutug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZBc7/JhptgOjWeXqD1STeWUrZ+1/9RJXW7fr6w1WOMUlxCNFAjbkc3t5OjR7Kix4/nAkUq+PEnJhrPpKbBNw2i5rU01M73Ki4WNZNcpPY/iK1z6JtqciePSBNDpXlyeFLovSwkmghrA+eAvCpPq/+s0+SyXzGcvxsaWZAdGJHMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com; spf=pass smtp.mailfrom=sang-engineering.com; dkim=pass (2048-bit key) header.d=sang-engineering.com header.i=@sang-engineering.com header.b=WJxMleBG; arc=none smtp.client-ip=194.117.254.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=KWma
	PEBCcVep6ivy67YpcIJ9fVWG8k2+ksMu4Ozutug=; b=WJxMleBGPIyk61eiSxjN
	6THuXQo5RXXvN63Bbd+EHVDh+TszFJcjZ3S2y2cINoiADEWeQSI93RsBZHrv+7Fj
	mLzL5qVZKkOuxNlo1g6LAd11GFbxvL0COskSO6qCfDFi0Fz3fGqfZHPxk3OLJvqN
	QxAHGYYiEpMNhZ0eODbZw2RXp28Zbpw5kOywhWnjsNxtzk0OF9uLu1D30UVeTXdx
	51rMcIzVuQdwSbpYHYPppo03a4e1AK1+1Y1v0kQk/LFIHTu91rj7jecRUk9Nr2Z2
	odzcZHIudGq432JzHlSi7dTgSTo4Hbh/C6JBHYasxIWkTeECeqJuc9CZSIZZt7ka
	9g==
Received: (qmail 923151 invoked from network); 30 Mar 2025 18:38:57 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Mar 2025 18:38:57 +0200
X-UD-Smtp-Session: l3s3148p1@3pSa8JExAK5Q8qei
Date: Sun, 30 Mar 2025 18:38:56 +0200
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	Alexey Charkov <alchark@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Gregory Clement <gregory.clement@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-omap@vger.kernel.org,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Rob Herring <robh@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@lists.linux.dev,
	Tony Lindgren <tony@atomide.com>, Viresh Kumar <vireshk@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>
Subject: Re: [PATCH 0/5] ARM: dts: fix faulty ohci/ehci node names
Message-ID: <Z-lzoCavFLmci1mw@shikoro>
Mail-Followup-To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	Alexey Charkov <alchark@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Gregory Clement <gregory.clement@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-omap@vger.kernel.org,
	Piotr Wojtaszczyk <piotr.wojtaszczyk@timesys.com>,
	Rob Herring <robh@kernel.org>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, soc@lists.linux.dev,
	Tony Lindgren <tony@atomide.com>, Viresh Kumar <vireshk@kernel.org>,
	Vladimir Zapolskiy <vz@mleia.com>
References: <20250330121326.9069-7-wsa+renesas@sang-engineering.com>
 <2d2307d9-6a5a-400c-b209-ae2b31ef87b6@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Vzh6KfJjgUUPaEDv"
Content-Disposition: inline
In-Reply-To: <2d2307d9-6a5a-400c-b209-ae2b31ef87b6@kernel.org>


--Vzh6KfJjgUUPaEDv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> You just adjust or align them with coding style or what
> bindings/dtschema expect (but it expects due to generic naming
> convention which is still just convention).

Ack, I will "fix" :) the subjects and add your tag. Thanks!


--Vzh6KfJjgUUPaEDv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmfpc5wACgkQFA3kzBSg
Kba8YA/+PD/rLwfhGQQYraav37Sl9h4EMPir7OzEK50nJ1QVdYIOm0KPE4sLNBdZ
id18ft+22rfs6F+u13xF4IEo+ON+8HS2HMoCZBZV+KD5xRt4q5dv8vpttcw/YvbT
3x8sCKi6psarTcko7SMM/eV1lcXQZTQ4cmP8A36rFDlXEkCju+wK9EFeYSDHa9oE
iu+7TXoAaGwmMLu3Qk3uUm0+MyQQQi3DvRzUAe/qW6C/Q3XQ8eUo0fDJxEgVaZXU
wL0A7Q2dmuOwPtyepwbQFLeqWJCPU1/87A0bIhxBoMX9R3yJZUWSyKmABHgnNXqr
ZeaNBSLeiZx43pz3XNHJU0l6fB6q/7x56EVEo+V0xW1whKzABP1ON6YeyEEewm/D
sZnH1ti1glAowUauFLPyp48UM9hJ3GAp+a8eZHl4CusS8wlkQbeY0p2h2uNmLLlB
j15qLBL5SGejbktjCM0ewbFLQGM1ybAzGtqk+j0OKwFUfz9L7440C3w+pfZZvOYx
Sg3HNArlrw4GfdZtHOTKT8RG+9CNGseLn3PEm+V5dQjKlQSDCFliudaMxqsw+dad
ec7nhjwjk09s0QNavm9oiyXZXbN4Ga9iv/nAfVe3n7rhHYFyrc9UquMdqIqb5bm5
KhQGd1mFaQg/XUFzGyoPGNrS4wAP8ZAbAfkiEXx2MYZnuXVETv8=
=8Dxu
-----END PGP SIGNATURE-----

--Vzh6KfJjgUUPaEDv--

