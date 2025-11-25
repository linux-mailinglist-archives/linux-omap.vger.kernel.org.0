Return-Path: <linux-omap+bounces-5037-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A97AC85210
	for <lists+linux-omap@lfdr.de>; Tue, 25 Nov 2025 14:12:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BB1294EA3C1
	for <lists+linux-omap@lfdr.de>; Tue, 25 Nov 2025 13:11:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BC0B3322DD4;
	Tue, 25 Nov 2025 13:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ohQq98jq"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 243DC2765ED
	for <linux-omap@vger.kernel.org>; Tue, 25 Nov 2025 13:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764076295; cv=none; b=d+k7Xp2NOx05GSpkBySye/FfPlnALzi+yLjeT8u4nXbHgtBXz7BxVwUpFqCu/z4jcRu6MX2sm/t4CI+ZpDsJ0S046T2krgMekORD/ayiJMKlkAYk9eObyLo4MFMz2yGkaH8ztVAf1Wz3IIYN2cdZLCh8IxZLSTOjKWGepWaTXXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764076295; c=relaxed/simple;
	bh=fBpUblSc3O1DzyBy7QcSE5g7YN0o/5l40ZKytPpEwNA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MnUEogTcQ6xxoG76wtRfSnkx9Whks7MCDEc4g4mrUZ4Pxld2Gkgg3qqRW2OweVXafWBchuRgJbDJquwIh8Fv9LzPxKtTnREwMB+V7WHRXOsEBIcTibS9MN8si1DAjriqAxuezr3HDJ2JPSL+TfU9vLD9Aba6AgOaPVs2t77A3dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ohQq98jq; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-477a219dbcaso49714525e9.3
        for <linux-omap@vger.kernel.org>; Tue, 25 Nov 2025 05:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1764076290; x=1764681090; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AF/ymKNU/IWkNzMOHS5V+glJ5rwSWoJx1hh9KxmKoDw=;
        b=ohQq98jqY0dIQaSn4JBuLcz9OMEMzTflYms+E0aPrY3nirlBjahAIeALTZjFaPpcB5
         KXFwkF8grL29+UKFdejHQMNhqrNF4pVV3FdsJQcVGUgoJy8iHD4w4cW6yaIKVPcABvpZ
         Rkz9feNHnzA/zxjwOfKY3m5qYveikukBCNGy86WZ9w2IIFo3VMYNqtvE9/9eHfnCHEIO
         TLJ38PZvDHiiLBTBk/XsdmlUSStZuBMBy+g8bu9q0gdCtKVjhwe5nnRNgx4XKRQKCagu
         GqYbjPzXg5c7Cylf3sm55kkn2jI63b2YfdmmiWcaarvQC/c0q6dlVTg4RicKfNWRopch
         5I9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764076290; x=1764681090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AF/ymKNU/IWkNzMOHS5V+glJ5rwSWoJx1hh9KxmKoDw=;
        b=oVKGjBQXKhqFzoXYEEliP/dGrLkmMQxnRSCiOoJeDy+FogBVMr7aP8UVozzXts/q4i
         lA56iTNw/NaSfUrC1c+DGk/JIEKQUaFGUbYBNvN676y8FrcaCe9sQIxj0RdCiMALp0Hn
         UVHM1gv1U0V2oIuzR0hwFHHTsW+ov+hMez6xuHsZBo6LK/F0nV6N9R40HH4GVo1YjjsQ
         TOU5+26+bl9AwG0WAaOxalIiWDtHumvsgbi10KzUj+PIgr+7FjNR+CLfb+aW2fLIYQgW
         IVDtZav3t/HN8thYP48nca759e4zsXRCADAwD/p9+quVkHp5XLNIznVn4xM6+6h0Scbp
         DSJw==
X-Forwarded-Encrypted: i=1; AJvYcCX5s6gHUf7AYKlrSbAz6I+WBFhItMokpbPefjn+lolGKY6YktGJ5UVDnjVI4xFsbmK01YAjWjAb+ZmZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3TzYfd3vkdPTmrF/W040+sQdQvdPooyij8BSMcoEbcDGqrtoa
	5jJu+cpeYWPwAiS8tseQL0HR72HgAyNEqtL2DB0YT5jnFKgjqNNBQdNecME0y92a0+E=
X-Gm-Gg: ASbGncsZsTIpnwzFtiQ5pnnthr6HwcmaVsycczbHTgcQzBApxRsuLHhRdYvOZwx8aKa
	n0pySC1Ytby7v0/h24JVkCbI70Lzd7YO5VtXGImR6b27ZtmNRm7WAQPefHEp0bUDv4Uke+q0Qwc
	MjUsX5mF/K1U0hYn7mNL4ECYGshnLDs46wd2hqH0dZFmCItJH+DazCdTRyRneRATQqfLTinpUdD
	Y23NuFsCQjzQ3ehiMXTFDEtx6AtxbVHrdzrp5o3zc1gCQcfxYMchrA5Ydlp05/JmvSGiOx+uF5q
	XfCSBD4/nzERdJ5XyXGm6oB8KedYibZvnZpN1Q8geZyScJ9zd+VXJfUNq1krfyeDaeqowCBWPqe
	8VQcFb9jHQTtUAQQLQhEUvm5cwfUU/8JY7SLYr8HbXgYlU8G6Rb0Ak8v1f6/SOSTygGSJ/b+KnC
	5KQqJ/
X-Google-Smtp-Source: AGHT+IF2d1dNaLQQ0BE1lb2WDqjp5F/ItE0EG7UTuAPSQpK/RrXI2v4HqgZHJSatvjjVOjwrU182GQ==
X-Received: by 2002:a05:600c:354b:b0:46f:b327:ecfb with SMTP id 5b1f17b1804b1-477c0184c45mr143467535e9.9.1764076290301;
        Tue, 25 Nov 2025 05:11:30 -0800 (PST)
Received: from brgl-uxlite ([2a01:cb1d:dc:7e00:df0c:79ae:5345:c3b0])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477bf226c2asm249328865e9.10.2025.11.25.05.11.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Nov 2025 05:11:28 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Doug Berger <opendmb@gmail.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Hoan Tran <hoan@os.amperecomputing.com>,
	Andy Shevchenko <andy@kernel.org>,
	Daniel Palmer <daniel@thingy.jp>,
	Romain Perier <romain.perier@gmail.com>,
	Grygorii Strashko <grygorii.strashko@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Jisheng Zhang <jszhang@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org
Subject: Re: [PATCH v5 00/14] gpio: Use modern PM macros
Date: Tue, 25 Nov 2025 14:11:26 +0100
Message-ID: <176407621592.26035.10745445614533794233.b4-ty@linaro.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251124002105.25429-1-jszhang@kernel.org>
References: <20251124002105.25429-1-jszhang@kernel.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 24 Nov 2025 08:20:51 +0800, Jisheng Zhang wrote:
> Use the modern PM macros for the suspend and resume functions to be
> automatically dropped by the compiler when CONFIG_PM or
> CONFIG_PM_SLEEP are disabled, without having to use #ifdef guards or
> __maybe_unused.
> 
> This has the advantage of always compiling these functions in,
> independently of any Kconfig option. Thanks to that, bugs and other
> regressions are subsequently easier to catch.
> 
> [...]

Let's give it some time in linux-next to spot any potential build issues.

[01/14] gpio: dwapb: Use modern PM macros
        https://git.kernel.org/brgl/linux/c/3f19e57cbfb55d743d60aeebf5d5c48cc7fd5d4e
[02/14] gpio: brcmstb: Use modern PM macros
        https://git.kernel.org/brgl/linux/c/56f3a6d7538d2e0dfb8d9df7871d2a9aec3115ac
[03/14] gpio: htc-egpio: Use modern PM macros
        https://git.kernel.org/brgl/linux/c/2557b1f4f21a75650a03c74a56ea30bd4214866e
[04/14] gpio: pl061: Use modern PM macros
        https://git.kernel.org/brgl/linux/c/b40c4dacf48a42ddcd701552575945e90f5c8060
[05/14] gpio: ml-ioh: Use modern PM macros
        https://git.kernel.org/brgl/linux/c/1f37a9f7d1fa582833cc8e226d77e5b2397df9fa
[06/14] gpio: mlxbf2: Use modern PM macros
        https://git.kernel.org/brgl/linux/c/a92f492a1473eb2255be9b7b767d0720c5c3b2a9
[07/14] gpio: msc313: Use modern PM macros
        https://git.kernel.org/brgl/linux/c/07a251bfe3b690ebfaef7c46f6ce25ea9ccba8da
[08/14] gpio: omap: Use modern PM macros
        https://git.kernel.org/brgl/linux/c/2b3c8bd8e13bd101fe8833b1f02ef5e5a6e9920b
[09/14] gpio: pch: Use modern PM macros
        https://git.kernel.org/brgl/linux/c/0ed358a87d6ef9782dca161ef3f1311d21f257d2
[10/14] gpio: tqmx86: Use modern PM macros
        https://git.kernel.org/brgl/linux/c/75ff16234bf3af747b9c77b81d7ce3df5c09df8c
[11/14] gpio: uniphier: Use modern PM macros
        https://git.kernel.org/brgl/linux/c/46e90d3924cb58b161c2dd57ba05f3a706c1c0e2
[12/14] gpio: xgene: Use modern PM macros
        https://git.kernel.org/brgl/linux/c/353fdaebdc6991f1cf03ae3aaec266ad0516859b
[13/14] gpio: xilinx: Use modern PM macros
        https://git.kernel.org/brgl/linux/c/dbedf93d1082b4e755eb62338e5f6566f4e31fb8
[14/14] gpio: zynq: Use modern PM macros
        https://git.kernel.org/brgl/linux/c/23ac52a4a2dceb704d8dc1674abb8beefd93bf1a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

