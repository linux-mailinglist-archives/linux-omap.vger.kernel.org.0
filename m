Return-Path: <linux-omap+bounces-1722-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 27708927C1C
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jul 2024 19:28:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 901D9B22ACE
	for <lists+linux-omap@lfdr.de>; Thu,  4 Jul 2024 17:28:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E6401459E5;
	Thu,  4 Jul 2024 17:24:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cLnj6I44"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AD2B144D3C;
	Thu,  4 Jul 2024 17:24:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720113845; cv=none; b=tInZUCGLwTEb1Wb6yUxix+n5cGNJRlWiLH6XP7RetThhDtyuwzEed8Fzw1jN8zLRKz4x/8/UNj3EipjBz03Xb6bVTtAvFopodYj9mYD3bxsOlxLRX2qXeYNtPi49xIWfkEj+NJ0RX4DHdpZLlxiBWRbpa0YTjuyOCfZA2a0JFhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720113845; c=relaxed/simple;
	bh=jMfkDgSxDotzG1jwrOsREhe4lpTvN394dyQECPi9cEE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LGBzSJbtKpsPlrmv9zFkwb2RQlaK6/bCdKkuM57s8Gl+aUBbdcL+4w+OHu4Bs5D5VOMU3mHnGvSK8AxUTnZFgKj5e+B/3T91HFoQfeTZGIGIM4dtK1mMOcGGnV4EyKr7WJ1a2seFB0W0OYt9hMTDKuMDPw9vxlPIa1/ElsJcFA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cLnj6I44; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ee92f7137bso1680101fa.1;
        Thu, 04 Jul 2024 10:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720113842; x=1720718642; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vy+A3rCs2GjwPUdBUvfrvVaJ4gXWSXpMp/c9DgZBcps=;
        b=cLnj6I44BqB7MR6y/eNdOQ+k61ZFB67nx2htiOwfwkpLG7roIFRFstR/cfGBsabZlr
         hJv/eDXwtOWJCXwu+0FCk4Vo5XAkmNUpQDdLP/2qd7PY8dZ6R+37vRjSWYgX7dYx4qx7
         sSQZ3bop8IDYyLO/g+WqE14u0psmGa8TCC1E37zOlURm25VE8ZkDi9ATpVZY8G/U+12U
         T2jkTXsT/Pkrl3ZOLJ6a/JgfFaLs8Azhi43ep4VCFoz7y4nAEiVZx1GXK2sSM0DgYaQG
         PovhJpkZWXdYb/fgYlS1x1glSjXYyS6pfS6JxT9CXKoYoWXhcKZHg8pfCUStPZX2ZNe2
         blzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720113842; x=1720718642;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vy+A3rCs2GjwPUdBUvfrvVaJ4gXWSXpMp/c9DgZBcps=;
        b=Ty+sgZrBEANgqzxCubke/gRFRXLEgrNnAkvziohVbf+N+853ggLdS2UGDWU2nFbVBi
         SIYZqYd0NtmiZgqphSk0oQyh0tyMzk1PGqKhPErYQGdIqHwmjA8MzXgYpvhzg/+VzXyq
         ZXSqmrSQhPc181EOc7ls5WkOgiVGTkEvmG/BaPCydriIvmHYk/XjT1Cm0PpK+gZluBVn
         7lcDGOwhuCEmce3n/rJ3hdG3HkqEplo7JpNA3lVSw6esyJJux+1Y+IOtgyOLan5MWI+v
         57XHQZdu55xmFTbpqth1bupPYk04nvbTNAah5nIMK2Vrs4nwJ3OedwQf4fy27pKcPv87
         QNhg==
X-Forwarded-Encrypted: i=1; AJvYcCUslI3TjljGlOhAdrSIq6hFLgZny+canQ0N2LGzYifrA65HaSvjqY/EWf2iB/Kj4LHQY/3UJZuuR3g/0OqqmLNa1b5fSq/ZvOOjjI1X6+yACk6WWmLynPJjVWaQHTKPwSOxm5FDe6RzCe7jTVR8
X-Gm-Message-State: AOJu0YwC/Mydj0etCIqJAzFLaFfRh5nNYVi6qOsdfwWOlXmVr0E/aJlr
	CDhRXuD+eCcVFR7h3JsQ5pCP0PVpjlfwGBypWkM49uwjKQU0e+SO
X-Google-Smtp-Source: AGHT+IEUnfJ9RXgbg6QBZTXm3lVcTtwHsksi3AlggvCusmiUTsvrHbKYeKsVnlhZlRYaPOLgLQnBNA==
X-Received: by 2002:a2e:a604:0:b0:2ec:507f:7319 with SMTP id 38308e7fff4ca-2ee8ee1373fmr17653611fa.43.1720113841636;
        Thu, 04 Jul 2024 10:24:01 -0700 (PDT)
Received: from [127.0.1.1] (84-115-213-37.cable.dynamic.surfer.at. [84.115.213.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4264a1d6133sm32330965e9.13.2024.07.04.10.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 10:24:01 -0700 (PDT)
From: Javier Carrasco <javier.carrasco.cruz@gmail.com>
Date: Thu, 04 Jul 2024 19:23:30 +0200
Subject: [PATCH v2 20/24] mfd: tps65912: Constify struct regmap_irq_chip
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240704-mfd-const-regmap_config-v2-20-0c8785b1331d@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720113803; l=827;
 i=javier.carrasco.cruz@gmail.com; s=20240312; h=from:subject:message-id;
 bh=jMfkDgSxDotzG1jwrOsREhe4lpTvN394dyQECPi9cEE=;
 b=aEkb4C6NIcwRYWelpberMBzrQJRrhogvHC0YfXWJWnMf/s2kQwvbx2Ew/+zOyBnHX4Wd3WTkX
 ffcyE5PyiPyAEB22f7q4nnDn82LjurOxzt1HcHZnroD2VU1cUlFvZOr
X-Developer-Key: i=javier.carrasco.cruz@gmail.com; a=ed25519;
 pk=lzSIvIzMz0JhJrzLXI0HAdPwsNPSSmEn6RbS+PTS9aQ=

`tps65912_irq_chip` is not modified and can be declared as const to
move its data to a read-only section.

Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
---
 drivers/mfd/tps65912-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mfd/tps65912-core.c b/drivers/mfd/tps65912-core.c
index 87ee6aac3763..a9dcd7f0d9e3 100644
--- a/drivers/mfd/tps65912-core.c
+++ b/drivers/mfd/tps65912-core.c
@@ -57,7 +57,7 @@ static const struct regmap_irq tps65912_irqs[] = {
 	REGMAP_IRQ_REG(TPS65912_IRQ_PGOOD_LDO10, 3, TPS65912_INT_STS4_PGOOD_LDO10),
 };
 
-static struct regmap_irq_chip tps65912_irq_chip = {
+static const struct regmap_irq_chip tps65912_irq_chip = {
 	.name = "tps65912",
 	.irqs = tps65912_irqs,
 	.num_irqs = ARRAY_SIZE(tps65912_irqs),

-- 
2.40.1


