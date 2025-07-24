Return-Path: <linux-omap+bounces-4118-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2213FB105D9
	for <lists+linux-omap@lfdr.de>; Thu, 24 Jul 2025 11:26:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32A451CE1C56
	for <lists+linux-omap@lfdr.de>; Thu, 24 Jul 2025 09:26:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC2C4275842;
	Thu, 24 Jul 2025 09:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="AQW0oxah"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11990283C83
	for <linux-omap@vger.kernel.org>; Thu, 24 Jul 2025 09:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753349090; cv=none; b=ctkGqwN/GENbhsgj+KHTFQJ41oC+yFkuYsxHM0i28c/UX2FlAL1bCuKeDG6aVi5w8Jk5GFBmlqYN3VSuz6V+18/8aN/ciOx8vv0SkiCj9DUqYipmvydXWF3h83M9r4pzs837Akvk7nkd4TF85uk1TpO4yMajT55yplB9Tw6N6NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753349090; c=relaxed/simple;
	bh=XLM+AKGhm/JPaIWRpDkOq+A/wAVorXQ6mpQytd/t0+4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZpGYJBHpZ/vc864fwp7oP637WS/WDYF0ZXXRKcWbi8SWrprAyVCmKmUNDmOym7SKoAAzZ+sSmjyyc78TyGcEotMLJJzlCiPHjP2LlWnLS6GPBAeeER99t/yumW1dlEvUqSVkWQNupRoshkj3QDlL8+IRdiB8W07kmq0SVjJzClA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=AQW0oxah; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4550709f2c1so5264355e9.3
        for <linux-omap@vger.kernel.org>; Thu, 24 Jul 2025 02:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753349086; x=1753953886; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=46QW0ZKTJsCdAnI774T47O1RlPj5t6dUczWWbfa0X0I=;
        b=AQW0oxah/gLZtFQbqJJo+6Las0oKJadNOKhSVYkPbUrSuzGTYnKoiJpSEHKKh9cX4I
         gLX32QHErI9hFB9qMdHgItaus2PAELfrANghFogh5ReecsMXVuEjwiYjAv8Fl++5VD19
         muNzxJvrCQ/yBhRGiU5A41bjwG4pUyF9KAKf8JUOL0z3Apihea4hD5mKemba9OBfDd4+
         Gwf0f96xD7ia0C2hKIrsYAD0fV2oUI2u9yaXF1P7JGdev9xwklEA7eVuG6v8+IoCWEC1
         TMEZlDc30nGr2li0iVxGYE1u1bbI0dbXCJCKJ2vmbUwcZXw4VDo4phmpf2OgmsPLdp5I
         Wupg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753349086; x=1753953886;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=46QW0ZKTJsCdAnI774T47O1RlPj5t6dUczWWbfa0X0I=;
        b=Xz+qZvWaNzO2hiZV9nOXOm4z3KtcgHa6mY2QSTycsN+G02E4K3TA4KmRHRbC6UW14j
         ajEl3x4Ijclm7C/zNq7uZG6tO+b1lTBUiUrRmKMhWpQb1abI29dXZKaS+ZZehYrObDNS
         tpNOd6AtQdSS1INa6Yzs5Zy2+0bNJMxbo69xfY4BjMMegywGBZ+va06ydLUzd8gQlTIK
         jci3vxeHJ15LI5N9sO/W6opXoe2/KlR/WTh2duXZIJ6Qyau612Nc95RHt7N9IZsFw+7F
         cGr29CEbitbFudujnE42z5UH6jzXA5P6C1JtYW2HkBMUInjT65HZNLDmW9k6vacPTOP2
         +VPg==
X-Forwarded-Encrypted: i=1; AJvYcCXHYFu9Dagtp3paE9wBv0EhqPHemewP3AUkVQSFFk0KPMEjSUOwLF2ew8V2u8mSt56ZPXpqQi5OPHwr@vger.kernel.org
X-Gm-Message-State: AOJu0YzVGE8KJ9bH2KY3c5G2DmDI2VHEQfwaMsb2WMxGdLXpL2qbfrnn
	Y2na1yIC7hbhgRDO+RcHQ7oVKjdpFmQ0oQVRQUtGGc5M68QQyaYcMblctA74uNG0yvo=
X-Gm-Gg: ASbGnct67DlWFwPhXF4M0jIwg201wR1xLB0urhohOTknf6/tggqzR4BUQOcrNeUZWWz
	Rrh+thkxF85VqxF5Vya/sGJvcC9VWNvgm96ZCExkFLLtBQPfpy1LN6Ujj++OPh6UWDu8toTh8t2
	z9M14PibL34WWZ9KsW+LgXdv++7/aT6pdzN7sfNKMnh7zQ2lPGGlavPwKBFSwBTo4ucTgPlw76a
	sxZRs9FgnQkUjOYpAV/hRrg0L+x9ZgXhUdYaNbO9QQrZllvYYDdAkaOriD5gJ4tfus5dXNm3qTe
	7u90+0jP7LhmsSehDH6eBJc6F6whskaih9sg9dqZakgFQhr4Fc35AL40I3MdAFxGX0KAcHqHOEd
	yEk9+pRamEVvdgVdJrIbhU1hcukk=
X-Google-Smtp-Source: AGHT+IFOeuH5zAlzFgvpD4Uz1Y06PKqXYxEckZmMDNMfNM7DLyHZBB1RdoHcgvW8waqnzfrmwOQl3w==
X-Received: by 2002:a05:600c:524b:b0:456:1d4e:c14f with SMTP id 5b1f17b1804b1-45868d69f9bmr48489405e9.28.1753349085686;
        Thu, 24 Jul 2025 02:24:45 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f44c:20db:7ada:b556])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fc72548sm1600833f8f.30.2025.07.24.02.24.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 02:24:44 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Jul 2025 11:24:32 +0200
Subject: [PATCH v3 04/15] pinctrl: mediatek: mt7988: use
 PINCTRL_PIN_FUNCTION()
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-pinctrl-gpio-pinfuncs-v3-4-af4db9302de4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2873;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=nunH5KiVSLA9eNaj6eipx8y2OBwu+tjBhQLeBJL1rQM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBogfvSq96zx0eWj6bB9Wtc62trZyDHOOqVEGsjt
 IdJru9X576JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaIH70gAKCRARpy6gFHHX
 ciU7D/9ufNSr0xAVjM3jLOYmhiZYTdSmu9d5m+WcEwts4F/wCHyNf8esGOZyhn5wUjORYdUjIo7
 eZFKz74xSLCU+omhJ1JyntwjO/u19pUr3cA16S53VWhQ8i8DyudgfzMCynaEO+AnlG8W6VDdloD
 sjo/e3GaNpK6UIS4gfqVhDkQhxARxrFqHhSAQfpQcImogDC4D25D6WNHBCJ/Oo6cCCRTR/4axFR
 5fcvSZA2dU9/5y5djCi2V6yQjYVC5XxZag/q8vTGMaAcJjUmVLBnVtBFhjIotVORY0DFi89nEJL
 y29d2wQbwZAOrDZPY9B07IB7CI52j77LdHf2SL2NvSselkHKMJKP02SNXEVQK7F/y3mXIHsbkK0
 6WgTHe/owJNiV3POTwFKWsLJOysiyDATr9qIvSJlM3/3ime6HlRo+lNLFtzONrpRFlkPeSRhiu0
 iJL3dlJh7FlYdAqI3NxP0sv5V/OFNyZqhCCNgEQwxbCWnuXPUftsK8TO0Pgrg/d32RYhOzUXKTp
 jt4cHWwTDpHenhDSF+VIkqTzNlyQ4S9TZbS5MACS9G87yVokvxr0o4q6us3KHaO5AVE1oqlDCdX
 ooIVrJFsCF7yvuldW8SymXwAJYAFkarNAtra2A7hv7HoAO0kE1XOl/gDenndsNED8XaEQSmOW1C
 uxnZKJm9mzswndw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

We have a dedicated initializer macro for defining pin functions for
mediatek drivers so use it here.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-mt7988.c | 42 ++++++++++++-------------------
 1 file changed, 16 insertions(+), 26 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mt7988.c b/drivers/pinctrl/mediatek/pinctrl-mt7988.c
index 68b4097792b88356babe4368db7d0f60194e7309..55c8674d8d66f12d2f2246c215056d4e51296a9b 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mt7988.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mt7988.c
@@ -1465,32 +1465,22 @@ static const char * const mt7988_usb_groups[] = {
 };
 
 static const struct function_desc mt7988_functions[] = {
-	{ { "audio", mt7988_audio_groups, ARRAY_SIZE(mt7988_audio_groups) },
-	  NULL },
-	{ { "jtag", mt7988_jtag_groups, ARRAY_SIZE(mt7988_jtag_groups) },
-	  NULL },
-	{ { "int_usxgmii", mt7988_int_usxgmii_groups,
-	    ARRAY_SIZE(mt7988_int_usxgmii_groups) },
-	  NULL },
-	{ { "pwm", mt7988_pwm_groups, ARRAY_SIZE(mt7988_pwm_groups) }, NULL },
-	{ { "dfd", mt7988_dfd_groups, ARRAY_SIZE(mt7988_dfd_groups) }, NULL },
-	{ { "i2c", mt7988_i2c_groups, ARRAY_SIZE(mt7988_i2c_groups) }, NULL },
-	{ { "eth", mt7988_ethernet_groups, ARRAY_SIZE(mt7988_ethernet_groups) },
-	  NULL },
-	{ { "pcie", mt7988_pcie_groups, ARRAY_SIZE(mt7988_pcie_groups) },
-	  NULL },
-	{ { "pmic", mt7988_pmic_groups, ARRAY_SIZE(mt7988_pmic_groups) },
-	  NULL },
-	{ { "watchdog", mt7988_wdt_groups, ARRAY_SIZE(mt7988_wdt_groups) },
-	  NULL },
-	{ { "spi", mt7988_spi_groups, ARRAY_SIZE(mt7988_spi_groups) }, NULL },
-	{ { "flash", mt7988_flash_groups, ARRAY_SIZE(mt7988_flash_groups) },
-	  NULL },
-	{ { "uart", mt7988_uart_groups, ARRAY_SIZE(mt7988_uart_groups) },
-	  NULL },
-	{ { "udi", mt7988_udi_groups, ARRAY_SIZE(mt7988_udi_groups) }, NULL },
-	{ { "usb", mt7988_usb_groups, ARRAY_SIZE(mt7988_usb_groups) }, NULL },
-	{ { "led", mt7988_led_groups, ARRAY_SIZE(mt7988_led_groups) }, NULL },
+	PINCTRL_PIN_FUNCTION("audio", mt7988_audio),
+	PINCTRL_PIN_FUNCTION("jtag", mt7988_jtag),
+	PINCTRL_PIN_FUNCTION("int_usxgmii", mt7988_int_usxgmii),
+	PINCTRL_PIN_FUNCTION("pwm", mt7988_pwm),
+	PINCTRL_PIN_FUNCTION("dfd", mt7988_dfd),
+	PINCTRL_PIN_FUNCTION("i2c", mt7988_i2c),
+	PINCTRL_PIN_FUNCTION("eth", mt7988_ethernet),
+	PINCTRL_PIN_FUNCTION("pcie", mt7988_pcie),
+	PINCTRL_PIN_FUNCTION("pmic", mt7988_pmic),
+	PINCTRL_PIN_FUNCTION("watchdog", mt7988_wdt),
+	PINCTRL_PIN_FUNCTION("spi", mt7988_spi),
+	PINCTRL_PIN_FUNCTION("flash", mt7988_flash),
+	PINCTRL_PIN_FUNCTION("uart", mt7988_uart),
+	PINCTRL_PIN_FUNCTION("udi", mt7988_udi),
+	PINCTRL_PIN_FUNCTION("usb", mt7988_usb),
+	PINCTRL_PIN_FUNCTION("led", mt7988_led),
 };
 
 static const struct mtk_eint_hw mt7988_eint_hw = {

-- 
2.48.1


