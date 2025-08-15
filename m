Return-Path: <linux-omap+bounces-4237-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B1F54B27CB4
	for <lists+linux-omap@lfdr.de>; Fri, 15 Aug 2025 11:18:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A44C9AA5BA2
	for <lists+linux-omap@lfdr.de>; Fri, 15 Aug 2025 09:13:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 08C072E4246;
	Fri, 15 Aug 2025 09:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="F8GGFahW"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7D5B2E283D
	for <linux-omap@vger.kernel.org>; Fri, 15 Aug 2025 09:09:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755248984; cv=none; b=XPJnAnMBqqSsrH5H4ZbL5zmjGwLN/zYkKda0SQnlxN+0JicFpjQVd7phIFjVgNFEdGKtdhltE0tSlR6uc4Ci5knxjyoBz7aOSnS/Lk793rx9/xFnk23lZeAmXHTTssbYdKJBl7GgVP2kB8C4RwM01KiIi6+Br6rFSt7S5OXPVjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755248984; c=relaxed/simple;
	bh=+QvEm53FGBL8kbed9CrGkfR7JQ0mUkCssMIU9hMIktU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b67Nk0M1exYjDWYNQ21kpka2mjwq3RpiRcSLGW2VZz28GYAlpGLpgUZYAtllu72KhU5mR7i+RK5YvqsCgbLUxW5J4+oC3A1ukGADd5Iw9JC4l8FXIASWg8MGAK7m+FHxzyC6rC3umb1xtLWAt214yWwhRy2MMPdTeCnZOvj3qWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=F8GGFahW; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3b9ba300cb9so1199906f8f.1
        for <linux-omap@vger.kernel.org>; Fri, 15 Aug 2025 02:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1755248975; x=1755853775; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fkIrT982nu0l7atioMtbVH3OTcGWcWH7NZxVXh73dLg=;
        b=F8GGFahWqgeYLoE3MMaBcgPi58mxSIweZA/ahN/bvTxjyzCAzA1igjZvAXct/fdSdm
         bfplKio4HXdQuBMpGmsgpA/uEovsjyApJIhIJi1ZJZGlaQxNHxzOVHlbZ95AVOYY7mNa
         yEEcVMsK5xZCdJWjRySBYXMiZoKvXmIr+Z353VPcUl7lu+XvDBmQjFibzvhBKgl+mOwM
         cuNokIVpnqLBCO6pEbd2mAdX1UmF+RzFWsIvNqf1SeVen9L1tCs/dLaUe+SD40gWsOTo
         dr92S1/bIQpSca5/Z8WV4weryYlTbAPmzRohlGEgVKL78p2O0X7MyqG0jjzw0PNYO3N6
         bARA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755248975; x=1755853775;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fkIrT982nu0l7atioMtbVH3OTcGWcWH7NZxVXh73dLg=;
        b=ffAwWgd4vichuIOwhdw7H8RXN05YFWKhOsgBXafUfKbv1WVFmPBbzt7qxPSZabhtGU
         TMOEr3yCBxE8RcCkmBmGgIz/4ivwEQOp4sXA3w8GxncLjTWnd7uE6etm9M1UmgPXh9Kq
         uYLhu3OjgOKYpOfp+fpgspr7T1d+fnLcyBkQ926q0tAHF5AOpk3sdgvo9PHsa/M7rQHp
         nlbV1UlUX6dGBVZNfMfaMjnaea4Ny1HTJxNTYNxzHUXMVwIrmSDwIc2kDck0OtRqL7xh
         ZXBpyx31b3S8CZhNoCVHkR+bdcTqM1IyliFnjzZIOcvWTn+93Avb+c2rIDTMtpLDkSxv
         m+vg==
X-Forwarded-Encrypted: i=1; AJvYcCXL8mICk2AgVcNe0vbg2z9OsmpYEMxpAi0Zk2VheG6nMLcpgyXd4HNHSu918irNPdUztvPtjYpFQI7d@vger.kernel.org
X-Gm-Message-State: AOJu0YxkBDhFKFVl+UfkLYcLBDbOscS0r9dVCd35/vYYaA0KuuvCs6X4
	/ZyBF1ATQFoPHg305pRtjgWu5AtrfVc/YJTdSZHlfVMjZ6qJCMiP+4Tx0E1cX1u17jo=
X-Gm-Gg: ASbGncvhTMmrqTf1kaCE9eWnqFqh3z4q/P9cQlVe+EnOrIG6UuCTp6254mc6IL0pjZx
	dFIQLOl/TH2vvmNjtxFdYv0JYn2ifbUkA9cyTZUi8yXZFGR5djO74LqBE0Vzw3ntb1vMuE/06CC
	/jgH/DM5rODtAURSfBa0wSchY9wYLaa2LxD0UPqUhfdyAQA1dLDtv+NHuPX21C3fK/JOeVpn7fa
	Qte4FNUuYpzvUPOikNb6uN8fhw4rq+WtfCWulUsCp9X2ZOdkYzf5UHeeX0mVm5BXmSZWzEvNRxd
	3AMO8W5xEN++oEc9YX+t7GOSwcUWrnhVdMAarkc9lK8g1QGMdiBIH2/7J+uDKT0u8x8SBZ4kB8r
	Eg/d6W/WZr1kHLH/SXA==
X-Google-Smtp-Source: AGHT+IGsDrB/9NqsFs+GTJUXDyUWG89PIW79ggF9quCSnVgyfof3rlZDBIwDgG3UDAmjbKhep2/pmA==
X-Received: by 2002:a5d:5d0d:0:b0:3b9:13a4:722 with SMTP id ffacd0b85a97d-3bb4a1fa03cmr1100448f8f.6.1755248974639;
        Fri, 15 Aug 2025 02:09:34 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:a125:bd3e:6904:c9f9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c9a67sm1205210f8f.35.2025.08.15.02.09.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Aug 2025 02:09:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 15 Aug 2025 11:09:13 +0200
Subject: [PATCH v5 11/15] pinctrl: qcom: use generic pin function helpers
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250815-pinctrl-gpio-pinfuncs-v5-11-955de9fd91db@linaro.org>
References: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
In-Reply-To: <20250815-pinctrl-gpio-pinfuncs-v5-0-955de9fd91db@linaro.org>
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
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, 
 linux-hardening@vger.kernel.org, linux-mm@kvack.org, imx@lists.linux.dev, 
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3269;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=chxUZAtCU37mhXCr4qzhIIkekcZb+5ZpnLwzXbUTM0A=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBonvk5lnBQ3Etsml5iw/SH8qzvKnyGoC4Hly5o3
 tnIDLJk12OJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJ75OQAKCRARpy6gFHHX
 csfPEADBEB0r5l4OpTTIJK9i5AuM4M/cyu/QvJFZPvHsnoQ9OThLsPCT7jshbC2wt9Pv2puSVX5
 T1Af8wLRGMDrEZDP79F4hdOml7iB4kmRVSgBGYOIXs9akwp0viAFXXfUTf0qk512LjP/Zeha8Qu
 2vBQJXCtlrnBVyrLAxCt7iywj/o0HrURUraqC1V/kL1ejTK5U51gBYfoAoeWQ5TUVJopb0tjbOA
 mkIQDFpPVtuvRc6JP3wWSfTDUEvSR/B8uIGUkyIDsqVTRzObzIFflNGPvWoIQj41zXagR0xgWTC
 tamCDJq4dBqsNR7YUMWTCgpLB9UMbZimR9r+Z5QhPEb1uEToQmLmIKQSH55KMosoRsheikmbyMj
 n/YfwJPK16Q1aEpo0CPIsJHHJDhsrEB4xWpq2w71ggoiJnPXLGtapH4altn+YIiCtNE2DsogjY4
 z1J5MTqicg8N2Wk959AZ2U0iqc7pHTgnC+caKBq76Wqv8S1/m+npVHP6elyJa3brBbDRDwVuFdr
 tJZsQOOHOmp0WRxh5N/07ZwrriHVtfhX1KD02OHuaiQrGtEyrp1/6LksZu/5fvUVpj92ttmQ1JL
 A+VFk+sgzNoH7ZCc3rGLtCq4/o+8RzkaRpoUSMtxA10w30Z31P8SZPwIDmMqECTzGYpEsEPiMNh
 4fdjFWUp2iXksfQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With the pinmux core no longer duplicating memory used to store the
struct pinfunction objects in .rodata, we can now use the existing
infrastructure for storing and looking up pin functions in qualcomm
drivers. Remove hand-crafted callbacks.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 43 ++++++++++++--------------------------
 1 file changed, 13 insertions(+), 30 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index 83eb075b6bfa1728137e47741740fda78046514b..96e40c2342bdedb8857629e503897f171a80e579 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -31,6 +31,7 @@
 #include "../core.h"
 #include "../pinconf.h"
 #include "../pinctrl-utils.h"
+#include "../pinmux.h"
 
 #include "pinctrl-msm.h"
 
@@ -150,33 +151,6 @@ static int msm_pinmux_request(struct pinctrl_dev *pctldev, unsigned offset)
 	return gpiochip_line_is_valid(chip, offset) ? 0 : -EINVAL;
 }
 
-static int msm_get_functions_count(struct pinctrl_dev *pctldev)
-{
-	struct msm_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-
-	return pctrl->soc->nfunctions;
-}
-
-static const char *msm_get_function_name(struct pinctrl_dev *pctldev,
-					 unsigned function)
-{
-	struct msm_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-
-	return pctrl->soc->functions[function].name;
-}
-
-static int msm_get_function_groups(struct pinctrl_dev *pctldev,
-				   unsigned function,
-				   const char * const **groups,
-				   unsigned * const num_groups)
-{
-	struct msm_pinctrl *pctrl = pinctrl_dev_get_drvdata(pctldev);
-
-	*groups = pctrl->soc->functions[function].groups;
-	*num_groups = pctrl->soc->functions[function].ngroups;
-	return 0;
-}
-
 static int msm_pinmux_set_mux(struct pinctrl_dev *pctldev,
 			      unsigned function,
 			      unsigned group)
@@ -288,9 +262,9 @@ static int msm_pinmux_request_gpio(struct pinctrl_dev *pctldev,
 
 static const struct pinmux_ops msm_pinmux_ops = {
 	.request		= msm_pinmux_request,
-	.get_functions_count	= msm_get_functions_count,
-	.get_function_name	= msm_get_function_name,
-	.get_function_groups	= msm_get_function_groups,
+	.get_functions_count	= pinmux_generic_get_function_count,
+	.get_function_name	= pinmux_generic_get_function_name,
+	.get_function_groups	= pinmux_generic_get_function_groups,
 	.gpio_request_enable	= msm_pinmux_request_gpio,
 	.set_mux		= msm_pinmux_set_mux,
 };
@@ -1552,6 +1526,7 @@ EXPORT_SYMBOL(msm_pinctrl_dev_pm_ops);
 int msm_pinctrl_probe(struct platform_device *pdev,
 		      const struct msm_pinctrl_soc_data *soc_data)
 {
+	const struct pinfunction *func;
 	struct msm_pinctrl *pctrl;
 	struct resource *res;
 	int ret;
@@ -1606,6 +1581,14 @@ int msm_pinctrl_probe(struct platform_device *pdev,
 		return PTR_ERR(pctrl->pctrl);
 	}
 
+	for (i = 0; i < soc_data->nfunctions; i++) {
+		func = &soc_data->functions[i];
+
+		ret = pinmux_generic_add_pinfunction(pctrl->pctrl, func, NULL);
+		if (ret < 0)
+			return ret;
+	}
+
 	ret = msm_gpio_init(pctrl);
 	if (ret)
 		return ret;

-- 
2.48.1


