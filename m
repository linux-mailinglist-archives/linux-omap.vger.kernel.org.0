Return-Path: <linux-omap+bounces-4471-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CEFAB403AB
	for <lists+linux-omap@lfdr.de>; Tue,  2 Sep 2025 15:35:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBA7016DD49
	for <lists+linux-omap@lfdr.de>; Tue,  2 Sep 2025 13:34:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FF5E31A06F;
	Tue,  2 Sep 2025 13:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Pqx7oMJZ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF6231A07F
	for <linux-omap@vger.kernel.org>; Tue,  2 Sep 2025 13:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756819788; cv=none; b=EWl7IM+of+FXbJXU4tNMbjEs+Dl450dNgoMAQO1Bss9bmBmlGSgq6/c/OjG3ikU4QN5Bt7i55/uTFh0xuN3JceK2R0LtiZir6Rj6LHVUYKN/4nEtSy3dCwMRoMdWWEamvK03l/H2phEiK3AEJodUFw9UqRUCc0iw7lU3Yt31hiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756819788; c=relaxed/simple;
	bh=3QlkS9Ed9gmuv+futXyyIrRTd0WcKtKmub0+uBCFWn8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rwHmqcvecZ1+f2HOVJxZ9MYSilS4Bwuu9dbMhmXc7wcQs79uQAxXpNyUbdIOt2tByjQR6JUe0mKHVltGX3jSBaVM1h8mpQE+ZJPagDKrgvjUnBiZaS6wHuPFYmk93OwB16FWQAwUT5eqcj251b67mBgjVHL8aOVjhQ/UAb6RB+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Pqx7oMJZ; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-56088927dcbso59623e87.3
        for <linux-omap@vger.kernel.org>; Tue, 02 Sep 2025 06:29:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756819784; x=1757424584; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jZCKJv4aYcw+dSdOw+40akoqTFv6AX+SyMdRpV8+ksQ=;
        b=Pqx7oMJZ8qmUS++jRYyyhqdtBvKrDhz7thM/sP/AIUqNiNpmHftLPYJhhVme284dqw
         RAdtqlFKT7FrZ3Rz1GX8xhGW+BBM2QY5VPYjbSIWJuspwmGwceeFVM3b2ynGB3qctMRL
         idvbLeA23uCw893n0faRQHAcJdXUOueZbbg3Q1uyM8rjLhN9n/JEH56hN41R7v0yIyE2
         VfSbUISln8Tf8hmVMNHM2iy6fBq4WeSjxD4NMa2DBCpLD6n19eKlCuCMmEPLAedCr82s
         sQQm6i+QzNXR90VfLxaQp7REQlM9F3sBlV2+DmLu5DACOk0Vfg9QLZB7yUEkwZJVmSA1
         mNzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756819784; x=1757424584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jZCKJv4aYcw+dSdOw+40akoqTFv6AX+SyMdRpV8+ksQ=;
        b=cpqmqoGmtIbVCORvHGiihS1ClJEMPZg+CR+5tCVMkmfq7s3PaXCHnHC1uLUP51Deq/
         SIZwWWR1xGihRZUslAMY6eOre+3mpYuiVlFz+EI92QWBjk0dHXdyXFcm7lCYvAq4+WWK
         khdKOG3ioGraMUBxUui+21mT395g0XUfr07F3I47ky9ihZqxT0u5xcoXhB4ezTXbrfoX
         K1A55KEkPgEukgQg/D8A0WeN5c+4w6j8w9aVaHxdh9LJJcFF1t4X5S8C8wXaWGp6Rfla
         GwDBBbXcZPaonDIopOu5hCWzjPD/bkFM+/x6fQsd+JQMWtyClN2cc434jYKw5Egd0OdK
         LYLw==
X-Forwarded-Encrypted: i=1; AJvYcCWWUUODeaJS4MhfIQ47ktUHkb2lAg84CKto7c1TKRfejHxpSmnJD6P+a4CfFoD6KH14Vi+Uijal/T4b@vger.kernel.org
X-Gm-Message-State: AOJu0Yw14loeVhK4j5fg567NTmIujPEfcdfiKf1FcRv5UIUMUt1gVbSx
	X5YPPXSxcPwjPN0ZmQsFMKRxs5UGmKcBqB5cdh3PZ+Z/4x1LaQlBndXuE78CcAgTrZoQeddL6Lu
	Wkta1dp+4iU9pu1TSIr3HAmT7M5Bof0yK/HOjax6UyA==
X-Gm-Gg: ASbGnct+reiP+3wcpjOFxIUASJeBuaAe/ZePCLjELjzdbtJGVbCFG/CcJbcbAboIfug
	xTdBGDW/LO8Q44k3Uf3kUM1PWDWeZwZbqlKjO6wfXpd9+PXHzZTS1a4BfFlqVeSt4CDE76Vty4u
	F1wKdO6rDsZt8vpm2FCSpbsrm7CRxujTnEzsJv2baC+sjaut/lYVjFQ5ONVmKpe0mReJV5Zj9gC
	qRaNIV7Kn/NeMWE6GZhNRrpN8P0RTgAf6KwTbNLKTVXjKzUAA==
X-Google-Smtp-Source: AGHT+IEokI8/QdZgrQf6Khw+qmZIKYKiiUgjGe2BsWGspCY5PLtcBEV9VcspomwVXiAZN5jhrLGIGNRfYpYegqH5QMI=
X-Received: by 2002:a05:6512:6512:b0:55f:4760:ffc4 with SMTP id
 2adb3069b0e04-55f709953admr2780344e87.29.1756819782757; Tue, 02 Sep 2025
 06:29:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-1-bb091daedc52@linaro.org> <aLbrz5DYS5Yxx_UE@smile.fi.intel.com>
In-Reply-To: <aLbrz5DYS5Yxx_UE@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 2 Sep 2025 15:29:31 +0200
X-Gm-Features: Ac12FXxptM2x0FIw3VzAD9gZWlHPceo9WcRvgcocpGcthnkDE6yjXmv7vVmpP9U
Message-ID: <CAMRc=Mfx5czDM=vfEYhFtVO3MviYaW4wKBYjGZ9ZnMbr-+T4mg@mail.gmail.com>
Subject: Re: [PATCH v7 01/16] pinctrl: check the return value of pinmux_ops::get_function_name()
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Alexey Klimov <alexey.klimov@linaro.org>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@redhat.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
	Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Tony Lindgren <tony@atomide.com>, 
	Haojian Zhuang <haojian.zhuang@linaro.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Mark Brown <broonie@kernel.org>, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-mips@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-mm@kvack.org, imx@lists.linux.dev, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 2, 2025 at 3:06=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Sep 02, 2025 at 01:59:10PM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > While the API contract in docs doesn't specify it explicitly,
>
> So, why not to amend the doc at the same time?
>

Because this series is already big as is. That would be another commit
that can be separate.

> > the generic implementation of the get_function_name() callback from str=
uct
> > pinmux_ops - pinmux_generic_get_function_name() - can fail and return
> > NULL. This is already checked in pinmux_check_ops() so add a similar
> > check in pinmux_func_name_to_selector() instead of passing the returned
> > pointer right down to strcmp() where the NULL can get dereferenced. Thi=
s
> > is normal operation when adding new pinfunctions.
>
> Fixes?

This has always been like that.

> Reported?

I mean, technically Mark Brown reported my previous patch failing but
I don't think we do this if we're still within the same series just
another iteration?

> Closes?

Ditto.

>
> ...
>
> >       while (selector < nfuncs) {
> >               const char *fname =3D ops->get_function_name(pctldev, sel=
ector);
> >
> > -             if (!strcmp(function, fname))
> > +             if (fname && !strcmp(function, fname))
> >                       return selector;
>
> I would slightly refactor this:
>
>                 const char *fname;
>
>                 fname =3D ops->get_function_name(pctldev, selector);
>                 if (fname && !strcmp(function, fname))
>                         return selector;
>
> >               selector++;
>

You can do this in a subsequent patch, I prefer a smaller diff personally.

Bartosz

