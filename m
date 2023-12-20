Return-Path: <linux-omap+bounces-183-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A228881A350
	for <lists+linux-omap@lfdr.de>; Wed, 20 Dec 2023 16:57:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D41281C24385
	for <lists+linux-omap@lfdr.de>; Wed, 20 Dec 2023 15:57:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4BC803F8F5;
	Wed, 20 Dec 2023 15:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m+UzCc/b"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8255141212
	for <linux-omap@vger.kernel.org>; Wed, 20 Dec 2023 15:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3364c9ff8e1so562800f8f.0
        for <linux-omap@vger.kernel.org>; Wed, 20 Dec 2023 07:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703087806; x=1703692606; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9YZPvzhywHZ0NIyZ+JCZ3ZD/HdiJUtGlWXitNOY+GyI=;
        b=m+UzCc/bVo0t6H9adsYMNBCdLIkVDtrlam0epBPK8wuYWcsRCevgWfn1LaXxSXbUfr
         3Ntiz0HEHC/zI6SJRyS/jLOlpU34hzkaI0C1EVd8tVK60JXSTLR+eBEELETB/SKsX1vo
         VFjX/GAqFrUpjCGAh4ti/X73kM5ay1TAZ6rN7jyLHYc8xVn/ViAf5CzCzdSGzWgVdmw+
         peMtkcEBdESBhVfcUqdWssyqDHfRr+EJ/DtodQWLyscFbQrhmmqMQh9bCKKPnq4sOAN8
         DM9o1DzjGWfHfieU9BDaTFyBjVfIsXAhq5LXtPA83fpqAWwAN7SRHy4uUTx8tamPWyHk
         TDQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703087806; x=1703692606;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9YZPvzhywHZ0NIyZ+JCZ3ZD/HdiJUtGlWXitNOY+GyI=;
        b=XdIOG7WUT4QA/dvBo70T8Iqb1Wx7XAIIoiOLj9xeyz05sjgeee+lMY2ayzhqRIAfNO
         eeK8nbiHrX4UsPE96nxGvj9arQnHkvHOp/LEBpNV6lCx01SfLdcP8jv++601YC//KM9V
         wJOeWc7+aoZyhoVl125DiSiVLzJK0RBTW8bCrQKGDIU8Q0VAtLMiBVYtz3oSob86IFvp
         BE0E0ODANjXgrbes3PE6WOBS4sYzFSkydwHXq0cWMGp9f2uN/N6jt8KYM98dEhvjpzOy
         t6TgH8BCiQ3dlWtbViKnHw9NuOzNFwIUdX3YzK4ZDYbXcJfTWZUr0CTOQ7dMTWpdskKI
         9ZWg==
X-Gm-Message-State: AOJu0YydEBAIDzHhIj6FdhvlZ470jw198nIUufrZPJMLetira6wYLtC7
	aegbV370HP2aPYHVL5kPtiY=
X-Google-Smtp-Source: AGHT+IFiD5YolgEqaAyUx9v13H6QCssjFluywLKq/D3BDEZUCZaJMhqQXJoTAVNVtWjc0TvNBYEGzQ==
X-Received: by 2002:a05:600c:2811:b0:40d:1af4:d74d with SMTP id m17-20020a05600c281100b0040d1af4d74dmr1721391wmb.112.1703087805707;
        Wed, 20 Dec 2023 07:56:45 -0800 (PST)
Received: from morpheus.home.roving-it.com (2.1.9.e.d.3.3.1.6.1.e.d.5.3.a.e.1.8.6.2.1.1.b.f.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:fb11:2681:ea35:de16:133d:e912])
        by smtp.googlemail.com with ESMTPSA id bd7-20020a05600c1f0700b0040c420eda48sm8255244wmb.22.2023.12.20.07.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 07:56:45 -0800 (PST)
From: Peter Robinson <pbrobinson@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Tony Lindgren <tony@atomide.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org
Cc: Peter Robinson <pbrobinson@gmail.com>
Subject: [PATCH] mfd: ti_am335x_tscadc: Fix TI SoC dependencies
Date: Wed, 20 Dec 2023 15:56:39 +0000
Message-ID: <20231220155643.445849-1-pbrobinson@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The ti_am335x_tscadc is specific to some TI SoCs, update
the dependencies for those SoCs and compile testing.

Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
---
 drivers/mfd/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mfd/Kconfig b/drivers/mfd/Kconfig
index 90ce58fd629e..68d71b4b55bd 100644
--- a/drivers/mfd/Kconfig
+++ b/drivers/mfd/Kconfig
@@ -1483,6 +1483,7 @@ config MFD_SYSCON
 
 config MFD_TI_AM335X_TSCADC
 	tristate "TI ADC / Touch Screen chip support"
+	depends on ARCH_OMAP2PLUS || ARCH_K3 || COMPILE_TEST
 	select MFD_CORE
 	select REGMAP
 	select REGMAP_MMIO
-- 
2.43.0


