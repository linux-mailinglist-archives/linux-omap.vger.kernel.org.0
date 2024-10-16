Return-Path: <linux-omap+bounces-2437-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 646089A07F9
	for <lists+linux-omap@lfdr.de>; Wed, 16 Oct 2024 13:02:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0B6A7B27322
	for <lists+linux-omap@lfdr.de>; Wed, 16 Oct 2024 11:02:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E7B3207200;
	Wed, 16 Oct 2024 11:02:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Q4ORbj2U"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9576420605B
	for <linux-omap@vger.kernel.org>; Wed, 16 Oct 2024 11:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729076550; cv=none; b=JPpT4T0fZUk3XOsQs6fuWaWLOxao8IEI1Glr6qs2g2U/U0SpOaXJ7+xojJQPpihExOUp2VuKioVZ1bVM5SMwMvW+i832hvKZ6wDJ/UHz4FRdGBJYYeCh/sggwx7fGB6jBfCnlF3wXFHj0OLMlha7CvIZKMH/kBEUGsUSAie7PsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729076550; c=relaxed/simple;
	bh=uiBgGSrncqqeHUfK1Pix/bd647NGUnzsTzymC80rcmA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=ZFCS2ugLFYdZ+n7k7l28Hw0ZT3y8KZP55QwkTVPnBuPFnM2ZUGJoPghtqeY5KFJc8134pSvSzZGCW2vNdWGFzM/sZ/nk+MrURL7s6QLbbO4ANxKreSPTPGNxe4KBBNkCy1dIRn5rV0PLaI2n+q22nb/C4d99C3A8UMW3CgPXR4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Q4ORbj2U; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-431548bd1b4so2379915e9.3
        for <linux-omap@vger.kernel.org>; Wed, 16 Oct 2024 04:02:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729076546; x=1729681346; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S78N4/8RMP568QF6yTt5vOftFhMLK+8VWVl5epjuiR0=;
        b=Q4ORbj2UpIczFAOF8CEbsoeLkIEbbNlLt749F/QRbHEUn9qSPGekmlgcX/MTHf099n
         albGVBYsQYMYUY/OyA7q4nzNOveAkbWKuaJs+flqq5wCd49dJCWaEsL+6+KuTwdjItCz
         JB2WtUqcbnouynmJuempJxD0R5ODBAW7QU5TrdkwbO+BHzwp9PRtTCA0AU6So2gohjKL
         s9JmpEJ10uIgWDFksnV80RxBWg8N+jDx1rTP60TQtxdyvQ3Id8iM4U3ByxK8pXD7qwwq
         cmccnhsszK3o86hLxlJgCOF4TFSFiC5RzPppLYOJNlJzuFG6MH7K7CQvNDtspDcx2ug8
         VlyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729076546; x=1729681346;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=S78N4/8RMP568QF6yTt5vOftFhMLK+8VWVl5epjuiR0=;
        b=kvbaBCVs6sn1oaQ72fmQWTw68+LohM5gUWmjL5vV+Z4Ek/5gAYghmYMeOoODYiPk9x
         GQcPTZLpUUfv9VAJK1URuZIziqtaXFpUZJGtpdaOiZInbHSeSSwiJoMSBh+J9PgQ0BcX
         +qoND8icSGD/EqsgwBUHeJcGBO479UO9QnoggpYqgAB63yoEJ3dDZCUaBlxsLAZtCT1I
         rDsL1qvpLubC8aZaaboRYovKlxs+Xahx96OHOjEF8ClEDLAf5pZEjiGWYsy6EsBLEQCo
         /TVpVHC9aONnj/bWBQ63XUTDek2Rfhk8iyzENsuidoEY1Loc5QsMYuYz0KrqdOwZCtHS
         lqFg==
X-Forwarded-Encrypted: i=1; AJvYcCVlx/Z6XDJsH+4p2HRPzJ29kdulaSFz77uVeHFWF+NHh4Nop8HPEC+3vWzImWvnJL/YPH7vlxxf7vKW@vger.kernel.org
X-Gm-Message-State: AOJu0YwJAShxLL2mYS7Lmt9fVM/gA3UYPFn+Z15JppcwDkIb8fFU0Pd3
	R1OFjE98NPGKmI7+xJJDGvTFBEQhBXtSR0KPe1VJw0eHWW+81URbaObxGup4Mes=
X-Google-Smtp-Source: AGHT+IEU7QFSfWTjinhf+R0wKFFv3saOgBGmxEE+icxISQneCQD8FOMn3IosX+Xof3B3bNeKByBs4Q==
X-Received: by 2002:a05:600c:5126:b0:42c:b63e:fe8f with SMTP id 5b1f17b1804b1-431255dd131mr137815815e9.13.1729076545866;
        Wed, 16 Oct 2024 04:02:25 -0700 (PDT)
Received: from [127.0.1.1] ([2a05:6e02:10a5:e010:472a:1760:2b0d:11e9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43150469a35sm16795735e9.1.2024.10.16.04.02.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 04:02:25 -0700 (PDT)
From: Guillaume La Roque <glaroque@baylibre.com>
Date: Wed, 16 Oct 2024 13:02:20 +0200
Subject: [PATCH v3] arm64: arch_k3: Replace select with imply for TI
 mailbox and TI SCI
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241016-timodulemailboxsci-v3-1-0e7f7a6de97d@baylibre.com>
X-B4-Tracking: v=1; b=H4sIADudD2cC/x3MQQqAIBBA0avIrBNysoiuEi3MphooDa0QorsnL
 d/i/wciBaYInXgg0M2RvcuoCgF2NW4hyVM2YIlalaqRJ+9+ujbaDW+jT9Gy1AoJTaPrdraQwyP
 QzOmf9sP7fjRyIfZkAAAA
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
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
index 6c6d11536b42..7f341c23cb01 100644
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
 	select TI_SCI_INTR_IRQCHIP
 	select TI_SCI_INTA_IRQCHIP
 	select TI_K3_SOCINFO

---
base-commit: 2f87d0916ce0d2925cedbc9e8f5d6291ba2ac7b2
change-id: 20241016-timodulemailboxsci-412e2a6458fc

Best regards,
-- 
Guillaume La Roque <glaroque@baylibre.com>


