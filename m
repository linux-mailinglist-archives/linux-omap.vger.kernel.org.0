Return-Path: <linux-omap+bounces-5010-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 39553C727F7
	for <lists+linux-omap@lfdr.de>; Thu, 20 Nov 2025 08:05:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 3BFA12E4DC
	for <lists+linux-omap@lfdr.de>; Thu, 20 Nov 2025 07:04:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E9BD3009E1;
	Thu, 20 Nov 2025 07:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BC1dRrpy"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 180793009E3
	for <linux-omap@vger.kernel.org>; Thu, 20 Nov 2025 07:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763622209; cv=none; b=H3HsSrk4lijVAR/gQGfm62iLu2i3ZBLgZqfwuN02Z6Oqakgcb23hi7Bioz3dhUcM6KxlfxQ9AEmfpqwEBOCV7Koe5k0diGzPm9zyvclGxhanGrmuqJhkYqGQ20PBrtqWkpodT8R5LKqZ+30gzt1MPBfK+YJXkZA7RBZZedEU/E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763622209; c=relaxed/simple;
	bh=yWaDyoeVkfBsdzNbNQDJMpjz5f/8LqjkZB0jvU1mrao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=M7XLTa4IEZMN39iJxJDZS1UH7aetPMuSZyW5BEBHv+PzAOvw2VXRKsDsURTfZMwik0NEyd5YYjG3HKjwvMoQGMV8+63DlT+5rCLSzQpsjvRZC66yApl8QYTFPp7lDY0H+AU6vQGvouF6BvgyieYiBv2s/EoZ4Swy46BR5e04ksg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BC1dRrpy; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b73b24f1784so94871866b.0
        for <linux-omap@vger.kernel.org>; Wed, 19 Nov 2025 23:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763622206; x=1764227006; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tJJgvs/ZqyDxpPWXe/GBTfmOfPXUTk9veRBGRsYfnYM=;
        b=BC1dRrpy0cBJzBvNYV7CDMWO20o4v8qJh4M0occ2QWhx6g3imByjktwxgrA8NoT3qy
         Qx2Tuu7os7p6InukXZLgwxR/zQV8XsgXA+YNtH6THdnlomVW7zh5moLJBq47U73Hjpxu
         gtmiklWkJamdkMajGGK9Z6Z/5WmJCVLJ9cMnY09kJS3UJQjnSVbbngP/KohigyroCVU+
         sTvfTmcdTbk0rMMps0PeaZwNadpetxuOhIFq16EB1DQqMgulQYyfxZnHt00WkyzlLQvZ
         Y9SJox4gUODiQ4PFZJE0nyyieKuSwXdzQvPKI/RSJn4aLsV4QZpFHmgN22H64vEZmRwP
         pcCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763622206; x=1764227006;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tJJgvs/ZqyDxpPWXe/GBTfmOfPXUTk9veRBGRsYfnYM=;
        b=KlF27kPg05lVNxkQT/26767tBKDiS1kflwWbO9AesuWbGrN3lVulACONWfh7rkNEvj
         vDObkojwklpK9W6piynetquDCCFdmckkdqbgnL3qUg4ASKVUwXIGypllKCxnAiK8rztV
         JM9S5gQ/DOo8LMWaAKRAcoPanlcTx0B3mR7AmrFBbciS+hxXwzg6us8SIUko4QSeC6G9
         mvJ3IoxgKSkVLxvkmxsX7rUkeOSehNENv7lw58CgGS/J7NUSwnX1BcFrd6xBibVaR/vx
         w2AvZR2+h8XxHjvEvErdnS5cY0WaHNtvNYB/5hoLUGVkiB4AK8JvR1Pf4ash63tprPXL
         vbqw==
X-Forwarded-Encrypted: i=1; AJvYcCWVKD1JqlYyMdF+nlcMv0f51RLXbRSzpvFu+GLSE1xuOHhf/ja0ndvjQvMHz6Mv6YGqtYxLf38VLx6O@vger.kernel.org
X-Gm-Message-State: AOJu0Ywqg0YwG9j4pj2OH0Fxy1PZ4qUwMqGqwxAiVnb+r25msLsYqoAW
	pcQt53VPJ9JVDsc+JVY1N5lOzFlG3jEP8oZHOTX3l4xazsO5s8+Vw6DA7A7gKBBmj6HoX1dc74y
	OQ7Jpn7sJjtUhL5DwOMbaDb+Z1WFJBNM=
X-Gm-Gg: ASbGncubiupAGFKzuY5e/gL5JBt+sArGDHCvnshA6jcu57mXdUpUNLCuyv8f7KWN2gZ
	AZTYKRNyVk23w45KALC8JYMK225Di9jbXKgcqYo2MOYv9MwD069Yno2R1GXRpciMOATf3eWLrHE
	uuqZFg15e7mQ5Zq1Yol1zved/656Qbm6gQmZabvl5Xlu7/LRWV8uWdweiySBRRm5Fr/Yrkqow5s
	zNtLo3T5zQ6TgDFIeB2heYxd1eYZ1/gGSvI/jFWxwQcEUE2lijocU7M28EH5fWBNoQYzpMQ37/N
	uAmYP+4wXMZgW90ee5Z/mDMx7SYb+D4JWbbz+3Cj5qxLQygRmn+VJtTZehyyX1gQI3ZdizY=
X-Google-Smtp-Source: AGHT+IEA8GU353sKcnteGmKTMEBzbiCaPQJCce5ujMTjOBQ1mFHaCHAzcFHXEgsI1VWuM6dNVzZd0ZtPLCtRbzcDf70=
X-Received: by 2002:a17:907:7f1c:b0:b73:37aa:87c0 with SMTP id
 a640c23a62f3a-b76572b27ccmr132695866b.23.1763622206151; Wed, 19 Nov 2025
 23:03:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251119163327.16306-1-jszhang@kernel.org> <20251119163327.16306-3-jszhang@kernel.org>
 <aR4CLQ_2-kUM-e2F@smile.fi.intel.com> <aR5gpsbw_r-y4JdS@xhacker>
In-Reply-To: <aR5gpsbw_r-y4JdS@xhacker>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 20 Nov 2025 09:02:50 +0200
X-Gm-Features: AWmQ_bmQiILHNoGbrxHaQiqyqVXCGmcrQ_qH6-ZV56DmIu-i9MkYErmA4p9ogqA
Message-ID: <CAHp75VdxDz4hG8TH2yGbQ1CmFTSd8m+6sBfuvD-aybuXY9SoQg@mail.gmail.com>
Subject: Re: [PATCH v4 02/15] gpio: brcmstb: Use modern PM macros
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@intel.com>, Doug Berger <opendmb@gmail.com>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, bcm-kernel-feedback-list@broadcom.com, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Hoan Tran <hoan@os.amperecomputing.com>, Andy Shevchenko <andy@kernel.org>, 
	Daniel Palmer <daniel@thingy.jp>, Romain Perier <romain.perier@gmail.com>, 
	Grygorii Strashko <grygorii.strashko@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kevin Hilman <khilman@kernel.org>, Robert Jarzmik <robert.jarzmik@free.fr>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, Srinivas Neeli <srinivas.neeli@amd.com>, 
	Michal Simek <michal.simek@amd.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 20, 2025 at 2:46=E2=80=AFAM Jisheng Zhang <jszhang@kernel.org> =
wrote:
> On Wed, Nov 19, 2025 at 07:45:17PM +0200, Andy Shevchenko wrote:
> > On Thu, Nov 20, 2025 at 12:33:14AM +0800, Jisheng Zhang wrote:

...

> > >  static const struct dev_pm_ops brcmstb_gpio_pm_ops =3D {
> > > -   .suspend_noirq  =3D brcmstb_gpio_suspend,
> > > -   .resume_noirq =3D brcmstb_gpio_resume,
> > > +   .suspend_noirq =3D pm_sleep_ptr(brcmstb_gpio_suspend),
> > > +   .resume_noirq =3D pm_sleep_ptr(brcmstb_gpio_resume),
> >
> > Can it be DEFINE_NOIRQ_DEV_PM_OPS() / NOIRQ_SYSTEM_SLEEP_PM_OPS()?
>
> Yep I agree with you. But IMHO, it's better to make the
> DEFINE_NOIRQ_DEV_PM_OPS() switching as a seperate patch and merge this
> series which wants to clean up various #ifdef #endif usages

OK.


--=20
With Best Regards,
Andy Shevchenko

