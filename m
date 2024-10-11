Return-Path: <linux-omap+bounces-2407-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BFD7399AEE3
	for <lists+linux-omap@lfdr.de>; Sat, 12 Oct 2024 00:53:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 61DED285790
	for <lists+linux-omap@lfdr.de>; Fri, 11 Oct 2024 22:53:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99E621E2841;
	Fri, 11 Oct 2024 22:52:57 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAB81E0B6D
	for <linux-omap@vger.kernel.org>; Fri, 11 Oct 2024 22:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728687177; cv=none; b=IOE/sTyoSaifc1ZfXNGrTKV6BTXhHnfHsf3GihpcGaI4q7eZxFb0knpZqmoZiuHfI6N4yl7NTmCoYpR2jsxfJmLzuuJZVW5hh5fmbfa2cx1mVPgH6x01vUcWgooMOoavvmh0DcAe9rdZaxi92A1G3BsmKc64cfd70lKAu7y6Gy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728687177; c=relaxed/simple;
	bh=QHnSVJgKPC4Nvh2tA4kTrfCxlBBghkUgALPOqLtV+38=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uH5jWpNPP6FNf59eV89mKYMkr0jj/q+ddgiN2POIDj9B8TzJuYsdlpZQkRiJkgb4ufA9WGaaDJadJF22sVnvNWIzNCtFv0eshypCCs+cQVDqZfRQHS9nF2/2tzz11BXqiPxrQpt+nVbhVDILwG0Dy1nwbylEc7dtoFFAnxbSrws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org; spf=pass smtp.mailfrom=baylibre.com; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=kernel.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-71e10ae746aso1902628b3a.2
        for <linux-omap@vger.kernel.org>; Fri, 11 Oct 2024 15:52:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728687175; x=1729291975;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QHnSVJgKPC4Nvh2tA4kTrfCxlBBghkUgALPOqLtV+38=;
        b=gZUYR8B3sik5i4/hwQ/Lm4YmG7kw7m/Ju6zbmlkmetj/FAe6BgKcpx7Mxff6MPc5dQ
         JP3QId34RuJ/kDbB5JyajNYsGrn8wg8nRTaE7u5wpUPYNGLPGouvP2LQ16xvkyjWMvsX
         yUwUGrFXIrflbu+H16dQuJHTwf/XDsHdSAP5DATvHapTA7g+MfT0U9d7AqNZ8njY8rVu
         5nbS4Tc6AtIOmuynFzghqjWi7ImGrSOgxtPbEgTQ42KmvORZezI+1bzN/rrhE9xrqNbj
         fKJRTEQkfEHFfgyLFIInb/jaDOlnX7jye5p6hBwst8QmbDvzjiKdA9ExbqlU+NXz8anK
         pJEQ==
X-Gm-Message-State: AOJu0YwfmGbqIKswf//zDk1BdT7gglBD5EhzkOmPeYCgpdHeX1soysbi
	mjMG5OEl99+h++Owr7twcuCGZ8VzAmUE/F3bqaYotcawLlONDvY44v6oN1YKo7Q=
X-Google-Smtp-Source: AGHT+IHaDDeBN7leSygl7Dodvs7/8OMvmcN+zyvTXC30J47HSWRnFCUDXl22hQJ4K5zbR934STm+cQ==
X-Received: by 2002:a05:6a00:9a1:b0:71e:1498:9ed8 with SMTP id d2e1a72fcca58-71e37ec22e2mr7297495b3a.7.1728687174894;
        Fri, 11 Oct 2024 15:52:54 -0700 (PDT)
Received: from localhost ([71.212.170.185])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71e4d0760c7sm254472b3a.174.2024.10.11.15.52.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 15:52:53 -0700 (PDT)
From: Kevin Hilman <khilman@kernel.org>
To: Judith Mendez <jm@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Bartosz
 Golaszewski <brgl@bgdev.pl>
Cc: linux-omap@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bin Liu <b-liu@ti.com>,
 linux-serial@vger.kernel.org, Judith Mendez <jm@ti.com>
Subject: Re: [PATCH RESEND 0/2] Misc OMAP GPIO/UART fixes
In-Reply-To: <20241011173356.870883-1-jm@ti.com>
References: <20241011173356.870883-1-jm@ti.com>
Date: Fri, 11 Oct 2024 15:52:52 -0700
Message-ID: <7hr08mw8u3.fsf@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Judith Mendez <jm@ti.com> writes:

> This patch series carries some miscellaneous
> OMAP driver fixes for GPIO and UART drivers.
>
> For GPIO, add gpio_enable and gpio_disable calls
> to gpio-omap which fixes an issue where if there
> is an irq storm, serial console is unresponsive.
>
> For UART, move pm_runtime_get_sync since the
> current order of omap_8250_rx_dma_flush and
> pm_runtime_get_sync calls are set in a way that
> when omap_8250_shutdown returns, dma->rx_running
> is set and this causes issues next time the UART
> is re-opened.

Could you summarize which OMAP platforms this was tested on?

Thanks,

Kevin

