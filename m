Return-Path: <linux-omap+bounces-2596-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D349B9BEC19
	for <lists+linux-omap@lfdr.de>; Wed,  6 Nov 2024 14:02:57 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 11A1F1C2273C
	for <lists+linux-omap@lfdr.de>; Wed,  6 Nov 2024 13:02:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3E92D1FAEF0;
	Wed,  6 Nov 2024 12:52:00 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D331F426A;
	Wed,  6 Nov 2024 12:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730897520; cv=none; b=i+A5BZESwF4bo9YXHA1HsJlUUjIaVBxPPMWNn5Rb35cb61KsZp5NoWcUyP2wlxoDUPeP2kj+jc/JTcsDWEFYL20/LFyzVeTPjsmA/d6qBI3D9u0L46NhQWvKPeWRn2Yh01HEdVMdzYDInLb1nuxN5X7Y78V2CwH+Oy5kM9QTZQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730897520; c=relaxed/simple;
	bh=ocT+2Lqm7zGdt+U9dlPmYwTu8/bWc/XiFRrsH7iAX+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q1FW7fX2lCSVxSAeo7hYzQgMoJFc6GjeV0SRglFH7r4f0zAyBc0bj2hX+x9Ifu01iGze+3foC5Xj/ItsOZ9xnJxQvWxQ6FItledJGYGFAv5MSVQ3yXOPMQIyGGadq+1V/GsAWs7iCGq4ihmL1WxLZy1iMXLxFADfRE+EBZqKLcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e34339d41bso56965787b3.0;
        Wed, 06 Nov 2024 04:51:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730897515; x=1731502315;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PPHd5Ml+4dhfKf7+W9PSlfsoxE25t0TD5o+m/lVsDyw=;
        b=qCYsgywD10AXEycUq3ASdAte2KQarLolUifxNJJgObOiKc21fk2T7L5X2v/WsLp+Zp
         h7SCFdwWy0Tr8poEFPvqgWMRRarRc+XgLHOIrvqZMxejXUrI4/FpYjHOAOgBAWpVANBn
         bRJDT8BZ84KoES4D7ZkWu1En7gOkfnTEpaXSXvTWFqI7FYCgRg6IkHrnPf+jhVz0SGfu
         t33AdiVHgK0T2CCwpp47uDjmJQtimGc1FeloA3Ga6YoQawgx797+CDhrJTAIB4eUEm90
         4keHXUzGOuLYPzxQ/zVRnEnsRs16D1E1Bqoc7kfhUL0O98DiwDpyX5Pgz+2szf/b5gLn
         nDZg==
X-Forwarded-Encrypted: i=1; AJvYcCUYYg1/chE9RfyYql9R8GLKqFEEXBT2rkZaZUbPBnV9vfFBr/59F9L5PM/coBgKDWW/a/Xz4isUW1h1AQ==@vger.kernel.org, AJvYcCW5i6vwqg2Rj3Rx6gR1AW6LA54ia0gwyOMmc8bYuHRTzO3snne2c+4Uid7IKWwJNldI4AtU3hIzC3ElvA4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7wRzm9j+UVXIKDsRb9W45B+elkhWpiwLvJl/qAa9CSeGKSrPZ
	iNC+HmlZiF5lBoXHpy2h3ERt5iTRqg8SVsatKOFr2zu8SNjCfnqlZFSh4Ki0
X-Google-Smtp-Source: AGHT+IH+jd+VaBYPbTe6J+NYKfpJFCGLSrhNc0YLq5nKsKaneGnlsYlL/yUDDpFIO7LhmHWQwTPgBQ==
X-Received: by 2002:a05:690c:311:b0:6ea:c467:a632 with SMTP id 00721157ae682-6eac467c44fmr10185617b3.35.1730897515605;
        Wed, 06 Nov 2024 04:51:55 -0800 (PST)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com. [209.85.128.178])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-6ea6965d0ccsm23137937b3.70.2024.11.06.04.51.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Nov 2024 04:51:53 -0800 (PST)
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-6e34339d41bso56965177b3.0;
        Wed, 06 Nov 2024 04:51:53 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV3Gk/C+eNCoMzsy0GcO2wJMgTLBMtyMzYSlSgRm2DyPyDhYejft4j9WssrXxU19LJg2f6V7h8CXDcCHEg=@vger.kernel.org, AJvYcCXkzkb0bPfbm5awzFfyKuSMeMggSbC3oFUgR8RM3ETDoP0NSd9MPgUyVKRCKLVTGvOKrUguV+st929JJg==@vger.kernel.org
X-Received: by 2002:a05:690c:6607:b0:6ea:9bca:9fcd with SMTP id
 00721157ae682-6ea9bcaa376mr108385977b3.2.1730897513684; Wed, 06 Nov 2024
 04:51:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <9e56c0d03509d79736961ded7a1b90a361fd2e06.1730895069.git.geert+renesas@glider.be>
In-Reply-To: <9e56c0d03509d79736961ded7a1b90a361fd2e06.1730895069.git.geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 6 Nov 2024 13:51:41 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVkMezR+opdwY=8QQuKRsniMhP3D6EiHVycn69PRUuPeg@mail.gmail.com>
Message-ID: <CAMuHMdVkMezR+opdwY=8QQuKRsniMhP3D6EiHVycn69PRUuPeg@mail.gmail.com>
Subject: Re: [PATCH] pcmcia: omap_cf: : Mark driver struct with __refdata to
 prevent section mismatch
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Dominik Brodowski <linux@dominikbrodowski.net>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 6, 2024 at 1:14=E2=80=AFPM Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> As described in the added code comment, a reference to .exit.text is ok
> for drivers registered via platform_driver_probe().  Make this explicit
> to prevent the following section mismatch warning
>
>     WARNING: modpost: drivers/pcmcia/omap_cf: section mismatch in referen=
ce: omap_cf_driver+0x4 (section: .data) -> omap_cf_remove (section: .exit.t=
ext)
>
> that triggers on an omap1_defconfig + CONFIG_OMAP_CF=3Dm build.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

There is one more in the DaVinci cpufreq driver, but that one never
triggers a warning, as it cannot be a module.

So either davinci_cpufreq_remove() should be removed (it is never
emitted), or the __exit and __exit_p() should be dropped (then it can
be unbound manually, but never rebound).

https://elixir.bootlin.com/linux/v6.11.6/source/drivers/cpufreq/davinci-cpu=
freq.c#L134

Thoughts?

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds

