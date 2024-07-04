Return-Path: <linux-omap+bounces-1709-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A496927BF4
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jul 2024 19:25:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D290286E81
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jul 2024 17:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B114C13AA3F;
	Thu,  4 Jul 2024 17:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mdU80Nte"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A36137772;
	Thu,  4 Jul 2024 17:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113822; cv=none; b=K3DQLFndFFISofDZl88obEgN661LBJEfsEQXMoYbkXqXgG52GehWobVPOeTweRyIYXve/rjkICbYWYe0pWPT1euo7XEQYkXQVbZ3ygiTeZsTF46REqd7qTxnj1nmTAIh9hmtPV4rY530M5M5dp5FIv58BajDsVAP4BzCfYE5Icw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113822; c=relaxed/simple;
	bh=LKI2QEHHewZIBoO1kuOf0vVdX3Kg06AQSdrYQ8twpkg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D/MsgDmRdsWIpJ7h9pbyJEQctYwakytYNWZU/uIBksXt0RJDiumHsnfgIqTmgq6E1oxL4ylwx/MRcEFTThuPREoJIInKHpBVmR035Jo3JEDQbsTOsHa4vqCZQm480ZZBh/5RXoa1uivtNVGE1Z+6aAsL/YmTmpnH1pltux1YMu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mdU80Nte; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-425624255f3so5735705e9.0;
        Thu, 04 Jul 2024 10:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720113819; x=1720718619; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mWEywv5t5/SdpV2ZwtxWx9CvH6fdNiDrX1/VhDJvqUg=;
        b=mdU80NteTx4sQAxIJOMK1QIiUrfkZ2YfcKGo2RG/6Q2DzI1OOYQUzdBygDP1nq4Tf5
         wC2w+hz1pJKQZeDoOedB+VAOoubGDo8yr0d2gNZ7wcd5mrZvi2FJcbgRHUZRaNe+B3tR
         K8Qn0c22tBlBzqMHhsu6ukosHYOf/2AZWJHQzftiXCunMW5hmP0DQ+6BsKF0qXFk8/Kb
         gd44z30R6dcrYLlGQqOUCuNuz928MmI2QUMwgYLbHy9decWHLFZBzoGn+08hTrKavIRY
         dywdh2n/R1uto1AAaKMm2XdaktikFi4nYFEampZj/GNCmhzAa5X8xmichp6Zkhaf8/eJ
         QwxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720113819; x=1720718619;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mWEywv5t5/SdpV2ZwtxWx9CvH6fdNiDrX1/VhDJvqUg=;
        b=o205PRtsQQAW06SCrfFFK+JA51DH247YkWVFVbEFENYcHZXRLKNL+BbPUwu6uYzaHJ
         e55AzDdt1MagCISX7vEiNIL2OdH2wCTuU8s7QOTnMWV8KvDrM5WWtv3IN53KJtTT7mom
         Vbb+7UDIGxYUVeayLIci2syvckET/vMIQVlZOhVHiWfv6S+YuEPEyhrGkA2DywRDojwi
         dVjKoMF0DXrlZul6mFR0M42WMOt9kaFD37kPivtZEufqseoEef7Gxj3Gu0kIL0scoyfm
         mmNKlKxrAucRqppASBy/YIVybyXTc5tjzlHEWWmwgonmWdu8zDF+g3KNArEZ1bc+gMca
         bSeQ==
X-Forwarded-Encrypted: i=1; AJvYcCV+WBASbz812BwwVhgOMcEvYQqxYJdousmCq7wKNByuSe78BIswlUJ8J8DCO7dSvw4REIaLjxTl6vnbe0Fyxe0lTLbe4RyNtLo0SxgoL6WkxwbadG272B6FCGDetnG7O/4wdWNtktidOj+6aG/p
X-Gm-Message-State: AOJu0YxS6PkB5UP0UmhCJhLQCIYp/+bWhwlqhrGsriZR21lJHMhcj22a
	XJXtauWb9P182oIgmUG38ugV9qx0S5EyX2XyrFpOCGNuUzs/d7Ux
X-Google-Smtp-Source: AGHT+IFaLJbGPGKqt38tbITvJvDUJW0cQKWDZwNHz+0MsfB1OM0rGrAFAbj1uDUigyKdYCGktKoyHg==
X-Received: by 2002:a05:600c:3107:b0:424:aa5a:280e with SMTP id 5b1f17b1804b1-4264b124440mr20595165e9.8.1720113819026;
        Thu, 04 Jul 2024 10:23:39 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d6133sm32330965e9.13.2024.07.04.10.23.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:23:38 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 04 Jul 2024 19:23:17 +0200
Subject: [PATCH v2 07/24] mfd: intel-m10-bmc: Constify struct regmap_config
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-mfd-const-regmap_config-v2-7-0c8785b1331d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720113803; l=1447;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=LKI2QEHHewZIBoO1kuOf0vVdX3Kg06AQSdrYQ8twpkg=;
 b=4Q4EhtFXAShhKO9oUsSVsc2sdoAyfwskGN2NUMjuJ4hwqJmSsRstHVgJZYGl2RYvZ2AqucTml
 oSt0eImsfB8COF21mipK5P99JHEEqOPFIZ4lneZOz6vtuRUtKukkgQz
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`m10bmc_pmci_regmap_config` and `intel_m10bmc_regmap_config` are not
modified and can be declared as const to move their data to a
read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/intel-m10-bmc-pmci.c | 2 +-
 drivers/mfd/intel-m10-bmc-spi.c  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/intel-m10-bmc-pmci.c b/drivers/mfd/intel-m10-bmc-pmci.c
index 698c5933938b..4fa9d380c62b 100644
--- a/drivers/mfd/intel-m10-bmc-pmci.c
+++ b/drivers/mfd/intel-m10-bmc-pmci.c
@@ -336,7 +336,7 @@ static const struct regmap_access_table m10bmc_pmci_access_table = {
 	.n_yes_ranges	= ARRAY_SIZE(m10bmc_pmci_regmap_range),
 };
 
-static struct regmap_config m10bmc_pmci_regmap_config = {
+static const struct regmap_config m10bmc_pmci_regmap_config = {
 	.reg_bits = 32,
 	.reg_stride = 4,
 	.val_bits = 32,
diff --git a/drivers/mfd/intel-m10-bmc-spi.c b/drivers/mfd/intel-m10-bmc-spi.c
index d64d28199df6..36f631ef7a67 100644
--- a/drivers/mfd/intel-m10-bmc-spi.c
+++ b/drivers/mfd/intel-m10-bmc-spi.c
@@ -24,7 +24,7 @@ static const struct regmap_access_table m10bmc_access_table = {
 	.n_yes_ranges	= ARRAY_SIZE(m10bmc_regmap_range),
 };
 
-static struct regmap_config intel_m10bmc_regmap_config = {
+static const struct regmap_config intel_m10bmc_regmap_config = {
 	.reg_bits = 32,
 	.val_bits = 32,
 	.reg_stride = 4,

-- 
2.40.1


