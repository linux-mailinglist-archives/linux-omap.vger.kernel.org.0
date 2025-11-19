Return-Path: <linux-omap+bounces-4956-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D9AC6F089
	for <lists+linux-omap@lfdr.de>; Wed, 19 Nov 2025 14:50:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E698D3518D5
	for <lists+linux-omap@lfdr.de>; Wed, 19 Nov 2025 13:41:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 769563563E0;
	Wed, 19 Nov 2025 13:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XiCf8snx"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6E3355815
	for <linux-omap@vger.kernel.org>; Wed, 19 Nov 2025 13:40:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763559658; cv=none; b=c0+10ENRFRqQ386VH3HNL7n+bjc4zDLgJdxImm7dWTANmBRTQCYfY32CW/Sd6iNLXmCCNW6HPuQgsLfFjLz+DZvdZvK6IUemLsTujUcASEXd3MF/lAeFb1zgSVSSfHoeRuu1pn1to6EPzZb5RPr7deLVcnIGS+d+v3tA0B36pEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763559658; c=relaxed/simple;
	bh=p1VeUzD38gPmtyIu7qtbXNax1D8JulnLI68nD5CrDU0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bu1Rdq3Stu4csngg6PbpiSIKIgxzaYCk1u/aITrU9ZMCHXYDK0gAPPNCCvfKYGNYVBV2jcmC8YV+ALyCGrD7pYkKWWsoyMgu0rS4cWLBslQpJBJXl8lC/h/3vz3cQW0ZGPedIK31umtPIz3051Q8gjTq0BaaUzHNrklvyw+c6rM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XiCf8snx; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-59428d2d975so7264274e87.3
        for <linux-omap@vger.kernel.org>; Wed, 19 Nov 2025 05:40:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763559655; x=1764164455; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1VeUzD38gPmtyIu7qtbXNax1D8JulnLI68nD5CrDU0=;
        b=XiCf8snxqVcz+bMzd5MLFfQXPyEiwMTSyJ0McqqwKfZF3pd7XYsGEi4M+ppJCV7koF
         pWGlqe2FWDYc+4juEWHNKVB0D/BsZWd5400+G80200tpjXb9jJ3fWw0OzZeXEBHXuNHi
         4FvZZ+01rLNBPza3XAI4lW+Uhn9pQVZOo3Q5R6aG55pn2QOcLwxBZbJpyXZSn4jv+R86
         aL7957Cki8isOkPGx7+uUKHiwFz8VPzcU3/Xr4Yz/q3f0FzQ8dTjAAtSNT7YnKVOmdLa
         0fZP7P2SMMc0CWrZUS5A+hHrzrpxRym0nsChlYPGjLhzFPJgfmKpU1zhxgYEbsKo+qak
         W3sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763559655; x=1764164455;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=p1VeUzD38gPmtyIu7qtbXNax1D8JulnLI68nD5CrDU0=;
        b=g7tOJCraCVMF9tgl03NlgHdOP0plY691tMK8uUd2GNoQJERGer4sCyFQr8mVhpTXfy
         f2zuleIaPGDwuaV6UvsnqK3+IKeKOkfd/HQH/WRBtqHw2d8iRo38qPFcEnaVbQnEm2el
         NAxoIsBNQSkXb4G84k1ZGaLMCU8GlkypnWWYrh0CbmcpsFFwauncwedhEG1CXkXj0L4+
         yr/06MEDu+B+GsC8kaKhPbECL2XcJFKrvmvLO+eANFILHkthxS7GZjqXl5djRmQ2uY8r
         y/MCjLKT0GKGLrIfbKob+eClWgnKJnXZCkWX2TPpRDKU/d0uZ5PjyIr2BNH0bfjAcS00
         tolg==
X-Forwarded-Encrypted: i=1; AJvYcCXBoHyKeoVC14frJYRO7cKiHN/nECMEWSRllbwlNtyiBX5HzdENA45Wz3nFiHZVW6CSgnRYsrblAAV9@vger.kernel.org
X-Gm-Message-State: AOJu0YwRdMvAJYMjd5IGufKbrP7jY5t8pykh4iZpPunx2sLxAOLY8BZn
	psMGnCAeJiutq+EMOsUyOLUVdnZXu6Le5Narfmm/jBRi+pHokCZEVtk1h5eg9zWUkaUy9Ol12Bk
	xEfTrLRzjmEDoPsY5SQ3bvvPZn7i9/s2rIOWJddnO6Q==
X-Gm-Gg: ASbGncvI0wE2GqnsZv4g6AkOcPiTOYCrquiEuBTO56wZcxZaXEDFtqE/24+hJX0GK80
	yqh+t8NJubZZyzfYlNsj2665BRyJ/bSdKwhI9KDmA/N1adwYSS0xqvplDEql1rjyQBRI19ZImv+
	V9ChnO016RmLYZIr5YULrrlO/66IKqx+Zrt6BZtV0cskKFQIJF/fMLd6DHjKr21/oJDLMxXezaz
	pddKHGC1BfXxa9AxAVzSBNnW28mEcLTJcf0pFxQp+KB+YjVHZcieYPYSSrmcjgb0zncn62kSRcQ
	1uD4pQ==
X-Google-Smtp-Source: AGHT+IHJqn3Q9sPhFEgzMw/vukdNcUT/GVv4BESPUPflJb4Mu3DDqG55U/y6YAHksU0FJOcXRT5fsp/raa2CukOp/os=
X-Received: by 2002:a05:6512:689:b0:594:341a:ab1e with SMTP id
 2adb3069b0e04-595841fbd7emr8740927e87.31.1763559654402; Wed, 19 Nov 2025
 05:40:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251118003229.26636-1-jszhang@kernel.org>
In-Reply-To: <20251118003229.26636-1-jszhang@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 19 Nov 2025 14:40:29 +0100
X-Gm-Features: AWmQ_bme-apOhLTLN0FLgYrYqF5_wu51DsT5ZOn-gWqBj2C9VIwE3ootHtgkuJw
Message-ID: <CACRpkda8GmEbFeSmGexcs-5aaFHiUigPhQfF_ynJRN1ix2f6nA@mail.gmail.com>
Subject: Re: [PATCH v2 00/15] gpio: Use modern PM macros
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	bcm-kernel-feedback-list@broadcom.com, Bartosz Golaszewski <brgl@bgdev.pl>, 
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

On Tue, Nov 18, 2025 at 1:50=E2=80=AFAM Jisheng Zhang <jszhang@kernel.org> =
wrote:

> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards or
> __maybe_unused.
>
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
>
> Almost all drivers are converted, only gpio-tegra and gpio-mlxbf are
> left as is, because the memory for saving HW context is not trivial,
> if we convert them, then the two drivers' users may complain for
> !CONFIG_PM && !CONFIG_PM_SLEEP case. So I didn't touch them.
>
> patch to gpio-dwapb.c is tested on real HW, others are compile-tested onl=
y.

The series:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

