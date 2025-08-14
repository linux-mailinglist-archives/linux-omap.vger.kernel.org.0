Return-Path: <linux-omap+bounces-4219-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67059B25DC0
	for <lists+linux-omap@lfdr.de>; Thu, 14 Aug 2025 09:42:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EF9C9562956
	for <lists+linux-omap@lfdr.de>; Thu, 14 Aug 2025 07:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CCA226C3AE;
	Thu, 14 Aug 2025 07:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Ffdl5HCC"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DC5E26CE0A
	for <linux-omap@vger.kernel.org>; Thu, 14 Aug 2025 07:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755157064; cv=none; b=dSLhudtVA9/TeVOCs8HtTBLbuBbJHOIDM4AcUG7tLeW0KM9VrfqHzga1sl2tr7ogRcdz3ZIQB5Iur7HWc0G6ksfH3zx2TFOXgqe3rm7Fer0PexnYAUI9e8aDK0eLmBD4JOO5e4t/xAPy4EI4FW7Zk/gix709gtTyMcSZ+woeGZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755157064; c=relaxed/simple;
	bh=i5bV8DJtt0kW/7rs56nYtMMFUHI8Xh3Xhpcajvy4BqQ=;
	h=From:In-Reply-To:MIME-Version:References:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ryfazzt1FVXFSOIJhRfh6dNT/zOSCWD66APGn5Pkj50kIefxq9JQ4YoWCOcVrk6ZSBZcr+eme7E9qJ0Jh8eO9qg8xa5rkI+7k3JaWZITi907OtvZtqpEhDMlN2oCR0FX747rOY7/zi7dGtVftQ/lTeM6GGgGOJnLni0a8+Wo4Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Ffdl5HCC; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55ce520caf9so716136e87.1
        for <linux-omap@vger.kernel.org>; Thu, 14 Aug 2025 00:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755157060; x=1755761860; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=E6lyA0E3BsgF3c0Firp9DhkX0QGDczU/GAUF9m624y8=;
        b=Ffdl5HCCGlAiRUNmG1lYFJKGkgMtToqwAeEYQf5+4P/qxIQiURoMJ9Xtdbefw7Dc5f
         1W85T8Myuj2S2CDVmdltB5SAXfKh2kXcA/dJYsLTuGPX8oqhNhVejPNDs3HIjN0BZb4p
         uiXe4VlZzueA7tukLnZDF6MYmxwneDSOquseRNWYdGufEJR0P37xMCrdIm8VEelePI95
         aQxtrxpfKs1m1rM5LFc/eL7AY2Zxw3B+kydWS1bbAwXdsxxWUgd72DTOtW5+fzee9+fy
         rtyO/IP7Li9+iU9VVyzrfRzNORUxIBmILWE3XvUqRMIAuzqRwcLre35Dn6IZAhm/fPfh
         F2Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755157060; x=1755761860;
        h=content-transfer-encoding:cc:to:subject:message-id:date:references
         :mime-version:in-reply-to:from:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=E6lyA0E3BsgF3c0Firp9DhkX0QGDczU/GAUF9m624y8=;
        b=G+64VJSC6Y6/hq/vSJp9lFjW0oMJrvmkdu3oF2W3WCaFdz9GrHyixPVU6AS2jH/fnG
         wFquuiP5M466JirPH5XLj+2WQP2SfgItXIJGejjEaRc6rhF5xXYtaBmc6D/rBhuPKs/9
         jpG/lXhRBtr0Z0BwjBZKQrwzRI9CXC+cDiVuugXe8c0NZe0daL9hr6PQxL55TghaS5MY
         3uRQcWxh9wyZDz+oluETvnzT36Gh1pHIC1EzyIxh9UzFvz12ArdIByjB3eXLqU7aPtOC
         /6yAzsZsJTrNkRpBpNVmoQmFIkeGSpF6zf11x7nNJafnnU7rwAffm6F8GX5VuNTHpFlX
         OyXg==
X-Forwarded-Encrypted: i=1; AJvYcCVdMkI5cRlORpO7qEagJlIEf1zzgd7C6LP1ZEfmtPdQwDTHPvtxCMw9CcVPVR/TbtoXzEqIoXRpdJKR@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6jfxY0zSbSrD/Oz6j2P2m4Hx8B9fCPwCopTmNlKby1Hgr5ujf
	RZzFxcceVRSORsgDrqhzy0EEnu/cI64/pI2gnIKmIskBI1Z6mcKe8z6nmjWyRZKcJVHCqlE/kNL
	Rh1Lrf0JqdWyKco6Q+ZMokYQgYNxf8kiwiTE3gPtOmg==
X-Gm-Gg: ASbGncv650JHBvlM5r7z1h7RXJToiowdq5KjcQux1MXQ7Om+yaf9HJySjcRPn1I5A6l
	yauyMCgvKJI+rzMoaKn2VmYVE9zEqDfUdW+aOBRv1cGnd/OX/M0KTAQj03kehYMMKxgewABn/T0
	NGWOFJOmT+eq/CtT7vyO7z9Gi3JRCJIp3xUKlOD/xLBX5oLGenZ0R+I9S/Yx6CDIYFPc11gXwtW
	WL3ns+yZmT8LdMA0Irrn5IqqC6zgzP7TDc7+MQ=
X-Google-Smtp-Source: AGHT+IH95og7bwOhUuHKkvwv0kTue2EveWatnb0pXZcfIY30oh+DnenMVeGiemPUTLNRulqOQX9vjsDh8YkJvs9r6SA=
X-Received: by 2002:a05:6512:3d29:b0:55b:8f02:c9d0 with SMTP id
 2adb3069b0e04-55ce4fe3984mr762477e87.0.1755157060157; Thu, 14 Aug 2025
 00:37:40 -0700 (PDT)
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 14 Aug 2025 03:37:39 -0400
Received: from 969154062570 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 14 Aug 2025 03:37:39 -0400
From: Bartosz Golaszewski <brgl@bgdev.pl>
In-Reply-To: <CAHp75VeSA=AYDKOV5XQ5nnz7EZRmnhbbVyJrcBUcMO2LrRMTmQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org>
 <20250812-pinctrl-gpio-pinfuncs-v4-3-bb3906c55e64@linaro.org> <CAHp75VeSA=AYDKOV5XQ5nnz7EZRmnhbbVyJrcBUcMO2LrRMTmQ@mail.gmail.com>
Date: Thu, 14 Aug 2025 03:37:39 -0400
X-Gm-Features: Ac12FXy2K4h4wcbTuyQHNLoBpmiM4n8vonnKvWP5_H1uDnS85jqeBZjb-G5DXZs
Message-ID: <CAMRc=MfzSq+7EY8cV+J_AePve6r+yV5QEHqG=Z2N8Afmy+Bc2Q@mail.gmail.com>
Subject: Re: [PATCH v4 03/15] pinctrl: airoha: replace struct function_desc
 with struct pinfunction
To: Andy Shevchenko <andy.shevchenko@gmail.com>
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
	Danilo Krummrich <dakr@kernel.org>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
	linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 13 Aug 2025 18:57:00 +0200, Andy Shevchenko
<andy.shevchenko@gmail.com> said:
> On Tue, Aug 12, 2025 at 10:27=E2=80=AFAM Bartosz Golaszewski <brgl@bgdev.=
pl> wrote:
>>
>> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>>
>> struct function_desc is a wrapper around struct pinfunction with an
>> additional void *data pointer. This driver doesn't use the data pointer.
>> We're also working towards reducing the usage of struct function_desc in
>> pinctrl drivers - they should only be created by pinmux core and
>> accessed by drivers using pinmux_generic_get_function(). Replace the
>> struct function_desc objects in this driver with smaller struct
>> pinfunction instances.
>
> ...
>
>>  #define PINCTRL_FUNC_DESC(id)                                          =
\
>>         {                                                               =
\
>>                 .desc =3D {                                             =
  \
>> -                       .func =3D {                                     =
  \
>> -                               .name =3D #id,                          =
  \
>> -                               .groups =3D id##_groups,                =
  \
>> -                               .ngroups =3D ARRAY_SIZE(id##_groups),   =
  \
>> -                       }                                               =
\
>> +                       .name =3D #id,                                  =
  \
>> +                       .groups =3D id##_groups,                        =
  \
>> +                       .ngroups =3D ARRAY_SIZE(id##_groups),           =
  \
>
> Can this use PINCTRL_PINFUNCITON() ?
>

Yes, it can. I'll update v5.

Bart

>>                 },                                                      =
\
>>                 .groups =3D id##_func_group,                            =
  \
>>                 .group_size =3D ARRAY_SIZE(id##_func_group),            =
  \
>
>>  };
>
> --
> With Best Regards,
> Andy Shevchenko
>

