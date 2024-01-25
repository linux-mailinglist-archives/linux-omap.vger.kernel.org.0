Return-Path: <linux-omap+bounces-367-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CF983C4D5
	for <lists+linux-omap@lfdr.de>; Thu, 25 Jan 2024 15:37:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 3D941B21225
	for <lists+linux-omap@lfdr.de>; Thu, 25 Jan 2024 14:37:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D5466E2B7;
	Thu, 25 Jan 2024 14:37:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mzZeuRao"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838B86E2B3
	for <linux-omap@vger.kernel.org>; Thu, 25 Jan 2024 14:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706193431; cv=none; b=Chriar4ehnyexpCZcaBcBNUseDQH6yOMYnf+GCPO7ZgxXcalsdIuOy5uog3+iMW6Iz4Lg+b2ul/68PuNlZ7wA7QyRbSzrKW5uLxtN+wbDybnhz/xihcaBKXmX8qAky8wchX9xav2b8dIjN7GNAbhSL0ReF7g4Mbq+kW5RdKkvhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706193431; c=relaxed/simple;
	bh=LdyXJuXes8r86g/h3o9TyzHM58o0lFRK+kpKZZFj2A8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=dqyw74bzrFhtOaxW6Ux1M2QrvkJQlULaxLKAdSPC/eZptGXUIZQFGnta/vVdz1+vqi8LxL9OyAG+Qa+nOASylQ+Krk4oedIaQtjrjDmCebzcegMHMCFFnxJmOUAmu2U0KydbxNPqSCplRv8Dic2Ev56JVFz5TuyG2P4y38xSjDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mzZeuRao; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2cddb2c2b54so69442341fa.1
        for <linux-omap@vger.kernel.org>; Thu, 25 Jan 2024 06:37:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1706193426; x=1706798226; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PY0FJRxd/qeRrb4ukxj5gGPXGnLGCFI9vbya5ZkPcOk=;
        b=mzZeuRaofCJtviZmvRuvgcdjdPUHFT6VMDteH7wHcWOlBc/rqW3NF4HgveTY4xGg4G
         4iHmi1dtafdJQrpAxq3HEiQHD6jD+y2t658LpXMnbyYQoL5iRzcrjzuo6A7QelGknc1k
         TF/DP5YcjEz9Kci4LsGYqeR+LbmB7UQz8RnAEkWLYP7FwCm5tVLS7NdmJF3FBhSvpEyh
         FVoUgShEcpJB9VMhMWt9lrvpbzdPFTPaBGRqOdgc7DQj24/UWlJ1VtQi5luYjM6k9UBx
         RehxTWour1+OVBdbPf2D3kx9+DwV12BdJ1EheDX/9S44BQ1UPF6EV/1jSzU8/6OkqQKP
         y8yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706193426; x=1706798226;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PY0FJRxd/qeRrb4ukxj5gGPXGnLGCFI9vbya5ZkPcOk=;
        b=Ib1bQ9ew4bL3VgHkFA/Gp315SAiwLvk44EPl6ZpfVd7vnDmwghwScs6UB+nP4jGC3E
         Ll9I0XbrqJR6BQeDcrxBlUDFcf6BSU+omtmQ5h0rlX4vFnhb9vkV1VMX1XAFCDb3E8Zg
         m810c3N4jXui2uAmlPJ8JbmtSpz0PzkzLAsJ5Vo7Wn8oo3uJyNr70X7acm91vAmGvD1u
         anpHMnWTz0LmOcvGqzlU4+nzG7OQTl3wb++FYp+g4qRLQePxmPdB5AYdZ+0NmvL6RnBr
         Cqx0bVY32CJ4fgW2GaIN9EumuPacopqAor6cWB8NTsKl5v08BpY9RFF6Nhrf6cRaoVcw
         7Zfg==
X-Gm-Message-State: AOJu0YwqHSonTzwB0nliph/ph8Bypfe7jvpXjcmNeKZX+9i4B4AOgy+J
	F1ixPuGSBsqdzBJJRTho20/P8ELrOi6t80AO4r+Osss3i8cXMXHfGfBcEl0O7ao=
X-Google-Smtp-Source: AGHT+IGNowrJ+ExOTEseHFYkxYqx0+T2cock91wk/oWIqjeYEFWjHC5mMrgXgR6U01DMWiHgqVUVoA==
X-Received: by 2002:a2e:9b16:0:b0:2cc:a618:f11b with SMTP id u22-20020a2e9b16000000b002cca618f11bmr923011lji.93.1706193426317;
        Thu, 25 Jan 2024 06:37:06 -0800 (PST)
Received: from [127.0.1.1] ([85.235.12.238])
        by smtp.gmail.com with ESMTPSA id y24-20020a2e3218000000b002ce098d3f0asm292644ljy.115.2024.01.25.06.37.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jan 2024 06:37:05 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH 0/7] mmc: Try to do proper kmap_local() for scatterlists
Date: Thu, 25 Jan 2024 15:37:04 +0100
Message-Id: <20240125-mmc-proper-kmap-v1-0-ba953c1ac3f9@linaro.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABBysmUC/x3MQQqAIBBA0avErBtIyYKuEi1CxxpCkxEiEO+et
 HyL/wtkEqYMS1dA6OHMd2xQfQf23ONByK4Z9KDHQWmDIVhMcicSvMKe0Gs3Wm+cms0ErUpCnt/
 /uG61fs+YJ0lhAAAA
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>, 
 Ming Lei <ming.lei@redhat.com>, Arnd Bergmann <arnd@arndb.de>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Nicolas Pitre <nico@fluxnic.net>, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Adrian Hunter <adrian.hunter@intel.com>, 
 Angelo Dureghello <angelo.dureghello@timesys.com>
Cc: linux-mmc@vger.kernel.org, linux-block@vger.kernel.org, 
 linux-omap@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.12.4

It was brought to our attention that some MMC host drivers
are referencing sg_virt(sg) directly on scatterlist entries,
which will not perform buffer bouncing for CONFIG_HIGHMEM
pages that reside in highmem.

See the following mail from Christoph and the discussion:
https://lore.kernel.org/linux-mmc/20240122073423.GA25859@lst.de/

This means that bugs with highmem pages can go unnoticed
until an actual highmem page is finally used and not bounced,
resulting in things like unpredictable file corruption.

Attempt to fix this by amending all host controllers
calling sg_virt() for PIO to instead do proper mapping
and unmapping of the scatterlist entry, possibly bouncing
it from highmem if need be.

More complicated patches are possible, the most obvious
to rewrite the PIO loops to use sg_miter_[start|next|stop]()
see for example mmci.c, but I leave this refactoring as
a suggestion to each device driver maintainer because I
can't really test the patches.

All patches are compile-tested except the m68k one,
sdhci-esdhc-mcf.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Linus Walleij (7):
      mmc: davinci_mmc: Map the virtual page for PIO
      mmc: moxart-mmc: Map the virtual page for PIO
      mmc: mvsdio: Map the virtual page for PIO
      mmc: mxcmmc: Map the virtual page for PIO
      mmc: omap: Map the virtual page for PIO
      mmc: sdhci-esdhc-mcf: Map the virtual page for swapping
      mmc: sh_mmcif: Map the virtual page for PIO

 drivers/mmc/host/davinci_mmc.c     | 10 ++++++++--
 drivers/mmc/host/moxart-mmc.c      |  3 ++-
 drivers/mmc/host/mvsdio.c          |  3 ++-
 drivers/mmc/host/mxcmmc.c          | 23 +++++++++++++++--------
 drivers/mmc/host/omap.c            |  7 ++++++-
 drivers/mmc/host/sdhci-esdhc-mcf.c |  3 ++-
 drivers/mmc/host/sh_mmcif.c        | 22 ++++++++++++++++++----
 7 files changed, 53 insertions(+), 18 deletions(-)
---
base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
change-id: 20240125-mmc-proper-kmap-f2d4cf5d1756

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>


