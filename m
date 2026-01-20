Return-Path: <linux-omap+bounces-5573-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id EDA70D3C4B4
	for <lists+linux-omap@lfdr.de>; Tue, 20 Jan 2026 11:11:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 6B90E580412
	for <lists+linux-omap@lfdr.de>; Tue, 20 Jan 2026 09:58:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B0DB3B8D67;
	Tue, 20 Jan 2026 09:57:17 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-oi1-f196.google.com (mail-oi1-f196.google.com [209.85.167.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9563A901F
	for <linux-omap@vger.kernel.org>; Tue, 20 Jan 2026 09:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768903036; cv=none; b=htDjliaOc/gngfIA6ZwBzixtfUu/p5qZPRi1Uu4fEe+UUonI6frTUrnTIW25qG9ktkkXH+XG2GHIMFcnKXS80SN4lSrdCaZchfdqndaJzy1sXMKGluTeUEuzMQjEVb1nmhUpnlV1Ph8qxGW5odw67Ld3BpOpBgbCNNV7V9nCdxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768903036; c=relaxed/simple;
	bh=PhelJ3YKLy0g5664IUc1xRM3vK2MnAcXyilLWshEZX0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SzgURX/ozpc+rmMIjEoGsMDLYj97Ith/QXVnHfrqVSZHM48d/4oPlGXxK8hq4ob39OTGuJ8SHOYJ4jVriokXxyoNWdQunB55oEveuHM61wlTT+RtTgsCHM8CzZfJpGbZKwizih6eehe+bYmUPvJ+oYmppJLcvpGS4I31TnrWpDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oi1-f196.google.com with SMTP id 5614622812f47-45c715116dbso3519105b6e.3
        for <linux-omap@vger.kernel.org>; Tue, 20 Jan 2026 01:57:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768903034; x=1769507834;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cMqHiB2kIqqBrLa59wdqxa2/T5exJBY1xL1A1svqwlE=;
        b=kt/wWO91Sp544Lp+4OFy2HlRhJ08E9U0yAOfVhtOJ9T8xJ/2i+BRMZXXG1TyS/d4nC
         e68SxGu4edzEspsJPRVR1qZuZrp9w7qk2KZ/tGT26PH3KD9P5j9lF/oL7yulVL6Ykyrs
         B83DKr+NAn/JARDwQQbDTxdD5AgDVF8hCHjCi3lcvckcL5nIoI1HNh9e/XHPheqcwnnQ
         JVpuKXAYijGOatCTMKr16Mkq+qT5P6UTv3V+p+jS77eMO4/kz07j7LpPA71aLF8liToM
         CAI9VyNoC3MvvfaVri/TipcJZKLGAru5zsskeA/iZ0YE9mwWp43cLalGZuVQQ3vDr4I+
         gtvA==
X-Forwarded-Encrypted: i=1; AJvYcCWhUxk4pcZJ31vUT79GBXDYHH24bIypWeCMN3bVN3q8D7asunqfmmucJUE1XWcrvQPKxQRzPUyGSmUh@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4ulxgx2PMEFY77aNG9gUc6v+7MJJUKBJJJ7agAbSYDP3ti38l
	VjV9T8WuJQcTyrxQSUkHfl5kEM5Ui4+Sg7dtzKywQhaZwsiCzgahB2YhX0KRcs0ldE8=
X-Gm-Gg: AY/fxX7HY+TnqvxrZH4YUEaR1kqI4gBlNhcO0A2IrqPNdm/DZyY3LZcTDX/gZ/ohQgn
	53dzKgoVsEmBSO++wuLADBp2mUxX8dzJCEj604J5Xubh6r7pZk4j2qgyUevU7uqXkSvSooWzxTx
	/nBJ/k3UcpeWoLw/QUulBMz5m5wXgKfXZ+B5eYk3OCIzz0f5D8w1WZtrIGRozTuKxoKd6+mHYlG
	57Cn9VAtnRWFqCGqPQY2+MWxS3zVLx+kKi9fy1dZwcfu/qpyY6DeOJPs/vnthjVOA49hnfMTCf1
	CVrUg3C9dShFt+wgxIbZg1VQg853A8RxK1E9jjQWSXOvokrPq2IyYG7dxXXlazAPhcvG0cRUTJk
	kIjGucmHIuHvk6XqKDFUUdtlGWPkaoAgSLLtLSHKsEstsoi37yIPrYLyq3IZFOcQ5owWwaA9DfX
	rEhLT0kaE70CkoOEBJNMfR7sKG5HEz6HO+BgRHZP3VXUDnup9AbIj2GnChphg=
X-Received: by 2002:a05:6808:10c3:b0:450:c877:fd5f with SMTP id 5614622812f47-45e8aa72f51mr556744b6e.49.1768903033922;
        Tue, 20 Jan 2026 01:57:13 -0800 (PST)
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com. [209.85.210.52])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-45c9e03e82esm6800242b6e.15.2026.01.20.01.57.13
        for <linux-omap@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 01:57:13 -0800 (PST)
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7cfca52ac2dso3227268a34.0
        for <linux-omap@vger.kernel.org>; Tue, 20 Jan 2026 01:57:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW1dGyrjx6sqOGI+ByAOAvAwASyfp7TeSZh+yxuQWLOZf36fUx8pldBNSHK96+1zGOrrFMEyMTgA7lo@vger.kernel.org
X-Received: by 2002:a05:6102:2928:b0:5db:f6ef:560 with SMTP id
 ada2fe7eead31-5f50ae0a099mr264663137.28.1768902583158; Tue, 20 Jan 2026
 01:49:43 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260118-rz-sdio-mux-v5-0-3c37e8872683@solid-run.com> <20260118-rz-sdio-mux-v5-7-3c37e8872683@solid-run.com>
In-Reply-To: <20260118-rz-sdio-mux-v5-7-3c37e8872683@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Jan 2026 10:49:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU5shzYs27wO2A0SoisGBMo8RHf9DO-ubC6VrhWECEPCw@mail.gmail.com>
X-Gm-Features: AZwV_QjEUqevj8OUxZ5xnP3V3BgNbEzQSiuy0CgomAkdvyQGaaSlv633jCWavtA
Message-ID: <CAMuHMdU5shzYs27wO2A0SoisGBMo8RHf9DO-ubC6VrhWECEPCw@mail.gmail.com>
Subject: Re: [PATCH v5 7/7] mmc: host: renesas_sdhi_core: support selecting an
 optional mux
To: Josua Mayer <josua@solid-run.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>, Vincent Mailhol <mailhol@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Peter Rosin <peda@axentia.se>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
	Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Vignesh R <vigneshr@ti.com>, 
	Andi Shyti <andi.shyti@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Yazan Shhady <yazan.shhady@solid-run.com>, Jon Nettleton <jon@solid-run.com>, 
	Mikhail Anikin <mikhail.anikin@solid-run.com>, linux-can@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux-i2c@vger.kernel.org, 
	linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 18 Jan 2026 at 11:29, Josua Mayer <josua@solid-run.com> wrote:
> Some hardware designs route data or control signals through a mux to
> support multiple devices on a single sdhi controller.
>
> In particular SolidRun RZ/G2L/G2LC/V2L System on Module use a mux for
> switching between soldered eMMC and an optional microSD on a carrier
> board, e.g. for development or provisioning.
>
> SD/SDIO/eMMC are not well suited for runtime switching between different
> cards, however boot-time selection is possible and useful - in
> particular considering dt overlays.
>
> Add support for an optional SD/SDIO/eMMC mux defined in dt, and select
> it during probe.
>
> Similar functionality already exists in other places, e.g. i2c-omap.
>
> Signed-off-by: Josua Mayer <josua@solid-run.com>

LGTM, so
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

