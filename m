Return-Path: <linux-omap+bounces-4944-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BE4C68C7B
	for <lists+linux-omap@lfdr.de>; Tue, 18 Nov 2025 11:20:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DB8254F1ABC
	for <lists+linux-omap@lfdr.de>; Tue, 18 Nov 2025 10:17:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C6C133FE18;
	Tue, 18 Nov 2025 10:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L0XpuBiB"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FE6433C50E
	for <linux-omap@vger.kernel.org>; Tue, 18 Nov 2025 10:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763460977; cv=none; b=MpXzZkaUsQjl/mG0N6GOzJPvTVXxAIu0Se2uyPhfRdDdsVDwUAL2gCHbDnIflpxJ3CD5zMVaoydabr/KOxlKfe97gd71aSb0J9HCbd4hBL8hoUmgX3e7fQKr2F5jODepOjeB5089kAa24bq7XT8Izk4gY1vswzrIoHY9HmsQIpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763460977; c=relaxed/simple;
	bh=KkZMZqyB5eWUZrzPQXKcKmAdMoBJnYI98RasHB1ZAO4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fDL9dDFHXF2HNKjwnjdnQFzMTuTp4GRgHzvhfEE00Zj3o/KAO5uPNdmAqnAFzNCqD5x4vR0SjTSkRx6Ze76TGpUGn1Sqbr8xa5jfR883QgnY8npu457a+BqunWkRWtrpQaH2FjbOZOPj8RhmS7fQej+iQLpeG00cD/ym7B6iGBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L0XpuBiB; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-b725ead5800so641597966b.1
        for <linux-omap@vger.kernel.org>; Tue, 18 Nov 2025 02:16:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763460971; x=1764065771; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KkZMZqyB5eWUZrzPQXKcKmAdMoBJnYI98RasHB1ZAO4=;
        b=L0XpuBiBNW/qtp3KJd7UB9E6ELFzyJeySGWEPuQfsrnmrB42ebn+x58f/uqAd89PYX
         rT+IhXKGxZCwf03+9co2w2GGOwOnTH15smm2kUdzGq0LBCuXZkbHXR0cJe6oWcwN1lQL
         WCbeeS9dKyeNYchUxi0czRTeWWG5j0nWoj0znJb1CZMJUiQxVCC9zk4tfII16OOzkW8P
         0UWp4B72upAWPS7vdL7YQJlTFBntyWUJDOYJAtcqZqPMVfNlmkntToUQyvd0HK0RPSfx
         sPlxo9bsMpJScpzovjevk16E7SziZ5gkP7SsfgnJM2pUX2tkiNcMEbmq/yJxTm35Qb/S
         rRcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763460971; x=1764065771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KkZMZqyB5eWUZrzPQXKcKmAdMoBJnYI98RasHB1ZAO4=;
        b=b1qcKA/XuIW2zZmFrODrRQGeDWQjqOK5S4cYKjGCcMtLmVYwYzorPY9ZslHVMtsejk
         DUiHDuf3V5pOM079lhBffBvlZIpMz9NjnsTUedyhPGPoTFJMhIhXlnOQHrI1hVkRvNUb
         zmNKi5sEBoz4I7t1j4OHi8H34zxIp23cFiUVXRPLNvFkkLn2fHF9J2dlEO20AzDbp/3S
         Yra52lqPWZDSSx1nuPPvoZBDd1T2zCmLZARV75u6iqBWw3RagBViDf40Aq6o1CEzkhIE
         FmeVy8WsVQQ9gLD0wi6HYu52QRk+cj3at8RBp2KzaQWK1c/MVVrjBZcNrwkcv+ng1FPt
         BN4g==
X-Forwarded-Encrypted: i=1; AJvYcCVDaf4sBRFKhLhb1fC2BLM2wBZU+PV2eaMSybUyBhVBOYKL+53SYp4r3Sw7weHlByFgPYN8I2DmSJd3@vger.kernel.org
X-Gm-Message-State: AOJu0Yxv88hXFCy72uRFO5hmZB6I6WM7JFvIoKcSpvBkTs3xJqReXKWe
	P0RrpviYY+dPoTdRNQHMPUP+al7VI4I1bNE3JnVTRBdEX0cRMQEJ+dXzZpV5iiq0JJvuCAVooEp
	AlrKwLvm7toXVKKLzK+0JLooWGbfTVmA=
X-Gm-Gg: ASbGncuKqHg/+q8sRU39wJNhIfrBMGdQufQJ36FLuzbWWEKvwwmtuhFHBGjIqPs0HRK
	d7MFsH1Y06QdsW0aKshAakjFnWMA3dqSkpX6mK/sJVj1E1NtTX8KM5PoXbJYukyAzlnGbu7iTrx
	l3aHfufUNd4LN1fAN8RaARrxFuGutPZKEr+Ixve8+6bXnK4QhtRysuQZnMvrn8ElGj7Murk5wjP
	M+VAwIMmTgvEvu3AFmEvMUHhw2vGdEm08hFf/XsTUQISOUC4ogBkMSa5BWV7gY+onh6ARcjlRQs
	E9gm5YOMcc4fqzL7o8NSeG/6pvKq+zAUXwW+RSXJwMHPZshaAvpUfU/j7K8ds1HKoroXduU=
X-Google-Smtp-Source: AGHT+IHWVqaHds/q+LTdhqRXaLWytjahqcnDcixSB6BIfNsrZiukSD6Fp2tjp7MP7I7eFis6nLzSaJ0KogSHuqCHmsg=
X-Received: by 2002:a17:907:9622:b0:b73:7280:7821 with SMTP id
 a640c23a62f3a-b7372807e5emr1454519966b.60.1763460971389; Tue, 18 Nov 2025
 02:16:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251118003229.26636-1-jszhang@kernel.org> <20251118003229.26636-2-jszhang@kernel.org>
In-Reply-To: <20251118003229.26636-2-jszhang@kernel.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 18 Nov 2025 12:15:35 +0200
X-Gm-Features: AWmQ_blAt--6c37TNGtYz06A9WDhIGNjmkfqZdEk3NoJJOsCX6O0tW-2H1DDGnU
Message-ID: <CAHp75VeB1L5ZwQx=uKqaCMsij1ghFH+Kw3jsLa4qFxnWV1vTyw@mail.gmail.com>
Subject: Re: [PATCH v2 01/15] gpio: dwapb: Use modern PM macros
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
>
> The dwapb_context structure is always embedded into struct
> dwapb_gpio_port to simplify code. Sure this brings a tiny 36 bytes
> data overhead for !CONFIG_PM_SLEP. After greping the arm/arm64/riscv

SLEEP
grepping

> dts dir, the max port number is 6, the berlin2q soc families, so this
> means current we have wasted 216 bytes memory which is trivial

currently

> compared to the system memory.

I still think the embedding is not related to this change and should
be justified in a separate patch. W/o that part the rest looks fine.

--=20
With Best Regards,
Andy Shevchenko

