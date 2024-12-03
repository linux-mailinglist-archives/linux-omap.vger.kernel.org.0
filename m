Return-Path: <linux-omap+bounces-2763-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B933D9E27DC
	for <lists+linux-omap@lfdr.de>; Tue,  3 Dec 2024 17:43:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6EC43B397B9
	for <lists+linux-omap@lfdr.de>; Tue,  3 Dec 2024 16:41:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C89EF1F8AE6;
	Tue,  3 Dec 2024 16:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ImoIQxh7"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C97C713B2B8
	for <linux-omap@vger.kernel.org>; Tue,  3 Dec 2024 16:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733244082; cv=none; b=kUkkTryLiwjqiSlb8DSTH0p/G2b9d1X6zB1DWvCLJwWsqDl5phvvm3CFH46SC2p3QzeYLVrODl3usucS35nC88xQXpRo+HUGqNO+FXdc/go/R4KVE9vCtddBGZfjfk1e11kElNYfpRTHA3baw0fWn0vSPOJuoPT1trGOmdFa28M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733244082; c=relaxed/simple;
	bh=lYbDR2oS7Lr5SDoN1wnli3FOgTY/tUQ6zhWZKZOdyow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rHquesvOhP01Z9MXP93njiPmYcPiW4iFSYln5n35Rwf+BP0Kh71YQI7bp8XNt/yVk8NHw55ohcN8eU3tP2IqaNy7cXPanjOYJ5F52xeQB4Jq72pcrNzEl3FmKO/bVmZ7xR6luIgUSHEzya8hWI0J1KuRfhaUX9jWBcSSTmDO1mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ImoIQxh7; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53df1d1b726so6945249e87.0
        for <linux-omap@vger.kernel.org>; Tue, 03 Dec 2024 08:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1733244079; x=1733848879; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R3cKcg9kF9rQPeRe4S6fxF/eadsgLyIFQpsrwW9a20M=;
        b=ImoIQxh7nUBc5zE16H6St8zh7YdwHCTuoVetX+c/ZAKvzRSCcZ9oLEKaV+SkYclt0u
         F2Hl2PyEoicz39fzpxddzAJKA5HRp5djWN2e0j7d9lzDmu+HOu4OodTHWeknppjoM9i1
         KRA1514qpqrV8kCieco0wbUIN+j07argQW2w6zUIAoa95v4q0+UJm54ouJB8phun9yMl
         AdvEFDf2ptrOKSSiXgYyfgjKLu9KQV1+rKbHKjsxyD+0Uhg0aPvlzZFr0f7O8nOZPc0w
         A+gHbB127oCihcCf0GJtNOSL+a7pUx3np7OUrIJVQ8gzlzGHoiBGcdO6Er41AlTviqFW
         FgQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733244079; x=1733848879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R3cKcg9kF9rQPeRe4S6fxF/eadsgLyIFQpsrwW9a20M=;
        b=FaSa+B40eBwSJBKwRCcOs/k3kZK1gJIOV00bo7rXpLg1q9dVKu722ioniJfYOyctlQ
         njcfltWPOc0csXvU2awAMl7dvbLAOooG9ZiH5r9L/JHCxhpcKlv8I42hLolJJZXHuzl0
         pee2I3lqWkHUUg24vYrLPi93aFTC4jx8L760cKuUikZvQXYZ+0iv0sScSTsfsIZUnUs5
         z2QPKTbsZ769kosMMz4yAx3piW+/FkGztzvcq0kbPNPb1OIR1hGt5wEsK5ekcqt6Pdw9
         KSBsgvdYKda/z2mPSrkuOCQvr0ljxbqod82kmS+w1/M7tgonqxAdpgDnkzeOdXeVvD+D
         XTwA==
X-Forwarded-Encrypted: i=1; AJvYcCU00zM/mdDXVNXtMjLfBEqj9IN8h9VTAFlY2StBMZMwVLD+BLHzuTXNmC8P84r9MBQlPOXy8nS22IzY@vger.kernel.org
X-Gm-Message-State: AOJu0YyCmUECqDU4GQyIPqRxeP9nnakuCFGEJsLVakLIxT+fxjDqkTOH
	j8KAdS4kD5yE3t8nwIZv5zWF8CQYBkmjpVMXItVagePk29Jv0TSedCaxHvnEdrcxWWSu9oZJHd/
	5MwPW2D845rSUgjoVElIbSgRvYHXtsi/BYMBiSQ==
X-Gm-Gg: ASbGncv3ZGLVplYgHg+/V/uWqDGtdcXgZSViOLTXpJt7QStNeM2jC2Ho4KRVZv4r2vw
	w62GPIToRdbNzzBr6fnsRHZrbKi//Xdo=
X-Google-Smtp-Source: AGHT+IHW+vsl0mYcoay/ASPlsom23HgQ21s30uqyqy8EPOs30ZTnPyOxBXGCdO8xyntMRDTjm/dm7vKdQmuCRnMPcw4=
X-Received: by 2002:a05:6512:3a8f:b0:53d:a9a4:73c1 with SMTP id
 2adb3069b0e04-53e12a2186emr2033000e87.39.1733244078951; Tue, 03 Dec 2024
 08:41:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241127184506.962756-1-alexander.sverdlin@siemens.com>
In-Reply-To: <20241127184506.962756-1-alexander.sverdlin@siemens.com>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 3 Dec 2024 17:41:07 +0100
Message-ID: <CAMRc=MeSVHjsrU6tbGwcu_TqOh_Pw-8OLRcqcdkZDpDP9n4Z4w@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: omap: Silence lockdep "Invalid wait context"
To: "A. Sverdlin" <alexander.sverdlin@siemens.com>
Cc: linux-gpio@vger.kernel.org, Grygorii Strashko <grygorii.strashko@ti.com>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-omap@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 7:45=E2=80=AFPM A. Sverdlin
<alexander.sverdlin@siemens.com> wrote:
>
> From: Alexander Sverdlin <alexander.sverdlin@siemens.com>
>
> The problem apparetly has been known since the conversion to
> raw_spin_lock() (commit 4dbada2be460
> ("gpio: omap: use raw locks for locking")).
>
> Symptom:
>
> [ BUG: Invalid wait context ]
> 5.10.214
> -----------------------------
> swapper/1 is trying to lock:
> (enable_lock){....}-{3:3}, at: clk_enable_lock
> other info that might help us debug this:
> context-{5:5}
> 2 locks held by swapper/1:
>  #0: (&dev->mutex){....}-{4:4}, at: device_driver_attach
>  #1: (&bank->lock){....}-{2:2}, at: omap_gpio_set_config
> stack backtrace:
> CPU: 0 PID: 1 Comm: swapper Not tainted 5.10.214
> Hardware name: Generic AM33XX (Flattened Device Tree)
> unwind_backtrace
> show_stack
> __lock_acquire
> lock_acquire.part.0
> _raw_spin_lock_irqsave
> clk_enable_lock
> clk_enable
> omap_gpio_set_config
> gpio_keys_setup_key
> gpio_keys_probe
> platform_drv_probe
> really_probe
> driver_probe_device
> device_driver_attach
> __driver_attach
> bus_for_each_dev
> bus_add_driver
> driver_register
> do_one_initcall
> do_initcalls
> kernel_init_freeable
> kernel_init
>
> Reorder clk_enable()/clk_disable() calls in a way that they always happen
> outside of raw_spin_lock'ed sections.
>
> Cc: stable@vger.kernel.org
> Fixes: 4dbada2be460 ("gpio: omap: use raw locks for locking")
> Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
> ---
> Changelog:
> v2: complete rework, I've totally missed the fact
>     clk_enable()/clk_disable() cannot avoid clk_enable_lock() even if the
>     clock is enabled; I had to extract all clk_*() calls out of
>     raw_spin_lock'ed sections
>

This looks so much worse now. :(

I refuse to believe this is the only way to fix it.

Would it be possible to wrap the logic that disables the clock
depending on the return value of omap_gpio_dbck_enable() in some
abstraction layer? Basing the behavior on the boolean return value of
a function named omap_gpio_dbck_enable() makes very little sense when
looking at it now and it will make even less a year from now.

Could we add functions like omap_gpio_dbck_clk_enable() and
omap_gpio_dbck_clk_disable() plus some state in the driver data set by
omap_gpio_dbck_enable() which would be then read by
omap_gpio_dbck_clk_disable() in order to determine whether to disable
the clock or keep it going?

Bart

