Return-Path: <linux-omap+bounces-1723-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 14EA4927C1F
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jul 2024 19:28:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 390231C21F1A
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jul 2024 17:28:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B733A145A14;
	Thu,  4 Jul 2024 17:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gv+BhKAe"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05144145350;
	Thu,  4 Jul 2024 17:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113846; cv=none; b=HPijeBI9O31ZFltx1iBaQSAz096faQJQJhZeICU7zC3OQTuhbk2hS/xl/gp+SdiHIEomjhEyVC3YfpMPkbWFpNs6DItcsZvEK4Jp43rcWkeZ6mrhV4OKILUENk7jbZl6XCVRb3Vn3C1KvFHqA6SOU71OrTnkMq3kvQDXr+oiz6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113846; c=relaxed/simple;
	bh=I1B1ilDX59ObzFXRiLamzLxGbqf5Ec/FSPD99VWZz6k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YVGExzvMJcp8kvhYRe8uq1elx41gNqYK49lxsVwaoZ1aHxK1aVsViB+A8DJ3rCMafBMmcbNFhzwfU3l6C2ouSSaeyBk2NaGU+aARKIn7tAkW0IOjaK9gkmUWeHPwDsoe43hCTkSEEEbIHLqc3NADSpq9PuKCs0aEZILxRxlde1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gv+BhKAe; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4256788e13bso5610855e9.2;
        Thu, 04 Jul 2024 10:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720113843; x=1720718643; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gn3WijEYYGde2qMFgclnizlvC5BdhQ9moOhVny9AY2s=;
        b=gv+BhKAew8uKk+EtlfH2tY/wJK8IwMK2ph03earcu5ZJG4PFQ010Fd8+a2EO6gtK8W
         ODZ8uaFMobtEAmFYBaiCTanvywHkkRqc9UpM4jtazuh5hpOZZ+T4HW4y4/b+do/6nBUw
         OKqjIPqNbmgU15VlIbd7/Ck/tLOXmA/wuwrpBvrlZdUiOVMFcxe/mXY/q6tsoMJDwS15
         vTwJjGwB0Cjxf2xSJS+unLK9JzXrdH5D1mUiTF1SihIGX1ieViw3hBb3YsVboVyytT5/
         E0o+VLv0HtMt21puJdh7ylxDec5JGG0D3+SnwMvARrVa2SJv5l2i1tPy/Idy+oNq7x2L
         et+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720113843; x=1720718643;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gn3WijEYYGde2qMFgclnizlvC5BdhQ9moOhVny9AY2s=;
        b=Cz5BkQ2tqm61cRfFS6rKf7U5VQ7sueh+eTJOhKlm6X7U+8hghQlKtOeSQl+VhowgiS
         zNXiwqUkwy/8IWp7ImGe3gg/L1yPvhx+HC9EBElOFo77EZq9kRHHxoQGdfk397AKJuq7
         n5uJ4ySWQEE1KPCtWaX/FQu5Gc9Qo2pRHvmXi+weY/RYpwoMkSL0UX/4iCl23ZCPszqT
         W/6VG0LFwoXG39zr8brytckps1f789BzcOFCdFM8SIbp/nBvltem0eQFluQtTf1LtNNW
         AlY6M+fZlw5WiaNL8LEdWQ3PaR94kS+MivMOd1aGl3kxvwFdzxaUqlQXKZjon1GhJ4DK
         fnrQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSd8baMpO6fj0yAW1zMD6gduFpgfPu/reREBC5QDW+h+HLFk1wygebxquKKkXv1n8SAiEehOx0JXLYY4LLLHz5qKKZ0EgVtste4nptt83BjBagkFxG4o2X3Z0h+lnKwL/sfBBnck6WNyd05kRG
X-Gm-Message-State: AOJu0Yyf1/mFqIttDIXFaWHvDC+vE6on1b0BHvARMKOL1GhfmSauPP/W
	YrDlUwiMLKgRMg3G3ubVTVvgXgUhfVt0UqWm7qKgsSpuBlbWtzlD
X-Google-Smtp-Source: AGHT+IG8fvyaCf2xyaf4M0QD3gyhQ5so/8RLHuVFkZijuO6tcEmwm6nfnnrw7he/U7Ta9U4kzKBZew==
X-Received: by 2002:a05:600c:1790:b0:424:9c01:a0d3 with SMTP id 5b1f17b1804b1-4264a3e1ed0mr16677795e9.12.1720113843415;
        Thu, 04 Jul 2024 10:24:03 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d6133sm32330965e9.13.2024.07.04.10.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:24:03 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 04 Jul 2024 19:23:31 +0200
Subject: [PATCH v2 21/24] mfd: twl6040: Constify struct regmap_irq_chip
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-mfd-const-regmap_config-v2-21-0c8785b1331d@gmail.com>
References: <20240704-mfd-const-regmap_config-v2-0-0c8785b1331d@gmail.com>
In-Reply-To: <20240704-mfd-const-regmap_config-v2-0-0c8785b1331d@gmail.com>
To: Support Opensource <support.opensource@diasemi.com>, 
 Lee Jones <lee@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Matti Vaittinen <mazziesaccount@gmail.com>, Xu Yilun <yilun.xu@intel.com>, 
 Tom Rix <trix@redhat.com>, Marek Vasut <marek.vasut+renesas@gmail.com>, 
 Andy Shevchenko <andy@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Tim Harvey <tharvey@gateworks.com>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>
Cc: linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
 linux-omap@vger.kernel.org, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720113803; l=764;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=I1B1ilDX59ObzFXRiLamzLxGbqf5Ec/FSPD99VWZz6k=;
 b=DPFTUWQEWuGtIwm/j9T6GPVHIPN77LuC5ioFZw9oHtvtRTePW/hpN/Pt/2X0ooGTAt+cutNl9
 YaWp2rV/4cFDw0I5jfzOYVelqe9Z2XCztXhQKax4HDng0YcrKonQ2Su
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`twl6040_irq_chip` is not modified and can be declared as const to
move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/twl6040.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/twl6040.c b/drivers/mfd/twl6040.c
index c184e8bfab7c..218d6195fad2 100644
--- a/drivers/mfd/twl6040.c
+++ b/drivers/mfd/twl6040.c
@@ -620,7 +620,7 @@ static const struct regmap_irq twl6040_irqs[] = {
 	{ .reg_offset = 0, .mask = TWL6040_READYINT, },
 };
 
-static struct regmap_irq_chip twl6040_irq_chip = {
+static const struct regmap_irq_chip twl6040_irq_chip = {
 	.name = "twl6040",
 	.irqs = twl6040_irqs,
 	.num_irqs = ARRAY_SIZE(twl6040_irqs),

-- 
2.40.1


