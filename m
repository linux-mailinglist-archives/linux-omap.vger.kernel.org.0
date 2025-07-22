Return-Path: <linux-omap+bounces-4104-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 689E9B0D9B2
	for <lists+linux-omap@lfdr.de>; Tue, 22 Jul 2025 14:33:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 671B2169020
	for <lists+linux-omap@lfdr.de>; Tue, 22 Jul 2025 12:33:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A8512E3AE4;
	Tue, 22 Jul 2025 12:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Z25gaQon"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95C5323ABBF
	for <linux-omap@vger.kernel.org>; Tue, 22 Jul 2025 12:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753187615; cv=none; b=bUAr/ZGNCDbgtW2uvY6Qa6Gt9xEPDZg1bodVT3r5h7cNiCFmohwrIb1s5WzyGH7Yl+xekmaPwZZ0BV3CdQR4nr2o/fij2E2hdvZhKZdikIcGld9n+sGgRfhvU+u4Z5GO7uLPJ5UIW+r1euiVwV//SLjBiUq2YX3sgTBaK1QECAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753187615; c=relaxed/simple;
	bh=JQAmUAgM9/RaH27IaFC9XF/IxHkWyVVH3kpCZLC5sKc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uNeM29Hsk4NEgjNvXmIh4R4dtYM9Sg6mIqvvloE9F49Ckwl7bZk3AfttFhk6RnbR5CjjvIQ+og+XcZx6DV6hZDBsJNwxb9hCikUU5MQQah187H6pqO3eq0gU2wIVKKgpLfNCSO6jNNWc3pAFzz2X6zncOFRMSvk8vhag9OkrSAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Z25gaQon; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-32cdc9544ceso48345231fa.0
        for <linux-omap@vger.kernel.org>; Tue, 22 Jul 2025 05:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753187612; x=1753792412; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+GKZahGmDdPv5L7LZQzaZ8ms1eU9iPtW5fE1sZ1rk4=;
        b=Z25gaQonh2BcW45vaEJQp/HWqnl1+hy5QQwAsr4LcO7R1jD3F0lf9TJ9s8q3O0xoet
         TfjqgSewMU3zg2g+PeW7xYdINxU5IKTkOIMOpfXJcnxAaNsTkcuwwGPhxqzhahmhXp+1
         JN/NqyWtZnjcbRf5pud3bGg1Tp7jTN0QPHFRrVnHZ4lZ0yyhFBL7MjvYDqfQsYjrHPKO
         jNoGjeEVgZUzuIItXUvk4Ghn82w+1VE1JntmAbO/BFMtgCeXpq36CbJXObzTnVkI6bFf
         fFjSsYFy5IQvPm5ezJWhvKMYjtil04NRq8eajsJsksb23Dk7z7/mTHS8VtavSClNICTI
         3Rtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753187612; x=1753792412;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h+GKZahGmDdPv5L7LZQzaZ8ms1eU9iPtW5fE1sZ1rk4=;
        b=JRtnW2O9saTr1smbkuhGS8q+KSfreO3CAIyZiHfcm5TD39ZFwKVJaEKgbzHtQvnK3v
         uSyR3QXoy72EIhoR1xtdG5aHUxV/FBiCVhMraIttVAr5yyCRc4YULXGkZb+GtWoongHV
         8xKD4f38GZ9LimesGohpKboutBuiUG+lveYvawNGtpgjxYXwS6ZWrx8lZJyG/q3AvuWg
         3Vk6QPCT8F5FwgRt3eA8tLL81R287kRzf+d7PpbOq8d4/+SrgadIEBRA6VkrlC0tzTIl
         SiYJWjL5LbmYwPpvvvsyn6R/zEO7gbu89xX20fftA9qVX/WRbUBfql/1Da64MsdadJ4K
         pTAA==
X-Forwarded-Encrypted: i=1; AJvYcCV03hpqgIoxwjvUO2HAb8nCf5SSdxtUfj68H1apjo+NpVx5pXmSqXRpUFVtqfejapdanzQodRQkjTMb@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0FDtkKPNz+VNKP3ad90K4i7D7R9Ro2NN9IGsiI3oINK10h+KL
	3lwIS5m2dmxpJ83q6xFhXWWtNYIhay4HJ+N2/hyHYRnNmLhDZ4Gg5hsWvET6vnEYKbbfTMMn5BW
	WRxcSKU28FAWZvT5+QWbR2/koOfj8f6PVCbcVA6kgNw==
X-Gm-Gg: ASbGnculpIOR5031EaQ+BAX6s060xIeCFSfV8zBlKq/t8tdcXoAM3Ag2udPMz629oho
	xC0vt5aOR5Jqwldz5pWjCiqOrzGiJcT0XWL+AR8VBPafq+Bl77ipZKjE1HFa8alobH4ebnOjEFt
	TGExx7+8aebRnb12qhQX4kWz8mPZZsQZgO1IYp0Wp4FQMlK22twJEGSu3ljSxXOqNvUY1vjO1gP
	Qza/jXU9pEO4kXo/9VA94E3AD9PbFDaUW7CmQ==
X-Google-Smtp-Source: AGHT+IE4NLh74+eaL28wuve2GVp6Fz+dzUpqyQgftU5RDfIQz6VE0xFsh7GIWHtxc9eDY44fnzPlyDiXLFQXZa1zK+k=
X-Received: by 2002:a05:651c:e13:b0:32a:6e20:7cdb with SMTP id
 38308e7fff4ca-3308f526f69mr38693341fa.17.1753187611451; Tue, 22 Jul 2025
 05:33:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250721233146.962225-1-s-ramamoorthy@ti.com>
In-Reply-To: <20250721233146.962225-1-s-ramamoorthy@ti.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 22 Jul 2025 14:33:20 +0200
X-Gm-Features: Ac12FXw8rQB0btGgQIdOuuluV0bKj5UY1CC8pTxt_PxLMJg3hptyK0eG64L8UIU
Message-ID: <CAMRc=McTJnTn1sf6Kc42yePvUyP87h1utJ7B_ynWjUxxm0E4Lw@mail.gmail.com>
Subject: Re: [PATCH v7 0/2] Add TI TPS65214 PMIC GPIO Support
To: Shree Ramamoorthy <s-ramamoorthy@ti.com>
Cc: aaro.koskinen@iki.fi, andreas@kemnade.info, khilman@baylibre.com, 
	rogerq@kernel.org, tony@atomide.com, linus.walleij@linaro.org, 
	linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, m-leonard@ti.com, praneeth@ti.com, 
	jcormier@criticallink.com, christophe.jaillet@wanadoo.fr
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 22, 2025 at 1:32=E2=80=AFAM Shree Ramamoorthy <s-ramamoorthy@ti=
.com> wrote:
>
> The related MFD series was integrated in mainline during 6.15 cycle [0].
>
> TPS65214 is a Power Management Integrated Circuit (PMIC) that has
> significant register map overlap with TPS65219. The series introduces
> TPS65214 and restructures the existing driver to support multiple devices=
.
>
> TPS65215's GPIO specs are the same as TPS65219, so the "tps65219-gpio"
> compatible string is assigned to two devices in the TPS65219 MFD driver.
> No additional support is required in the GPIO driver for TPS65215.
>
> - TPS65214 has 1 GPIO & 1 GPO, whereas TPS65219/TPS65215 both have 1 GPIO=
 &
>   2 GPOs.
> - TPS65214' GPIO direction can be changed with register GENERAL_CONFIG an=
d
>   bit GPIO_CONFIG during device operation.
> - TPS65219's MULTI_DEVICE_ENABLE bit in register MFP_1_CFG maps to
>   TPS65214's GPIO_VSEL_CONFIG bit.
>
> TPS65214 Datasheet: https://www.ti.com/lit/gpn/TPS65214
> TPS65214 TRM: https://www.ti.com/lit/pdf/slvud30
> TPS65215 TRM: https://www.ti.com/lit/pdf/slvucw5/
>
> Tested on Jon Cormier's AM62x platform with TPS65219.
> GPIO offsets remained consistent and functional.
>
> Signed-off-by: Shree Ramamoorthy <s-ramamoorthy@ti.com>
> Tested-by: Jonathan Cormier <jcormier@criticallink.com>
> ---

This doesn't apply on top of my gpio/for-next branch. Do you think you
can quickly submit another iteration rebased on top of it?

Bartosz

