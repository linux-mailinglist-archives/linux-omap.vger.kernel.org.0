Return-Path: <linux-omap+bounces-1975-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F7D395CA3D
	for <lists+linux-omap@lfdr.de>; Fri, 23 Aug 2024 12:17:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A2B231C210F6
	for <lists+linux-omap@lfdr.de>; Fri, 23 Aug 2024 10:17:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50DBC18733B;
	Fri, 23 Aug 2024 10:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K/a0jPm1"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A47537144
	for <linux-omap@vger.kernel.org>; Fri, 23 Aug 2024 10:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724408170; cv=none; b=ZHmYJURokEyNfVa6zy29Wb66VSeF3EusEosqViOVkjJEJVvTdpU/vW9QyHJyLM8HW0zS68oPFkCOnlYryKNHMCqjN4QoPO+uDOQphQCW+mVexMBeyJb27vrmFBWWGW+nqC6afvT8q4bfEYXtP1mFT1tgHn7lF40JrG5d9i3djX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724408170; c=relaxed/simple;
	bh=LtVfsUrkXvrpIrQ9RY7ofd8SPZNPe5l+WNIEpOclJW8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e+EkYVb5IhIsdcbsk/JS2zCSXv6jO895UPRiF6kJgHz4w4JLfWN2gupzqmbFnvngs0OZKNU/F1sqjwgbBBtX2IAeXleuHUiqlrILOlpB0YEdaoueEa1HOdbGeO8NWVy/i5ovACoNF6uVAWR/7/N3SKNX3Nhy9UOrMHq9V1RdSGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K/a0jPm1; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a868ec0d239so12964766b.2
        for <linux-omap@vger.kernel.org>; Fri, 23 Aug 2024 03:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724408168; x=1725012968; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LL8lrH4m1zu8jQzjHDxCkVbmtMdz/cav5HroEZBlyVs=;
        b=K/a0jPm1lAb2W92lShBuUHweqnu55ZjNYvEK7poxfGEugLMAGScMWNMO5/AvYVOFVS
         ZDbBiVL9ltenX++J+zE8KjWmwLCfOrUy/uYSV79FsryUJMtFY2jq5pJbmZjtdag68ZHs
         8otUyoWxMnJoG2lGMhlhg4CVjwYwEv4Ih+7hbAmfoQG0QKN20Jz/Y19JiZA1YeB1xGgc
         gafWQXC1zeVIiofXrF6HLPeXRqcq6sJFoLETrkIjRXzHk2tmGSEd5lVbHx6uDMZRVHr8
         rAie5TTK6v4h48OsxZV1dqKdvsqLwntCYmzdGvMu9sVvyteBZhp8v0MG0n6on1/vzqd6
         W5XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724408168; x=1725012968;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LL8lrH4m1zu8jQzjHDxCkVbmtMdz/cav5HroEZBlyVs=;
        b=aPTPAipbUXvWgmYZ7tah6lQsTs69yIBoHBAitcp07rSpazl+66UrFVYlTxV0KQ39XV
         o92zHmXyRSoYaikckDpgo6IXCSCVX4K4px71IERWFKIDGXXOi8vbD9bhY8uQI6uccQaS
         YcVNfmbCGfHa7j5TN1X4lzMCIr9aMqAx+bcWFN6dRviSkhu83bV6zBDCADHa/UankDP+
         3K3BQXcb96jqehZptvN2Tof/5OsaEZ7K5TON6RbLoX7K+i576TDTbuvn8IYLkuxCvmvm
         ZNysm6ZP4CJpyohXWGufejZuCTamTN+Fak7/L1/kOC8JHoL0jeGUotq99nxZ0CqfkgjS
         plgQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+z4qEeDb1vRi+/Bwb3wF9LbPh/kanIv/tfNf4g0oI95u05YjhPYW+Xa8QCNL1fyQfC/xtSZ3CVx9g@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1asMzk16bI8Hn1KerGceUEcR0a4hQM0xjxEYhBb7cXuFH0m2Z
	b7Wl4w1l/eEpVqwYryUNDtCGXir3XndkZivJMHNbGX05uVJJQXGNaty+67Hfyks=
X-Google-Smtp-Source: AGHT+IGpZrdXtuPVCcQwhIvIg5Gw3qd8+DVV59c115ma/5r72tOpjy+Z8GPBzffzBb1Nt11PqlAWTg==
X-Received: by 2002:a17:907:7e95:b0:a80:a294:f8a with SMTP id a640c23a62f3a-a86a516134dmr78367066b.1.1724408167575;
        Fri, 23 Aug 2024 03:16:07 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.82])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a868f2a1df5sm237912166b.68.2024.08.23.03.16.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Aug 2024 03:16:07 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 23 Aug 2024 12:15:56 +0200
Subject: [PATCH 1/7] memory: emif: drop unused 'irq_state' member
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240823-b4-cleanup-h-guard-v1-1-01668915bd55@linaro.org>
References: <20240823-b4-cleanup-h-guard-v1-0-01668915bd55@linaro.org>
In-Reply-To: <20240823-b4-cleanup-h-guard-v1-0-01668915bd55@linaro.org>
To: Santosh Shilimkar <ssantosh@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, Roger Quadros <rogerq@kernel.org>, 
 Tony Lindgren <tony@atomide.com>, Vladimir Zapolskiy <vz@mleia.com>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Michal Simek <michal.simek@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=608;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=LtVfsUrkXvrpIrQ9RY7ofd8SPZNPe5l+WNIEpOclJW8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmyGFeW1M44IyaAdN7DLEIjIFH+IOVjqjv+CZGH
 CteVueXlu+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZshhXgAKCRDBN2bmhouD
 1yNmD/0baNim+hSwFmuf5i67uJCDBqNTmfRLqjw3IiXAtxprRD9OIHTOUNWewIxpDKOW2T0fUkF
 BI70RMp8aE61rnmDenkEnr0rs++uDEmfbAc57plGITtw8W1vkscwjMpkPNbRyJCZDIdZZTCuQLJ
 gTDsSuI0psahI86kXZov1XJf+BCjnY5bFLoiGqzgnx/+hnM66gEBroFbZ6TCCQ0LS+73Y8t9S7X
 52NeItgsVFGuFGKozMb4xBPk79pFerDotzNhQrtHKePgxKPJLsRLEZt+VOt21egL4sTxL2jv6Nv
 aN6qoIQI2V1uXC+IPVjn3BlXEkCi5G1/fDzq6/hiKEC6Jb7youNNcMhA/8gNCD+O6zVCOabX+Ab
 QBz6cb6Fb1CysHtTGZ7RNISe+uu9B4OmxQde1sW1gjB5Fq+QtuWEPJfMsH0ZcmpQIGvyPBO7NL2
 kgUo+qPxlfM9rRtqHeNxV6tT00CNQjx/Ju73fVontHAEufbDCYycooO5HLpyCFhG3Cnx3cJdz4M
 OJpxz3kUxIMmGEFw4nzyYq0imW7Vi05VIdscaw9diXPkyjzjY+C/xKbQ3q+c4wb4uUrWv0/k38v
 pXxFFjwg6xdKx1PbWm4Sd15uz198MDoxjFvtsYZ9WUXOOQ71/GFcW7+CjqI+aNeKIoo6DOQ5kTy
 RbwH5RnPsLmRMHg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Driver does not use 'emif_data.irq_state'.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/memory/emif.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/memory/emif.c b/drivers/memory/emif.c
index 974ed641473e..b32f3a8f9d71 100644
--- a/drivers/memory/emif.c
+++ b/drivers/memory/emif.c
@@ -57,7 +57,6 @@ struct emif_data {
 	u8				temperature_level;
 	u8				lpmode;
 	struct list_head		node;
-	unsigned long			irq_state;
 	void __iomem			*base;
 	struct device			*dev;
 	struct emif_regs		*regs_cache[EMIF_MAX_NUM_FREQUENCIES];

-- 
2.43.0


