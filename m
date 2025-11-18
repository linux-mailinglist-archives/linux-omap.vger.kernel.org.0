Return-Path: <linux-omap+bounces-4945-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EBFBC694CA
	for <lists+linux-omap@lfdr.de>; Tue, 18 Nov 2025 13:12:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2E1DD4F5874
	for <lists+linux-omap@lfdr.de>; Tue, 18 Nov 2025 12:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 95BDE355809;
	Tue, 18 Nov 2025 12:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GQzFbHym"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96367350283
	for <linux-omap@vger.kernel.org>; Tue, 18 Nov 2025 12:07:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763467638; cv=none; b=lVy2EAlHqivLXfRtVPLiGOU6BF2+W5gQycsXE7kPrIsO7OuqgOjDt8I5c5BQubr18zrgm6VO3kMH3bkAV1KNMJYbttkoAuFwHf8MyyIGssdb3hVGIuTZyCijGeeswJ5/Z9E79jpeinwgpAGFFEITMDiX4WwcsyyUHsaNW5AJ38U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763467638; c=relaxed/simple;
	bh=DeHwKKEjLZWFTse7g9tHY7GfyY976LJPMenDaQrV2BY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=THYJ3RxPwpx4QadEkv2cni5kJXYnQtOpWTFW3Cx6EKjqKmvDuFI2JPzRTFSXgul2RJ7gSxYFOcd2poRw12Xo3s84ooD7JHWCq3L7RIIIQNoWWH2pVslAV+0DrlD+4mLn1GNrcsktnkBsf8pt1+OkUuRX/VW+o6wmXmRocgMPwH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GQzFbHym; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b75c7cb722aso113030066b.1
        for <linux-omap@vger.kernel.org>; Tue, 18 Nov 2025 04:07:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763467631; x=1764072431; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YPUPwbDm14BN9pVkqto4Vz7utDChnT1k87mVo/hojfE=;
        b=GQzFbHymMuXAamVgsgwvyfrGKDiQr0asQFaJoGh14bFnhTFCgKmv2YeP6LjUoHkhhU
         1L+c624DAccv81HZ7qUdLA2N4CdTgxk+TECriLKwfF4Ly0bL5q20XRdE/Jb4MgmzieOb
         ZuHqlXaHk0fndchvyR+WBGUU78zy47gC3HHMqgSG4MPi5BvoaFVBwYJFsqxEE6LoDyCp
         IVzEHBX7jR1ZpL2x3R0YuLkWIujPb1Z1H/7HCoRnO+i+H9p5XL1KgvfyxORQyvoEQ5i/
         aoxcNQB+CuwpUMvGjBcSQh/Tb1xDx4xWimF15TZTrXEBUHiGrl68FLe4lRPaXNbBweZ8
         lsDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763467631; x=1764072431;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YPUPwbDm14BN9pVkqto4Vz7utDChnT1k87mVo/hojfE=;
        b=nH6eDbiXyuYjV6VyuB2CEkCTtm8uYy2Oy+mey7sSxxrtwy77EpuqexnesxGnqpRkGU
         imWQTB1NWDvfoydljqLzOT2OPdVVpWlhItki8NIpbl6ZtIWq00jsvHqvNe3qqteU7kHD
         9U0l0VccPcVL7umzwzGQn/XL0fRHYBfoPA1iSw4y7feRlaEth64yiOAHMR7affI5ICkw
         5igS9KclV/SM+Ky4JbKMRcirLoA40uGqkN+lYGW8iZ2pvX9Qqmysl5eMcYftfYGzk8bV
         Mhmq78h4QHaX7jpO6uysebOrMQgztZi8YRr/HRjE6wifpDbhtff/Q+Qo3haKG+w1l5nC
         T7zw==
X-Forwarded-Encrypted: i=1; AJvYcCWxSscFDHBf6jjWTFSiKcvG3lI6xrehQm3ScXnJylecFYaFG2grHoa+svMZiM07M4kZjH9Av85B0Vjs@vger.kernel.org
X-Gm-Message-State: AOJu0YyvuEmC5TDwFyErmp1ddqqX5WkCzrx0qlOjLAzhFMCpLYgdnB+j
	bc46iAHp40deoQV8484IsVlFQMU+sp9KUNX3axLI9gW2oTpzcG939aNq0fwPay841bziSV1lqq0
	JNaKve0FPYFpkLoT6og2n8dN8Rl+kHEo=
X-Gm-Gg: ASbGncsJIKJxM+6iiuUZSEXHSfBTtwNVXofYRea70BWPnJ+mKgxWU83MFh0dpF+1i+q
	dVXHxRS9j2Cx+wQW320kw6927E+GBY5qgM4ywbe+leVbrHosmcus0S/MCUSbF+iJAnr7rrvW7gx
	pt9sGs2fsIyLNvcOTJoF+plMWzdUyPa07VUfyFCNxNFh1O4+6rY8iTK7OnrqsnwIgm01Ca5dykR
	M+4cbCS2YzQzBpJBBs1laFI8j/FnruuBhiGPP+KOepbTyGDQJrBZXFTj82cYG9+AX6kLFK+SRu2
	dxomr95TO2RiaLxO1AnaxOSQZqFt6AXpWbt0jsC6U/qQgjWtUScd0Igxzkpptjf6+2/cvkAAi+c
	84t3yjQ==
X-Google-Smtp-Source: AGHT+IFy67x9V6cH2hLqaJFod32QM89W3J9APhleRbLJkEvfU8oukE776A3bhfCtC5MGo4gC9KLgMlhG45du7MmtybA=
X-Received: by 2002:a17:907:7e8c:b0:b73:8e7d:4f87 with SMTP id
 a640c23a62f3a-b738e7d5088mr905707766b.45.1763467630576; Tue, 18 Nov 2025
 04:07:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251118003229.26636-1-jszhang@kernel.org> <20251118003229.26636-6-jszhang@kernel.org>
In-Reply-To: <20251118003229.26636-6-jszhang@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 18 Nov 2025 14:06:34 +0200
X-Gm-Features: AWmQ_bleoiALlFg3xQPLT0jXfJmB6ug8AfTDr-vB_7secp2PIEnh_6lO4x7Rkb8
Message-ID: <CAHp75VevWmB4X_Mh+st_NLChAYZw5V-b3pM9Yrcd-ofa9xYvDQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/15] gpio: pxa: Use modern PM macros
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, 
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

On Tue, Nov 18, 2025 at 2:50=E2=80=AFAM Jisheng Zhang <jszhang@kernel.org> =
wrote:
>
> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
>
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.

...

>         unsigned long   irq_mask;
>         unsigned long   irq_edge_rise;
>         unsigned long   irq_edge_fall;

> -

Stray blank line removal.

> -#ifdef CONFIG_PM
>         unsigned long   saved_gplr;
>         unsigned long   saved_gpdr;
>         unsigned long   saved_grer;
>         unsigned long   saved_gfer;
> -#endif

Otherwise, LGTM.

--=20
With Best Regards,
Andy Shevchenko

