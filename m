Return-Path: <linux-omap+bounces-1725-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C2D2927C26
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jul 2024 19:29:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 56696281F32
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jul 2024 17:29:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 755C2145FFA;
	Thu,  4 Jul 2024 17:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H5HwC+Jx"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BECE7145A12;
	Thu,  4 Jul 2024 17:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113850; cv=none; b=ldeQqfM64WamINzNMj3HvUwrNSS9f4z4yVMhZ8zzonvB+v3ZC19+NQZEtr3Ecv7uBM88Llh+aTpxDypGtRzgrdQI84Ov24HhMmVjttfNopvc1JUL/AArfozBa8/lYSTqKWN4PdyxBeS/wrbKaIxevHZ4CfP5ggk47wRgbVKLBmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113850; c=relaxed/simple;
	bh=l1Cj78yZY8L2tTDG6sw5fSc8edu6SL6nJiCxRWtiPUE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CnXbQxVrHu0AqAfMsAjE3Iuy9scgQjJHes8Ogk/SFEwtV3jfhobeXIi6Z/x53SMN0OgH9aLHIkq+0QyoFkvTWf7u8EAqcVaOdgJLAP1ynd2l0EhN3qca97DFcw0x3xooxAcGm+Nbg4ZoBHRv4MX6eS22y2Q4Iwu+bXjZtjOPzag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H5HwC+Jx; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-424acf3226fso6081315e9.1;
        Thu, 04 Jul 2024 10:24:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720113847; x=1720718647; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NKHYWbzkMTD6qk8aJRMT+i6jtpdTExyqbOxjXHTRIgE=;
        b=H5HwC+Jx2Q6V121kh4tBkIdf9YOWbEqLw8NIEZEbiqI8K6XeY3il8keCkZ0TjVN03h
         d381Pviymj30Zceo8YUq4bvyc64rxeg4uiKnu0u4AwB01n7PSlSbldieqT754jfH3bGA
         B76Jp17EuAoURJetodoRIfThj8lxCBn/hGhecIKhfrOgMKh55Z4KMPN1MFMMhaE2FYvC
         egqH1y8p5JjftaNjlehiB2yGM2ySm3CgtMlTW73CLlpcdYx02f45O19pGnFcr/tc7+JX
         I/rXuCFTMIxm9KnSGwRzYh4rGSQ3gDV9m4OmE6wPIOLNesbXh2TDw2TB2Oq14aLHTUtn
         UAZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720113847; x=1720718647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NKHYWbzkMTD6qk8aJRMT+i6jtpdTExyqbOxjXHTRIgE=;
        b=vJYY1ioiRhhU0Uuq5+fypWoRGp56fzM0dTIXdP5O+9eNc/l/1bKxjrlRZzuj2A+KUx
         LlkkcFBNPJF76rb7ED4mjGkz8E9Bk5oD7BGlUtnwY96/Ph6PVyEi1cwsAudBKhS6yiUc
         sfC92lroKw8+jvXLqIuPNalZ5fL4+8KCiRKaj8bTUHBreYd5F3cltEVklDSLCofZ5GQD
         97g4G6+v4R1mcXscSQrFTflg5oEGXT3a7dpZsPhi9PH9p6kU00FBt2gJTudKBMA3nGT5
         Jo+fxdyZ5rf9njRPhDyTLSNjwHedS2bkLjn7at2fMRWdxEavggew8/z8u556fSQSZ1pm
         HmSg==
X-Forwarded-Encrypted: i=1; AJvYcCVSn0i122HkH2pGgRh05biqE5/wN1fBVThmN6d/Wx433MyB0PxQQfac37eNVy7d0hlnpQqIQfTJjDXGxaChGm40FDTQTtpggGwo/cNcai06U9V1SIIMz88gH8SZea4WILGgmaagQzHgddg5Y6Cs
X-Gm-Message-State: AOJu0YxG5kDsR+V45m3Ee8jq1eDhQtq27Jz4soha2qgfMpIDvNc4x48t
	aiiP84RxwpuNrhlmk//HBdVDzs/QJV3RFLzU8dU6QClpwnie0ICm
X-Google-Smtp-Source: AGHT+IHQZ4Gzn4G/A+zIb9YJ2Q0ClP0LZcg6Q/8xU16dU9Jcz7FFgRTHzeJxzyBqHfPRtw4+F+JGUQ==
X-Received: by 2002:a05:600c:5116:b0:425:6851:8172 with SMTP id 5b1f17b1804b1-4264a3d8045mr19854075e9.3.1720113847160;
        Thu, 04 Jul 2024 10:24:07 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d6133sm32330965e9.13.2024.07.04.10.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:24:06 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 04 Jul 2024 19:23:33 +0200
Subject: [PATCH v2 23/24] mfd: mc13xxx-spi: Constify struct regmap_bus
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-mfd-const-regmap_config-v2-23-0c8785b1331d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720113803; l=755;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=l1Cj78yZY8L2tTDG6sw5fSc8edu6SL6nJiCxRWtiPUE=;
 b=tgsjQxPaXkJ9v9t7+dV2nb9XS3bWZJKrIdxeCdZx3svXnlCSkrJAPABlqxbHhy6nedQFMauDC
 XP+11fvCOmaDAuPvCKPD84p9LPLlmHO3Pe9gkiHXJXCPJEp1YnGpdbD
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`regmap_mc13xxx_bus` is not modified and can be declared as const to
move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/mc13xxx-spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/mc13xxx-spi.c b/drivers/mfd/mc13xxx-spi.c
index c973e2579bdf..9f438d5d4326 100644
--- a/drivers/mfd/mc13xxx-spi.c
+++ b/drivers/mfd/mc13xxx-spi.c
@@ -116,7 +116,7 @@ static int mc13xxx_spi_write(void *context, const void *data, size_t count)
  * single transfer.
  */
 
-static struct regmap_bus regmap_mc13xxx_bus = {
+static const struct regmap_bus regmap_mc13xxx_bus = {
 	.write = mc13xxx_spi_write,
 	.read = mc13xxx_spi_read,
 };

-- 
2.40.1


