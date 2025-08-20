Return-Path: <linux-omap+bounces-4275-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC94B2D494
	for <lists+linux-omap@lfdr.de>; Wed, 20 Aug 2025 09:13:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BFA564E0132
	for <lists+linux-omap@lfdr.de>; Wed, 20 Aug 2025 07:13:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 311832D481D;
	Wed, 20 Aug 2025 07:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u+nFfGdZ"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1552D47FD
	for <linux-omap@vger.kernel.org>; Wed, 20 Aug 2025 07:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755673985; cv=none; b=t+GbI0smAGS33jwTJ36Oyv209yiz1mD0Za7IAQKB+jSAaj9n9Xe1I6teHiHuuDeobeWP5X7zHa/j1xNty2LnOVOo14lBykD4mrbSBqBFu4fUhrwqmmoQazrHPuRbjF6azLYr41c69yZZbzsuXmloGsxXsBZT7i8lxhEMs06zcGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755673985; c=relaxed/simple;
	bh=c5+S/1Gf7ZsoEnmy+5rJrXdwibFww9JCyR0LQDM420Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BOI/QzvtSaMibV3DdFcXkhLHx5fzgSVTXwlTuOq9jE59RmXvKu7ySQ4MM2fGyggKX2wwOEO0p945wq9J3rus3UJKqtbZcq6f6efb5oxH3Lz069epPZ05JG0ewYIGgYX3I2YFHevxdIaoBrcu4UweN7avZpmi+eo9n+DRMX+h3XA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u+nFfGdZ; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-333f9160c21so44973081fa.2
        for <linux-omap@vger.kernel.org>; Wed, 20 Aug 2025 00:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755673982; x=1756278782; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S2fgjYTxYjXy8UMOqphDGxwyeF/52vWVWRMlWTcUmd0=;
        b=u+nFfGdZWm2upyZ8H8Q/1YeiqrdWui+lZFdVlGkny+R3i65205+6S5Ibzk6sevqvgV
         4rb8JHRMYClP/cJ23SQUKqMuTE29Uqb1DX8u21fcy4o4x6snD6BxvMzhrPIVGK2Lm+Nc
         oXDYLXx+/51/qtJWoWAYJQCrNgWTHAB1PtK30KrDJzVxEQR7WZQQ/ydXZjYow5wdFRWp
         mblnL7SnWhAFef3QbfiNmMhy0IEK1RwIbimvt3zNOyKoTyJdEeKH4EzOt7/YYLBa66U0
         yqRbk7ufFn9mj2IrpOKCtgpBmd8+eF1uo1icxjl3Ft8G34HtRw1e2DLievg2aGr6EY6i
         zhaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755673982; x=1756278782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S2fgjYTxYjXy8UMOqphDGxwyeF/52vWVWRMlWTcUmd0=;
        b=CHcCO/5h27CjJuTNem33rVoCcjroiPARZ4MLJPQ0wJsg5OQRcFkYBY2Mjrlfv3hEgx
         5P98FS7nobc4RSBS/TxJcvaKB+QoRG1Xk5+MRcBCCDtwtkNOgEksZFKNXSGALFiB9hST
         4oLPyV3G2eGO1AZzE7Q0595jPpd88d02jmuoSOEYHvZUOljK97ikMDH1ZRpThb7sjizh
         jWqtlROwm2JpF8gYf7hCRLtcf1cSt1SfPttYojkt0MrgxUmKtvswpSN6uLdQBIQ11bmC
         LziWk95B8FnKW+ee3VrVLj86CuSi0fk/+Bn5r7z5J5qWs9HupHTd5SwokZ3xfVafWyPF
         EOWw==
X-Forwarded-Encrypted: i=1; AJvYcCVBNblAqUWQ3gf+JHNu3l7jM2+lqfXQ6msPLgZoiMhcKUmlAXZuAX/9N7Kal5ynk/GEBsyZD0jtwo8j@vger.kernel.org
X-Gm-Message-State: AOJu0YyPO8M2JmbB5yHaVAx3EJbBSHAtEVnlGsjaY/XWVkwo9MIBT0C6
	hZFH5InHUHklZ272JVwsN+nbASnp8DZJIwUbLcCXhcUq+9XXE6fm1mMlFD9sU3/hxpohUCUB9VS
	eP44hDWHor4fDnkmeGk4b6f4hYT6u0tueW1rGy94caA==
X-Gm-Gg: ASbGncuv154+dHt21k+ejho0wjfX1Rt2Y/xeRCwCen64m4l2a5jLtVJ5N8g4imusjAp
	nfK2vvPLV9kYuU2oJTpNDH0delqUgU0222oVIfEHBKUIZLhUCYuSpdLI5wg0HH7DNVdGfRpj3dA
	nelbxf9w5wKO2SoBSeUbSQwgw7LUefOC448aT500DKbuEGFXj6wAiqeO3GhEyDsQ22dbwGjSHAP
	VUEb6Gio7qo
X-Google-Smtp-Source: AGHT+IF6EyOC5NaF9ylfzmvC/lF+XZ8ruNEnYsDF5O1GCCUBAqJgipnFljpMN/OqbECQRkpVCXWcXHbvMHeyWEs8R7M=
X-Received: by 2002:a05:651c:41d4:b0:332:45e8:3aca with SMTP id
 38308e7fff4ca-3353be058demr4837631fa.19.1755673981615; Wed, 20 Aug 2025
 00:13:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
 <CACRpkdaDGmdhaik+1saRv7Ts4myQ+tg1aQqGU3xQyT7ma8dJFw@mail.gmail.com> <CAHp75VephepLq61HrVy=PX2oKUQd5NK2qS-vOC5h_NR65td3Uw@mail.gmail.com>
In-Reply-To: <CAHp75VephepLq61HrVy=PX2oKUQd5NK2qS-vOC5h_NR65td3Uw@mail.gmail.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 20 Aug 2025 09:12:49 +0200
X-Gm-Features: Ac12FXx_mHZvAEY3OP5MA3Uo1ED7cgPY59m1esPAFUlhfqgk9BLjcKH2xKwqp3I
Message-ID: <CACRpkda4soRCLF5=W=6R4wnwT3pjk743j022XfJxjTTQzuarAA@mail.gmail.com>
Subject: Re: [PATCH v5 00/15] pinctrl: introduce the concept of a GPIO pin
 function category
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>, Bjorn Andersson <andersson@kernel.org>, 
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
	Danilo Krummrich <dakr@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 19, 2025 at 8:31=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Tue, Aug 19, 2025 at 4:02=E2=80=AFPM Linus Walleij <linus.walleij@lina=
ro.org> wrote:
> > On Fri, Aug 15, 2025 at 11:09=E2=80=AFAM Bartosz Golaszewski <brgl@bgde=
v.pl> wrote:

> > >       devres: provide devm_kmemdup_const()
> > >       pinctrl: ingenic: use struct pinfunction instead of struct func=
tion_desc
> > >       pinctrl: airoha: replace struct function_desc with struct pinfu=
nction
> > >       pinctrl: mediatek: mt7988: use PINCTRL_PIN_FUNCTION()
> > >       pinctrl: mediatek: moore: replace struct function_desc with str=
uct pinfunction
> > >       pinctrl: imx: don't access the pin function radix tree directly
> > >       pinctrl: keembay: release allocated memory in detach path
> > >       pinctrl: keembay: use a dedicated structure for the pinfunction=
 description
> > >       pinctrl: constify pinmux_generic_get_function()
> > >       pinctrl: make struct pinfunction a pointer in struct function_d=
esc
> > >       pinctrl: qcom: use generic pin function helpers
> > >       pinctrl: allow to mark pin functions as requestable GPIOs
> >
> > I applied these 12 patches as a starter so they can
> > stabilize in linux-next.
>
> Hmm... I'm still sure that we don't need to have a separate flags
> field, but since I am on vacation and will be able to look at this
> closer next week, I can't look closer to it.

The qualcomm 32bit platforms fail in next anyway so I dropped the patches
for now.

Both you and Bartosz are on vacation so let's let it rest for a week or two=
.

Yours,
Linus Walleij

