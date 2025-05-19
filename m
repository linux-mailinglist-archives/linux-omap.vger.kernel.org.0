Return-Path: <linux-omap+bounces-3726-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A53ABB707
	for <lists+linux-omap@lfdr.de>; Mon, 19 May 2025 10:21:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A50DB3AEC33
	for <lists+linux-omap@lfdr.de>; Mon, 19 May 2025 08:20:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7F80E269CE0;
	Mon, 19 May 2025 08:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Jjtz3w8k"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0F319E96A
	for <linux-omap@vger.kernel.org>; Mon, 19 May 2025 08:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747642865; cv=none; b=CroEacFVYz1OqRgc30OOdhsSqJ0+Z9pAh+cCqUlnNNBCwy52MDnNGQjsZOuEmI5N3iLEEfXYzYyqA+HRZk+lvZrWM+qJrnxzJkgruc6e659XmdA0xYfGEuDWY2zY5n3ZZh8j0OLH5QAKA9XOlmDqAd93Cocl9QR5D8BhyrvJWS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747642865; c=relaxed/simple;
	bh=jSeqdWl1GwCYu7ApC/CsdSOboMo1BfT/Qan01LPNn0w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ggVbuzfdXQjsi2JEztj+Xr/whdAET1wbuzsg3oSzmIYSfAeoPE8kUUTcgjwu9bPcgmG/BrFs73nBiz/OGn7cdOBDLoHWDpqV9VQ+/HY+3h7soPLUjd7T/x0gRCjCnN/wlg2BKGko+0BKx3+qV3KOZopcoJmtZtxTrP4ULx62fcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Jjtz3w8k; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so31747305e9.1
        for <linux-omap@vger.kernel.org>; Mon, 19 May 2025 01:21:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747642859; x=1748247659; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t/k62NGDDYYiEZcY3g4rv/NbFRxjHY8ftixszCG/oSM=;
        b=Jjtz3w8kYh2wtBvCdhKcPt2N1TU7oVzvgLndZTfCeq3pr6RflvHyaCFATyPhg1tQLC
         HcSiOr+N+1YU/dNB7FEzVxE2i3CD169PZ2eijatqKjBCgqL5DCihON2Y/a69cuSBB897
         TK89kwbCJDPmBZdvO8SRi6foz0CwlM2C9azErGHFTmRhG1BnKDO5xM5igzHj6eq6mlqo
         Hy4F7OWijZkDD7sxpkRcJpUg3S0sj9kKlx8Qlbt7RIgQfsL73XO34bnLc+XY4j3vbNAc
         7j652USlwzPkFA3htXi0CYCzKdILGUbdr74kKysjbcQRlh0CXhJl4ObaV+jFxI+TcXIn
         43xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747642859; x=1748247659;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t/k62NGDDYYiEZcY3g4rv/NbFRxjHY8ftixszCG/oSM=;
        b=LuW2g2JVg+uyTPwNNQ58hoPCu7Y89GJSWGTZ9ssCKHZjwdQ6xrtW1quWPq517kSNGb
         QmCNVZYJJDAimuTO8GIJZGQRr7SAR0/Xs8fRZPGs10vXR1OSfqYWVt2Wt+asdvGRul4Y
         rc7WwJpSOJ0DgIogdUgeh8/mzySybPi+WTue2GIDCfgJLWN57GhLdTz4gs1bqYneNHYo
         UxEk8dd2Fpee2MyDlrWY+FVvo9ufs0gI91u9j4szJly2p9TwJjc+GzR9FJiLGeezZeTw
         GkcGs2bIadRi0piZnPlnFZFrrJjmerKj3RYChHak/dwTQA9UR248tMyvrrKV88XYMke2
         B+DQ==
X-Forwarded-Encrypted: i=1; AJvYcCUaR38Wro0US2JqYFUTL2o4PZpcW49YIj4FTdszVoR8B/uDPPZBbp3wWois3SFaZtpMAImswh82lUqJ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq9Eleb+oM1lugEoWiaBk8VJ/SIQ7FIASl6M8xbbT1mn+P4rXy
	COBn9oC0QQ8dR3fRljIyovFgGj4grBJ5mqskRoCf12epbCIhRaLxQjKG6YsOUJeuooA=
X-Gm-Gg: ASbGncuGDuOa+4Uu0i7t9yJ398VhRetbCtwM9tlsRVzBuWCtoAvZDv8XVRJUNHPlZJb
	mDKe1yF14Uc9V8bFyN6S+dpHL8LLH+/XCsGReMHmHbI/9Wi7hWTdgsvcwkY2gP6g2Skq4RGvuSA
	eBxx/mLSg4XfinuwNNJ5Gl7l6Md7GTCfGT6YId6ohtVOZKNYb8/Ldt/79oMpXcjcOGb/d3q8usP
	kqYbxYwsQuBR9KmkK35Bn/bJc+7g8cBiRA7dUjtNM1cn37Q+oGFinQ8Ojyo3DQyPbWR0e/TfyCh
	PAJxO9oV19bjNz9oUo6zv7IXXt1mQqaFF5OqWdZ+fDliUZpkkyhc4VU=
X-Google-Smtp-Source: AGHT+IFGzPPtx3PF8r11/vjc9a7/gcX2mANQelOTEbdI5fy6+2ZiOLqEmQuRVs3+LIEHWfWk7aen0w==
X-Received: by 2002:a05:600c:628d:b0:441:d438:159d with SMTP id 5b1f17b1804b1-442fd60cee6mr100229085e9.6.1747642859405;
        Mon, 19 May 2025 01:20:59 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:e0a:e50:3860:9e23:ebb5:83ee:38e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442fd50eda6sm127139875e9.13.2025.05.19.01.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 01:20:59 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
Date: Mon, 19 May 2025 10:20:56 +0200
Subject: [PATCH v2] arm64: Kconfig.platforms: remove useless select for
 ARCH_K3
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-kconfig-v2-1-56c1a0137a0f@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAOfpKmgC/2XMSw7CIBSF4a00dyyGR1tbR+7DdADIbW9UMGCIT
 cPexU4d/icn3wbJRXIJzs0G0WVKFHwNeWjALtrPjtGtNkguO97xlt1t8Egz6wcUakSDSp2gvl/
 RIX126TrVXii9Q1x3OIvf+m9kwQTThkvRY4t6HC5Grw8y0R1teMJUSvkCb6YuMKEAAAA=
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Nishanth Menon <nm@ti.com>
Cc: Andrew Davis <afd@ti.com>, vishalm@ti.com, linux-omap@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Guillaume La Roque <glaroque@baylibre.com>
X-Mailer: b4 0.14.1

After patch done on TI_MESSAGE_MANAGER[1] and TI_SCI_PROTOCOL[2] driver
select on ARCH_K3 are not needed anymore.
Select MAILBOX by default is not needed anymore[3],
PM_GENERIC_DOMAIN if PM was enabled by default so not needed.

Remove it and give possibility to enable this driver in modules.

[1] https://lore.kernel.org/all/20180828005311.8529-1-nm@ti.com/
[2] https://lore.kernel.org/all/20250220-ti-firmware-v2-1-ff26883c6ce9@baylibre.com/
[3] https://lore.kernel.org/all/20250507135213.g6li6ufp3cosxoys@stinging/

Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
Changes in v2:
- Remove some other config after comment from Nishanth. 
- Link to v1: https://lore.kernel.org/r/20250504-kconfig-v1-1-ab0216f4fa98@baylibre.com
---
 arch/arm64/Kconfig.platforms | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 8b76821f190f..bf9e3d76b4c0 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -135,11 +135,7 @@ config ARCH_SPARX5
 
 config ARCH_K3
 	bool "Texas Instruments Inc. K3 multicore SoC architecture"
-	select PM_GENERIC_DOMAINS if PM
-	select MAILBOX
 	select SOC_TI
-	select TI_MESSAGE_MANAGER
-	select TI_SCI_PROTOCOL
 	select TI_K3_SOCINFO
 	help
 	  This enables support for Texas Instruments' K3 multicore SoC

---
base-commit: e8ab83e34bdc458b5cd77f201e4ed04807978fb1
change-id: 20250504-kconfig-68f139fbf337

Best regards,
-- 
Guillaume La Roque <glaroque@baylibre.com>


