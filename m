Return-Path: <linux-omap+bounces-4185-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2992CB220C6
	for <lists+linux-omap@lfdr.de>; Tue, 12 Aug 2025 10:27:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A0C77A5157
	for <lists+linux-omap@lfdr.de>; Tue, 12 Aug 2025 08:26:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A30322E4244;
	Tue, 12 Aug 2025 08:27:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xsK5dXwp"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921F42E283C
	for <linux-omap@vger.kernel.org>; Tue, 12 Aug 2025 08:27:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754987237; cv=none; b=qb7vsy50eGPC433TAIEldTXENIZ5E5vBzgFmo4RCV39fDw8QqyeCIi0KcrNHBy3PBqB8PkU/JwBjFpUzbLpdMrZ8vQiVhIuQ7ZYcr0dj9dt2K8kFbj+VneegkxB3u86lNPiLJLJCJyblGTx+klqGAiusqY1weD3olEy2Va3fjGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754987237; c=relaxed/simple;
	bh=WIEQvxtdRthB6856r4HUV03c0VDMli/mjsj8od8S8wU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BqgcnZfub6rqjVTQo7tHqeMg9t5qZARnrrf0zBdZIQr62g+hkG54q3AmBQUaHsXxb+lXbJLVqskVPyJzImjnLlwCXy+gEiWPRzUl40MgMf1ElszHSr2iYjD2s9rFrB0bkH5wRnaDpxjCa+Vi5lk9Myq30VWZvk88lk6BjtR9ChQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xsK5dXwp; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so35370175e9.1
        for <linux-omap@vger.kernel.org>; Tue, 12 Aug 2025 01:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1754987232; x=1755592032; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PTEYsyiptWWjSso4TZTiEeMehJGAEz0s92KPugL0Mwk=;
        b=xsK5dXwpGdKE5x1tNpA2IyddGcJKqR6rOdnzloAkGUOCIK9PsR5G/YvThglpOkpEBz
         PIVaCivYtH9MlT6y95cIFI4KmNBZvPdkJ11uHyFKZBVyadk+QYYhgVRSIMcBFBcJukdw
         twxaOIMj1WsjRvog1AatfmLaLIhPqyXwEJkdtGfUIvl5sLKukiHGxFPcgy+kkUeb4t2I
         fCbrVLwpG2mGgPdkaIm/ezQAXGTH/BoLQJZK1q9amtsbZyOv21O1sj5In4eLaVkkMX2b
         +UhHDnxsrxAiaukq9XkrLBRwGPSKkRyiWN/0cOI4udxQ0znZjo0ec3rmj5E7i2EFQngS
         nPPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754987232; x=1755592032;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PTEYsyiptWWjSso4TZTiEeMehJGAEz0s92KPugL0Mwk=;
        b=oK5npxdUqYaa38sPIqgm8tIoJdH0q17/rUfVTQOMJhQ86OfR/47uCJM3DRPUG+PSgL
         dKeEKE3/ai0WkPTx2tYb4SKKjFic0DGPLFo7OImiIztirHb7w91PnaqqDBDeAs16JVOp
         Ksrj8CUiW5BAwNb/B0F1X6BPfYeAFJRF1c9B3u570xERQ79mQrFZwnHbuGE9om4Xdjg0
         6hi/Hht82PIgbVidIrMddHqLRlWh35Lt6vIEPglgnJqPGpTqSA4UReQqn40EmCWD+sZ4
         U8rxUQHOCFeC1VHIYAWGhLEUFL0udT0mEnSY57pgSsDxG+81NPpQ9O3FVggNBLXgXi/q
         /Gcg==
X-Forwarded-Encrypted: i=1; AJvYcCW8B3V63lBgrl6TlKvVJr2xanfVBNIMX5LG9GPfbLD9ajUTYhsg1F7S6Qd+PZLJl6xrPTe6NIBo6h5H@vger.kernel.org
X-Gm-Message-State: AOJu0YysWtORlwr13ULacoUbDgkzmf3/Rp5VVE8N9fAebK3LI3go4vXW
	JSxCFYIVTllQ2TAssK5UENi7rcu1Ei7awqDWezVR+cNQhKTMvS1thqNKMsrABAIc22M=
X-Gm-Gg: ASbGncvNqAqA8DA2JPNbftMOrLCmrmMI7xMLQqySLgToiU2dizwBwiU1qWEv/3vB1VA
	Ct//7ceK+r+UJluSVeTgvpCPBtKlaGsuc6h1/kFcLNPM9LqOKfRXIUYfziwY5VsJNNr+d+t5S34
	Et5B9opZ+RdEbovNTFN0TRiAvBEn7Wqkzu4YdsNX3jB2DhyoVqBh85S0gx53P2P5YHIWfVKYAIT
	0W+r8SNsJ6cOZcXCfrEJXhOacFQutW6pJIgpEjG8znVIPrP+QA2bj2J5DSXbCJBAd8CY+HjD719
	SU0L7YGaaf5d5+ly7XP5cShXxTpdgITMob5rcIayQFtitkU/5QORwF0bJOqkT0tSzQyJ2zXGwn4
	8DHA+V8ZnQGo1eFs=
X-Google-Smtp-Source: AGHT+IG9LeN0OGOpXGyWbmm1lDOX65hlsrf90WSgSnAgOs0kyHwhrmmIpnE1O9UZJd/SZOy1ZHJldQ==
X-Received: by 2002:a05:600c:3547:b0:453:78f:fa9f with SMTP id 5b1f17b1804b1-45a10ba7e5cmr21860695e9.11.1754987231433;
        Tue, 12 Aug 2025 01:27:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:16c8:50:27fe:4d94])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c3b9386sm43549423f8f.18.2025.08.12.01.27.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 01:27:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 12 Aug 2025 10:27:01 +0200
Subject: [PATCH v4 02/15] pinctrl: ingenic: use struct pinfunction instead
 of struct function_desc
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250812-pinctrl-gpio-pinfuncs-v4-2-bb3906c55e64@linaro.org>
References: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org>
In-Reply-To: <20250812-pinctrl-gpio-pinfuncs-v4-0-bb3906c55e64@linaro.org>
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
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8989;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=ngwvMKiL7WjeArNFSdBs/AB2ylnC/fm8iV0Ni8uhrlY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBomvrXKwBoZmvE6IqRK/h3ZfdqdJFQZiTnlv70d
 0TzN5CgzNGJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaJr61wAKCRARpy6gFHHX
 coBFD/4wcnUgTwHXpY/uuZYNyiUo9QpRYkwTT4+3smLqrIAfe1q/XXvhhAoQ+/aQw+BwPHC1Pqe
 URolaN2+0ZqnzObnyMNpniI2IC7VUPkk5J11eX3f/S6mok7czKVmR/i1jreEGRdVkM1yUf/yDt/
 I6Z7CQQa6xH+FdNkk64zWxkgSoAnEYO19mpzTsgmUHqLdEG0ut8b6vBARWjxewlFBF4GnnRx4RY
 mhR0eA8lvQwMEuBZqJDoKgZzAStqpzxWMGfn0e05earrNGZfsqHNhH60bvz+F8vaic4acPFlecE
 4228aQB6xOgjKHtnVdTlKwPqLHFT3+cfo3+TDOCcuyEGcxyAn8z70GU45gECugeUHjgrHp/O+8H
 p9EWkHp3hAuVIrF1hVIgr0QErgg95xVrK1q4GUTSYVfKYXlfsTHd8S02gKZukIoQpExm3vIeQ50
 Al04mUPYQXZBQYHJBkblS18qmlIYbPq6/jrN7A5v1Ggs68G5Qi0oN5oRUf6uQJ0x1z//D2mqpGc
 WYFyPYKktKiMPzV+5AXpocoXbab16ifpTUFPIHL4xf0b8ALn/+2C0lSO529yQXpQvEuRwUH85i1
 y45Arf0XetU0vF5mGd2ZIK0Gvqy94EI2JkmCXh0hBxf7NQSuohuFh8zkJpLykAW66Xt9MNem4kn
 6qeKfVolA8iijvw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct function_desc is a wrapper around struct pinfunction with an
additional void *data pointer. This driver doesn't use the data pointer.
We're also working towards reducing the usage of struct function_desc in
pinctrl drivers - they should only be created by pinmux core and
accessed by drivers using pinmux_generic_get_function(). Replace the
struct function_desc objects in this driver with smaller struct
pinfunction instances.

Acked-by: Paul Cercueil <paul@crapouillou.net>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/pinctrl-ingenic.c | 45 +++++++++++++++++----------------------
 1 file changed, 20 insertions(+), 25 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-ingenic.c b/drivers/pinctrl/pinctrl-ingenic.c
index 2900513467fa4e2e9374946fc9c7a30d48aef9eb..af9d2f3081859bc4b22f6820f3b3753eba36f959 100644
--- a/drivers/pinctrl/pinctrl-ingenic.c
+++ b/drivers/pinctrl/pinctrl-ingenic.c
@@ -96,11 +96,8 @@
 		.data = (void *)func,							\
 	}
 
-#define INGENIC_PIN_FUNCTION(_name_, id)							\
-	{											\
-		.func = PINCTRL_PINFUNCTION(_name_, id##_groups, ARRAY_SIZE(id##_groups)),	\
-		.data = NULL,									\
-	}
+#define INGENIC_PIN_FUNCTION(_name_, id)						\
+	PINCTRL_PINFUNCTION(_name_, id##_groups, ARRAY_SIZE(id##_groups))
 
 enum jz_version {
 	ID_JZ4730,
@@ -128,7 +125,7 @@ struct ingenic_chip_info {
 	const struct group_desc *groups;
 	unsigned int num_groups;
 
-	const struct function_desc *functions;
+	const struct pinfunction *functions;
 	unsigned int num_functions;
 
 	const u32 *pull_ups, *pull_downs;
@@ -263,7 +260,7 @@ static const char *jz4730_pwm1_groups[] = { "pwm1", };
 static const char *jz4730_mii_groups[] = { "mii", };
 static const char *jz4730_i2s_groups[] = { "i2s-data", "i2s-master", "i2s-slave", };
 
-static const struct function_desc jz4730_functions[] = {
+static const struct pinfunction jz4730_functions[] = {
 	INGENIC_PIN_FUNCTION("mmc", jz4730_mmc),
 	INGENIC_PIN_FUNCTION("uart0", jz4730_uart0),
 	INGENIC_PIN_FUNCTION("uart1", jz4730_uart1),
@@ -370,7 +367,7 @@ static const char *jz4740_pwm5_groups[] = { "pwm5", };
 static const char *jz4740_pwm6_groups[] = { "pwm6", };
 static const char *jz4740_pwm7_groups[] = { "pwm7", };
 
-static const struct function_desc jz4740_functions[] = {
+static const struct pinfunction jz4740_functions[] = {
 	INGENIC_PIN_FUNCTION("mmc", jz4740_mmc),
 	INGENIC_PIN_FUNCTION("uart0", jz4740_uart0),
 	INGENIC_PIN_FUNCTION("uart1", jz4740_uart1),
@@ -474,7 +471,7 @@ static const char *jz4725b_pwm3_groups[] = { "pwm3", };
 static const char *jz4725b_pwm4_groups[] = { "pwm4", };
 static const char *jz4725b_pwm5_groups[] = { "pwm5", };
 
-static const struct function_desc jz4725b_functions[] = {
+static const struct pinfunction jz4725b_functions[] = {
 	INGENIC_PIN_FUNCTION("mmc0", jz4725b_mmc0),
 	INGENIC_PIN_FUNCTION("mmc1", jz4725b_mmc1),
 	INGENIC_PIN_FUNCTION("uart", jz4725b_uart),
@@ -606,7 +603,7 @@ static const char *jz4750_pwm3_groups[] = { "pwm3", };
 static const char *jz4750_pwm4_groups[] = { "pwm4", };
 static const char *jz4750_pwm5_groups[] = { "pwm5", };
 
-static const struct function_desc jz4750_functions[] = {
+static const struct pinfunction jz4750_functions[] = {
 	INGENIC_PIN_FUNCTION("uart0", jz4750_uart0),
 	INGENIC_PIN_FUNCTION("uart1", jz4750_uart1),
 	INGENIC_PIN_FUNCTION("uart2", jz4750_uart2),
@@ -771,7 +768,7 @@ static const char *jz4755_pwm3_groups[] = { "pwm3", };
 static const char *jz4755_pwm4_groups[] = { "pwm4", };
 static const char *jz4755_pwm5_groups[] = { "pwm5", };
 
-static const struct function_desc jz4755_functions[] = {
+static const struct pinfunction jz4755_functions[] = {
 	INGENIC_PIN_FUNCTION("uart0", jz4755_uart0),
 	INGENIC_PIN_FUNCTION("uart1", jz4755_uart1),
 	INGENIC_PIN_FUNCTION("uart2", jz4755_uart2),
@@ -1106,7 +1103,7 @@ static const char *jz4760_pwm6_groups[] = { "pwm6", };
 static const char *jz4760_pwm7_groups[] = { "pwm7", };
 static const char *jz4760_otg_groups[] = { "otg-vbus", };
 
-static const struct function_desc jz4760_functions[] = {
+static const struct pinfunction jz4760_functions[] = {
 	INGENIC_PIN_FUNCTION("uart0", jz4760_uart0),
 	INGENIC_PIN_FUNCTION("uart1", jz4760_uart1),
 	INGENIC_PIN_FUNCTION("uart2", jz4760_uart2),
@@ -1444,7 +1441,7 @@ static const char *jz4770_pwm6_groups[] = { "pwm6", };
 static const char *jz4770_pwm7_groups[] = { "pwm7", };
 static const char *jz4770_mac_groups[] = { "mac-rmii", "mac-mii", };
 
-static const struct function_desc jz4770_functions[] = {
+static const struct pinfunction jz4770_functions[] = {
 	INGENIC_PIN_FUNCTION("uart0", jz4770_uart0),
 	INGENIC_PIN_FUNCTION("uart1", jz4770_uart1),
 	INGENIC_PIN_FUNCTION("uart2", jz4770_uart2),
@@ -1723,7 +1720,7 @@ static const char *jz4775_mac_groups[] = {
 };
 static const char *jz4775_otg_groups[] = { "otg-vbus", };
 
-static const struct function_desc jz4775_functions[] = {
+static const struct pinfunction jz4775_functions[] = {
 	INGENIC_PIN_FUNCTION("uart0", jz4775_uart0),
 	INGENIC_PIN_FUNCTION("uart1", jz4775_uart1),
 	INGENIC_PIN_FUNCTION("uart2", jz4775_uart2),
@@ -1976,7 +1973,7 @@ static const char *jz4780_dmic_groups[] = { "dmic", };
 static const char *jz4780_cim_groups[] = { "cim-data", };
 static const char *jz4780_hdmi_ddc_groups[] = { "hdmi-ddc", };
 
-static const struct function_desc jz4780_functions[] = {
+static const struct pinfunction jz4780_functions[] = {
 	INGENIC_PIN_FUNCTION("uart0", jz4770_uart0),
 	INGENIC_PIN_FUNCTION("uart1", jz4770_uart1),
 	INGENIC_PIN_FUNCTION("uart2", jz4780_uart2),
@@ -2211,7 +2208,7 @@ static const char *x1000_pwm3_groups[] = { "pwm3", };
 static const char *x1000_pwm4_groups[] = { "pwm4", };
 static const char *x1000_mac_groups[] = { "mac", };
 
-static const struct function_desc x1000_functions[] = {
+static const struct pinfunction x1000_functions[] = {
 	INGENIC_PIN_FUNCTION("uart0", x1000_uart0),
 	INGENIC_PIN_FUNCTION("uart1", x1000_uart1),
 	INGENIC_PIN_FUNCTION("uart2", x1000_uart2),
@@ -2341,7 +2338,7 @@ static const char *x1500_pwm2_groups[] = { "pwm2", };
 static const char *x1500_pwm3_groups[] = { "pwm3", };
 static const char *x1500_pwm4_groups[] = { "pwm4", };
 
-static const struct function_desc x1500_functions[] = {
+static const struct pinfunction x1500_functions[] = {
 	INGENIC_PIN_FUNCTION("uart0", x1500_uart0),
 	INGENIC_PIN_FUNCTION("uart1", x1500_uart1),
 	INGENIC_PIN_FUNCTION("uart2", x1500_uart2),
@@ -2562,7 +2559,7 @@ static const char * const x1600_pwm7_groups[] = { "pwm7-b10", "pwm7-b21", };
 
 static const char * const x1600_mac_groups[] = { "mac", };
 
-static const struct function_desc x1600_functions[] = {
+static const struct pinfunction x1600_functions[] = {
 	INGENIC_PIN_FUNCTION("uart0", x1600_uart0),
 	INGENIC_PIN_FUNCTION("uart1", x1600_uart1),
 	INGENIC_PIN_FUNCTION("uart2", x1600_uart2),
@@ -2779,7 +2776,7 @@ static const char *x1830_pwm6_groups[] = { "pwm6-c-17", "pwm6-c-27", };
 static const char *x1830_pwm7_groups[] = { "pwm7-c-18", "pwm7-c-28", };
 static const char *x1830_mac_groups[] = { "mac", };
 
-static const struct function_desc x1830_functions[] = {
+static const struct pinfunction x1830_functions[] = {
 	INGENIC_PIN_FUNCTION("uart0", x1830_uart0),
 	INGENIC_PIN_FUNCTION("uart1", x1830_uart1),
 	INGENIC_PIN_FUNCTION("sfc", x1830_sfc),
@@ -3225,7 +3222,7 @@ static const char *x2000_mac0_groups[] = { "mac0-rmii", "mac0-rgmii", };
 static const char *x2000_mac1_groups[] = { "mac1-rmii", "mac1-rgmii", };
 static const char *x2000_otg_groups[] = { "otg-vbus", };
 
-static const struct function_desc x2000_functions[] = {
+static const struct pinfunction x2000_functions[] = {
 	INGENIC_PIN_FUNCTION("uart0", x2000_uart0),
 	INGENIC_PIN_FUNCTION("uart1", x2000_uart1),
 	INGENIC_PIN_FUNCTION("uart2", x2000_uart2),
@@ -3449,7 +3446,7 @@ static const struct group_desc x2100_groups[] = {
 
 static const char *x2100_mac_groups[] = { "mac", };
 
-static const struct function_desc x2100_functions[] = {
+static const struct pinfunction x2100_functions[] = {
 	INGENIC_PIN_FUNCTION("uart0", x2000_uart0),
 	INGENIC_PIN_FUNCTION("uart1", x2000_uart1),
 	INGENIC_PIN_FUNCTION("uart2", x2000_uart2),
@@ -4571,11 +4568,9 @@ static int __init ingenic_pinctrl_probe(struct platform_device *pdev)
 	}
 
 	for (i = 0; i < chip_info->num_functions; i++) {
-		const struct function_desc *function = &chip_info->functions[i];
-		const struct pinfunction *func = &function->func;
+		const struct pinfunction *func = &chip_info->functions[i];
 
-		err = pinmux_generic_add_pinfunction(jzpc->pctl, func,
-						     function->data);
+		err = pinmux_generic_add_pinfunction(jzpc->pctl, func, NULL);
 		if (err < 0) {
 			dev_err(dev, "Failed to register function %s\n", func->name);
 			return err;

-- 
2.48.1


