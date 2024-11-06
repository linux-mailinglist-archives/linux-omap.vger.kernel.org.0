Return-Path: <linux-omap+bounces-2597-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 893369BEF4D
	for <lists+linux-omap@lfdr.de>; Wed,  6 Nov 2024 14:43:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EAB51B23EA9
	for <lists+linux-omap@lfdr.de>; Wed,  6 Nov 2024 13:43:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D74241F9EB3;
	Wed,  6 Nov 2024 13:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="VTWXeJw6"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36C61F9EA6
	for <linux-omap@vger.kernel.org>; Wed,  6 Nov 2024 13:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730900572; cv=none; b=D2RlG4V+V/kmkxlcytbjGaWn3cKZp3hNEnT87vBNu57bJ8SDIdmj8RGcZ7nee8Uq0IkMGvW2USm/yhQnhK/qkg6nn09osmuAhzVCKrqIUWO7A2+Qsg+U9YbGe8l0et0AVmgHUsQ3d040AfKELbDxe55B2luCQJbtz8Ov5pXCBMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730900572; c=relaxed/simple;
	bh=KeBTnd9dk1BPL5p+cp+YTLVoAgKuRdIN2zFZaIO++7Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=CQDHC8+XKr2PfMUcmZST1V4ec9UnN9l2ZF+36xHuH5dIsRBlH3rA+eXPE2qzB54sZ/Q2CmHiZyQACRS1QqdH1Mg1Xz5+1sfDSEPhZRQlPOzZaqJOX0qldJ6lIXawNAo0TzTDzPGSpnM8xDkDb+gA2q+iKZJbo17sU2XddgkN9Xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=VTWXeJw6; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2fb49510250so68686711fa.0
        for <linux-omap@vger.kernel.org>; Wed, 06 Nov 2024 05:42:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1730900569; x=1731505369; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hqS6jiGSHPo4vOg4tSYtx/2BV3Y8RQyaC1jG/J2IFvc=;
        b=VTWXeJw6mbNZ8bex9PW+Lp3aRtx8hfpOkppBH8maLoO2RpYuuSoSu+D8l+VVc953MS
         kbedUxYefzlfNCG2rvtXKw8ziS+9D71OLh4xmuZvtp5V/cIltBNWtaFv6OJwiAteD6rq
         eb5JY90Q6wB9ISbMdulW6HnCXndv0JG6A5b0It2vZVi2K53p37lLDDlmZt5g+YVikXSa
         KiXvb3ZsQLj/6X3fgoECfFYYiHVHh9Lfhtijn3ttjHfKyYnb8gwH5H/LT8L8G9QSjo/4
         YEG6wHjEQDu9WM3H1FtolQIZ7UduIa8kkfcs0jf8VCCJvnXZsVv7yAjhy4SnI7O/g3Ml
         m4MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730900569; x=1731505369;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hqS6jiGSHPo4vOg4tSYtx/2BV3Y8RQyaC1jG/J2IFvc=;
        b=jvvQaYXDwMipW+he9qVvcBTygA2KZmRgk3fxx4tZidmJ9nAR6IO9YlzoCrvalVVDFc
         wXVW5+9Fx7D461NS5M+vcpiEFWjcv8LuLMdc3TfN433GHrR6MYv/Lg5pyBccV8bXRdrV
         dYXlpqTpsKsAOUR20WRCY518yTwOAjv+qZVMruDrdILlFEZo6A+josyv4ZItK+HbrPQN
         ozmBpLGb71fD8Ue3DHPnr5CJlUMkdDPx0LEY6hEJQ0+ZA4RDu/6g/3yQBctbjxSbqbC2
         cFB0A+sCSSmbg5kcDy8SiGKacjs624uPJHgntoD3sRvr+0v73Gl/DSTuSg+ga+lv5cH6
         D+HA==
X-Forwarded-Encrypted: i=1; AJvYcCXrNfub4iaxBWlMcXJpAHrhxqi5C7iTiK0KS28aQvAiartxgqzgRcw5NBIqMj3KT3rsz2Bb0zpr7J/c@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9jdiI0xHTxfwB8DsShRuVC0gsM9ae3My9earliTbCgvidm27j
	Q5r1yaADj/aukG5MLjHL7ztyegjIMCWRNZpWMKvwzApT4pLKvJVDltXzTbkzik/S3iAvmFQKnxc
	8krmb5zWiJetc2yr1Tyx/8joEINXLY9OeLecCaq0US0fYIVJHQcc=
X-Google-Smtp-Source: AGHT+IEHCVaQw8Cc2N4TDWFQRo6TwbO4VysfqY3eTkGEv36JhQCy52famljQArgTKiz8UVxsUufHkRMssP8f3wWEWhc=
X-Received: by 2002:a05:651c:50c:b0:2fb:8920:99c6 with SMTP id
 38308e7fff4ca-2fdec85890bmr110424251fa.23.1730900568922; Wed, 06 Nov 2024
 05:42:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241031145652.342696-1-jm@ti.com> <7h5xp7owmy.fsf@baylibre.com>
 <520c7e6b-f9c0-441f-8810-8e5ede668f6a@ti.com> <20241105190005.cg6dpeedbirgflqm@iaqt7>
In-Reply-To: <20241105190005.cg6dpeedbirgflqm@iaqt7>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 6 Nov 2024 14:42:37 +0100
Message-ID: <CAMRc=MexFELAEVpEg39teG=Yr-R71gwxRR9TtGDwHjVijzDeWA@mail.gmail.com>
Subject: Re: [PATCH RESEND v2] gpio: omap: Add omap_gpio_disable/enable_irq calls
To: Bin Liu <b-liu@ti.com>, Judith Mendez <jm@ti.com>, Kevin Hilman <khilman@kernel.org>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-omap@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 5, 2024 at 8:00=E2=80=AFPM Bin Liu <b-liu@ti.com> wrote:
>
> On Tue, Nov 05, 2024 at 12:47:58PM -0600, Judith Mendez wrote:
> > Hi Kevin,
> >
> > On 11/1/24 9:29 AM, Kevin Hilman wrote:
> > > Hi Judith,
> > >
> > > Judith Mendez <jm@ti.com> writes:
> > >
> > > > From: Bin Liu <b-liu@ti.com>
> > > >
> > > > Add omap_gpio_disable_irq and omap_gpio_enable_irq
> > > > calls in gpio-omap.
> > > >
> > > > Currently, kernel cannot disable gpio interrupts in
> > > > case of a irq storm, so add omap_gpio_disable/enable_irq
> > > > so that interrupts can be disabled/enabled.
> > > >
> > > > Signed-off-by: Bin Liu <b-liu@ti.com>
> > > > [Judith: Add commit message]
> > > > Signed-off-by: Judith Mendez <jm@ti.com>
> > >
> > > Thanks for this patch.  Can you give a bit more context on the
> > > problem(s) this solves and on which SoCs/platforms it was
> > > developed/validated?
> >
> > Sorry for the late response. Patch was tested/developed on am335x
> > device BBB, If you feed a PWM signal at 200KHz frequency to
> > GPIO, and execute gpiomon 0 12 &, Linux will be unresponsive
> > even after CTRL+C without these 2 functions in this patch. Once
> > this patch is applied, you can get console back after hitting
> > CTRL+C and then proceed to kill gpiomon.
>
> In addtion to Judith's explanation, when the PWM is applied to a GPIO
> pin, kernel detects the interrupt storm and disables the irq, however,
> without these callbacks, this gpio platform driver doesn't really
> disable the interrupt in the gpio controller, so the interrupt storm is
> still happening and handled by this gpio controller driver then causes
> Linux unresponsive.
>
> -Bin.

I take it that this is a fix then and should have relevant Fixes and Cc tag=
s?

Bart

