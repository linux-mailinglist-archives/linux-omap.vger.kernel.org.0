Return-Path: <linux-omap+bounces-4487-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE781B40C35
	for <lists+linux-omap@lfdr.de>; Tue,  2 Sep 2025 19:38:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 89A5956418C
	for <lists+linux-omap@lfdr.de>; Tue,  2 Sep 2025 17:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B29A534574A;
	Tue,  2 Sep 2025 17:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="KGjbL/sa"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54862345728
	for <linux-omap@vger.kernel.org>; Tue,  2 Sep 2025 17:38:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756834695; cv=none; b=M7q2kF1wKPQYNeq8l2bj754eqC5WicLgSbQOB9Nmfr/qEoOgD9ePAcMbirqTGi9q7JuHbyjAIuTfwWhotBROvWuqAjGZUaBQI1/LoI6zQALR7PneFFiVL7t8LWVd8MxlgYOGlMF8cV1Pt4A1jsDPGlhEhbeW8mjTl3EhP6hxCJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756834695; c=relaxed/simple;
	bh=2Z+f+tiHla+aQTQotpxacmkadlxYF0eoGoXuymRlJFU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iWVEKUjqWNZK84JNG2ZgMdtQmBJREmWIXlCZnOfNu18cEH/VmyjKgBQO7UUkOTEJfTDK8s5PXBoQRuScdP1Qg5QT3Z6NZnLIA8i2N2xy8DOkZl6kL0qt6Ab9MfkBUXEt/wiDsw7j/rGALoNEpNn0EE3DSb/e4GovWZeKYI5eK2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=KGjbL/sa; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-55f74c6d316so3087187e87.0
        for <linux-omap@vger.kernel.org>; Tue, 02 Sep 2025 10:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756834691; x=1757439491; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nMdZlkimpPBEuPAWoTrzN+8f/yVdz1IgzbjTh40gfDQ=;
        b=KGjbL/samYv4/OkvGoMgUDnKCAEL1eRn+Z/4Q5CLfcCSUXb8aLDVkHr1OdvUxTJvW/
         jUTSFn7k5s2+JleAC1kbRBTv1y9zYJnrwms9jN0bb/wM5nN71PHThc192SMST7tuB9Rm
         gyqRec8BjM6sgqSnfE3D7s9VQzrTuIWwIb7RtnCwIOfmpTRPHrodIkGuvCiZI6tw7e3d
         gAc6jzeGpg6xyZ9JxQqB8ai0vhCTbmoJhQ2CMu1fVYBhv1kXCTBfzwwsz15TLsPEjGvm
         5+DidMz1kd6+k1GQZ8ZAZQM/Z9nPN24O1kpCuObhGmzt6GPzxaspM8xlKrkN9F8m1W3f
         sfHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756834691; x=1757439491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nMdZlkimpPBEuPAWoTrzN+8f/yVdz1IgzbjTh40gfDQ=;
        b=oAim7DohOQW9ZEBitbuWskp866yOZCZSGhXqQGNqA6CZiRPXuYIJq0InWlK4FMRyUS
         fjGR6uP/jX+sknyX7STIpXvxsBnhpJ6sFLiP6FQ2tkg0Lb1IU5IbuPsrKNY9jwuP5wpm
         gU8790LKVyTiMv46egwd5vPj3mfk4g5EMX5+fndutqybc5f6wHkMTF2vYkEwH3Q061wK
         HbMsSKmW8dfLzVo3Yzhko0zfEF0D9c/+7P0YV6I8/HR1dQMjok1ndq8IpWZXZUOAOOkg
         OtZK8NpBXdLDJMyLVq+V88AKate28Siou07F+Pz/Zgo23dqckWHqS8Uxg7m9FpjqOlmv
         Mz2Q==
X-Forwarded-Encrypted: i=1; AJvYcCWYhsWleo6pTca16o4YRmMihQAmg/TWS6PqQQWGlWuUvBUN8uUl2+ws73BS/iZJG9KLspkD8KM9HB4A@vger.kernel.org
X-Gm-Message-State: AOJu0YzNZBGTudZoeGQwzVLU/wQ0lq6kTWf7laAwkxD1m0UPPPR5T/Sr
	kz/HMibz4Fi/tcBZVyfKjCuZxnXMnzaJtOk1QX33/a9Zr3dG1z5f0iLlQWyE3C9oZ9hV0hw65qq
	i9nzNEjGvKQXuunLS0/x7WbU4OsMf1BT2y0QS5qGskQ==
X-Gm-Gg: ASbGnctsn+Sp6VM3HvaHR01jk1BpMtbEkKiIC8Uxc9ijWurz3cC9QJhiKIpmpDmzeHB
	KwC679oWZ5St4MRUP7f1MI8CQQB5/rswh6/bZcx2Gt7Rk6NQxFqyzfKn0TPMbx3n1um1c1wEgW9
	BzIl1UDMJf0oioNmeV3ACec9g5G15FlNEZfkZB68oQrTC0SL7IbZBmBdx6yGCFn5Wg+NTKMj023
	LJzLoCQTbvY6MWHI5LCggUQE7ZvqOCEwPJg3Z4=
X-Google-Smtp-Source: AGHT+IFm+23zbyZl8sFvNScDe+I2YeYbDYPXFeVHpq8D0bnsdMaG/KEVvVZ9a/rq1R21K2fB6GO+UcDGweplkB3yAgc=
X-Received: by 2002:a05:6512:b01:b0:55f:6cbd:fc0f with SMTP id
 2adb3069b0e04-55f70566bf2mr4012228e87.0.1756834691121; Tue, 02 Sep 2025
 10:38:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org> <aLcDP36eEIZ_tqFv@smile.fi.intel.com>
In-Reply-To: <aLcDP36eEIZ_tqFv@smile.fi.intel.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 2 Sep 2025 19:37:59 +0200
X-Gm-Features: Ac12FXyPcmhwrJUG952loM2GHhwbaAf9Pg-CA5a2iq5iRb4akDGioSRihDizLT0
Message-ID: <CAMRc=McSpciZCCzhSRwDqUw-7qiqqQqNAqngSm5mGNefWBJinA@mail.gmail.com>
Subject: Re: [PATCH v7 00/16] pinctrl: introduce the concept of a GPIO pin
 function category
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
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, stable@vger.kernel.org, 
	Chen-Yu Tsai <wenst@chromium.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 2, 2025 at 4:46=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@intel.com> wrote:
>
> On Tue, Sep 02, 2025 at 01:59:09PM +0200, Bartosz Golaszewski wrote:
> > Problem: when pinctrl core binds pins to a consumer device and the
> > pinmux ops of the underlying driver are marked as strict, the pin in
> > question can no longer be requested as a GPIO using the GPIO descriptor
> > API. It will result in the following error:
> >
> > [    5.095688] sc8280xp-tlmm f100000.pinctrl: pin GPIO_25 already reque=
sted by regulator-edp-3p3; cannot claim for f100000.pinctrl:570
> > [    5.107822] sc8280xp-tlmm f100000.pinctrl: error -EINVAL: pin-25 (f1=
00000.pinctrl:570)
> >
> > This typically makes sense except when the pins are muxed to a function
> > that actually says "GPIO". Of course, the function name is just a strin=
g
> > so it has no meaning to the pinctrl subsystem.
> >
> > We have many Qualcomm SoCs (and I can imagine it's a common pattern in
> > other platforms as well) where we mux a pin to "gpio" function using th=
e
> > `pinctrl-X` property in order to configure bias or drive-strength and
> > then access it using the gpiod API. This makes it impossible to mark th=
e
> > pin controller module as "strict".
> >
> > This series proposes to introduce a concept of a sub-category of
> > pinfunctions: GPIO functions where the above is not true and the pin
> > muxed as a GPIO can still be accessed via the GPIO consumer API even fo=
r
> > strict pinmuxers.
> >
> > To that end: we first clean up the drivers that use struct function_des=
c
> > and make them use the smaller struct pinfunction instead - which is the
> > correct structure for drivers to describe their pin functions with. We
> > also rework pinmux core to not duplicate memory used to store the
> > pinfunctions unless they're allocated dynamically.
> >
> > First: provide the kmemdup_const() helper which only duplicates memory
> > if it's not in the .rodata section. Then rework all pinctrl drivers tha=
t
> > instantiate objects of type struct function_desc as they should only be
> > created by pinmux core. Next constify the return value of the accessor
> > used to expose these structures to users and finally convert the
> > pinfunction object within struct function_desc to a pointer and use
> > kmemdup_const() to assign it. With this done proceed to add
> > infrastructure for the GPIO pin function category and use it in Qualcom=
m
> > drivers. At the very end: make the Qualcomm pinmuxer strict.
>
> I read all this and do not understand why we take all this way,
> Esp. see my Q in patch 16. Can we rather limit this to the controller
> driver to decide and have it handle all the possible configurations,
> muxing, etc?
>
> I think what we are trying to do here is to delegate part of the
> driver's work pin mux / pin control core. While it sounds like right
> direction the implementation (design wise) seems to me unscalable.
>
> In any case first 12 patch (in case they are not regressing) are good
> to go as soon as they can. I like the part of constification.
>

I'm not sure how to rephrase it. Strict pinmuxers are already a thing,
but on many platforms it's impossible to use them BECAUSE pinctrl
doesn't care about what a function does semantically. It just so
happens that some functions are GPIOs and as such can also be used by
GPIOLIB. Except that if the pinmuxer is "strict", any gpiod_get() call
will fail BECAUSE pinctrl does not know that a function called "gpio"
is actually a GPIO and will say NO if anything tries to request a
muxed pin. This (the function name) is just a string, it could as well
be called "andy" for all pinctrl cares. This is why we're doing it at
the pinctrl core level - because it will benefit many other platforms
as Linus mentioned elsewhere - he has some other platforms lined up
for a similar conversion. And also because it cannot be done at the
driver level at the moment, it's the pinctrl core that says "NO" to
GPIOLIB. I think you missed the entire point of this series.

Bartosz

