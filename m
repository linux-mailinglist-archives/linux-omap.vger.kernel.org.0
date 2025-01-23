Return-Path: <linux-omap+bounces-3195-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A97CBA1A3FB
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jan 2025 13:12:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 771B33A3FF5
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jan 2025 12:12:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4FEE920E70B;
	Thu, 23 Jan 2025 12:12:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="gjc/OILp"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BD6F20DD72
	for <linux-omap@vger.kernel.org>; Thu, 23 Jan 2025 12:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737634374; cv=none; b=ebxyuX9p+cd271zRuuOzFNvPRisdwoY9OIZyPdD/ldFEETETEyiMqCeUDjbRYblh3AMwafmTSVcvKndInilB/5QJ1t4fCkwJs9bEWbVM8snkPjTKE9DOs1tdcFERSyQFn/vrAdDmXDtoT7/W4+fjd/LUaBHiFfknG4KvAla5BHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737634374; c=relaxed/simple;
	bh=mtFgcK5d5vU+0BEr2cMeO/rvLdDdCsqETnlBl0Uv0a4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=Fflc66c5yMJEw+KuWveTD2UcqZqQfVQrSb8bTCvteYfZCFZMaJx2CXCHdiyWtVaki7nK3BTn0UK9sbampcPESgI3PQBAEkLxvqr5rmcAlnHq303pxw9h3fpi9gFjc0FWOer77UUieqyVKmKO2j80/IqPDiaPaa3T9aJ5d3gbcOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=gjc/OILp; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4368a293339so9321335e9.3
        for <linux-omap@vger.kernel.org>; Thu, 23 Jan 2025 04:12:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1737634370; x=1738239170; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRxUqDQtYMNJ04dpHaJOBq0JBHfXv3aaDgKYPS3OL04=;
        b=gjc/OILpiYhmIG742Au89SsYsOYymUqdXSubdr72zxwvCvAJSDExSI2FIiY/b2ivE2
         fJLzLfbcawzjA7nk0CmO132pF+7OJKKsyTflWVbGRFG3iwfV7qcSDhrR92TIap1YDeL6
         Qwg/hAOGAefKsBv+VuoETZ/pggIkL1M2s3RcspW0zUFDm1PCzClAI8ffISAcnxO6ICOB
         +TkcqSeec5jLpAjmzcP+TZU89uQuyYrwCdt/Ar2gTKJClMjBu/K0oopKAi4+4iyTOA/m
         6Xdr30opiDPzNv5y1mm6+VvkegPLMXHzyMSzX1FEy9i+8YOHS7NH8Gd/aOwEMIr4RKtr
         HxQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737634370; x=1738239170;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZRxUqDQtYMNJ04dpHaJOBq0JBHfXv3aaDgKYPS3OL04=;
        b=KHsGu26z+jDplXDs/wAO3LdPbyuGBLNTwC82RfcJGnpJeODIby/LG1ftnllFdK9SmJ
         zilf8EVIMl42Z8nQdsh0wnioAVAo+xbGHiDIDQWVRM5Z4Van7BZvgFfYvHTI1zhXJuT9
         TEEkwojeqA098lhfhyhDDn7Ysfg/IiVvDvsdKf1ekIZq/kHFqkmCMzFkvxOhMIcZ9Vxa
         wgiY5iufYtBMb0MZE4HnNCIvPbXsOtic+WlBFjwOjVml+SSUsAA/jkOl95QZT8FNVWTM
         4580swz0Qf53twXvb+76GO6E5Ia6vrprBKghDEEPjj18nPPLn2X+7IWH4BdB9t8a1Pft
         /o8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWxfAulh/UaaxuizhB3UH8YSNzRiPd/TOWyhiOqE8kNev5jIK+fIPVfsFQomr13bIf7OeP2zkuH7CJ2@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+0TGGHIgGknpJuPN4NE58WycBHWgYxAdbA0bcozrMCdlxcTol
	zbWRtvO+w9tf7EADEDqR+G7x9/giIXgzFWyvyVoK1xXSR7f/rqMrK4R7K1HuYmk=
X-Gm-Gg: ASbGncvBqZXtypAtm7BPfqTOD+VSYxG6ndZ5M8x8VLRo7kbz9X1FuFqFaiP5tPcukkO
	skCpDJh30qYgaEkMaCFVCORbYdD6VycVkab2PKi4Gxfew2mcDlJR/7dHbELtVAhUDQeQtdZRc49
	4pONYr/65tEN00YaP7rhPqVIXtBD7hhWFSoKNsLlVon/1UNAR7VcaQGyRKih2N0jpTB7MW9P7+l
	9ZngCcnRh7MSgHlbm7c/5uyg2oj5bOwAZZS1pu8+3CtVfELL/rmALh+qBWt5OvH8W56YhD30pEd
	xTeW/zMIfATi0ALwCGE=
X-Google-Smtp-Source: AGHT+IHC7AaB8nrR3oGShOfXmCEVPdPVczCK1GzN9+qsELRO7/8LMNivLw27uw09FDLlr5i8rOIA4w==
X-Received: by 2002:a05:600c:4e93:b0:436:1b81:b65c with SMTP id 5b1f17b1804b1-438913df89fmr238758825e9.15.1737634369568;
        Thu, 23 Jan 2025 04:12:49 -0800 (PST)
Received: from [127.0.1.1] ([2001:861:d40:ed60:2a79:1cf5:e6a6:b1a8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b31de036sm59344435e9.33.2025.01.23.04.12.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 04:12:49 -0800 (PST)
From: Guillaume La Roque <glaroque@baylibre.com>
Date: Thu, 23 Jan 2025 13:12:48 +0100
Subject: [PATCH v4] arm64: arch_k3: Replace select with imply for TI
 mailbox and TI SCI
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250123-timodulemailboxsci-v4-1-b1a31b56f162@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAD8ykmcC/32NQQ6DIBBFr2JmXRpBCm1XvUfjAmGsk6g0YInGc
 PdSD9Dle8l/f4eIgTDCvdohYKJIfi4gTxXYwcwvZOQKg6iF5DVXbKHJu8+Ik6Gx82u0xCQXKIy
 Sl2tvoQzfAXtaj+izLTxQXHzYjo/U/OzfXGoYZzXqXhvl8KbdozPbSF3As/UTtDnnL7btH6S3A
 AAA
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, nm@ti.com, afd@ti.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-omap@vger.kernel.org, khilman@baylibre.com, 
 Mattijs Korpershoek <mkorpershoek@baylibre.com>, vishalm@ti.com, 
 Nicolas Frayer <nfrayer@baylibre.com>, 
 Guillaume La Roque <glaroque@baylibre.com>
X-Mailer: b4 0.14.1

In order to build TI mailbox and TI SCI as modules, replace
select with imply.

Signed-off-by: Nicolas Frayer <nfrayer@baylibre.com>
Signed-off-by: Guillaume La Roque <glaroque@baylibre.com>
---
Changes in v4:
- rebase on master branch 
- Link to v3: https://lore.kernel.org/r/20241016-timodulemailboxsci-v3-1-0e7f7a6de97d@baylibre.com

Changes in v3:
- rebase with master

Changes in v2:
- Use imply instead of removing select altogether and dropped
patches 2/3 and 3/3 from previous series as using imply makes
them redundant
---
 arch/arm64/Kconfig.platforms | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
index 02007256709e..a6e4bfffc09d 100644
--- a/arch/arm64/Kconfig.platforms
+++ b/arch/arm64/Kconfig.platforms
@@ -133,8 +133,8 @@ config ARCH_K3
 	select PM_GENERIC_DOMAINS if PM
 	select MAILBOX
 	select SOC_TI
-	select TI_MESSAGE_MANAGER
-	select TI_SCI_PROTOCOL
+	imply TI_MESSAGE_MANAGER
+	imply TI_SCI_PROTOCOL
 	select TI_K3_SOCINFO
 	help
 	  This enables support for Texas Instruments' K3 multicore SoC

---
base-commit: 21266b8df5224c4f677acf9f353eecc9094731f0
change-id: 20241016-timodulemailboxsci-412e2a6458fc

Best regards,
-- 
Guillaume La Roque <glaroque@baylibre.com>


