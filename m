Return-Path: <linux-omap+bounces-4746-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB9BC04E29
	for <lists+linux-omap@lfdr.de>; Fri, 24 Oct 2025 09:58:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 433FB34793F
	for <lists+linux-omap@lfdr.de>; Fri, 24 Oct 2025 07:58:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CEAAC2F999F;
	Fri, 24 Oct 2025 07:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IjmaJSio"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DED62F83B8
	for <linux-omap@vger.kernel.org>; Fri, 24 Oct 2025 07:57:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761292646; cv=none; b=t1Fa2SimIQpChw+a1koP6SxI89PYSZKj2GNpHnL46MjwcjIn9mNkFnEelJBXnx02jVWCdl1E4M09bPIdZ7HIk1ao5zQIA8KJgz8HeRjOuDwzCU+XK27jp/tDQJb9bY8tMSgReuWU2P/+bftFN63BmJeXQDr7l3SpXtVkKQrlHGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761292646; c=relaxed/simple;
	bh=1S4UQ+7nhEA8zNaooCtgSqA9haFJvF9HfZbaXeqS2EM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uIGf27hQt9WHBSfMH98tzpt35JfIt+MTw9gHbjm6CV2CmlkjVt9GZ8nvnP+y06ssXm4TWHA76vzs9QZiGCLVREdNbFdvUBF+3q7V7AYxf0ZNZ+TIHKa8LY/9xzPbBsWNTxurobPvB1azCpozGstqQM7Iu+2FG1iD2jT+/DKeZ10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IjmaJSio; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b67684e2904so1277535a12.2
        for <linux-omap@vger.kernel.org>; Fri, 24 Oct 2025 00:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761292644; x=1761897444; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bsCgGE+t2FAq88PcqDeZB7E9huH7ZBCKhVdOKCnfFwg=;
        b=IjmaJSioIn++WVvjuZqEGIOa8+5Te6i9jBTQXZlrlhB+d3pQfBl0tp5RSuuljbU/04
         GXpRj5k+sDatnfiS2r18jGkSLvTBTLqDFfeLHmx2dLMzxJ96vO43g75GaDAjxzSzFT2I
         opoVsEyZ+0WnkQxTQc4ivDeSX+7mSalro16ShXp/xAxiRN7lTuzOl9fitqVY/8QNMXxG
         upJrNUL6O75POGqRRAyu1tUKF9fdAO2uphCysolERxIIOts+DzyxrtaiQyrqCOaLqEnp
         lYsmMdLMh7QAOW047695wd74e6o9yiyrsBHlweqpS7eL+NFkI9jBF1XiD5nJpZgMGPk7
         GkCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761292644; x=1761897444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bsCgGE+t2FAq88PcqDeZB7E9huH7ZBCKhVdOKCnfFwg=;
        b=Gzvgu6sq+2xbS+6LxunhvOz3l2zMpdBdNf6tgtxO2wc8IuO4fdJPO0BH4ZqMv4bi2D
         XHIJANUyna6oOUcVUcByzrLq2LV4rPwmpZNTcoO4BXvZUYrAiJTYhfah1jyvB8XJUN0+
         LFRQE/rB4b4TTKbfFuuS5r61iZ0VdsUIJut/1Dh26H78Fod8Qo9xBE9fKXfYk5Fnzf7k
         BrqAtfS2zB86e0dQ4B1v0npYb5FMZkbRguot05A/a6NpjKiRCyUbswtmYK33yRLJaV/w
         rq4LRI9jJE3LNytd6o4HYTvWYDW/WJtqFl0lC3DbUSwr2I8MvIAyGSSVJdI/ZmtbOiL2
         Jhbg==
X-Forwarded-Encrypted: i=1; AJvYcCW9GDH8ouH9gUglOuhl8Mb+ukP32bKHgeNTbWd3EwJbblnqmwjLTnr6lRBPHVkAv97wpmomCSsjV0iR@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5oytTo7zKjboyKybcq+Qcfa86eKBqbkAqjCprcB2L8QMVoTig
	gaKR3ZdIGFhNPHEZt5IdXqaijDDU0LqFPjQXa3/9fX+b0HsdfIfbw3rs
X-Gm-Gg: ASbGnctvLacW/aX8TWs7RZsx9t/5UA2hLKzCF7ldXCV47G4NkkOdfXhJPg1blV5TM0j
	FJ1d2rSwqJCLxiyCrbOAD25+lR14EgLQgqyKpuwL8LD0X0bIY5GffRvyNtanI1VOc0YV0wobmr7
	Yh+VrTe9SzRbMAuX1wSWqr8ipxOjvy2NW0pf/eHZX3I7L5xaH7C+uiTnxDNE2nqIp06F/7uLcmg
	3N8oBn/THGnRL/bxSWtM0SH5E5/fcYzlvek1ZF654f2KxYZNDWZaK2Hc2wPeC0KU8/R+9VLX7x4
	liGWZaz+ay6tLTV/yv4dg+hWZVQsQaxKS06rlJ00I870FdsdF/BzgMyI3wlyIQsHDVnlHc32IjX
	77jBCYBxkCdpDmulFtKCWJV+AmdVXI/X1YjN9kvWCchzV1Eo7eVBKraqvaYUXzvqSIb8oVdp52w
	C78Zko8Ae4tKuvDeVTty6w
X-Google-Smtp-Source: AGHT+IGTHOLGIwrjQXatww+KV9yMhd2IOEe91lui9OUaDG0ykvPq+cnpLgcMgz87qAdZPtufjmcT2A==
X-Received: by 2002:a17:903:2446:b0:290:6b30:fb3 with SMTP id d9443c01a7336-2948b97658bmr17002255ad.16.1761292644352;
        Fri, 24 Oct 2025 00:57:24 -0700 (PDT)
Received: from Black-Pearl.localdomain ([27.7.191.116])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2946dfd045esm46608205ad.64.2025.10.24.00.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 00:57:24 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Date: Fri, 24 Oct 2025 07:57:08 +0000
Subject: [PATCH v5 1/3] arm: dts: ti: omap: am335x-pepper: Fix vmmc-supply
 property typo
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251024-ti-sdhci-omap-v5-1-df5f6f033a38@gmail.com>
References: <20251024-ti-sdhci-omap-v5-0-df5f6f033a38@gmail.com>
In-Reply-To: <20251024-ti-sdhci-omap-v5-0-df5f6f033a38@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Barker <paul.barker@sancloud.com>, 
 Marc Murphy <marc.murphy@sancloud.com>, Tony Lindgren <tony@atomide.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.14.3

Rectify a typo for the property "vmmc-supply" to resolve the errors
detected by dtb_check.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
 arch/arm/boot/dts/ti/omap/am335x-pepper.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/am335x-pepper.dts b/arch/arm/boot/dts/ti/omap/am335x-pepper.dts
index e7d561a527fd..10d54e0ad15a 100644
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
2.51.1


