Return-Path: <linux-omap+bounces-1646-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6C3923900
	for <lists+linux-omap@lfdr.de>; Tue,  2 Jul 2024 10:57:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 475AE281031
	for <lists+linux-omap@lfdr.de>; Tue,  2 Jul 2024 08:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FF87152534;
	Tue,  2 Jul 2024 08:57:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="glwt1H6g"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE2E0150993
	for <linux-omap@vger.kernel.org>; Tue,  2 Jul 2024 08:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719910637; cv=none; b=TcTePjv4WY3aNNu6LL5RwE2WAQ4HAPyTukaPve0lcD+LVJ2oQnxsjNIOqqezMvl7pPTQEmEL5A9nUIDCt0LHq7uGkTrzm/4pepQkBUpyz62OZXE/9AxGrlvE3MUlnVoSkXOdHSHcX48/llLy0foimPuQI8VNWw+ukVHNE0Xd580=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719910637; c=relaxed/simple;
	bh=lQNWMHSAHhi1B2REf6bXB44AOtjzCQUTtwwc1XnHiu4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fx4n/SxE4dNR43gNEqgZ490EBdHwwT7qoUXy2bDyHTwDcFg7N/14ftSVleo1c7gsuj7R3v8S1/yxpUchfZlVrjRtMKUkIho0O65jJiZ8udE3nfGx3jYzqSWQ1MkQGJwjo7Ao6OVmnAJ7fLcvRSivI+NE4STG4KhFTfY1hVcgQB8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=glwt1H6g; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ec3f875e68so43600621fa.0
        for <linux-omap@vger.kernel.org>; Tue, 02 Jul 2024 01:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1719910634; x=1720515434; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lQNWMHSAHhi1B2REf6bXB44AOtjzCQUTtwwc1XnHiu4=;
        b=glwt1H6gEHz5G7Wnt7RTnhGCqk5JZIC88aU+612xeTQ6wk6987komrereM13fpQuFw
         DnM3gWpGvivvrkmaVkZqjw8iQJMRiyL5bY2JlsfTg/sM/01DZXoZR6xmrnh1+cSB5zqI
         wsfe8xel4I0LhUKd6/AFreXDxAZnRqLVMcToFi+bCN9n07eOD/0x1TPiL2u+yYnWMxlf
         7kG098AIf2R+T9LJOtND3GOT2eZBBQUs0mjMgxScReV6q9Er2dv8wbfkAAu3VE9TdV3Y
         xJd+TqCnpltgchQuCl9btbMOFI36sdKBHC9/UBtE7oG5sFTS6Jge7euCZ005F0NnqXAX
         f41A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719910634; x=1720515434;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lQNWMHSAHhi1B2REf6bXB44AOtjzCQUTtwwc1XnHiu4=;
        b=s7sKv7Ary1TpiTz58iwANRM9kWMzWaHpnggZup5bOyC/hZOTn/I5OIrtiq6BkfhXEC
         zDLlbZeZiimM4UA+Z9yzyShsIVVfGQ65pb/bSkSBJfdnF1X6oBLv0i+NUJXzuLvGUxyj
         F5Rkl2QDyj1jcyk0yVS4r7kOI+lcW2sfJYYLTQ3YJ0nl+852DtwvTb8Yv1eZzJrBK6kd
         d2cgpXAC+MkFkA0Ez7vmpkMMWahOCbAHpdgGPZdlmyxF4hQEvE2YLEeZbLbhlO+Flm+i
         LIzn+lhua8joS4iKBLkHYhVM7WJzk0cJ+MhTJp9jCNrqVyYRFzg0dxfB6EkDi0V7YQFt
         4wzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKpqRLXFzxMFRdTyB3be7GT0e8XwcEsuhVnpdm43/KQ8/4yAaTlhnWS3TR6rzywZP8t5a7WSrjwI/+wsIg4+/ejZmss1d9E7R/fg==
X-Gm-Message-State: AOJu0YznLgWyGVD3GvDzgTJCHdn9DhdrgDzQ4cNjjvfmOVX1Iw8rvUj+
	wLElJqlSolM5lWCUiAZUrLU6fg+/C/OClyi28tCHRXRuep5/syTr0z2ZCr2Jy5A7Y5lpJCSovNK
	nBeV8g1YqhxaeaXRMfbXGZlW5l34GeHRPOA1Slg==
X-Google-Smtp-Source: AGHT+IHo5eEIsVu44pGpnRevjVwA1ZpOtmw6Mmmn4Q+VHOJCxnzpE8v3YnPOHaBgvtoU17z7s4obBrZVrOf9sLuZILM=
X-Received: by 2002:a2e:bc06:0:b0:2ec:1dfc:45bf with SMTP id
 38308e7fff4ca-2ee5e6ba584mr55892571fa.42.1719910633934; Tue, 02 Jul 2024
 01:57:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240701-b4-v6-10-topic-usbc-tcpci-v1-0-3fd5f4a193cc@pengutronix.de>
 <20240701-b4-v6-10-topic-usbc-tcpci-v1-9-3fd5f4a193cc@pengutronix.de>
In-Reply-To: <20240701-b4-v6-10-topic-usbc-tcpci-v1-9-3fd5f4a193cc@pengutronix.de>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 2 Jul 2024 10:57:02 +0200
Message-ID: <CAMRc=McP=K0jSD56JdCR9DPJmJN39Z74mjAo0qX2mEnTBN1GAA@mail.gmail.com>
Subject: Re: [PATCH 9/9] eeprom: at24: remove deprecated Kconfig symbol
To: Marco Felsch <m.felsch@pengutronix.de>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Russell King <linux@armlinux.org.uk>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Vladimir Zapolskiy <vz@mleia.com>, Andrew Lunn <andrew@lunn.ch>, 
	Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Dinh Nguyen <dinguyen@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, =?UTF-8?Q?Jonathan_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Huacai Chen <chenhuacai@kernel.org>, 
	WANG Xuerui <kernel@xen0n.name>, linux-mtd@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, 
	imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-tegra@vger.kernel.org, 
	openbmc@lists.ozlabs.org, linuxppc-dev@lists.ozlabs.org, 
	linux-mips@vger.kernel.org, loongarch@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 1, 2024 at 3:54=E2=80=AFPM Marco Felsch <m.felsch@pengutronix.d=
e> wrote:
>
> All kernel users are shifted to the new MTD_EEPROM_AT24 Kconfig symbol
> so we can drop the old one.
>

Nope, with this series arm64 still selects the old symbol.

Bart

