Return-Path: <linux-omap+bounces-686-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E540E85CB99
	for <lists+linux-omap@lfdr.de>; Wed, 21 Feb 2024 00:01:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 14B231C219D4
	for <lists+linux-omap@lfdr.de>; Tue, 20 Feb 2024 23:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CE723154438;
	Tue, 20 Feb 2024 23:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="B4IdbgTC"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AC35154427
	for <linux-omap@vger.kernel.org>; Tue, 20 Feb 2024 23:01:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708470065; cv=none; b=UoS5zJYE54EniR1RsESbGg+yKythiWQ4FWMMdbi+liK+pBRn7lX9/yD7ErDO1MBrMtcKrx3nX6zajyvHrhCva99MV/yoMIKTTuLytiiaMFQqAB728vqhNQnKc6DDVoUk2ULJLpqj7kx4DQeyC5/R+uMdmC2yyBgQvukJdd6j9Ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708470065; c=relaxed/simple;
	bh=0nJssCnVqUtLLrgbcTA5mzUlsmakm/CsmHiqgH3hL9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iyFID0iICXyGSjhN0oJZdrmipYT1Mz0BQepyrixsgbMkfzOnKCM0KNnARFsWlGia23kug5tBAUwy6vHf8FhZF/u2H3uMQYRqF2KCH7JDvDzjTmrHZsUsRlCPrjJT9WxgS7KSr2wp1vwfAASAbF6ceW4+MibgqWzEyW/bkZ8Pocw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=B4IdbgTC; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6083befe2a7so26575697b3.0
        for <linux-omap@vger.kernel.org>; Tue, 20 Feb 2024 15:01:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1708470062; x=1709074862; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1A3zr3xkjkMF8lRpEIOZJ9IYJxQ1uIKjo+R7IGHgj8k=;
        b=B4IdbgTCN+7QDRLHWUZdbmwjRop3NkEX7LLiph1qSD2K4iefoo8u/gylMJ9Nnc1zbH
         M+y31kHZ2ETlNrs0Sx2ddu+9TARagzi5KaJbZLHby43xOKhxy/M6MLp6roapSSeUX5U+
         +CGe/OfClOcqAz1Xps0rIFxnK0S2xHGR0xL2JKrQioOMRVHHlq5i5LmMY2VgknQ9eQIR
         O9SNinXAVLIpYesm0kUzdJlPQZU1IPi2HqBYneK6vsgH4+sZS8GMLij7mrs0buvUarTR
         ydwrm+JkL7hEVxv4kTpzUSTa9NS7LSSgvvJYIsHSAVoh4OX6bZhZZqXTeK4ktSFlTsmi
         boug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708470062; x=1709074862;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1A3zr3xkjkMF8lRpEIOZJ9IYJxQ1uIKjo+R7IGHgj8k=;
        b=JGY/YqenFAeV/U0grGyIInsTj6maS80Yr5O9QmjjRL3cVcY/cVzGn70bvfN187PtlH
         kQgyru1abcY5BW70vqSR6d2sKd24qa9m63T5ahOwWkqXNH/mG88/9uTCxR30Cmv9E5Xs
         tok95q6M5gUATk55RxtGDFkPH2gbx/B0rY/tLC56HkEPZ6EiYxv2VOK4Rt6ACF+ESHaM
         PHHMqzP5TEFiS2NKdaFCdmE6ygVgpmZke8/dYzift/YiLz3WxDhsf1C0WDGC/Ad6ifXZ
         rKvMAqFH0VZPEBL/plKKvYQ+5E/oauVYjkJ0uUS+z2koorM/h4Ocn/Zp0UfLfoZtKZec
         rJrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaB04Lz75UKIbxzuY6PLOcqYxpj2RslnImuf6RLb3kRO0Ce+wram9fsGgZoeUkhdDQiJrFEitSU5fWD1TWRxNws1pUiOzoR6ceBA==
X-Gm-Message-State: AOJu0YxAPs70edTeB+KO8CyU33Tkmn9f3ITJ4WXL976eGezpWi4QMe9Q
	gWmtghRv37WleW0/cnfREeVjFqJw+cY1S4gXivOReaI9K0VMgPkaLhKzaSR4KZ4Zi3dUGipakFf
	PUv5pV5MQaxetb9XMlgemSvQNDDaVAp9F+xhZG0mnUXDn9DFx148=
X-Google-Smtp-Source: AGHT+IGS1rjbIbqwa2FUKNvXF4Dn5+e0RlJyXxF6trqxXbZrLHNf6jVVcW1tvydeSHAyFS/jHob425YDo6DrXyKhUs8=
X-Received: by 2002:a25:838c:0:b0:dcd:3f82:e803 with SMTP id
 t12-20020a25838c000000b00dcd3f82e803mr12702286ybk.39.1708470061794; Tue, 20
 Feb 2024 15:01:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240127-mmc-proper-kmap-v2-0-d8e732aa97d1@linaro.org>
 <20240127-mmc-proper-kmap-v2-9-d8e732aa97d1@linaro.org> <7f40cb40-1a1-532-75fc-d3376ed27a@linux-m68k.org>
In-Reply-To: <7f40cb40-1a1-532-75fc-d3376ed27a@linux-m68k.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Wed, 21 Feb 2024 00:00:49 +0100
Message-ID: <CACRpkdZpyefnTyKEJXru_HZG8xcJF66Eb2pZhbk+HVvfzdh4yw@mail.gmail.com>
Subject: Re: [PATCH v2 9/9] mmc: sh_mmcif: Use sg_miter for PIO
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, Ming Lei <ming.lei@redhat.com>, 
	Arnd Bergmann <arnd@arndb.de>, Ulf Hansson <ulf.hansson@linaro.org>, Nicolas Pitre <nico@fluxnic.net>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Adrian Hunter <adrian.hunter@intel.com>, 
	Angelo Dureghello <angelo.dureghello@timesys.com>, linux-mmc@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-omap@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

sorry for the mess!

On Tue, Feb 20, 2024 at 10:03=E2=80=AFPM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:

>      sh_mobile_sdhi ee120000.mmc: mmc1 base at 0xee120000, max clock rate=
 12 MHz
>      mmc2: new high speed MMC card at address 0001
>      sh_mobile_sdhi ee100000.mmc: mmc0 base at 0xee100000, max clock rate=
 88 MHz
>      mmcblk2: mmc2:0001 MMC08G 7.33 GiB

Hey it reads some blocks...

>      BUG: sleeping function called from invalid context at kernel/workque=
ue.c:3347
>      in_atomic(): 1, irqs_disabled(): 0, non_block: 0, pid: 35, name: irq=
/151-ee20000
(...)
>       __might_resched from __flush_work+0x20c/0x2e4
>       __flush_work from __cancel_work_timer+0x118/0x198
>       __cancel_work_timer from sh_mmcif_irqt+0x38/0x8f8
>       sh_mmcif_irqt from irq_thread_fn+0x1c/0x58

Actually that is the thread so the message is a bit confusing, the irq thre=
ad
isn't atomic.

I wonder if it is caused by this:

> > +     sg_miter_start(&host->sg_miter, data->sg, data->sg_len,
> > +                    SG_MITER_ATOMIC | SG_MITER_TO_SG);

...because I don't need to ask for atomic miter here, since the poll
functions are actually called in process context.

I've sent a patch, can you test?
https://lore.kernel.org/linux-mmc/20240220-fix-sh-mmcif-v1-1-b9d08a787c1f@l=
inaro.org/T/#u

Yours,
Linus Walleij

