Return-Path: <linux-omap+bounces-5236-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 69A4ACD5B88
	for <lists+linux-omap@lfdr.de>; Mon, 22 Dec 2025 12:06:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 554D93008D70
	for <lists+linux-omap@lfdr.de>; Mon, 22 Dec 2025 11:06:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DBAE30B50D;
	Mon, 22 Dec 2025 11:06:05 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823A7295DB8
	for <linux-omap@vger.kernel.org>; Mon, 22 Dec 2025 11:06:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766401564; cv=none; b=Jvfvi/Mwn/0z3HfncSfZQmrp4ufIvvt4Oteies1K2PNHjh2+UVUHpFvwybAuizwfDmLB3ZsuujleYJxyZ0ofUE/4fTNsm/ASEXX+atEwfHd3kl7BKUyj3TYEEl4zgJOw2lQfW8k8gHiENWreq/+x1+868lIjkTZ4cZELTtGffmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766401564; c=relaxed/simple;
	bh=Sa6vRFp+J8CzdQeFDX4yWNCdRt01fLLpAObxTP7lVIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pszVqeTzUr2a/je4lWcDrbwFzk0DKx0KDMrG3fY5wUMYjzKCgP46rVarka/PcDs0kUHRbVdeSyizcXrsCWxbL7daw0z7f9co9hSeIm0qR/D0ROjV+Fx6x3dMSbJQL8am5Iy8QXjUNQyX0/q8h6j/5iglVrCdiUFqcaWu9eAU5Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.161.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-65d0441b6feso2206119eaf.1
        for <linux-omap@vger.kernel.org>; Mon, 22 Dec 2025 03:06:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766401562; x=1767006362;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Er9fT5sSTO9v6Ol7FhPUI+D4OHHff+0Re947MEjlztA=;
        b=GijIyZQatVEoK/OecyRFr6x8CXGzqhlAMw6ZJkSXqlT9RD98142xzc1BsSHHLJstG1
         R662GBkFU8yuEWKAvrneu0xSVLkqLeHX37VpyZMfqRAbDc4ffcoLjQIjeJW9I+KiAPMi
         2UpdS9EvHKzpgftdi9BCK55DssXTnyu8psZBr5fJ1cH7lnIVe7d4/iKcZCD+hRD9rWiD
         zgzvL855FO0JlCjTovxzYZFGmPgOVFseTvPhhtfv5w+jTy5uVo38ntRfCjuWDdQTWwQU
         w3/o6/diPJgDwuYPK6Acy1uLGcezPudRtk00NLhqdpDtRxi6SpXOPObA5SOXTGGLqMvg
         pp0w==
X-Forwarded-Encrypted: i=1; AJvYcCXEd/0b+/XiT2XKg7C/t21pIabmLMpfTZNRbNh7/DfNrJvB4dpLkCpRtl9KRvtwWQ4UD0bL3oq8sz/W@vger.kernel.org
X-Gm-Message-State: AOJu0Yxl2r5D0HM0PXuNLzwk64x0XDGqmSspMJEB5GWY39rz7PUPyJ6Z
	rpOjbXT3qF4GtYAb7GYN1Xm0h3+7hSJZJE7XXy3s+jQPhIfx3ghxoH4+eePvWlo9
X-Gm-Gg: AY/fxX5RJJWQJqtUrUT7z5KFrb3rI+98hCaxmkZse6oEAcmJqib2EyLrM+Aat6UT7IG
	d160pmZln0AaXkvwUhkpOHCCTtic2mbXmgB5QIWlFuvIJV5dzhcl1ZgmTWIk4eBfXojWd098ita
	e30nN0jEWWlYLDmRzCXz2ij2mwiiaS1OyCS2YFnVLlJLFV4XRxs3kNv4GCNHTyYreKNWv53xuXi
	suwB4kvHOWgSKggwGQYWkwBp/DOtPXol9qSQOmgv0xobavqUg/tOewKLCTihtOQolFI9CqZdlic
	MxXS1BtLh81U7a/2p7riuyTuO1hnCx4969qhPpQqKs64dqz02QoRiSxu3Ela9w1IZlPSXbSrvGO
	JYrTfwETYny2W8cgCTI/adYreZGqJ6Da0fWzxglcTusala078Mzqn+nZqY2olZ2k7LsXV9Q8B3O
	mUs+OXEatTU8iGzamyiZrcMyxDyyqtWUJKLSB3WGgoFb5ZwR0y8wri
X-Google-Smtp-Source: AGHT+IFtE9g2fgqpa844pr4jbG3HqwAX4ZtgiG5D4793u6oEQL7aG7C8RdhD+JbTULQa+2efOkGGsA==
X-Received: by 2002:a05:6820:168c:b0:65b:35fe:4323 with SMTP id 006d021491bc7-65d0eae1f60mr4862057eaf.67.1766401562449;
        Mon, 22 Dec 2025 03:06:02 -0800 (PST)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com. [209.85.167.171])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-65d0f69ae7esm6652062eaf.9.2025.12.22.03.06.01
        for <linux-omap@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 03:06:02 -0800 (PST)
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4537407477aso2467614b6e.1
        for <linux-omap@vger.kernel.org>; Mon, 22 Dec 2025 03:06:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVRabUZyn8qtmpLAgASdtKLVUZOWAn3XgkICWwaFy+lpaCwX2Eb1qovW8WiiQk1VvkCwjbbDELLBZSY@vger.kernel.org
X-Received: by 2002:a05:6102:e0e:b0:5e5:5ed7:60ae with SMTP id
 ada2fe7eead31-5eb1a817635mr3544923137.31.1766401227460; Mon, 22 Dec 2025
 03:00:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251210-rz-sdio-mux-v3-0-ca628db56d60@solid-run.com> <20251210-rz-sdio-mux-v3-3-ca628db56d60@solid-run.com>
In-Reply-To: <20251210-rz-sdio-mux-v3-3-ca628db56d60@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Dec 2025 12:00:16 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXmKPe6AyfAeD9nObqVhofZ4a5559_=DbDZzJ57A7=k9g@mail.gmail.com>
X-Gm-Features: AQt7F2qYMU-2Y0vKWd5gUo3SltdOK-02OVX3vIl9B9fuc7xPsFnO8gx3yQGyGmE
Message-ID: <CAMuHMdXmKPe6AyfAeD9nObqVhofZ4a5559_=DbDZzJ57A7=k9g@mail.gmail.com>
Subject: Re: [PATCH v3 3/6] phy: can-transceiver: drop temporary helper
 getting optional mux-state
To: Josua Mayer <josua@solid-run.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Kishon Vijay Abraham I <kishon@kernel.org>, Peter Rosin <peda@axentia.se>, 
	Aaro Koskinen <aaro.koskinen@iki.fi>, Andreas Kemnade <andreas@kemnade.info>, 
	Kevin Hilman <khilman@baylibre.com>, Roger Quadros <rogerq@kernel.org>, 
	Tony Lindgren <tony@atomide.com>, Vignesh R <vigneshr@ti.com>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Andi Shyti <andi.shyti@kernel.org>, 
	Mikhail Anikin <mikhail.anikin@solid-run.com>, Yazan Shhady <yazan.shhady@solid-run.com>, 
	Jon Nettleton <jon@solid-run.com>, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-can@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 10 Dec 2025 at 18:39, Josua Mayer <josua@solid-run.com> wrote:
> Multiplexer subsystem has now added helpers for getting managed optional
> mux-state.
>
> Switch to the new devm_mux_state_get_optional helper.
>
> This change is only compile-tested.
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

