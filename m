Return-Path: <linux-omap+bounces-4457-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8192CB3FF1E
	for <lists+linux-omap@lfdr.de>; Tue,  2 Sep 2025 14:07:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C968E7A7ABD
	for <lists+linux-omap@lfdr.de>; Tue,  2 Sep 2025 12:05:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 429D331A046;
	Tue,  2 Sep 2025 11:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="mwfpAm3l"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4302D310650
	for <linux-omap@vger.kernel.org>; Tue,  2 Sep 2025 11:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756814377; cv=none; b=CW4a7jDzyc0lhe/ZIwl1L8TLqkIMaPmajS0Y/IM6GCjq/3L9TWvR6QfZoGQ8/st1mdwyKmndbjxazYr+rN9H8LqMHvYHAvA3sG+8mToWvQmEQUyZCElAo1ddq7U5GiHpYXl+GHcMFTUJFvVjiRfwvTAqKmKI+g/JOROpmFmQJq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756814377; c=relaxed/simple;
	bh=fE/sdxLuLVdF+s/hmIyKox10uqamZF81pz2izGaZE30=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X61/i2n70y6IaOeFyg6xHm2h/JPw5L9p55XK91a/ySz/HM9Zz9NUVznWDFj/9adZmB9AbM369oyiO8B7SF0ouJaMgagj1eeuaF09UP8MJnnnV6zQpp+iTLBtJrMfO8JGZWVX8LR3ci4/f6Q1njSJCgB0qcCGvCqo6TETIx1VaS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=mwfpAm3l; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45b88bff3ebso15216305e9.3
        for <linux-omap@vger.kernel.org>; Tue, 02 Sep 2025 04:59:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756814371; x=1757419171; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FaCre2GzdHbdQSV0ImBvBUo9sM3J8CdQV8vbp4R8HMY=;
        b=mwfpAm3lchhRSUB7bfE8jhas21dzob18gNmNX8da27DtQGtwpGqzHvdY45aMrNUPV6
         B7qTjijiKu/6WK6GyP7Nfh2U2v0CDtcGaJNDvkRfxLLtgvge8pV8649q65twIjQwMdCg
         oe+lyvrZ51NSuTP7NGaq6Q8QTRbY2gPiK9dV7A3YRUFiqZcePZWYURi288Ly06FsUqFi
         K6TDCV6qWIWRure38eG168yrDiMgamaG73JaS53TSiU3inOdBgxfh279rpdu693eZZMh
         fzbOMgO6kLj0BqYzu8qPYBF8L8g4gT3Yw8Xi7N4tkzvUc86d+ZK6ICuKK+CZfEuXt5G/
         jHoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756814371; x=1757419171;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FaCre2GzdHbdQSV0ImBvBUo9sM3J8CdQV8vbp4R8HMY=;
        b=VCa5EBO1gWEIjaiP3ZqegOVE3nzT0vD7g+gPVBXMRG/rY175/AeOZBgax74rEZJmMP
         Av7y8t5OkspikddmVq5PG/CMDg+fqytI4LhvmRheNhmvSErAWbRWX9Yq65OVAJJr14WV
         3X1P1VtXgnpcj2GZHolG+BKWXy/IrYLWGlQsuYWtSJRDh1aP4wH4SdgKOjYrL891hC+A
         TRoAnvs4irXSxBSxbGnSYTGtrV3iFO7QQcezlfV/RDdH2POqjTTwN/nScCHYjgDi5peT
         TxdzanM+aU4Ubv+hDU2O/tIfh4ifhOyxPWjnc/GH8jiHskbrfk3JqBvK4f7xn/NxA98e
         eCWw==
X-Forwarded-Encrypted: i=1; AJvYcCX3y3Cs6P2/hXQQs5Z1UFWBtzUGdDW49mMW6TZrH2U8511efyhuP0h0g3wTbSMR2zKXcOWSOXG6e/xG@vger.kernel.org
X-Gm-Message-State: AOJu0YyV4t/lLMtuLbvJEx/VPSi2g/QEWM2SyliiwpeAKKyi7LHAXAXa
	SEMkc3rPYS1sJzd64MUNO2Nq2+1mwpWwhrts6UJ7OXGaKF6snJS421MbgB7X9epLcKU=
X-Gm-Gg: ASbGncvKHkVDrjrwgb5/10dtoILUCIBqIagKBOREMbcv4bVciBQCnZxEeEHE6Zl8QLu
	IGIzaJP4fvIXupyO2DCy4U2d6VtddwnsJbypZsPuPEVhy+nCoGqM7VIWGWofmhPwuKtLU3NHOUb
	O5Vl5GZlUgsN/sZ/wBGuWjzhSqmVmBwk3dH/aw3sGUb3DxMNoDcbnJepie2RX9G75Pgp0CxGXIq
	HHUF9+FwNQKK4+GW71Wmy26NWy9WTKDPN36ZJo0bxXsCK4DlZ65OMYJTGLGpyqBGBauGWNRnZms
	w/Cc1WY+8K7DkwifNAzH7Hiu0v6xH26VSOgowOdlF3927TWsyEyEw8x+/vp6gf9IYVtxYMXc9qH
	Hwjh5zrERcXT1CvJe
X-Google-Smtp-Source: AGHT+IEly0vxxEclpdvYe6RqlF5Qq+Fgr46eky8ZTTtYsSRx7+N3oq1XDfjPTJar+7PHSisK+6uKbg==
X-Received: by 2002:a05:600c:8b42:b0:45b:7e86:7378 with SMTP id 5b1f17b1804b1-45b8558be6emr82490175e9.34.1756814370975;
        Tue, 02 Sep 2025 04:59:30 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3327:447f:34e9:44f7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b9c234b24sm10224195e9.16.2025.09.02.04.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Sep 2025 04:59:30 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 02 Sep 2025 13:59:16 +0200
Subject: [PATCH v7 07/16] pinctrl: imx: don't access the pin function radix
 tree directly
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250902-pinctrl-gpio-pinfuncs-v7-7-bb091daedc52@linaro.org>
References: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
In-Reply-To: <20250902-pinctrl-gpio-pinfuncs-v7-0-bb091daedc52@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Paul Cercueil <paul@crapouillou.net>, Kees Cook <kees@kernel.org>, 
 Andy Shevchenko <andy@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@redhat.com>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Dong Aisheng <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>, 
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 NXP S32 Linux Team <s32@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Tony Lindgren <tony@atomide.com>, 
 Haojian Zhuang <haojian.zhuang@linaro.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Mark Brown <broonie@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3263;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=UHL45bU3ycpBbK/9v0T/s+H5JbIm9uq6QUqV6dCnaD4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBottwTg2jeHg7MNqyFVpB53OT3hBDpMLMqtzNww
 Mda9A73U02JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLbcEwAKCRARpy6gFHHX
 chIjD/9z/2COMvLdzt0sZZcC2v2YMaEH7j/ovLMC4xkic7o5czvRo1n7/S6B6mXDm90zT8g9iqO
 sKmPGq1jec9ahZ/sG7AjV6HIK9GMa6Jm/RZJWIakFs9QpzxgwQmqzQ4XG1z/zSW8jp5CD5tqC7K
 tYF18u3wvifVH3S9+DbzsNBWeifEDHRCxQ3pVUz/u1q8gk8FmjiUeRFXLOj1T4ibMLkU2jsD2ZV
 CAksogKfbUZoxCPgosTITDGYDwe3BROXhrBlm7OV1ZQsgJKkBwQgTSG18KV/KJuWLirWxPj/Tjk
 4ey1rb0m9dbIpYGtOoGuGXeaZYsejj1HciGAjPItW63hafjF8OFhYALR6ujBpAxC+xDXy6eVTTy
 NNfK6tvT/ZVzY1SiVxzkyYDg+q8ntrQu/x4CF7rc35jomHHsLis0VGtkedibJ2aMszPzSO2U+Gp
 5zzmGNkKITiSdLPojpJQZj0laaPjQi+t4ehqxXw6r6ViTzAk12e+QMSWPYJbypz4HMmPxYLqHek
 qPCtTOGtwHdg7eqSe3upVSYpcTwVZPBYORfF6Wo7oPN33vEhKtL/UZxCOFjUD4maqIH3MpD8Snr
 nfGpdqkEfAAOQrs64YvtHt6UTCTkOCcy3/CxRO/fDciQ30/X5DgLQ5ZT/FoySFzYiKZNiA+++6S
 z+eUAM19e+0hQxw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The radix tree containing pin function descriptors should not be
accessed directly by drivers. There are dedicated functions for it. I
suppose this driver does it so that the memory containing the function
description is not duplicated but we're going to address that shortly so
convert it to using generic pinctrl APIs.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/freescale/pinctrl-imx.c | 41 +++++++++++++++------------------
 1 file changed, 18 insertions(+), 23 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 18de31328540458b7f7e8e2e539a39d61829deb9..c5b17c5ecfb5ee7856bc499de218c288099f334b 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -580,33 +580,38 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
 				       u32 index)
 {
 	struct pinctrl_dev *pctl = ipctl->pctl;
-	struct function_desc *func;
+	struct pinfunction *func;
 	struct group_desc *grp;
 	const char **group_names;
+	int ret;
 	u32 i;
 
 	dev_dbg(pctl->dev, "parse function(%d): %pOFn\n", index, np);
 
-	func = pinmux_generic_get_function(pctl, index);
+	func = devm_kzalloc(ipctl->dev, sizeof(*func), GFP_KERNEL);
 	if (!func)
-		return -EINVAL;
+		return -ENOMEM;
 
 	/* Initialise function */
-	func->func.name = np->name;
-	func->func.ngroups = of_get_child_count(np);
-	if (func->func.ngroups == 0) {
+	func->name = np->name;
+	func->ngroups = of_get_child_count(np);
+	if (func->ngroups == 0) {
 		dev_info(ipctl->dev, "no groups defined in %pOF\n", np);
 		return -EINVAL;
 	}
 
-	group_names = devm_kcalloc(ipctl->dev, func->func.ngroups,
-				   sizeof(*func->func.groups), GFP_KERNEL);
+	group_names = devm_kcalloc(ipctl->dev, func->ngroups,
+				   sizeof(*func->groups), GFP_KERNEL);
 	if (!group_names)
 		return -ENOMEM;
 	i = 0;
 	for_each_child_of_node_scoped(np, child)
 		group_names[i++] = child->name;
-	func->func.groups = group_names;
+	func->groups = group_names;
+
+	ret = pinmux_generic_add_pinfunction(pctl, func, NULL);
+	if (ret < 0)
+		return ret;
 
 	i = 0;
 	for_each_child_of_node_scoped(np, child) {
@@ -615,6 +620,10 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
 			return -ENOMEM;
 
 		mutex_lock(&ipctl->mutex);
+		/*
+		 * FIXME: This should use pinctrl_generic_add_group() and not
+		 * access the private radix tree directly.
+		 */
 		radix_tree_insert(&pctl->pin_group_tree,
 				  ipctl->group_index++, grp);
 		mutex_unlock(&ipctl->mutex);
@@ -669,20 +678,6 @@ static int imx_pinctrl_probe_dt(struct platform_device *pdev,
 		}
 	}
 
-	for (i = 0; i < nfuncs; i++) {
-		struct function_desc *function;
-
-		function = devm_kzalloc(&pdev->dev, sizeof(*function),
-					GFP_KERNEL);
-		if (!function)
-			return -ENOMEM;
-
-		mutex_lock(&ipctl->mutex);
-		radix_tree_insert(&pctl->pin_function_tree, i, function);
-		mutex_unlock(&ipctl->mutex);
-	}
-	pctl->num_functions = nfuncs;
-
 	ipctl->group_index = 0;
 	if (flat_funcs) {
 		pctl->num_groups = of_get_child_count(np);

-- 
2.48.1


