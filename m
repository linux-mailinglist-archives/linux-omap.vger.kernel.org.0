Return-Path: <linux-omap+bounces-3855-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C99B7AD8BEE
	for <lists+linux-omap@lfdr.de>; Fri, 13 Jun 2025 14:23:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 459257ADC3C
	for <lists+linux-omap@lfdr.de>; Fri, 13 Jun 2025 12:21:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8F582E0B6B;
	Fri, 13 Jun 2025 12:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DH28uZDU"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EA342727E8;
	Fri, 13 Jun 2025 12:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749817391; cv=none; b=gtzpXequoXoFNLqtpIaTHWFxy4CF4wehkuMxvI3tVN/QESnJX6LNGfaJE9mRPduxVyQXds9Y9M6MEERTBuxmLKYy9icbcgqIFlmqOjkjJkZvuZeX4HkP08kdYnKpTDRVibS1jbaM9hf0vsmJHSV5zpIj6rRjxlwPuylDFfco5GY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749817391; c=relaxed/simple;
	bh=JiQ9RO63rTiSweA5WgDt7giwKWP1ckT6Lp/wiX88Ws4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EH4V15f5Yy4UyI+/Qhxv+m70VnEqytWbbE8HwN0AE7Bhgy5r8cubvJ+Lmn88tP819611kXiCP9k1XvuITW2IBuK04uMPfHkxQWFH5Ozntj+135aeWHCnutg+mqxCkPyzjsUzPkJKeMBUHb3ywcj6avb1iehtcWMkpyUu44Tcc3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DH28uZDU; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b2f1032e1c4so2141042a12.3;
        Fri, 13 Jun 2025 05:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749817389; x=1750422189; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZF8Ijk+kxycu39taXWGDmympqXTula1EYmwZ/sS6tJg=;
        b=DH28uZDUQE2D5c/KwBjFmKc4qVA4LIDW8tZ/eI7WQX/a6psAmXrGlG7LyJJCNT9+3R
         AJGh7TJ4VdRU2dWlJZGFXkhFYPtuyB8nxIKQ93IUiieywgkQJ6iECI282/KtnGvP7wNP
         fzDN3leajla5xlY530lS+utKP/XYBB/n7g3VfYRIh0bTobz515F/ccIsd+jY52AnbeLH
         aUkfKHWLPDNR5smo46mzqHbLHxyQS2y5hfE1vLHjOn591JEUQ4UK9xmVfsg7Nedo5cSm
         m2ZkyR/VTOBFj0uHYQUBOuC8gmPUl1JHX14ymCn8s+xaUakRdPh4LES2yfcxLeN2O3+N
         0gxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749817389; x=1750422189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZF8Ijk+kxycu39taXWGDmympqXTula1EYmwZ/sS6tJg=;
        b=L49QlZOiDDdzI6LFYhLFvmL7oFfbUPXnh3p+suQR74i9sSs8b7aupy3PZyGg8Oibed
         M/t6DshgItamwompKXvmrrf0jkI+bZ/kGsaLrFZ0644MGaR1pzwwvoySNGTm6JiwkuXM
         2CBai3sL6sWiLtUxOJY7a13UJ9kOzacS8AehJFwg47Jugro6OouZofRgzn6Jq2Vvsilv
         +aBsg029bFHyVdOvzVv8zA60F+PnysG2cKwXUZnWXjLXP3ggjfVZCBUqwlMblcUNly7+
         oUtvbaLEAXiM38DKe8SghazzD0EYHb/kwusBC9SVVqi6OV25st0JpTimgNkCur0LrAVM
         B/Ew==
X-Gm-Message-State: AOJu0YxII6i7RDu0q6yGKUuQt+/+EiZXmzSNsXQ1kLPtw9N5NaWuFp27
	xVBp9xQlQBd67gTWde7U0DWBOfs6uAa+J4ou24BDWpp5xJ5MIyjWpEOjdhDRz+Gb
X-Gm-Gg: ASbGncvMvi1xOq0NqTw5+UEof+rc/jWVGp6vLSKbLfaAbgVddp9dhDV8Sr+Z19X6fDE
	kxEDwm9ZiCz7kYRc44M3JhFUDDCSwK9Z1zLCJdIIquDbsATib1rc6DQfB3BTZfwu9xMZAf8ZREv
	J5hQmBQkPT2729iNu/yCwzTpd5hXOJ41YVSffJznPsZKY/Ljhv7BZM3Rt3ZmKpKjrcjEPGMqR1O
	mc9+pHKyve6D/P94pU0pcrS+KLVEux5yjwRkWXd8zHGKtyyq9/AZBlD9nlYlyRxzY4CpzgwZFPQ
	vyNvQfG99kB2fQGFCh7F7JjeKlXDc4IsGmSJS4STFlvWv6ubkVE08UrzGRoYpYDz8E/aBP84en8
	ZXwdIsMI8oPzw/A==
X-Google-Smtp-Source: AGHT+IELKrcoAf7PgPvBAOyNIQlmy6cdkvLGa8CIZk+QShFhYJ6D0lC7HFhfXUI/BeWfsLf0KH8zAQ==
X-Received: by 2002:a05:6a20:9148:b0:21f:512c:ba2c with SMTP id adf61e73a8af0-21facec450emr5046063637.34.1749817389000;
        Fri, 13 Jun 2025 05:23:09 -0700 (PDT)
Received: from avinash-INBOOK-Y2-PLUS.. ([27.63.22.176])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe163a470sm1553126a12.9.2025.06.13.05.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 05:23:08 -0700 (PDT)
From: avinashlalotra <abinashlalotra@gmail.com>
X-Google-Original-From: avinashlalotra <abinashsinghlalotra@gmail.com>
To: linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	khilman@baylibre.com,
	rogerq@kernel.org,
	tony@atomide.com,
	lee@kernel.org,
	avinashlalotra <abinashsinghlalotra@gmail.com>
Subject: [RFC PATCH] mfd: twl4030-irq: remove redundant 'node' variable
Date: Fri, 13 Jun 2025 17:52:51 +0530
Message-ID: <20250613122251.1033078-1-abinashsinghlalotra@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The local variable 'node' was used only once to retrieve dev->of_node
in a call to irq_domain_create_legacy(). This patch inlines the usage
and removes the redundant variable, improving code clarity.

No functional change intended.

Signed-off-by: avinashlalotra <abinashsinghlalotra@gmail.com>
---
 drivers/mfd/twl4030-irq.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mfd/twl4030-irq.c b/drivers/mfd/twl4030-irq.c
index 232c2bfe8c18..a2ab5deef9e2 100644
--- a/drivers/mfd/twl4030-irq.c
+++ b/drivers/mfd/twl4030-irq.c
@@ -676,7 +676,6 @@ int twl4030_init_irq(struct device *dev, int irq_num)
 	static struct irq_chip	twl4030_irq_chip;
 	int			status, i;
 	int			irq_base, irq_end, nr_irqs;
-	struct			device_node *node = dev->of_node;
 
 	/*
 	 * TWL core and pwr interrupts must be contiguous because
@@ -691,7 +690,7 @@ int twl4030_init_irq(struct device *dev, int irq_num)
 		return irq_base;
 	}
 
-	irq_domain_create_legacy(of_fwnode_handle(node), nr_irqs, irq_base, 0,
+	irq_domain_create_legacy(of_fwnode_handle(dev->of_node), nr_irqs, irq_base, 0,
 				 &irq_domain_simple_ops, NULL);
 
 	irq_end = irq_base + TWL4030_CORE_NR_IRQS;
-- 
2.43.0


