Return-Path: <linux-omap+bounces-4500-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 931E4B41C12
	for <lists+linux-omap@lfdr.de>; Wed,  3 Sep 2025 12:42:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 290C07A68B4
	for <lists+linux-omap@lfdr.de>; Wed,  3 Sep 2025 10:40:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD6852F2906;
	Wed,  3 Sep 2025 10:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="BV4WoCeR"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD48E2F1FD1
	for <linux-omap@vger.kernel.org>; Wed,  3 Sep 2025 10:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756896123; cv=none; b=b/D58m9MbdRi2CyYFytPTFcbUo30kTImAqaK5fcrnksZgxL9uFtGuQtHM/XURQkhZThzryqvqTlSMnbhnjGY8oqtAIKS35O1xUeaqng6BH7FKzDryrpsm/l2eSMWqqy3sCA7Z+bQNPVKYomdRs5pJDqqgko1Z2fFfN+V3oaqrbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756896123; c=relaxed/simple;
	bh=+DICLpeLEk5QfxI0uLHQeTK/2wiRnzmCNbLnrX8FqT8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V7S7xBEDBbiKqZ36e2aeAmeP3IWrfC2L8kEZOr8dqejHSRxSfjhTMN9xoEWH9YDvEmjbWMHD2ZqzAybqVNFWNTKs+jtgbw/qU46ntSSL0aCJB0p9zS/8BXCawmIhapIA5l77FKM/yed5xTKFEY2MfvExfHX88X/+y55jdud8rm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=BV4WoCeR; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5608bfae95eso562778e87.1
        for <linux-omap@vger.kernel.org>; Wed, 03 Sep 2025 03:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756896120; x=1757500920; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+DICLpeLEk5QfxI0uLHQeTK/2wiRnzmCNbLnrX8FqT8=;
        b=BV4WoCeROYKdQuKpCa1r003pTpktSC1V7lni02NcoYC3rvp7k1FdIKQBLijhH2IQuh
         qvvGsA1EsEDAAeLSXGiZMg4VN6RZXSyh7ZlaZOhggAD6Kr0uJBZwQx7ze3VX7CJJajlT
         /eq4ENgdMjESRfpjuHNyhjYoTQn7viq5zjxrYvB2UmH8XItqzOGkS6HkGJRPFfNBYkE+
         XgV2DHgGjYdPvGcYGR+RVH6mRuJkld86DDgsKM2t9QySyPijh7RLkjLDz+jY85wn3MI3
         1oUOR39r8F6T84x2z2f8RHXLSC+G92S8xXgb3AQVaGaF8TqCAjuuzUy8lrO+7fN1jdHe
         SS8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756896120; x=1757500920;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+DICLpeLEk5QfxI0uLHQeTK/2wiRnzmCNbLnrX8FqT8=;
        b=RtaUefa2XynW0jK3V2yysXsdltj8tXzrblyps1aLtHtxrObC0/MeHm+5cFaoWa1jVr
         8s83HJ23zl0oFxUN8t5OLkFeEgNqlYkEzlAvx0veXcI4qX+mZF8b+lDO4WiVcrFhdnnd
         3uw1GvbEhCS3KTPyUGPSmyfyosNfKkMaR1v6/hoEgDLEBzG1h3zSt3+OFZ7mzw6FIXxF
         /eedMnV2zImheXshq4QICBuyCUWvEgVQ8egfrFCOoOrAqeM2zZ/gcNGTnKNd9p7nw24a
         ChKjq6F4/x57LNObwPP/sCuZ/wyr/tA2Z/nVXqwuW6udAjiqV4LTSg0L/Dr/8me0J7Gs
         21aQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLIhz0QWaUTb2pMCBdf8WycEXSqRnlYh40JPOIGgKVs/GzXWyM64vYNxZ+NO5ckWT23MvzKG0t9uit@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp4Ls7VdUJPx8iNfTaf5HoT52Ew5zXIbCivIgF7LaLTj9aglGn
	yA9TdjAzXgazD6pYqLd5oWeWXzg5txfR32Y37rkUanbTiEUaEnT0LRKHHxkYo42lQ+ZsjDsHr25
	psngjy3wwY/uz0NuJKmCnYyUVetSx7IlnwuqNfwGtgg==
X-Gm-Gg: ASbGncte6j1OvuTIZwkAcXPO4Bv+zBHLHyTL2bfAYtmplaCRbxrXBeqPA8QqUVPV9bP
	2DFQvtF6uC7BU5Nm1EHMLs0wnqzSrq1Ofvqlo2x4pQ1oJP3WSltI2w7Toi/ccClgEvufG3MtY0G
	+2KzMJrNBOOPcVX17JJyhPwv4gX3ESzk9CEALSVRhYYBYg6iza1WbdDra4hnyTfuwWnQqBQHvch
	XYCd07RpgfjoHzkwXCBG3jJEB+JocG2t7EZbqw=
X-Google-Smtp-Source: AGHT+IG+m7ivvcbSy5vEIztmUhS+t7hNv39lHZt0A7pC6ogTKWUtHExG+a5EtFY7oJjunqJek5PQQ93pvgc0Giy7D2Q=
X-Received: by 2002:a05:6512:2447:b0:55f:6adb:b847 with SMTP id
 2adb3069b0e04-55f708b1b9cmr3479644e87.13.1756896119817; Wed, 03 Sep 2025
 03:41:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
 <20250902-pinctrl-gpio-pinfuncs-v7-16-bb091daedc52@linaro.org>
 <aLcBcjvMbrxoDYoC@smile.fi.intel.com> <CAMRc=MfcFMgkNqWNZV5o0NxkAvxBTjC3vv56Cr98n0R2CkxuPw@mail.gmail.com>
 <CAHp75VcgaqnDrPH27wxfgyK6zz4RAKJQB0r7G2vbTONTxkEzTw@mail.gmail.com>
 <CAMRc=MfhhX2NJ0fhhX8u+7=sdyUy0G27n7caGf9=TpHxUDJVxg@mail.gmail.com>
 <aLgW7J-j4nn0u8uo@smile.fi.intel.com> <CAMRc=MdA21fwnamymG6YhqBjKDso_nJs_4xefPNONQNfEcPHXA@mail.gmail.com>
 <aLgaoivmBUgoeO6B@smile.fi.intel.com>
In-Reply-To: <aLgaoivmBUgoeO6B@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 3 Sep 2025 12:41:48 +0200
X-Gm-Features: Ac12FXzqWEtt2S2TE9mSxpi98I-TDCIBZvSibEo9i2pyKL48Vs1B0BzDGCeR2o4
Message-ID: <CAMRc=Me84OX=UEmAXxmwE8oOH=1UBsyHe-7XmU0c8a2gG9JnCA@mail.gmail.com>
Subject: Re: [PATCH v7 16/16] pinctrl: qcom: make the pinmuxing strict
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Alexey Klimov <alexey.klimov@linaro.org>, Lorenzo Bianconi <lorenzo@kernel.org>, 
	Sean Wang <sean.wang@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
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
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 12:38=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Wed, Sep 03, 2025 at 12:34:00PM +0200, Bartosz Golaszewski wrote:
> > On Wed, Sep 3, 2025 at 12:22=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
> > > On Wed, Sep 03, 2025 at 09:33:34AM +0200, Bartosz Golaszewski wrote:
> > > > On Tue, Sep 2, 2025 at 10:46=E2=80=AFPM Andy Shevchenko
> > > > <andy.shevchenko@gmail.com> wrote:
> > > > > On Tue, Sep 2, 2025 at 8:42=E2=80=AFPM Bartosz Golaszewski <brgl@=
bgdev.pl> wrote:
> > > > > > On Tue, Sep 2, 2025 at 4:38=E2=80=AFPM Andy Shevchenko
> > > > > > <andriy.shevchenko@intel.com> wrote:
> > > > > > > On Tue, Sep 02, 2025 at 01:59:25PM +0200, Bartosz Golaszewski=
 wrote:
>
> ...
>
> > > > > > > > The strict flag in struct pinmux_ops disallows the usage of=
 the same pin
> > > > > > > > as a GPIO and for another function. Without it, a rouge use=
r-space
> > > > > > > > process with enough privileges (or even a buggy driver) can=
 request a
> > > > > > > > used pin as GPIO and drive it, potentially confusing device=
s or even
> > > > > > > > crashing the system. Set it globally for all pinctrl-msm us=
ers.
> > > > > > >
> > > > > > > How does this keep (or allow) I=C2=B2C generic recovery mecha=
nism to work?
> > > >
> > > > Anyway, what is your point? I don't think it has any impact on this=
.
> > >
> > > If we have a group of pins that are marked as I=C2=B2C, and we want t=
o use recovery
> > > via GPIOs, would it be still possible to request as GPIO when control=
ler driver
> > > is in the strict mode?
> >
> > Yes, if you mark that function as a "GPIO" function in the pin
> > controller driver.
>
> How would it prevent from requesting from user space?
>

It wouldn't, we don't discriminate between user-space and in-kernel
GPIO users. A function either is a GPIO or isn't. Can you point me to
the driver you're thinking about or is this a purely speculative
question?

Bartosz

