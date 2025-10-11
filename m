Return-Path: <linux-omap+bounces-4664-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 86E4BBCF27B
	for <lists+linux-omap@lfdr.de>; Sat, 11 Oct 2025 10:44:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3952034B4A1
	for <lists+linux-omap@lfdr.de>; Sat, 11 Oct 2025 08:44:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F26E42417C3;
	Sat, 11 Oct 2025 08:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qo0dZ229"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C92923A99F
	for <linux-omap@vger.kernel.org>; Sat, 11 Oct 2025 08:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760172244; cv=none; b=MbXa4ytAqtk0LxpJXLnOUn/t8kxyLalSeezqaLt1Q5Zx1xFsJN5MmWFGKWZiYHwSLxmEpm1iamnDcVq4Leu/QhTi+gsbwpcv9DKC5E1DuhdHOoDTDdoY85aqW2Iod2XBNf0Ccf4EH+91IjK51v8KLt1FQfbKj7n9ChcS8ICTaiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760172244; c=relaxed/simple;
	bh=WupZjDzp+mYLUnPliPNHAA8llyM+D76W7Nv/oh/99/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TCMKsvEAx1H9BMpj65P7bW7qmP0EQOCmM05QKsJPxVdqvFbIDQuUyN7jGy1Za5BB8joHNCG35XBLzGNjOeezeTxRiArkJRtIPsMk59dgr5GFzZWhiPq0hC9gg8j65MyfPbpEhHZidGDcN6KCagiMBclFIxm/mgwRC+5d6+2ShBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qo0dZ229; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-33226dc4fc9so2479314a91.1
        for <linux-omap@vger.kernel.org>; Sat, 11 Oct 2025 01:43:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760172239; x=1760777039; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H8kUPDmdGFI5dlB1Y4l1vU9fWBs35HJfqSRekTM7U1A=;
        b=Qo0dZ229E/eq+7ywW972jK8byHgbfnOq29CXOGodzABs/1NVKhK4dXPtiQK11s19sL
         4IACOZVSTxNPiB/J9mxmOigspTOefa5f8F3gMng/IonoqBqmWyBDGdwba7vkKZh8EIRx
         rQZvKbaGCn96JhEU980upuVi2Ug/wbkQSCC7qBMB7qBbVrEfUm7Rlbbiq0mKwSE6GsVh
         Fm5PKJ8zKcICV/IyVtGchCloSyVaBdwq7bMstu1YTq7EA+UoBUbYJz328d+kPMb9OW+m
         tfLbaTCFZBIV2qRlXDx5jg2nRJPfTSm+NLKM3n5UmG3HYeWz0sjSRVdv3HiLW73sP+cG
         V4AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760172239; x=1760777039;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H8kUPDmdGFI5dlB1Y4l1vU9fWBs35HJfqSRekTM7U1A=;
        b=kMgqQKq5oWzaGeq6qcMPgCwQTaF2ZvIWqdGSQU7ixOpTM9dI1oaBzC2k12H7Aean7+
         HECJJfnpNjWTs9gLOl1n+3zshr2FAztISG/9/SNvcR1Qdyw5xCk6ArTioZjOCasZYujb
         yVCpskC9NHzkqJTgMRtZwxBa2DNkVQpcsnWNjH5hVmR7LarkIazgCTIQ4u21f2ooN4k/
         /jw9Z4PoKKdcD5HPkQE1B3dqjeCh4JXkRF5MB5h+L52lvULeebXMZ8GcWBnWtqyKH3b+
         VQhIS/DqSCI/1SVgEHlO+TwjDW3aMRzJWZS3DZLxnGJMGTQvpdl8DSTMJBFOS+l41w6y
         PzdA==
X-Forwarded-Encrypted: i=1; AJvYcCWIpuJ1EIqwK1SODQqH5NR/bSKuI1iA3H+6YiuUzZivOG1ibkMon5wIpecmLr/97jWY08vQ0VqzsNQ/@vger.kernel.org
X-Gm-Message-State: AOJu0YxF+R7Y0hENEMgrRHVU0P8C94AwZeXzV6P1GY9yeo4V40qHt7qc
	a22ol/eYtEITYjj2QwwDfaft3aUpuJlHf3bQ1bz04XeduCSwGmy3ZfTK
X-Gm-Gg: ASbGncu6yNi6f49z3BVMvrMMNcyEhsJQiUHWskyrlrws6xPoSc84iG9xSaOcvKKcYEl
	n9HEG4IYnJig5Px7pubc37teYFKBpAXQzw+3PLn57JtGrwskaMG6XS4IgS4Evn7sFNoIWxb/04w
	3c1cPBI3B0O7mNXzFaNmfuutdfYey9G6lJxld1+gUeylrgjejfYp0LB4/myUn8QQPUArno/fNPI
	6JrNj4gy76KU00+JSCUP9q8aukmbPtJWNUyTJbZJm3ckEqx5IlGnLJC8YE7jf04GovcsdpvfsKY
	tbWzz/ixTrxPCevHnK0+pNUMqVpvW/NlLehcdNdPXvSbV8LmxUHuXhOJ1uLqXQFJPcl5LVVVxQY
	My0/3Lyly0XV8YHB+YDG4PRMIgfxS6Xsip4F1D5K6u7ULdG20CIJC8VthCR74LGsK+AXpmgMVg+
	UIfJ4=
X-Google-Smtp-Source: AGHT+IEEOTuflRqQKofgn/Jm+9c1ebGng0TIvOwkuJKhNdEWd6yjANpMqEqY0yHrWn9gQeTyxzynFg==
X-Received: by 2002:a17:90b:1a87:b0:339:f09b:d36f with SMTP id 98e67ed59e1d1-33b513a1e0fmr19026440a91.28.1760172238813;
        Sat, 11 Oct 2025 01:43:58 -0700 (PDT)
Received: from Black-Pearl.localdomain ([157.50.164.155])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7992d09659esm5401090b3a.45.2025.10.11.01.43.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 01:43:58 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Sat, 11 Oct 2025 08:40:23 +0000
Subject: [PATCH v3 1/2] arm: dts: ti: omap: am335x-pepper: Fix vmmc-supply
 property typo
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251011-ti-sdhci-omap-v3-1-9487ef2de559@gmail.com>
References: <20251011-ti-sdhci-omap-v3-0-9487ef2de559@gmail.com>
In-Reply-To: <20251011-ti-sdhci-omap-v3-0-9487ef2de559@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Barker <paul.barker@sancloud.com>, 
 Marc Murphy <marc.murphy@sancloud.com>, Tony Lindgren <tony@atomide.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.14.2

Rectify a typo for the property "vmmc-supply" to resolve the errors
detected by dtb_check.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 arch/arm/boot/dts/ti/omap/am335x-pepper.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/am335x-pepper.dts b/arch/arm/boot/dts/ti/omap/am335x-pepper.dts
index e7d561a527fdd9eeb15237ddee4c8db1dfd48edd..10d54e0ad15a7ff9770ad02c224b4b47aa5040de 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-pepper.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-pepper.dts
@@ -347,7 +347,7 @@ &mmc3 {
 	status = "okay";
 	pinctrl-names = "default";
 	pinctrl-0 = <&wireless_pins>;
-	vmmmc-supply = <&v3v3c_reg>;
+	vmmc-supply = <&v3v3c_reg>;
 	bus-width = <4>;
 	non-removable;
 	dmas = <&edma_xbar 12 0 1

-- 
2.51.0


