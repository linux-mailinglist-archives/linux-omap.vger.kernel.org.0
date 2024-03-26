Return-Path: <linux-omap+bounces-970-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B90F288C608
	for <lists+linux-omap@lfdr.de>; Tue, 26 Mar 2024 15:57:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7338430527D
	for <lists+linux-omap@lfdr.de>; Tue, 26 Mar 2024 14:57:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A6C7D13C697;
	Tue, 26 Mar 2024 14:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="f15vaomC"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E177D12D75D
	for <linux-omap@vger.kernel.org>; Tue, 26 Mar 2024 14:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711465018; cv=none; b=Z5VUVdpEkFt39N2VeojELCzwDYHMGTHw91i8SCTBPOOMQPIrXEjSfnVgiCHEZPbIyBJ+iXzfGLxEhas9sxaadZuf2zncOVxdUlLI6h8MgTJF14pgRxLqxINrXOFLjVl55R5VEelQnAmdSCOJqaaa6PHwYJkEGhe06HCkMcDGrLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711465018; c=relaxed/simple;
	bh=2y9ctp56HMkbvyZgKo5fx6Q9dshxX5+8r2XntdNWGeE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=iJB+JoCMzkqvefVtp9lnQdzdIB6/jZvvaTrIUsOa0Q/geh2Ww8yXUOXEqSl+Ja5QkRkC39siADIQ2X7BzqdotuJ5FXMq/FhakvyrObzPtb3sEgXleFf1sV4c3hw2LWdRr3bg5R2Vzg6HTEe1FMlRPUO4jnnMSQ38WM/IibTa67E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=f15vaomC; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-414881d8956so14826615e9.3
        for <linux-omap@vger.kernel.org>; Tue, 26 Mar 2024 07:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1711465013; x=1712069813; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z/G1vU/i34n4Yf6dbVXXOkUIfKhQJFotsjQ1E/HHO2A=;
        b=f15vaomC0cvHnHoFzNXXTfWCoXvbuMy8w/RoqQBw0ku9hs/3EX5LWswwSWV4D/Q5Zv
         qo+fZhzXcSNhBdt+kpbU40MdUxUVydKwL6nujj5g1XUs+ZbpOC7CsQRsWR/1D6460Ekb
         pqSMHwZWnCQxOKtxA66IFEoXoR/rSHYvj4Kk6BLykWHE2cIgiEVldCLa5NFt6jiJKtcc
         FTN0NjKdOXQfCXkmxGaSvasSKuDmQFcKmnEGeEAc5XESzB9lMusV7bVAwv8A/86OS6V2
         YY6IrAWWhvOk8MrnszbSjeHsPg95zgbnXkZWaIlhxOnD9gnzJuF5DjZd4QJjPQ5ytO10
         Iu8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711465013; x=1712069813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z/G1vU/i34n4Yf6dbVXXOkUIfKhQJFotsjQ1E/HHO2A=;
        b=ff8VaTC+eAz1ppi9mXSyFv4euGKcP/KmV2YXkdIOfQ361aRnAOaCpItvU9iBjARimA
         5f9SriUKEz9d/5MkgBofAUDezLnaxdTB1/+fvCJaok4IrL+MuQGyMMYXjANwKSvLzQiP
         +M4NSJ11DTg8NLeQJe9bg+ECVj5sbJUuGVs1fzPHrxD5VauRshKgI7T2y0J/BY8/bRON
         KLZTSv73x5dgW64APb/OwN/2fXnPoTxXPFG7TtDMZ1WZlLIEHWlvNO63d4XF8uwK7Yhv
         gvS7nhn3hP1TXKmdxgh1LJBc51hCvmAu3KYNJ1p4AFRccKpHV0p4JVwfcS/7aTSj8hQT
         h+aQ==
X-Gm-Message-State: AOJu0Yz+pdWRyGR6FJnkI3bFtm1WqEqUmyPb2ES49jq/raSYNQPRXT1E
	3xAnrPAEwLBicNYVsBWTu15lFgLIizhxoDv0ZnJal2xNJbvKjgAUUQotdp5qDvY=
X-Google-Smtp-Source: AGHT+IHgX0UjDpUS3pvvXSWQ89lGsdbFRcjbil8q0TiSG1zwcrctb+NcH3iuLaIhpS4dSbwwuyx9yA==
X-Received: by 2002:a05:600c:4510:b0:414:1351:8662 with SMTP id t16-20020a05600c451000b0041413518662mr1176708wmo.12.1711465013025;
        Tue, 26 Mar 2024 07:56:53 -0700 (PDT)
Received: from blmsp.fritz.box ([2001:4091:a246:821e:6f3b:6b50:4762:8343])
        by smtp.gmail.com with ESMTPSA id f12-20020a05600c4e8c00b00414850d567fsm9838120wmq.1.2024.03.26.07.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 07:56:00 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Grygorii Strashko <grygorii.strashko@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kevin Hilman <khilman@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-omap@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	Markus Mirevik <markus.mirevik@dpsolutions.se>
Subject: [PATCH] gpio: omap: Fix double trigger for level interrupts
Date: Tue, 26 Mar 2024 15:50:14 +0100
Message-ID: <20240326145439.1293412-1-msp@baylibre.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set gpio trigger before clearing the irq status.

This patch was originally proposed by Grygorii Strashko.

Cc: Grygorii Strashko <grygorii.strashko@ti.com>
Reported-by: Markus Mirevik <markus.mirevik@dpsolutions.se>
Closes: https://lore.kernel.org/all/20220122235959.GA10737@sol/T/
Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
Hi everyone,

this patch helped me on the beagleboneblack to remove the mentioned
double trigger of level interrupts. This diff was proposed by Grygorii
in the thread linked in the commit message. I am not sure why this never
made it into the kernel, that's why I sending this patch. I did not
create the diff just made a patch out of it, I don't care about being
the author but I would be happy if this would get merged or some other
solution to the problem.

Thanks!

Best
Markus

 drivers/gpio/gpio-omap.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-omap.c b/drivers/gpio/gpio-omap.c
index 76d5d87e9681..74b8fe2995e1 100644
--- a/drivers/gpio/gpio-omap.c
+++ b/drivers/gpio/gpio-omap.c
@@ -696,6 +696,9 @@ static void omap_gpio_unmask_irq(struct irq_data *d)
 	raw_spin_lock_irqsave(&bank->lock, flags);
 	omap_set_gpio_irqenable(bank, offset, 1);
 
+	if (trigger)
+		omap_set_gpio_triggering(bank, offset, trigger);
+
 	/*
 	 * For level-triggered GPIOs, clearing must be done after the source
 	 * is cleared, thus after the handler has run. OMAP4 needs this done
@@ -705,9 +708,6 @@ static void omap_gpio_unmask_irq(struct irq_data *d)
 	    trigger & (IRQ_TYPE_LEVEL_HIGH | IRQ_TYPE_LEVEL_LOW))
 		omap_clear_gpio_irqstatus(bank, offset);
 
-	if (trigger)
-		omap_set_gpio_triggering(bank, offset, trigger);
-
 	raw_spin_unlock_irqrestore(&bank->lock, flags);
 }
 
-- 
2.43.0


