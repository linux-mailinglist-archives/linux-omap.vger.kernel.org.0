Return-Path: <linux-omap+bounces-4115-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DD420B105C1
	for <lists+linux-omap@lfdr.de>; Thu, 24 Jul 2025 11:25:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B067B7A9A40
	for <lists+linux-omap@lfdr.de>; Thu, 24 Jul 2025 09:23:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CF72279DA1;
	Thu, 24 Jul 2025 09:24:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="s+9q3+Lk"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB9C25A2AA
	for <linux-omap@vger.kernel.org>; Thu, 24 Jul 2025 09:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753349085; cv=none; b=MP/ZxK8++KJ72bJlWdgses1IZneF+cYN3KgLdPmTcx0QXeonhi1/wxEZOnzvM5lAaZLwOS7KFPrgb0GyUNVqY60Lg9RTszX7i2GssylVFl4lOjzA7OeyitSy0BTrVrHQFcdPZJ1cykplANPY28k5x8YgOgwnRsAVTMMj9/k2A8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753349085; c=relaxed/simple;
	bh=UVS9SpzWVwmGyJE+4Dquy2g9DqJn4S6AIXELDh0rj9c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y1n8DHUeu1U5UPbLHzgkHssRASe+LHy+ePAEJ403/a1ZzcZ1nzbSC+jLOiBs1A94aF524PnF9Dh497KKcF1Hw3QfMvV78T5Qfrt62p8J4bd4hKGr6VyDEzAveONTC5d/X2ek7PfpnglRlTTR51KPBguXrI+UIR9FF2Tue6gBTq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=s+9q3+Lk; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a54690d369so675850f8f.3
        for <linux-omap@vger.kernel.org>; Thu, 24 Jul 2025 02:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1753349080; x=1753953880; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=enHFJE6UQ4MedDyqBD+KXxRCiT2/woFdp52jlXH8+kI=;
        b=s+9q3+LkM7QuOOS1Nx1AaBlrCD8GovVE2EO/y2OXzX31isB/iDM1BHjYy0sHHKx0G+
         bpDFL/GvhV8NGK2nP/2EUBMv6obBufD44iT/xge/RnVUEHBDz+ZOIYhzMv9RgdVb1jiN
         tBv6zrKNyx3h2raQN1lpdTkGySSsQJSf8lABDRzxwcVQcxjV4ljh2RYWNBlkwm0W5p4V
         SNXiVz7QUJ8cPsPn/+lBGJO/TWebe9xX+npVm0m9/cBxkiMivn9rbJhq0JEija9x8EZT
         kzIYXdzJr8kLbNzdfslulL8VsgpKBqgLwFhVN39y7+Ep4h/Tr+P471WyrOGqwuPJB9l0
         SfyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753349080; x=1753953880;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=enHFJE6UQ4MedDyqBD+KXxRCiT2/woFdp52jlXH8+kI=;
        b=hZ6h5HNWcvKZNdrVtNPg+kG4ePsturAeohur54A5rcS1QQfdCGHI5NnAaqnlTn5WOI
         YrW3w8zBE7LyNEtnIU3DNAHL2cJAOwrqotKHXthMUaDXJ6vTi3qpcQE7ziK9VW3/W/8X
         LtplxrAfNLB1z5xhbpHBb+FuFtY4uKAYAxXWjaCYYtxtAS2EUTfeHmEG0m8Ex8K+ssnM
         f0QWG5dyJGsQVqiobLTKioWhuPPAyZ9eJdYS3gv8xclcHkYcepTaJKFL1tdKu49y8AS1
         zBsY6snVA6z9KMvTPNQ5GYYqnop9Wfq6f/taa3X3CWYA9rAN+5HYQezCr2HO3syR3mfC
         A7vQ==
X-Forwarded-Encrypted: i=1; AJvYcCXJLm9q7faPTS7U9J+xXiKVMChBl2lN0LqJTS9DWTN1Z3w6sMMh2CtJVm+731KhUsv5kgZMLGQkNRQa@vger.kernel.org
X-Gm-Message-State: AOJu0YxWk3SqIaXUWGSFQPt1PePOxG/4SHUZ2Tn750Kvg6v27Uhc6xnC
	8+0B8BWk8oBqEmAx4NoBTL/TK2VNMldiuyfzRYuwDO90AB/SSjQ6YD9F6aW7nU5kBms=
X-Gm-Gg: ASbGncs+Ym3+bW1r8Ph0JPG3QgLFV0FukJCSADqEBzrMBSV+gXNKKje10XqtveGbYTz
	bEi8WtgIWHwXH0nQEkkI3aHv3TaBo38n48WG5JOfSsLYf/5kuQwT/g4ATPMArKT8tbAs5CDgHdf
	aS1EtIFFTI9SbDjEP6CD/IVCxLz13XEpwEyQ2VwnC5HNN40m2w001nUBhSPmiXRU+LBqiedc9AI
	Nr/2kBP6tobHVZBIX1XaPyoQGjCzNvR+2qXx4zW+3U/j5cK1gkEgr+ORdU8fVVqcpZBj7vJw+sC
	nDfGWIS56vUAnGs/gX0a5P3Hwi5j5g/WcLbuNiGp5RV3M3KZhig6IZwh19PJZ4RrI757NSl2uQ2
	jlfgQaXYmR85SiWgu
X-Google-Smtp-Source: AGHT+IFLTaYRX3oZKktSwmTl5BxHaXO7YP006jDq4+wHGsPABKDqUOqQk5SOHVzh8IhrpobqFVAPGA==
X-Received: by 2002:a05:6000:248a:b0:3a3:5f36:33ee with SMTP id ffacd0b85a97d-3b768ef3913mr4552377f8f.32.1753349080240;
        Thu, 24 Jul 2025 02:24:40 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f44c:20db:7ada:b556])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b76fc72548sm1600833f8f.30.2025.07.24.02.24.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jul 2025 02:24:39 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 24 Jul 2025 11:24:29 +0200
Subject: [PATCH v3 01/15] lib: provide kmemdup_const()
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250724-pinctrl-gpio-pinfuncs-v3-1-af4db9302de4@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2062;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=4C1RHZTMKgGSo3gXRAvPeC6y45wc3aHImSFGh2Fz1QE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBogfvRcDL9XPXeHv8dyMY2ypjsvbwhNFFTJNmoy
 2AX+ZslnGaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaIH70QAKCRARpy6gFHHX
 ch0XD/9I+1OijkQL+cye+ZruBlaR1Ib2UfMF0QEOwEw0hfteX9fTl34LlB1334pIq4xxhDMyq4m
 FZH5qMf22U1fVmLVGDs7Py/y1aFeIly97+9z4U2zlOSQ6KH68lmB8I8pmA79F94Ls0nxwl9MXi9
 A2WDTXvSoAA2nloXBT8D/2nv/HDVzSpY55mNCZn0QeI+lQwBhC02oOwDN3xg+aXfkSCzERHNLUX
 6ccd3tZpTYjYcyaEzdS3Pr8xvrq/CKlcGx/7UWQO0XPKWcYr7NDzBhcuZ/Xnciwnmf+4bHDTfsj
 N+QXyPhCYpNecz+o9HYMzcZ49hkbaDDcHRzqJ1QAqMopPXRH2Y+uuN5IlTCvLCP0CxYJrSNK1Ir
 +t/tUQDIsNKH0oe60hktWfTdSPocCQ+A/e6joTSg7q7rwlh3PeajuYoz9tdr1v4bN3ZCgNI5NSy
 vb6WLdiiC8zV317SlA2fotQFgGqmCmNXHZ1MxIG8WdADW1csMF44skaq6TtMIu6B0JzqQVnJSCL
 4ZhGqhYsud6CNJbYGa9BIZ+m3Kq6EysSbLmBPCEpH0cgs5Pui2X2PUIf6BHelaLNyHV0ckYn+Vx
 XUDG95SjgAiMT6Kq5zHT8VPY91QJwnLtOaPEAM/z3cF8qGMdmWR5fJT0BUlU6e7t3nqhfPtV96G
 w8wHIy7JPNlWP+w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Provide a function similar to strdup_const() but for copying blocks of
memory that are likely to be placed in .rodata.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 include/linux/string.h |  1 +
 mm/util.c              | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/include/linux/string.h b/include/linux/string.h
index fdd3442c6bcbd786e177b6e87358e1065a0ffafc..1a86d61de91204563e4179938c4dfc77108e03aa 100644
--- a/include/linux/string.h
+++ b/include/linux/string.h
@@ -304,6 +304,7 @@ extern char *kstrndup(const char *s, size_t len, gfp_t gfp);
 extern void *kmemdup_noprof(const void *src, size_t len, gfp_t gfp) __realloc_size(2);
 #define kmemdup(...)	alloc_hooks(kmemdup_noprof(__VA_ARGS__))
 
+extern const void *kmemdup_const(const void *src, size_t len, gfp_t gfp);
 extern void *kvmemdup(const void *src, size_t len, gfp_t gfp) __realloc_size(2);
 extern char *kmemdup_nul(const char *s, size_t len, gfp_t gfp);
 extern void *kmemdup_array(const void *src, size_t count, size_t element_size, gfp_t gfp)
diff --git a/mm/util.c b/mm/util.c
index f814e6a59ab1d354b8cd04ebf3903626f6b23a6c..f4df9194b0c69c27ff06e6ba1d1137c559035470 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -142,6 +142,27 @@ void *kmemdup_noprof(const void *src, size_t len, gfp_t gfp)
 }
 EXPORT_SYMBOL(kmemdup_noprof);
 
+/**
+ * kmemdup_const - conditionally duplicate a region of memory
+ *
+ * @src: memory region to duplicate
+ * @len: memory region length,
+ * @gfp: GFP mask to use
+ *
+ * Return: source address if it is in .rodata or the return value of kmemdup()
+ * to which the function falls back otherwise.
+ *
+ * Note: the returned address must not be passed to kfree(), the caller must
+ * use kfree_const() instead.
+ */
+const void *kmemdup_const(const void *src, size_t len, gfp_t gfp)
+{
+	if (is_kernel_rodata((unsigned long)src))
+		return src;
+
+	return kmemdup(src, len, gfp);
+}
+
 /**
  * kmemdup_array - duplicate a given array.
  *

-- 
2.48.1


