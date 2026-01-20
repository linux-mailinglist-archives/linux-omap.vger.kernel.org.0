Return-Path: <linux-omap+bounces-5571-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id EF4A9D3C44E
	for <lists+linux-omap@lfdr.de>; Tue, 20 Jan 2026 10:57:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 330F65403E5
	for <lists+linux-omap@lfdr.de>; Tue, 20 Jan 2026 09:40:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D29A43E95BA;
	Tue, 20 Jan 2026 09:35:19 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8CD3446AC
	for <linux-omap@vger.kernel.org>; Tue, 20 Jan 2026 09:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768901719; cv=none; b=RN7Jyt2CO/rUJt+B4bP6gDXmZhOlJ9SSvTo2Zx9m+6KSj0/8/3fh5Zcq76L8L7oW3zsA7QuhdOdIo9kye6lCzNv6JkJT136xcR2L4B0Ql5dvVzJ5GpSE8T99+XQGNC1P9wK8Dvb2l0JLs3WxAIEwI6XS0ZP06NJAGYT/mM+UyNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768901719; c=relaxed/simple;
	bh=8oF7WvkLTpbnCP6yb2DMCynlFu+13M83ZUzjQuNxXOc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bcoc6BzIefM/VQDhqj1aBxhTbM45gjBLmRmXhYPU6WbrN7Ob/BPoTvuJ/nZp9VUAKlkGyQ9QEfEqz+9yFQpFx708U1vCo6Z9FoICbpBbKOKPE3HgkDIEJYzNpFYDChK77+UtQxSSOKyJ070M3oCdeljjWj0+CD/YRlA6jL8Tj9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5ec87b1f525so2236471137.0
        for <linux-omap@vger.kernel.org>; Tue, 20 Jan 2026 01:35:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768901716; x=1769506516;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=97LNh80TR77S8pwS2e4ZBU/MTmpHjj3Q16znIrdsedk=;
        b=Ea9IeOOQ/y+8cfq76rGe6ufDpUgMTk1DEToIL/MIkzsWCv47gyqrqxy05UZhukGfjR
         8uSsMLa5Lsn+uSERfeh5kALT3gGSonYJSMeW0eBB0BC1ayQKI6TDMxYYJz0t1YpFuYq2
         yCKF8k6Jypti/70ih/RimJr17lhz9D/ErIbHcbjNAfXZwkbVZVdO/cxoxQYXTOhACjSQ
         PjZK4r5wzAux5FCp2ZaKY4tcunj7nKfQP7VtLmK0+Vi8f92Xg17W9EChIMXBfidl1XlW
         fn4xO7g+9gs2izb9KR4b+zFVoDgtq0cCuLiL1Sx83gN9yNC7rKoeudsPFHT6wPmkqYza
         HIWw==
X-Forwarded-Encrypted: i=1; AJvYcCUv8PlmMUxTSOTE370E0k9bUrAlq24p5WFORHY1y9YQAK6FSh122s4hR6mg4zZKpysY00OQodL6xu9e@vger.kernel.org
X-Gm-Message-State: AOJu0YxyzpuByMEwoe1kW7PSAZDyxlnpe0CeavL/jmFNpjdTfxYUiBrs
	PIrguaOmM16SBna/G8pcFwBSeW2iNFeCbwCbgvfRaKfGcIaxPuHl9g7noqXENDWx
X-Gm-Gg: AZuq6aIabK15Dj+lEb3mia8D7kyh0bKcKQNswG6OQKet05BedjJ2wc+jlxbMkfV7eh3
	XIMnuS3RtRAHY6stYx2Gwd0ntIUukp/NUVEXPQevTwGAoCaLf+aytqla1dYiZCEidanRlHOxj4+
	vXNdH6fpXrEjbaxdpdlG8Bvl5bxAHyA//cT9C92zhCcE3OQlk6Te+J1Yp+HAVuJs/ZGeeF1L16z
	U4r8et9AsRipni/qfoanBmVdbirdBAGVlqHFnCeq5XhiMRgj8fDymFEhrRQGb/7dww0c9kJqbNv
	nJ7kCo5trqNPRArcNRFLx51G57WLwDq5MMDqV5fsFHptCXyHfjCLcwm5+l4iTjRr3ll8kNedFKo
	95PTR2b1kQwZLi6vyOTrMsJp2LOpDXilNZn7XdpKYGX1m8N70JdzH3jQP2LkMBCQKPjVlAjDHqE
	7HxQLjs7piol/Anee7NaLOy5cLYGBzEAU+62xQa7aBxiX3xndN
X-Received: by 2002:a05:6102:dc6:b0:5dc:7fe3:1d0 with SMTP id ada2fe7eead31-5f1a700dba0mr5204868137.19.1768901715999;
        Tue, 20 Jan 2026 01:35:15 -0800 (PST)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-947d0458fc0sm4056544241.15.2026.01.20.01.35.15
        for <linux-omap@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 01:35:15 -0800 (PST)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-94121102a54so3447383241.1
        for <linux-omap@vger.kernel.org>; Tue, 20 Jan 2026 01:35:15 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVImyp7Iy5eeo0CjqHeBMZU/dy1MscLRy4df2J9Nb6w74CsHNrjbEdMP6TmMrqIBmjm/4G+9fzGgEiM@vger.kernel.org
X-Received: by 2002:a05:6102:1610:b0:530:f657:c40 with SMTP id
 ada2fe7eead31-5f1a712440dmr4338759137.22.1768901715766; Tue, 20 Jan 2026
 01:35:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260118-rz-sdio-mux-v5-0-3c37e8872683@solid-run.com> <20260118-rz-sdio-mux-v5-1-3c37e8872683@solid-run.com>
In-Reply-To: <20260118-rz-sdio-mux-v5-1-3c37e8872683@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Jan 2026 10:35:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVf7MjEAaTAy3kgaTcfs240UcnL_yFWfYH_eqVfp-6jvA@mail.gmail.com>
X-Gm-Features: AZwV_QifN5dzgWIfmsNWfdw085d37JEd6a5y3M-TObPOlkszfcRmE9SintqdNzo
Message-ID: <CAMuHMdVf7MjEAaTAy3kgaTcfs240UcnL_yFWfYH_eqVfp-6jvA@mail.gmail.com>
Subject: Re: [PATCH v5 1/7] phy: can-transceiver: rename temporary helper
 function to avoid conflict
To: Josua Mayer <josua@solid-run.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Peter Rosin <peda@axentia.se>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Vignesh R <vigneshr@ti.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, Jon Nettleton <jon@solid-run.com>, 
	Mikhail Anikin <mikhail.anikin@solid-run.com>, linux-can@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Josua,

On Sun, 18 Jan 2026 at 11:29, Josua Mayer <josua@solid-run.com> wrote:
> Rename the temporary devm_mux_state_get_optional function to avoid
> conflict with upcoming implementation in multiplexer subsystem.
>
> Acked-by: Vinod Koul <vkoul@kernel.org>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

My
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
on v3 is still valid.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

