Return-Path: <linux-omap+bounces-5309-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B09CF04B7
	for <lists+linux-omap@lfdr.de>; Sat, 03 Jan 2026 20:05:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 36F42300764B
	for <lists+linux-omap@lfdr.de>; Sat,  3 Jan 2026 19:05:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8384E30C617;
	Sat,  3 Jan 2026 19:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="atupu6XD"
X-Original-To: linux-omap@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2660A21507F
	for <linux-omap@vger.kernel.org>; Sat,  3 Jan 2026 19:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767467099; cv=none; b=UwPilR+jLWe6NrXsB/scakpk5SFVOsqSsVlYFHkr3s39Ffvc82rC2SRGEWCUulZ2EvEtZtM1t2W9Zf8hS1zWrnDAEzBGoS1UOqneTeXCLybku66PMziY3kJqElFbbUGgStSaUNiOIRmqviqDMsi2VzeI4HEV7xPtFbBitT6Qk/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767467099; c=relaxed/simple;
	bh=1ocYjoxF+BmL+4lAR0aruV6XJ3WNgsR/AMGWfp36r6k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=egMnh118MMR1+KRWm71V8PsJWycthZPelvtihpgYVnjdCKvQjm70TzbZm5hcq7try4emQFItuM+dJ39rjrWyvFO8+wL7CXgNa0P0lnfWkqwkemz6S3gV+HTnzf92+xxBAJ4TCEXbjGNbxu0aLtIdorNyV8yYT6F7u9mF8yDOWWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=atupu6XD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3955C2BCB1
	for <linux-omap@vger.kernel.org>; Sat,  3 Jan 2026 19:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767467098;
	bh=1ocYjoxF+BmL+4lAR0aruV6XJ3WNgsR/AMGWfp36r6k=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=atupu6XDFP7652PVUmPfZud6aDwhqa/ShrQ05Y5wN5/LaENexfNbtOJpU21SLDuad
	 /JrplqpISURr8E0EFo//+aQfbu0WpIEwBnc//lv7Fk6eSisrxTDRuDyHClC57/KLhe
	 /PeqMO9Ar+QLK45G0k5H6a3Ht7wKy9LTSU5M2GIFfjkpUqRd03FbSazoqC5cxl5Uts
	 atpvL9HfSGux6SeoYUEWTVxQH/JAnmUVCSzk3JlV1e2aeGlSW3Za+5BPso5xXwwaiI
	 728xCJ9TWLDA6INS8x/bI26MpiCFM8uxprYdwhOvarojhbHJ9H3MaoLuaeZw8MBQUv
	 VllevLzEnt6Zg==
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-787df0d729dso101952417b3.3
        for <linux-omap@vger.kernel.org>; Sat, 03 Jan 2026 11:04:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUfGkddtYBBKw8BAbW4IQdoDA9xfj2UFpLpY7z/5Iz3tdlbkuj9neu5mcBZA7SUOOTvqEf9BohAYUjr@vger.kernel.org
X-Gm-Message-State: AOJu0Yxea5ThdlZ2TCteaiH4+i059awgeElrhW80tN0OJlmhFwYrhTUZ
	JP1Q6J5DqRze33iXaDc7FTAwlts73iQm9ma8Ep0CED5LlT+pfUoIyQrFA0X5RzgPPnFrxpVZ8ay
	aLUnGeOvTT6UQzEffEZbBq2Ux98smcvs=
X-Google-Smtp-Source: AGHT+IHbZhHaHEdWDQjutRDr8SPOwbSZ030Zf28/79XflrWl5n95Y1lTs89sR/aKwmdnEx8TvadlNTwYTO0FXJaNx3U=
X-Received: by 2002:a05:690c:c93:b0:78f:a7aa:b67e with SMTP id
 00721157ae682-78fb3e6370amr383069257b3.0.1767467097982; Sat, 03 Jan 2026
 11:04:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223-i2c-adap-dev-config-v1-0-4829b1cf0834@oss.qualcomm.com> <20251223-i2c-adap-dev-config-v1-11-4829b1cf0834@oss.qualcomm.com>
In-Reply-To: <20251223-i2c-adap-dev-config-v1-11-4829b1cf0834@oss.qualcomm.com>
From: Linus Walleij <linusw@kernel.org>
Date: Sat, 3 Jan 2026 20:04:47 +0100
X-Gmail-Original-Message-ID: <CAD++jLn+vWZ=BrHEcYLDVKkOjt8W7NcVziYgFkeyoC7ZBYHOWw@mail.gmail.com>
X-Gm-Features: AQt7F2o3USLd11IPN75yO0DWWTRzw0lHx5hiKCrp6xftEOAkEo84jaNFImuzgt4
Message-ID: <CAD++jLn+vWZ=BrHEcYLDVKkOjt8W7NcVziYgFkeyoC7ZBYHOWw@mail.gmail.com>
Subject: Re: [PATCH 11/12] i2c: nomadik: set device parent and of_node through
 the adapter struct
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>, 
	Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Vignesh R <vigneshr@ti.com>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Janusz Krzysztofik <jmkrzyszt@gmail.com>, 
	Tony Lindgren <tony@atomide.com>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Patrice Chotard <patrice.chotard@foss.st.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-rpi-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 23, 2025 at 11:05=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:

> Configure the parent device and the OF-node using dedicated fields in
> struct i2c_adapter and avoid dereferencing the internal struct device.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Provided the overall concept is deemed sound:
Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

