Return-Path: <linux-omap+bounces-4306-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 84A21B2F736
	for <lists+linux-omap@lfdr.de>; Thu, 21 Aug 2025 13:55:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 97C3D1C27E78
	for <lists+linux-omap@lfdr.de>; Thu, 21 Aug 2025 11:52:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 051382DFA5B;
	Thu, 21 Aug 2025 11:52:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UCGwqeU5"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC44E2DE6FB
	for <linux-omap@vger.kernel.org>; Thu, 21 Aug 2025 11:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755777139; cv=none; b=HTFOPlR/AWckaxictuv0Iiqv8P02a25mU0d/OOLlJRqjFkFM22cdx0ctlLCQDLPyPdBn/Kpxg/FHw0+y3BYod5qLYHFZssRNd3/LX2w+Kd5a0n1GeGbYB1d0nCcII2VHoGVH+IUa7D+KiXY2+5BqjXAFbj4Ad3DGtWlmMcx8pGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755777139; c=relaxed/simple;
	bh=1HfvgkKViBDBmpYljJpo0E9vtsQUhTJ9vwqBCEaAPZ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kMn5WSUzYPK2PAal0S4RR9IV9OF1N+iuL8ufDnKtIDu3cALWNhtc8GimNLiloRp2YXY+nr42ITcwTF69v+++UPh2oWjALmaJyZz635WITzMVgLyrMpALKKpSk0yJyAHSMvBA9n8yZSejlEYIb0trTRh1/NkbFl3iMorI50kWr/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UCGwqeU5; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-55ce510f4f6so877540e87.1
        for <linux-omap@vger.kernel.org>; Thu, 21 Aug 2025 04:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755777136; x=1756381936; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1HfvgkKViBDBmpYljJpo0E9vtsQUhTJ9vwqBCEaAPZ4=;
        b=UCGwqeU5t1LakJHmSvOrQse5imuLR96fw5i6jBiJ8aSZsV5UfDUgxWhnDUd67XXE83
         new2c11eEQNra+3JhGPan7E8GboCddGqXUEST0VgrgpOJdf/a4sBOueLqb3Oxd8NI+IR
         2CrmxMHs0Jci3N2MsQ5R5klnydqfR4UjQMZKkSbLIdhxuiCpDvYhc3TR5UDbKCllfGdl
         uBElR99Qc1roTCmJo2dPDiQxbff6ZjO4ECpGwgU8JOocvTtuT5cskR7D/CwP2XY9NANJ
         WG8pYufjZBby/fxpGgI5L0nd29HEyWfUMgf1iFkcJtyvE+6bPyJNou58D4Z1tt/tCtSw
         kZoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755777136; x=1756381936;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1HfvgkKViBDBmpYljJpo0E9vtsQUhTJ9vwqBCEaAPZ4=;
        b=nqC5FR/4YBYmZfCXQSDnp3pMe/ax/rZdN8JXa3UGGzeJytn0zTVu/f3ov8iCqv7uNG
         ErTC7f7+vJtX+R6N6uGAJg4JZgjyuVt7KqsyEGUpeXk/82pG2GFA9n8vIBOwqgr8kp/r
         tDPalNb2URlvOHOm6jU1ngu1/3YnMEnuMvea+8bDPyx+n8W46hbhvfD509PFOVlZbmVq
         MYl6C8BnMVyzBcQa4XyGbNA6u9KIX3kATgJrWO7RFC/IiEYU7tHfsuDj+5yUtwhDHTkf
         PUzej6f0+Jb4r4e0/Bd2sGZhFyr78/HrSLC2VPQYGSsmLNw5IDJnWlF6POlEBUfJZM1D
         J8jQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTCAisreSussEaUn3K/ooWKzXSIai9QtX/Ee+8jCr72i3neGYzohwRVHZX7mOWPcygINWzVjVs8ZgV@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf+3CNovoRrTNMa4X7KEBLKhx5Hxc452LbawHlZukbpCbf0VFe
	Xhoaz0pOzxxUGIRgGg4csyss2Ns4+YU3Cq7x03X/1EFY3R/qGNSRI0tarWS/9dnhjQL7JU9Ut5l
	3Yghh/JLaadMkG/9j/AFK5Hu7MzfcOsCdl3jmcrbEtw==
X-Gm-Gg: ASbGncuZn/W2oEINbf84bkI0At1Mj/plDRz2sC1GSssR1VhwRVGjfcoxkdsl8skBRja
	XltPthstyWoYQzvZ6orum6G9hwRxC+uAUpokdCnT9WVOTluybeFxD6+gNyxpW3vkBhJt6QfTH4E
	8xmVM/ZjUVXMfKXFl+XceRejxvldC7vYkCktEosCoQF+BlLzKNkSnu/5S6jmMQobgW4TiOp6yLf
	OgWQZI=
X-Google-Smtp-Source: AGHT+IE7DsV+WQk14KSKY0ALtymqoUNW021ikvEa1U5yioRxACQmRRzQMDDiUa3zI76UT8Ua7qd03ScrDSQ9aaYIYQI=
X-Received: by 2002:a05:651c:235a:10b0:32c:bc69:e926 with SMTP id
 38308e7fff4ca-33549e3a7e2mr4759881fa.7.1755777135941; Thu, 21 Aug 2025
 04:52:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250820154037.22228-1-jszhang@kernel.org> <20250820154037.22228-6-jszhang@kernel.org>
In-Reply-To: <20250820154037.22228-6-jszhang@kernel.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 21 Aug 2025 13:52:05 +0200
X-Gm-Features: Ac12FXyaf06rfmzUvXDVHS6gsoqtOPyc_OHXCIqFKQWuBvT2rlmZGUdGjdqba8o
Message-ID: <CACRpkdYQLqDxh=zqrZ+wK_Ky2wD5AUoVLmCV_JDfmaqJC4Yzqg@mail.gmail.com>
Subject: Re: [PATCH 05/16] gpio: pl061: Use modern PM macros
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Doug Berger <opendmb@gmail.com>, Florian Fainelli <florian.fainelli@broadcom.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Michael Buesch <m@bues.ch>, Hoan Tran <hoan@os.amperecomputing.com>, 
	Andy Shevchenko <andy@kernel.org>, Daniel Palmer <daniel@thingy.jp>, 
	Romain Perier <romain.perier@gmail.com>, Grygorii Strashko <grygorii.strashko@ti.com>, 
	Santosh Shilimkar <ssantosh@kernel.org>, Kevin Hilman <khilman@kernel.org>, 
	Robert Jarzmik <robert.jarzmik@free.fr>, Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, 
	Srinivas Neeli <srinivas.neeli@amd.com>, Michal Simek <michal.simek@amd.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, linux-gpio@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-omap@vger.kernel.org, linux@ew.tq-group.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 20, 2025 at 5:58=E2=80=AFPM Jisheng Zhang <jszhang@kernel.org> =
wrote:

> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards.
>
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
>
> The pl061_context_save_regs structure is always embedded into struct
> pl061 to simplify code, so this brings a tiny 8 bytes memory overhead
> for !CONFIG_PM_SLEP.
>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

Hm true, 8 bytes is not a big deal.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij

