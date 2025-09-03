Return-Path: <linux-omap+bounces-4495-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 99DEFB416B2
	for <lists+linux-omap@lfdr.de>; Wed,  3 Sep 2025 09:34:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF2617C0219
	for <lists+linux-omap@lfdr.de>; Wed,  3 Sep 2025 07:33:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAF6B2DA74D;
	Wed,  3 Sep 2025 07:33:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="or+O9yqi"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2D52D836D
	for <linux-omap@vger.kernel.org>; Wed,  3 Sep 2025 07:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756884830; cv=none; b=DFYZUCidBHsXX638UgSBkvpQaToMowA/YTyt+OMzRrJF37A+lTRG698CdMbInzqDP3wI5BGwiP8WeG9cSh5zOZvZbDvoasL6JQOm21QeFcPsREJJgwa4CQtPCR42MMwhd0PNQdHxjIGh9U5VvY05SVehxZbN1NGOSJFkp4wwnaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756884830; c=relaxed/simple;
	bh=YNYvzh/kc3+s5XJiH2jNySFaGPSj6mlg48FZqtmCTZw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ulj+FndezMFygK+VG8+DX5KmYKmUj9nRgRuBJ7hQfW19xW3re6obE/z64OffuEiJwOb3NOqwP7GEU4RfMo/wJeQIofXv/E/Ku5ETgCldDFOYadlaVkH8YJmbiZIQGJJN6KQE9XBG0+rB24c+9ojiY4I6GH+fkcJbO1fxAse+r/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=or+O9yqi; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-333f92a69d4so48037691fa.2
        for <linux-omap@vger.kernel.org>; Wed, 03 Sep 2025 00:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756884826; x=1757489626; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YNYvzh/kc3+s5XJiH2jNySFaGPSj6mlg48FZqtmCTZw=;
        b=or+O9yqi+Fme2yw28jrJWT8dtYwgRPniIwPzJq/SW1Nz+gCVTeyG6kXv/ETbj6pAhP
         PfQwrdCC0J8IPpaDld0dGTwBdTo8HgnCEkfxiGdnUigPylEtYkHH2IXCnVKHreljZ7Nk
         yHXifcsd/RJwRpJCpaQE+Sf2RjCLIX11vWitdQbTjymxY5bZipIdoVLk6nUFtZwlsSaz
         vVuiSathFGm9kWh20Hjen/wxlqVIDx0Hhapdh62TMS/Az+TzXdY6phHYf1p4+FACfmNQ
         a33uBd4f12xTbiEtFTsqIEUUIOQCbxgmPtVspR8B+qHxFZeR4C9svVPCUa/bD4YF8ja4
         SW7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756884826; x=1757489626;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YNYvzh/kc3+s5XJiH2jNySFaGPSj6mlg48FZqtmCTZw=;
        b=IPk8/VTkOUon3ZY1xL+b7GFe0s3QUql8ogZTeorpD4aG/FGRFSxofxv13uIXLPycr2
         XgjnHp/bPLyeWkYlo8z21FY4O14q/1BCk0ogaXFpkQClgcnJv8kEBsscS/2BXCyGweyw
         9gLP+WiL3EdxEZ2yBVAdeMNot1VNhrL63BjyJNIhcz0NyCETxzVq+3hvrxEeZJIXMNp0
         hV8dcRiZf/h06IdZA5gjnxY5KCBGlsAnOkJlEFyrocDVJUblaJvQhmdMtFJ39ivETEO4
         OgMM3ehXw6Sxaxbajcp1WWYKvjatVkwDHWHmPSYgQoyEJ0zx6DeXIZ96PBJpv6EJOenf
         HemA==
X-Forwarded-Encrypted: i=1; AJvYcCUa2dcoEP/LkwtkHGu1DxZDJwGgcOzZCC9Vh3ERQt39Xyuo9z8eU+esa2QTZLmOCWVTwfisTN+JL4wO@vger.kernel.org
X-Gm-Message-State: AOJu0Yylxo+FfCuoFS+HE1fSY+GKxsNsi+hetxu+TpVPHhQtvA9cKiSO
	XCMNp5o3a7sQ6bK0ErSvXIEDkWWlkF4gTtipmfqkXXLZHTV+Ii1H3J8Q3LCup7qJqkMgIz7EPLY
	TGALPUSkS1FEahFcDMDrrhBMMzsgStdILafgfYCronw==
X-Gm-Gg: ASbGncuVCnBmlU2vVW5dc+URoq5hbOVRfnqD8GJJA0CBHlWt+zCXfxQwel43cHwahoU
	H9rXiy8mOOvRX9ftxyvKMBKXnvK+OFAzOX5fpzpXptdMDmHhiB7m2pa3D367s5kFgIVjZaBc6Vr
	dywlnWXAh/ZUwmLjNIfvbz2vstFxpcEAmQu6CjqCzvWAf3TSAbRxIn77ApAcYjiipDABErW8KRr
	bGTWQ7yRoXEqFrAMQ/qKxZAcGOWuk4eskEH5w7lnnLVR+xtXg==
X-Google-Smtp-Source: AGHT+IHQMDojBvXdcYFr83Du1enPEHK0Ti//rRC94x6rK+6MbJgsPNbFLU1zOeSW5BOM5GJv9hHYWvwxYnse2nh/rU8=
X-Received: by 2002:a2e:a58a:0:b0:337:9e3b:895f with SMTP id
 38308e7fff4ca-3379e3b9b47mr24730131fa.0.1756884826262; Wed, 03 Sep 2025
 00:33:46 -0700 (PDT)
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
In-Reply-To: <CAHp75VcgaqnDrPH27wxfgyK6zz4RAKJQB0r7G2vbTONTxkEzTw@mail.gmail.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 3 Sep 2025 09:33:34 +0200
X-Gm-Features: Ac12FXwfTFesdkv2AsVGJLh1I6xBKdxxPYffotwRnf3CookQp3k-WXkxYMLzaTo
Message-ID: <CAMRc=MfhhX2NJ0fhhX8u+7=sdyUy0G27n7caGf9=TpHxUDJVxg@mail.gmail.com>
Subject: Re: [PATCH v7 16/16] pinctrl: qcom: make the pinmuxing strict
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Linus Walleij <linus.walleij@linaro.org>, 
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

On Tue, Sep 2, 2025 at 10:46=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Tue, Sep 2, 2025 at 8:42=E2=80=AFPM Bartosz Golaszewski <brgl@bgdev.pl=
> wrote:
> >
> > On Tue, Sep 2, 2025 at 4:38=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@intel.com> wrote:
> > >
> > > On Tue, Sep 02, 2025 at 01:59:25PM +0200, Bartosz Golaszewski wrote:
> > > > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> > > >
> > > > The strict flag in struct pinmux_ops disallows the usage of the sam=
e pin
> > > > as a GPIO and for another function. Without it, a rouge user-space
> > > > process with enough privileges (or even a buggy driver) can request=
 a
> > > > used pin as GPIO and drive it, potentially confusing devices or eve=
n
> > > > crashing the system. Set it globally for all pinctrl-msm users.
> > >
> > > How does this keep (or allow) I=E6=B6=8E generic recovery mechanism t=
o work?
> >
> > What even is the "generic recovery mechanism"? That's the first time
> > I'm hearing this name.
>
> "I=C2=B2C generic recovery mechanism" (I dunno why you put away the I=C2=
=B2C keyword).
>

For some reason it was displayed like that[1] in my client. I see it's
correct in lore though.

Anyway, what is your point? I don't think it has any impact on this.

Bartosz

[1] https://postimg.cc/7GFtxzzR

