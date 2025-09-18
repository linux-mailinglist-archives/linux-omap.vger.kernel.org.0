Return-Path: <linux-omap+bounces-4387-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D80AB3A564
	for <lists+linux-omap@lfdr.de>; Thu, 28 Aug 2025 18:03:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F7811C85F70
	for <lists+linux-omap@lfdr.de>; Thu, 28 Aug 2025 16:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6204B2836B1;
	Thu, 28 Aug 2025 16:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="co6w3OTX"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CD9E279782
	for <linux-omap@vger.kernel.org>; Thu, 28 Aug 2025 16:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756396843; cv=none; b=t+AJV2/5rYOE21S/lVWddcLJSybJjw6WBKJYu6bk2ju1liQfrzJy3HSCuYHmFEiHbVWRclrN9uL7XQtqbICIB/NpM6XcAdwX0f2BraUfQYBknLfEARNT7lcphqb1JbiV8krWwffWPmpuPkuLYk+sWyDjLzuP+nHTpCWY4ps7Cek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756396843; c=relaxed/simple;
	bh=gnGkjaHtZR5cG1YYWSUpvgHnNwtSkmlkHkuvNgBor9E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qEkCmoMpZMFwnxOB2rxgWXIgsVf2hBeRgtEtswJQir+mF/NzI+MdFcSBx+xiJo7B8WZOzPFOc2sMA4G3Q/OvmpPRl3PQnFCWyzYH/bsKM2W46SGNf51TyXw//7hi3J46Dk7f0oi67B8j2AZOws7hh0E/C87XZRcmfoaycIAO5TA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=co6w3OTX; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3c79f0a606eso725917f8f.0
        for <linux-omap@vger.kernel.org>; Thu, 28 Aug 2025 09:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1756396837; x=1757001637; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kyDGhfJgrh4J6gn9SuBfsKVPoVuurUg4MDMRSiTssr0=;
        b=co6w3OTXKX99n90RpI+O1BHXogGfoKQExgalVQDbJqJPuvxO79Y3WjrQAwS6lIb2JR
         v/htFMBrtxrEyzLUaSstUdMVLFOXMjK2VFWYF8EoNfEPGYsnoVvw3koF/mGkKIM6uZxP
         Zh9PK8J1NbnynjM6tk80h+VIWgUAypUFOe7ng1wwdZLmMVYcla7PSNeRtshnaXqBLRTq
         qA5n1hzrjHE2GKhnMMuNZgaiA6vYA7UUAzu/GBUH6wtiSCKUdAedUg6ggQD4Q+tEN57j
         OZbtXILxQqaxee1l04hyiDPsFkoIvx7Aochq8PgM7hPY0pe/QiEuvgRTUSS8rKtOUcIz
         pIrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756396837; x=1757001637;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kyDGhfJgrh4J6gn9SuBfsKVPoVuurUg4MDMRSiTssr0=;
        b=ke5cbo02mbO54U8YDwZt4qqhTI3VcVTkhCTIvdEvwVd+29xK58UwWyF0W+sIUmj2mW
         rXDL830Zft5soQu/MmcfzH7HMMY+w+/1AhDZvVFq2MJ4t+ofUsZLzKuMPEsCriuXuG7D
         ihdeOSuImj6C3vWlAb0ZFZ9M9wddozHFTM2wZuigaMZX/C0knu/PQgcryMPWAVHARug/
         BukRZAHVONHpRs/qb5+twmlMDZQOu1KA0HxFAMgfikKb/YGJ1RfhGiBTAFSHfRGdhiys
         FSm7nAkIgxvLEHkifI4MBhuICLYz4sLtCnSHyDz2WMO8WIzbpyEU0bDlvMgFH8eki2vL
         Z3hg==
X-Forwarded-Encrypted: i=1; AJvYcCU+1O52YOV7DZgoanyGC3DMUnD0VdDWcnGl7+bYhpDdnBtSaaCYfpMSe9Eb8R0fSV2mrd0YT8WpMg1O@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa0fnfYUEFhGUkLD3Mdp/UffVWu6w45cE0kOO31LS182wPYy5S
	nhi6eZQ1cgdIf8T4sW44VDBYGlGGkQ9PQDkksWDskmpRh/U98QwFwe66YBxVMI2/L3o=
X-Gm-Gg: ASbGncvZP2fhRm1FC03OWUyaCnP5LPHCOhJOadbhhNzwX8EPdCDCWTFiqehpVZEWlHO
	dvKtzEYCeaq8Bf77o2mlpaGGkMlScf+/Zca6IumiDo+MWuRzpHAoMjNa0PoHgDY3W7tmLxT/kHe
	lkBBP/1NpS6Kx3pYewYPHRUKqaAVxMFf7b67TUk0wu0p85j2WVD5f0p65jhXdNo8zAZ30i8RE/Y
	iIssF1bugJMbA595liswW01Is68WHIiXcsUXv/XiXF3q7EuAVvcBnr2jkBgJeU/61ySVeaMUy/e
	avcEl7irFdOO6pJ437wBNzPQe+1YB9o5o0QE4v3SkID3Ntm9qw27SgzTT4VDqkCBvFye51amEjA
	jwJpXEdWoEdg4NAHAQw==
X-Google-Smtp-Source: AGHT+IGRb2IFrJR7/1J+rjeNU8GkVEAEf5qNguD6R0jJVoV6aqw9N3uve9t0ub2p/g9PXQeEWnV+2Q==
X-Received: by 2002:a05:6000:2403:b0:3c9:1433:f8c0 with SMTP id ffacd0b85a97d-3c91433ff3fmr12100077f8f.7.1756396837431;
        Thu, 28 Aug 2025 09:00:37 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4933:4d7c:cf69:9502])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45b6f0c6fe5sm80211675e9.5.2025.08.28.09.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Aug 2025 09:00:37 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 28 Aug 2025 18:00:19 +0200
Subject: [PATCH v6 11/15] pinctrl: qcom: use generic pin function helpers
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250828-pinctrl-gpio-pinfuncs-v6-11-c9abb6bdb689@linaro.org>
References: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
In-Reply-To: <20250828-pinctrl-gpio-pinfuncs-v6-0-c9abb6bdb689@linaro.org>
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
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3751;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=qmbs27ufzmC16v+sdcPEY4dDQY3iNSX16sXKxiePlDE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBosH0PnC9WMdqFML1hS6pX4Ax7d8FKU/1NETcnI
 wejv8+DrUOJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaLB9DwAKCRARpy6gFHHX
 cgUlD/9h+MbAVo/wpsAgGFq0gzUJAW9nwwGnh2UUoj3Kqv10EutSXw2RS8/j2v+ITd4A7ABEv04
 3e7T9KxIfgTGIQNStI/av47LGaFQoanqW1bbicRWetgfw4ov9Kg8DBWxmiM38ucKX0TH0B1V0DZ
 1ickY8HG8BK6FO+qam8qf//7NJ03enn6xAFDsdu8gsOOiGGf/TaB+M09CpUjTROpxx4kOdwoyRd
 7KEgzKdp5nr/aTr/5ymPx+D4YvdV3g8g7zKgpOv7sNzlh6q4eHpIyRXfSLTNFfMEK27gs3RfQiu
 nFjbrmBC/Cm0Dx3PtrZoiuGFLIynOHFozfI8W1nxeIcTH2drbiUpQM+PMyzn6QwdQLyuYsWIIp4
 P97TifYj25rmdWejAC7ce0M/MUr6ym5k13HkeDFMueER//pdQh2BB6H45PG9So0YrhSESCqN3TL
 0rgOdRqufzPjxELShQhA8C5ca/bWsVuYWVY2lPBJxS7oqgJQ7yO0V9lityx55QhQweeXFlkDOCa
 odj5YLA2Ua9lK5nhrpJl4Pm++PVW/VroLuBJuEtg8pEYp5QOywE1m2GdXhZxMn4fOMb71Iy8Ye/
 YCmOhCxdeaxT35vIe0apm4cT9JEQFY8JhotGnkxa3p+cTEYqk4BreR/mYrEtQrZJAOXNvDQXIeL
 AWgGjt+UZOIungg==
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
 drivers/pinctrl/qcom/Kconfig       |  1 +
 drivers/pinctrl/qcom/pinctrl-msm.c | 43 ++++++++++++--------------------------
 2 files changed, 14 insertions(+), 30 deletions(-)

diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
index dd9bbe8f3e11c37418d2143b33c21eeea10d456b..f7594de4b1e9b95458c2c817e1158026a8006f64 100644
--- a/drivers/pinctrl/qcom/Kconfig
+++ b/drivers/pinctrl/qcom/Kconfig
@@ -8,6 +8,7 @@ config PINCTRL_MSM
 	depends on OF
 	select QCOM_SCM
 	select PINMUX
+	select GENERIC_PINMUX_FUNCTIONS
 	select PINCONF
 	select GENERIC_PINCONF
 	select GPIOLIB_IRQCHIP
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


