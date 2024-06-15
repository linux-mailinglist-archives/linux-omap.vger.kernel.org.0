Return-Path: <linux-omap+bounces-1535-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D6583909960
	for <lists+linux-omap@lfdr.de>; Sat, 15 Jun 2024 19:49:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 436CF283347
	for <lists+linux-omap@lfdr.de>; Sat, 15 Jun 2024 17:49:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90EDD4F5FB;
	Sat, 15 Jun 2024 17:49:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gQrcO3lP"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C82A481B3
	for <linux-omap@vger.kernel.org>; Sat, 15 Jun 2024 17:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718473750; cv=none; b=eAXKFmZOkUPB0x23i8ARPG3eHmfcEU0Ta+M7fZb11kNPzVzYMHNgar1FYTmn4c6r+iWbKuC0OCx8gqAstk1rme9zoocP39w6XrCKQr/W0937gelvmZnJONjJqalqfiqniVcrYvGyN5byynSFWQqB7Ls6JmSD9DrwvozG/3ENET8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718473750; c=relaxed/simple;
	bh=oGBKPT1M0XiRJNpVabQalPfRMu14bYm1uul2tPOLwKc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DWERs45SQ3/27N0k7n1+1SrLEaLRnIazfAeM9/Z+cC/oyKzSXlCzITEY/Xid8qwSitv0trMO0RpotHMUy7Huyqin0+//KQ9L9Vwr1rZWlg9HHsHT6LZy2pbQkBxZK3BZle1iNWyjt3M1cxgNAzVc2DVWgP1D3q+RCCySFUs52fE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gQrcO3lP; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-57a44c2ce80so3726677a12.0
        for <linux-omap@vger.kernel.org>; Sat, 15 Jun 2024 10:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718473747; x=1719078547; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sQTdAZk+xkTaWcpSjHpauNVsk4RuoZYN9xg1Bzump2k=;
        b=gQrcO3lPZ1BSKptChDDOMB4LLap3KNy5uchXwU6iJx7aiuThMLthLDA1oJAcn+uTEd
         XBn26wARdb5U6cnuXTiq28zRGDWpW9B4PAXQOLdyIoWvidy59C0H82RFWk9fT94kJ4nf
         4DGB4/qE8LJZn0Re+Z8+hxIbJcX1z4q7Idfs/pb9N32RhbBIBdoqZ5Cb9ibo2gqVQioX
         HPYPkHXIpoRJyUroB4DwaOhNJb7uyGFqiqiQ5E911dte5aIUsiYpTWNDGUFT7SwwFEvO
         BcARFRcVUQVH+LiWGv8rq01QLYkZR/6OFh9uYieEaLcq5jKnLajrbtO8D4UXUq7dxHIw
         iBvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718473747; x=1719078547;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sQTdAZk+xkTaWcpSjHpauNVsk4RuoZYN9xg1Bzump2k=;
        b=fztUyLoI+mKcqUbWDRiow5rsUMm4AOuV2FWWn66IHIV53NfiAZMM61ewBGzrdLNSBj
         GpeeI/4B12cjIaRyz4JEQEKrEyiQ3w9B4pjPaWuURgr6Zl6/N75sARTgNWQyAEz1X4JP
         YfM+he92Vlht6S3HmRK4cWCrd6F226ucr5H+vcYEsL2BVwfSDICFm9G/YNwN/sxUCZiM
         7a9c8FxFxiXUYRwqMokLCITxt74zsYqCwAlvuTud2v/El2dMIDMn8/JxHStcYVMxBM82
         w2pjy+OOzomYZNMSNkaD25CRJsoibuVcGJ8IYd9MPCOsgSm4bV5OAI2BFn6bg3OVgqo6
         1k7w==
X-Forwarded-Encrypted: i=1; AJvYcCUSLXr5pulQLtC/mtsvM4DcDNTgpfU7mtu/oddZjt2ii/IzrOjVYyoKvY5ZxN0ySovIfUM5tvdA29c2MQzQV6viWBx6Co8Sdm/QEg==
X-Gm-Message-State: AOJu0Yw543R6uYLxTA6gQCYjtmPvydl2lajSSxr8BnoGVIocjsT/yvBA
	U16DQ8dJ38emjMDsEmic2cRve5y5AafEXRYmeCfb/7pkRZYOled1rfTBCIo1w+StCP1FUsA7MKU
	uGlE=
X-Google-Smtp-Source: AGHT+IHI9wdR5yttuPe5CPAFwyWHcSWXRKDzT5MKecRnY8k+A4gMwRIgI941SC35XAKMmBHxxAe/6A==
X-Received: by 2002:a50:cd91:0:b0:57c:8c45:74ff with SMTP id 4fb4d7f45d1cf-57cbd8e8182mr2812346a12.41.1718473746710;
        Sat, 15 Jun 2024 10:49:06 -0700 (PDT)
Received: from krzk-bin.. ([78.10.207.147])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57cb72e992dsm3942946a12.48.2024.06.15.10.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 Jun 2024 10:49:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] ARM: dts: omap am5729-beagleboneai: drop unneeded ti,enable-id-detection
Date: Sat, 15 Jun 2024 19:49:04 +0200
Message-ID: <20240615174904.39012-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a ti,enable-id-detection property in the Extcon Palmas
(extcon-palmas), but not in the Extcon USB GPIO binding and driver.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202406152004.F2fNnorG-lkp@intel.com/
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts b/arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts
index eb1ec85aba28..e6a18954e449 100644
--- a/arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts
+++ b/arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts
@@ -196,7 +196,6 @@ brcmf_pwrseq: brcmf_pwrseq {
 
 	extcon_usb1: extcon_usb1 {
 		compatible = "linux,extcon-usb-gpio";
-		ti,enable-id-detection;
 		id-gpios = <&gpio3 13 GPIO_ACTIVE_HIGH>;
 	};
 };
-- 
2.43.0


