Return-Path: <linux-omap+bounces-4125-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 61863B105FA
	for <lists+linux-omap@lfdr.de>; Thu, 24 Jul 2025 11:27:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F15B51CE451A
	for <lists+linux-omap@lfdr.de>; Thu, 24 Jul 2025 09:27:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 73694283FC3;
	Thu, 24 Jul 2025 09:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="eWOu+JuR"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2EE288C08
	for <linux-omap@vger.kernel.org>; Thu, 24 Jul 2025 09:24:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753349102; cv=none; b=VcFvFCh5JLB2xNJj4mnX9AO/l+6m0mQdabPZz8lKbQyz8dVzHafmKeqkXwbkXpHlUTSJvbl3nKgNnvEBNqKFPnF9c05lpiwp+3GD3XduN90+tQu2tc5h5r4Gy36/Z8csBh0BJPkuJoKlQApOyRhoED2qCoPzjrwnMtLYMH0vLHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753349102; c=relaxed/simple;
	bh=uY+ZOwQz9NTow62silZ+dNZ7euYQDbRWxGmD0jBRAJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qXt/OM6xzDXqAuueH3cp2rNiXXnzVO/9Z4HwDsiob6fEYH2k1ptJGVUoSvC1c83HlZYKniEHRvrfNnYIGyws31H99jhhRbkhrjTcDzqI7kyMhPudFqbH27fE1dsLnICV8uR8reBt9KG+Cps4TGztiYvRrvogVaATwxGMYTmJd/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=eWOu+JuR; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3b49ffbb31bso511538f8f.3
        for <linux-omap@vger.kernel.org>; Thu, 24 Jul 2025 02:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753349097; x=1753953897; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zi2TjXbns/ZB5tY+tLJCSU3ZnVzRbewv2i116bdMct4=;
        b=eWOu+JuR9xw07etmgNivUh4pI/5lMaf3anUZokdHRMmImu4G1ou6rDrGpX8ZWh/T9n
         wfPcxrIY+eiRcO+2WKoA/167EJO2J8GIhkdMDxNtWMnudofFXKjo4fa0GmYAOs9d81Ru
         Bqxbe43uU236tlt/e4VJoqNFevhTjfN8Dxijlo1XndI/KVC2AtG+R8F5FRojnbEMwM0a
         253rTbLgPpQzyc5SPAfDGRl7yzyt1GITuR3JycDOJ/3N+uJ4OQSHW4FDXoK8pQRvkHl9
         xoTpqPWNjYwYU5X7x6VFOSUu++9aLHgtPBHd0JqRofvsZEaTi2+0wRRlKxqk73jgE3bz
         mvCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753349097; x=1753953897;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zi2TjXbns/ZB5tY+tLJCSU3ZnVzRbewv2i116bdMct4=;
        b=ZVkBiVBH+OWtdoAEHuFEqgQJPuXiwpTjjcyL4tPtuY9xhACCyjg1vmQa4MuHGx2djR
         oj+6c6/gNWHp6HV7vM069hM/mXmPhrkvbtHvkmmd16qoDXY9ZvMGVOfzc+ICDM9BLgc7
         +XKzFhjqtgX3oFI8sMw0/s7rboF4dkDdmXGAqt5Rc0Wq639zSkPOLQyNuJNX837lrxxX
         DrDcgWMdufQRTa3a58cH53k3NlKszZlFuOPVNqYztBspPT051IhclVzfK38P1m3Ez/5P
         3AgtiFfXbXa3/q5ZcYZbBWcerf2cPhchwB3W3yPQ/21e+e5CzQANuqVyHHL+Gnwy/acN
         2SvA==
X-Forwarded-Encrypted: i=1; AJvYcCXXRLFobO2q9lnFlW4Nr+dv2SolmRTekNj3Fm5XtxYNFI+KjtZoUUGeg69IY5aaZD9j+cjh0CxxAzzP@vger.kernel.org
X-Gm-Message-State: AOJu0YzrZBZS3Hry1kmNpoXZv7+tIYqg3ZCgSzPNxizbCe/n8A0iWyOj
	WPApA1DMSNJhhkiwpAb+JsDSIP1simv0rpc4v2slQglXvMFpBoHgn4Gcwpjhu1xAaGQ=
X-Gm-Gg: ASbGncsdzF9OwAkUfYGDl61ZPoMpDtQzHehxH6gYcOgGqugIzeTvFkV2D3wwygDbnOu
	QjXHWyoNPWj18q9cuVa9qit05oOlNflJIxLDoaoL2cmTYfGpVN+mOJxj9TeXohqu1i4r1d5NeO/
	MW2IKP39AjOsihN9EedKvg9uZV9E2equGP2GN1K82WgZ8PPVdWFW7KWw7qKwm5jcPbD2cBUhIoV
	WDQgGKo5nmrAlgied2BYWXZ3pUIoFZnoeBzXNrtaIlOEYAkUrsJxQKYrXkUe/jqtjFBwdOni0q7
	MKRmoY9lZbfISiX82PuwjNWmHshUj91ts7mba4YmJkhSLGlWoxHK51w8YlVADwNZSaxWKVyCaL7
	m+mtbdUAVVg4aGuT+
X-Google-Smtp-Source: AGHT+IFjtwksIDz+7DSsBWeS97i1ZBqpIGTXCOjdZdeq4tlTrWHKVCP+IvRPyXYuhcRL3QY2eNIWHQ==
X-Received: by 2002:a05:6000:208a:b0:3a5:25e0:1851 with SMTP id ffacd0b85a97d-3b768eb077emr5529569f8f.7.1753349096652;
        Thu, 24 Jul 2025 02:24:56 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f44c:20db:7ada:b556])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fc72548sm1600833f8f.30.2025.07.24.02.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 02:24:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Jul 2025 11:24:39 +0200
Subject: [PATCH v3 11/15] pinctrl: qcom: use generic pin function helpers
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-pinctrl-gpio-pinfuncs-v3-11-af4db9302de4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3208;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=j23TQRNjGh0BJR8XFxZqqg+wPRm63XTzB00GHcaNVhk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBogfvTk7yHYlcFQMyWoiWjPshDZZtgzQDFYrODV
 Z1WZPc/WEyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaIH70wAKCRARpy6gFHHX
 chVRD/9eeVGld+ATTL9+JqtQxPOrIZwlqhXFRCYZlyZazFTQwwHsY0fRCWqUY8zJDUpWJ58dICF
 jGX8CnvpX/qLEAuVRoRHPDvawkmoIZ7VML54qi6pmuB0YMtGcgUNj2YkriHA+g6fdE7LK+D3e78
 QQofwNaGv1MFuYFQE+hOnDOirVK6VIc8XhYsyL07YDN1qnaEDHtLkBZHefcIJryYxC6wlNBcz1p
 Cd3S05INSHpxvJstk5w7pofJEtTs0jl8bbzR8F2pN4QRtW6JfIKpD1otUHL+T6Ny7Qg0vUXNtW/
 Ibk72PLoLyTo/yGUQS0qBtRGzIeVRaxeAlbL3TC+oIXA8n8knMwcZsLnfQ8WJiygL6jWKA/bLkd
 XXXexkgPtnZPj/2q+WJTsC2+aVYV6F9bXeUOGEZG1tPatCwGN5qcsd9Fpdx+lRDxEmecZasPxgO
 IyNyAkCsvk2nERY1KT1vAZeJ+dgl63R3L79Rte7IK4nvIFxQeIP1p1hbSc7vOUV8Y8MTZg9RNKW
 pWMHGEJJmNENd2gZl/1mIBxCkfmnlDE8ymlKk6Rd+DK+e6X0sWBgvjj4so9LtIKeO8CmRsTNYoo
 4keB8r+QC7KS0dwAvoSEOFiNm3p4pkvhVsR7Oy+hpgrltAAF7eE9GT1MfhLfdxNVC0w1dagDftW
 5csm15vDv1NWXdw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

With the pinmux core no longer duplicating memory used to store the
struct pinfunction objects in .rodata, we can now use the existing
infrastructure for storing and looking up pin functions in qualcomm
drivers. Remove hand-crafted callbacks.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 43 ++++++++++++--------------------------
 1 file changed, 13 insertions(+), 30 deletions(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index f713c80d7f3eda06de027cd539e8decd4412876a..965f0cceac56697bc4cdb851c8201db7508c042e 100644
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


