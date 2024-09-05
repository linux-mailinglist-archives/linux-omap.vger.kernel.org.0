Return-Path: <linux-omap+bounces-2115-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4622F96D4AC
	for <lists+linux-omap@lfdr.de>; Thu,  5 Sep 2024 11:54:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A17DEB25DDF
	for <lists+linux-omap@lfdr.de>; Thu,  5 Sep 2024 09:54:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3851D198A01;
	Thu,  5 Sep 2024 09:54:39 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 425F3156225;
	Thu,  5 Sep 2024 09:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725530079; cv=none; b=s1AcnxTIg2ENzeHneuMVspAYQI+rddR7koJ4Qrn6nVMmcdFH4l5CExYkWXuvdO2Uek8ULt+QEKFm36TTJNrBq+AGBkitadxMBNr6j3YnHkcUtmXvSFioUXqvqby57SAkaWhixCBpXWY0k2Vml5S/5OlnhX3gaIhKerMJo2LNk54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725530079; c=relaxed/simple;
	bh=CUa9olPq+AXLi4yjiXb01U/wLckCsRjgHnbju1lATbU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dpTyvv7VFiF2oikL6AQZXm2XyRsKttXd0c6GoJHzd7St8AM9wJrem4CIremoulmfcuQSi+NtW4oseZLzhSlrBOMd3xvF79bap8ajsZwjUg2Qx7M0AfKQPwEEcn3GouzHe4aFZcL7doX43FPXdunk9NkdJCpRKk7B7fuFGc8bQxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6bada443ffeso4396757b3.0;
        Thu, 05 Sep 2024 02:54:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725530075; x=1726134875;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9diqHcpO/aE5+LW5NeGeZFj2mzo73WZhkkRkkfun7eI=;
        b=M1HTyFxbpjnPYDI3A/JNE0D8snsSsYfr1nvHirSeGzggQyUWiHWhDHgQbBMR0nhbRM
         rPAsjyzoD3V+NLkcvORuAb307h0NIsPpeEmXUxgIkTXK5JdnNkKcsOYWHsXT0A8vdBQ4
         P5zBiX8cw58BQwGU3b5WYl7S8xQFDBy0o+DxPmxVeHdNEjj+WWtsjmbZ6iffrE5RkmOr
         IkL5KhbzeVqML+t5aCgkU6ZXdpn9bn3uOilb0XNKu9HQevRcOcyVWVWF7u9KipIMR0OI
         dcweto9rhs5L2C0h69e7jvWJKId/cHPeXC1vVZh+3OkwJMUuYJfuMJhP+HCI0wBTCnAx
         o56A==
X-Forwarded-Encrypted: i=1; AJvYcCUgqWR9t4BDpHtQaPVwAHowEB7HdJxkXBWer8ycxavO+meLYbPNwDGJ+6SkRaGFMNgHgj+2OOxxfyFr1w==@vger.kernel.org, AJvYcCUmT5M7BWOMJ2S6kPqMMdF9Z5p6DzHtPlFkDK6dIVQyHTKVWjHy9wb2L/3WXAbyVEcAXKfwqmdSpX1T@vger.kernel.org, AJvYcCV7xPJNbHwm2+hAQnqVl/L9gvMfTN0maTtZZO9NukNaA4Be3LDfiydRExgkQIiex1KG12TOzF9J7R4g@vger.kernel.org
X-Gm-Message-State: AOJu0YzsYNSXebRCxJ4+OrfxrNr8b2+TCtftXvme40Bl/nVDMlmA3TFK
	j+ntgh0GDSMrbiypTZvc1LSldPcPewBM+ZSY7gen4ViJe44TbZjSxGwiu7Tw
X-Google-Smtp-Source: AGHT+IEzYK4ChgIxHWbhgm2ro+sorU+2H3iZkR8YMryr4b8JZNEdrnuoBKcjn+OvwexdjAbRDL+Srw==
X-Received: by 2002:a05:690c:6609:b0:6d7:3c0d:3adb with SMTP id 00721157ae682-6db25f5584cmr44724317b3.1.1725530074818;
        Thu, 05 Sep 2024 02:54:34 -0700 (PDT)
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com. [209.85.128.179])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6d3cdc309e8sm24561847b3.108.2024.09.05.02.54.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Sep 2024 02:54:34 -0700 (PDT)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6db2a9da800so9476767b3.0;
        Thu, 05 Sep 2024 02:54:34 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUqUKjy6DUI1ht02qGIbB/iWY87KwdcLHPPMSudAonGUbnIbpxTFsjBetqNuE+vClnBHeMEbsGrirpD@vger.kernel.org, AJvYcCWSma4OzrIedxesHP8LCUSlZvJfj/c8DxOxXXuoMLUhXDQhTE8hBg6zz4kZfZj9Zo2yv2xQYeAJjQ95JQ==@vger.kernel.org, AJvYcCXAZvOj2aE3RUBs8FdfCzYs/2nnjg+Sm6rvl6xxf4tWvTp5QZGL1SeKokNyLm0RH1mUE3dCoV1hscrC@vger.kernel.org
X-Received: by 2002:a05:6902:1785:b0:e1c:ff8a:68f9 with SMTP id
 3f1490d57ef6-e1d1056a277mr4589641276.11.1725530073994; Thu, 05 Sep 2024
 02:54:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240213105730.5287-1-tony@atomide.com> <20240213105730.5287-2-tony@atomide.com>
 <CAMuHMdXZTmn7R8GQWAMFL_9C+VGu4SDfFuMN-8MJmi0AbPMx-g@mail.gmail.com>
In-Reply-To: <CAMuHMdXZTmn7R8GQWAMFL_9C+VGu4SDfFuMN-8MJmi0AbPMx-g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Sep 2024 11:54:21 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWb56RdBVOWysOm4CMUrsA85tk2Du-RNrMQA_Danv05ng@mail.gmail.com>
Message-ID: <CAMuHMdWb56RdBVOWysOm4CMUrsA85tk2Du-RNrMQA_Danv05ng@mail.gmail.com>
Subject: Re: [PATCH 1/4] clk: ti: Handle possible address in the node name
To: Tony Lindgren <tony@atomide.com>
Cc: =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Tero Kristo <kristo@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andreas Kemnade <andreas@kemnade.info>, linux-omap@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	Paul Walmsley <paul@pwsan.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 2, 2024 at 4:03=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
> On Tue, Feb 13, 2024 at 11:59=E2=80=AFAM Tony Lindgren <tony@atomide.com>=
 wrote:
> > In order to use #address-cells =3D <1> and start making use of the
> > standard reg property, let's prepare things to ignore the possible
> > address in the clock node name.
> >
> > Unless the clock-output-names property is used, the legacy clocks still
> > fall back to matching the clock data based on the node name.
> >
> > We use cleanup.h to simplify the return path for freeing tmp.
> >
> > Signed-off-by: Tony Lindgren <tony@atomide.com>
>
> Thanks for your patch, which is now commit 3516338543cafb65 ("clk: ti:
> Handle possible address in the node name") in v6.9-rc1.
> This causes an early boot crash on BeagleBone Black:
>
>     ti_dt_clocks_register: failed to lookup clock node
> clk-24mhz-clkctrl:0000:0, ret=3D-517

I found the culprit: after the move of .dts files to vendor
sub-directories, I had updated my boot script to:

    DTB=3Darch/arm/boot/dts/ti/am335x-boneblack.dtb
    if [ ! -e $DTB ]; then
        DTB=3Darch/arm/boot/dts/am335x-boneblack.dtb
    fi

I.e. I missed the "/omap" part, causing the install to fall back to
an old DTB file that no longer works with modern kernels.

Sorry for the noise.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

