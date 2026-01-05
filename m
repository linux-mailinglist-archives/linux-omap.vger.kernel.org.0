Return-Path: <linux-omap+bounces-5318-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D034CF3DA3
	for <lists+linux-omap@lfdr.de>; Mon, 05 Jan 2026 14:36:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8E41B30D1869
	for <lists+linux-omap@lfdr.de>; Mon,  5 Jan 2026 13:29:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C0A14221FAC;
	Mon,  5 Jan 2026 13:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="zWlEz8la"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 899181EA65;
	Mon,  5 Jan 2026 13:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767619771; cv=none; b=Uab1CuVNVQRBdTXwvkNUSrh7WKeX6H6BoiqxxyO72LQhb7dnuJmtfv+q6cQhbUxG49bs6XlW84zMWVc+HOz78QrgbTZgAoPvbV4xXQcYuF8vRfKQRqv/KX3S+YwVtQqav1xyjdbnoyGQsB1JkSJLbqN1OvkhBVeFuPwz7Eesr1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767619771; c=relaxed/simple;
	bh=vBH8JiDwfiJDYGHofFIugWOXfNcExW4sl5x9m+iuBd0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mmKwA1m9EVgMYAsx457gX8IjWX3FxTZbm5+wdxloRhwUov9g8HbdhuEJt+TrlV22zvxZsvJWHWACjUtGQ2PuxALBQBgzPX0Q3n6SIb9+0wp7uIC2Nxk1QuWQIenKl9spwTOWMvUEUNRfCszluB4gyYZ/ET9CCD5Lhka8xQcrTiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=zWlEz8la; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DBC061A2659;
	Mon,  5 Jan 2026 13:29:27 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B150660726;
	Mon,  5 Jan 2026 13:29:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 151E9103C853F;
	Mon,  5 Jan 2026 14:29:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767619767; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=A25N/ovUP2MHvVztinoJtar+/xH5m7o0FxJt+cbAiJY=;
	b=zWlEz8lauLrlfKOdjwLtu+R/e5LfaPkXffKoJuVQockemAiEfhdesqIPTCLmmDGmKEMTMA
	dEgo9B1gZTCdlC3hKBPGO33dvTitQdhxLWx8OkIq2ZdcOEJ08iV8itblIN+IuhkgVPyRiC
	vb/qzME1CWDQJtyu/BE4CRq01AdUK1QmoCXNwhDndk0X1BDVdOI08QKBRBdxQfGfmMnzMi
	yyd9gAz/FQMhIycTe4taqOMXTTPngzf6CJ9lmtGRiyVN3LcDyneCayXcsJoyhEgCuplaBI
	qoucejN/+Ji5fp1mmOc4ydwQnfKmq+h2vqIHanN0zRlWC39YwZeopxjU9zcdhg==
Date: Mon, 5 Jan 2026 14:29:23 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: thomas.petazzoni@bootlin.com, Tony Lindgren <tony@atomide.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Enric Balletbo i Serra <eballetbo@gmail.com>
Subject: Re: [PATCH] ARM: dts: Drop am335x-base0033 devicetree
Message-ID: <20260105142923.15746579@kmaincent-XPS-13-7390>
In-Reply-To: <20251204092346.1076836-1-kory.maincent@bootlin.com>
References: <20251204092346.1076836-1-kory.maincent@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On Thu,  4 Dec 2025 10:23:44 +0100
Kory Maincent <kory.maincent@bootlin.com> wrote:

> From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
>=20
> Remove the am335x-base0033 devicetree as it has been non-functional since
> 2017 (Linunx v4.14) when the ti,tilcdc,slave binding was removed. The HDMI
> output on this board has been broken for over 8 years without any reported
> issues or attempts to fix it, indicating this devicetree is no longer in
> active use.

Hello,

Any news on this? The devicetree author acked the patch so all lights are g=
reen
to merge the patch.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

