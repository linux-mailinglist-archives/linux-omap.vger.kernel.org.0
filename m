Return-Path: <linux-omap+bounces-4120-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E641B105DE
	for <lists+linux-omap@lfdr.de>; Thu, 24 Jul 2025 11:26:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8A20C567CAB
	for <lists+linux-omap@lfdr.de>; Thu, 24 Jul 2025 09:26:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7234D289372;
	Thu, 24 Jul 2025 09:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Jpr6SGYW"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B6A283C9E
	for <linux-omap@vger.kernel.org>; Thu, 24 Jul 2025 09:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753349094; cv=none; b=XpaurWB3jc2/iQBeKVMMN+p00Tn97y29fKgrr2vRoCdqug1eD0cSgbHfXVbU2tiAoyT7PFLE+yqxqgsMlGrwa0PIbP+APOSYzHz7iTwPJ+VQrIeHF0l0HyckO+ovfPXG9114OJVjQQacxOOFS8Asn5eB5Ve+Ydk3tSdv0Y3pMB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753349094; c=relaxed/simple;
	bh=NN8N64azTZ6Tm9oD0O4UPA4GBXyAY9HuPJ1OulPwzrQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=puBXBAoPnqhLSkKV9F/lSKJ7q1Wob8KE4IANrtOxLTRivzttWsCyR8ZJI8qdjhPSmHSmbJ4BWF0y9vQ4j959Q5O2XTrVNrxDTEIDKlxJFpIthw0c1r7050Oe14xJpmBKs0jvMD+P22pFYUGCXqKKPlGeYJHix0YrZ+czkmwYVP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Jpr6SGYW; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a6d77b43c9so797029f8f.3
        for <linux-omap@vger.kernel.org>; Thu, 24 Jul 2025 02:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753349089; x=1753953889; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EnhxaXfLWBAe5wxXyN7EB4a4qBStRGqZ5wQqNK1Gqy0=;
        b=Jpr6SGYWi0UUMIS155Ug1Zxbsz9/w+wF7ClvHVZJM6bZfamwWXZitlpyaNm8RYXdI3
         Ee9FmeAOfqoSIb2zKY8SBd+HWcF3tEEGwOoJwTcZ4dxEV3LsrXJJiPkpuO89aF8rOQUQ
         4Yqukspf9rXLAdccZdoztNR1Nnr1TBBTN0NlQDGjUWM5O8Q1ywnchuTF5E9sLIsRt7+r
         Kh0j++JuT5LaxJpL6tUCqA83KNNdOZfBZh5FqSR00iXI4lVVLlRFtKYwTa8JJdhbc2Cj
         hdtns7Nt2oQKtkM/QAmVHfiW8/zZpnWZvAGz9xavQaa5Dpb2ryagLyya/naKFym7ca3W
         m8Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753349089; x=1753953889;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EnhxaXfLWBAe5wxXyN7EB4a4qBStRGqZ5wQqNK1Gqy0=;
        b=GGR77Uo3EZDEiIJSPKJQZO7OL4JagjCfIf48l6lMsFeQ4eZ/M0cUx+atFlXwogVxuR
         3MveijW0xHHr+g0GtuBTCAGP/j4VsBqupkbycqG5OJqB/Cq05rqAeFTS5CJ9Z0bn6R09
         WcRF+qT2VU/f16VI4akhD5upRZPfD/uTXFS079HsrFnCV4tk7OZC8RvV1F56jTZTMvyN
         VpvczydwOAnZ85UaXPCZx7Oqz480+TxtVo148YtgBDXC6wRejCLDhSpk55ndslu0V2OL
         V4SbMibYD2u4HOQKWwi40omyVvg9zjCiHLdSlgPoIkHO1xnm33p95t/FJj4HCmbC8nG+
         5flg==
X-Forwarded-Encrypted: i=1; AJvYcCVZLAWr2QyI+CmFSkJoo1XAlT3Qs2sNgknttfUbjr6Q1gPoPz3X4gpW0aYtZBhkbQBFKGotI1y33vMQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzKBlTgO6Me5EfbvGTG7oaHDr+nxQXPpGsT34iuv/0ud+q+4c+x
	j7I+0BW+MdKsBdK8Pk6MiKxGHy0Qmbqgz7D/ygfJwbHdWi80w+KQYqHSTgYJFLJ2knI=
X-Gm-Gg: ASbGncsQiUPwo2bHLMo4E9WZ1HJmA3XSJnaPEgd4KrrMtSdmSQso9QBLN85o6rhtF5h
	fS8X2FZL0Id/uufgFUKAxKQo3tPakVEWaNgCB+eqeHPuHIGpD801hFYYuVb6jY0Kg67zPw9zepv
	+QNU1m62KxIshobrNhnTExG8zsH6n/yehWTVDghs1+6ct1e06qRwLfdsaZdlm72qBe/ToOJZ2gK
	rKZXbd6oXEx+E0m2b5cFfFE0aOVK67nDBI7xRjB3Vw6hCfeo/GjJOBHZcp9h2fFTNb3/u5Ph9J1
	4tVCzSO+HYUMsOH9raw7aciB4dLzChC1SsTb1zkay3chj7FmjO9B+KkPnJ2a9iTsBQYclONyMAl
	tydsSzYZGxP5do2Sz
X-Google-Smtp-Source: AGHT+IGnhvfYcdLRXAtdaLRr5gD7VJr0sJOuUbMg0+qJlR1rhLS/+bKPH6E6yrPyHszr9XJ/HYT2Sw==
X-Received: by 2002:a05:6000:4305:b0:3b4:58ff:ed1 with SMTP id ffacd0b85a97d-3b768f1647dmr5410021f8f.52.1753349088691;
        Thu, 24 Jul 2025 02:24:48 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f44c:20db:7ada:b556])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fc72548sm1600833f8f.30.2025.07.24.02.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 02:24:48 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Jul 2025 11:24:34 +0200
Subject: [PATCH v3 06/15] pinctrl: imx: don't access the pin function radix
 tree directly
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-pinctrl-gpio-pinfuncs-v3-6-af4db9302de4@linaro.org>
References: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
In-Reply-To: <20250724-pinctrl-gpio-pinfuncs-v3-0-af4db9302de4@linaro.org>
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
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3088;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=FuPiesxsrAA0Rn9DkOactcvX9/BHBoNthgyhyXGEhH0=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBogfvSXtvqkFaYJUjTRAJPRVMAk5wNil2YXVMOw
 MxVCTuRo8OJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaIH70gAKCRARpy6gFHHX
 cshfD/9SbpCGJDJ/Jk0sGpayxa0FhLlGvR6oERWTvgMhtUeHxUCFxBx6YMGv+BXEHcewihGh1jq
 BgX/VsRjvw6EKMEblPXX7xIezXGlJ1it6QRIJhD67eBZiCBfyPtBPG9wS5We7w//N3dzb7oZt23
 53GJbPsWFtg7q1VUNLX3nRrR9lnlbsEnSqSKbkHNbMJIoV9rji1HhGAgBmaT0ORciNHfcNGGFOM
 KVacjCtlplbn6eJG8vSzpRvU0cb7YHFFsvIt3ywpH+IOMdo3ZSw/Wzmf7YD7iS1WQr7Rsp7zxf1
 Bn6qiN7lKO4IVxgFPuQhiiUXjAt9OCjbJYlb8MVwCbTkLMFXcVVBQYHi/53LnDO9HvjWzsIdJ2z
 YumdZy8EhIhf3NCj7jIrdAyFYnm3sQqVn1h8YAvAXS1T2OS3QRcnjueogYTfGXBNCMutApRK/BB
 8kVNdJGs1FH2+2s1u2ZHJSTAdXTyuEtC0ZtlsPTZK8qnU4tIzC+eHoHw/59LtMzbTqMOdhc7kP6
 2mFiCpXau57p6nMR9D58vlXLXZ7hPCvcyk+otcV+5SypG0Z1wj6aCWzj9cpO8AnBNWF5hDbXS7E
 ygjMSNH5srKmYTV5/cOFe/eEPNtS6qromALeW2LQN/kc2GWO2J3B/x2YuLPBSsaK85Rbu8N5Cl2
 64ZSUQ7l7oryaNQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The radix tree containing pin function descriptors should not be
accessed directly by drivers. There are dedicated functions for it. I
suppose this driver does it so that the memory containing the function
description is not duplicated but we're going to address that shortly so
convert it to using generic pinctrl APIs.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/freescale/pinctrl-imx.c | 38 +++++++++++----------------------
 1 file changed, 13 insertions(+), 25 deletions(-)

diff --git a/drivers/pinctrl/freescale/pinctrl-imx.c b/drivers/pinctrl/freescale/pinctrl-imx.c
index 18de31328540458b7f7e8e2e539a39d61829deb9..d5d42c9ad5fe9dcf7c25ad393688e714b02db678 100644
--- a/drivers/pinctrl/freescale/pinctrl-imx.c
+++ b/drivers/pinctrl/freescale/pinctrl-imx.c
@@ -580,33 +580,34 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
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
 
 	i = 0;
 	for_each_child_of_node_scoped(np, child) {
@@ -614,10 +615,9 @@ static int imx_pinctrl_parse_functions(struct device_node *np,
 		if (!grp)
 			return -ENOMEM;
 
-		mutex_lock(&ipctl->mutex);
-		radix_tree_insert(&pctl->pin_group_tree,
-				  ipctl->group_index++, grp);
-		mutex_unlock(&ipctl->mutex);
+		ret = pinmux_generic_add_pinfunction(pctl, func, NULL);
+		if (ret < 0)
+			return ret;
 
 		imx_pinctrl_parse_groups(child, grp, ipctl, i++);
 	}
@@ -669,18 +669,6 @@ static int imx_pinctrl_probe_dt(struct platform_device *pdev,
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
 	pctl->num_functions = nfuncs;
 
 	ipctl->group_index = 0;

-- 
2.48.1


