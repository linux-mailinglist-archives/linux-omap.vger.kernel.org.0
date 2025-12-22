Return-Path: <linux-omap+bounces-5237-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 133D1CD5C7A
	for <lists+linux-omap@lfdr.de>; Mon, 22 Dec 2025 12:18:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 77D4B3048094
	for <lists+linux-omap@lfdr.de>; Mon, 22 Dec 2025 11:16:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 911D52DCF6E;
	Mon, 22 Dec 2025 11:07:21 +0000 (UTC)
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com [209.85.217.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA02B30E0F5
	for <linux-omap@vger.kernel.org>; Mon, 22 Dec 2025 11:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766401641; cv=none; b=gon/OuUC5P7jYwVL70isGTFPSa6vdYEax6J9KG9iNgBO550UHwzsZW7v6abPqVuI9a8yN58W4s9GjrUPYzwkBp53Yyjn17OLswRMfP1NcLWBL2RVRd+O7rFbpPO6cgBD9rzOXGAaLIiQTVPOhVxDTC9L51QhJHtE51QFqOHzSXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766401641; c=relaxed/simple;
	bh=hQz8inePYy4z7kE2ZTh8btcX7ZL/LHM5S3zx3idHlV0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pi/GIiCQ5IgsjZdCneP3FGWKKez5SL9OqqeXhd/FGEtN+ogOeL5hVzb+t6e0KhzOcC/DtXfHyb6hYbcbtMEVq+GKBwRgwbJsw3VwMzSnCLpZYh8QgQ4jWDF78SWuPWtW11xNBrGN0LotlwO6R5uMXSZC6jHsWQWLFLjMfYPY/9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f42.google.com with SMTP id ada2fe7eead31-5dbde7f4341so3774069137.1
        for <linux-omap@vger.kernel.org>; Mon, 22 Dec 2025 03:07:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766401639; x=1767006439;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iVlS5J1HzuVScBDeCBX0VxoypelfY5sXHRtDOTQInFQ=;
        b=VO8FDTRHoW09GkWK/e+FF92TgEXB4t8OIYqEvph4wSXZcKbVi+ThgQoc7t8+EGc7UQ
         RagxO64BPSidYlClzZtLVyGFFll5dM++3ghXPA+UJVimkfk9zTvbLf4KUchAGlWkX9ro
         wyP1syrdzE3vF0pebP25k1h+oQvHcJI0jmQneAW7zWmvm1EKT459cQZh2LglRVl+Tsf5
         oyxdxgTkwohh3KQHzfKlMjtTwpOoDxCXGdS9kcVFXloU5KhXgoCw5uPqK8AWKdwjroln
         5sTRQejXe8PeAlf1gyHVxHHhiFsJuIJliNCZjVWq3rwd9Tx053qnOGrKsACcrcWN/qS2
         CehQ==
X-Forwarded-Encrypted: i=1; AJvYcCVfYx2Ll0S1MQtCs40YxSFz4fnpbeAItBe+teV1QhIWYfoMZZLrk1HKRFvLG8KyLIgxuYsfdHHrPFng@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6ibofZwG0iX96PBSBng2qk5ODbK4NNom2pFN8AbN+HQWwS3+f
	JHUSDtH3NGkB+4dUK9v5FHVoRir67PC/RUs3ymqTk5aDO4Wsd/0YtXPnQOR5lN+h
X-Gm-Gg: AY/fxX62+ZCeP+bGZdJLojK+Wtb+jLljfnEccTfXGuJ7N3gOnzkE2L1MopRnbo+8aSt
	msAnwtHhH5Z84iwnrnCNYWGPDVBHNhCMcznqCsE9vGi63kG3hEu1OmVKz/koSBqQOhpMljUcyr7
	HrqjaOQ3+Ise2QXnJ25I7RXvOmbp7DvSJZz56uXhksnlErKpsOfL/aXHxnQdLm94yoPtrTTKvQQ
	Uk6vY8Jg1F/P4Lctbyg0V/W/1l4m/m9fGqchQ9hdfe3TxFmobHI+oLr5O9QJ5ZN+R/4VhZp0Xu6
	C1wD4XcVEyvk1CU104PIP0jZ81GThlIss+pPBiWWTa0JOb32XeyfhMsfGfq4FOuFyzciklfwYhk
	OPfHTg4BLWWEJQXdSr3/6QmMuu3h02Y2Kt28U5Bqb9FW3EGx906cJUwLCFnzJgDX1CvRbkcW36B
	T+P2hZxpNovQ0Npts6D6eiyWNTZQ7vGgcQmoV6iZK1G69Wdtmz
X-Google-Smtp-Source: AGHT+IEinh/dOIzbNkgqc/APuOp26UdKMAdInSUuZdDjqdaahxbsV0gEkrNsHzyYRAgl/+4gXrRqtQ==
X-Received: by 2002:a05:6102:c0c:b0:5dd:a08e:5bac with SMTP id ada2fe7eead31-5eb023b4d14mr5447458137.6.1766401638693;
        Mon, 22 Dec 2025 03:07:18 -0800 (PST)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com. [209.85.222.43])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94341796a4dsm2857345241.12.2025.12.22.03.07.18
        for <linux-omap@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Dec 2025 03:07:18 -0800 (PST)
Received: by mail-ua1-f43.google.com with SMTP id a1e0cc1a2514c-93f5910b06cso2373041241.0
        for <linux-omap@vger.kernel.org>; Mon, 22 Dec 2025 03:07:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVE40dcof0LHecDgi37N0WsWN+BAsaFwkhh6nqeSElLe7xoZJVD/Yssw7X7jHuKB9C3C+gkUHkO4/uk@vger.kernel.org
X-Received: by 2002:a05:6122:6790:b0:559:7faf:a276 with SMTP id
 71dfb90a1353d-5614f7ae2d0mr3069797e0c.7.1766401194470; Mon, 22 Dec 2025
 02:59:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251210-rz-sdio-mux-v3-0-ca628db56d60@solid-run.com> <20251210-rz-sdio-mux-v3-1-ca628db56d60@solid-run.com>
In-Reply-To: <20251210-rz-sdio-mux-v3-1-ca628db56d60@solid-run.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 22 Dec 2025 11:59:43 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVqSPQ_rCY1mPxyAw1=WwK2VX9bxMKQQuVEe75u5hTvsg@mail.gmail.com>
X-Gm-Features: AQt7F2qvtAFJTZWBdh_71wFZZJPHL2v6ti7TTVpa1qQd7XzzszUS-LtvxMifYms
Message-ID: <CAMuHMdVqSPQ_rCY1mPxyAw1=WwK2VX9bxMKQQuVEe75u5hTvsg@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] phy: can-transceiver: rename temporary helper
 function to avoid conflict
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
> Rename the temporary devm_mux_state_get_optional function to avoid
> conflict with upcoming implementation in multiplexer subsystem.
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

