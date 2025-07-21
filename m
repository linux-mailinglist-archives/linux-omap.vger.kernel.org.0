Return-Path: <linux-omap+bounces-4099-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id ED899B0C9D2
	for <lists+linux-omap@lfdr.de>; Mon, 21 Jul 2025 19:38:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3CBD1674BB
	for <lists+linux-omap@lfdr.de>; Mon, 21 Jul 2025 17:38:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0C942E1722;
	Mon, 21 Jul 2025 17:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="crNHOQ5Y"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 853572DECB5;
	Mon, 21 Jul 2025 17:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753119484; cv=none; b=VvJFoGZDzwwzfOXSJf6RrP8bCCOf8rPhEfnsUieIPIg7I9MsyDgDkNGZ4Xe/BmHr/zV13rbMnEG576JGn7NG1vIWuXp5/Z4f4thT3I0ZvYhxEKnIWoEs+2raQletzw9U2CFpmG0UdYB5ia/JfALNFUP6g8wmvmUfClcTL90APz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753119484; c=relaxed/simple;
	bh=JQeKeyjQ550mGYzRoXjGCK3oDO8pvfYR6KeZGy7cwls=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l/GFSVZ8top+GJufSrsO14+Uf0DNPyGxhmA6eSK6qs716mqpdy2CJqdDo6TAB/FEN6JoXnlF15C7PZef79IDeRex9RcuTOoID/AvqJfYXWO1ooHTNwyaCIUZdio7IlOlY5JHJWN+SI6Q4VnJaPUxz9EsWjcKhDl/BYL6mgZxq/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=crNHOQ5Y; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-60707b740a6so6618967a12.0;
        Mon, 21 Jul 2025 10:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753119480; x=1753724280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i5aYttvmuPho8Hr/hRnl5TjyZg+8OVRSRk5gmU1kZpA=;
        b=crNHOQ5YvO5EnAAUGiPNkmGTIfe7JMRtHlZAY5aBtWvULAnRNnhNKmyAqErnL6xmXt
         zPftPrzhlHDrCHXKwxApYoUBgkD6OMZucBKOAB1JzAPVfTMELOZGi3AjVTaRDJKI8cqZ
         VdOrLLsWjJCCN8dcenW6QoDce04+QrFvR0TIrL2cvmZBKQuvVmSbQzuXN8fY5LVoRTw8
         jn4vq/nvZcE5Ri5ilMmvX+JuOB6BRv3lAozyDpbJI0iBSWrPZtXe3ymKyXq1lcDrCv3u
         R/pOCFvfhypDKBfsTPswSFv56NQcDvXAw/wgil6GFZpK+qNtbAl4IdBq+rjZEO6z+m2U
         Dd1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753119480; x=1753724280;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i5aYttvmuPho8Hr/hRnl5TjyZg+8OVRSRk5gmU1kZpA=;
        b=LdyAmM49OspMlnOtbBZcNYaJdoM0F958/Men5xxlvDjToBQsruX/zJtaL5uIPEa/gq
         MJVr+9W6gNNR4uN3BnIrWpWm3fjQN9TLcr8+OuqDnx09FKOPIdhqMDuZqdlQlo2KYDQE
         Ad1K9mpw8Yx9xxKN4TrBLJQhGpPmLTnWiFBWk/HBKThZmikgbjWA7/TECHjV6db+zNMh
         JntfcpRaGMM6rK4nyvf3ehx0iloFZNDdBOaP89kWxgZ4opwrY6UNPw/ds7oR54FuSWef
         BCnaRstoTOUe8J/YwOXsS82CVPRXtLeorHvYSJtLkIMfsct61v8GA9VgwZ7u+GP3m56T
         oomQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIlcJmpE63MUzrg1w9G+RR1QT5Wmr38hPDU+tax8h3FGrvClzkDAQVRRIzGhAh+vp8zKG+dXbB9U+w@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/IaAf/CImiGkmXxRd8cpuJdPmtLicrxKhQB5EZSCR2OqpVzMf
	gLQ1kvqVgUA1RPZ1iCWsAA2xGHXlYwKpDl89y+j24O6kbiYtCz9vXoukbqrj3yaY
X-Gm-Gg: ASbGncv04fe2sbIXxZil7vwU0K4DTcRtMAfydp9M0dAF8FA+934dCQlAKgY4F6zrCxp
	x1TDQwqUiIVJbPD5n61dWGgym2F8kFWOhLJpR1KYeG9vuKtOP5uMNF8axHMTq900UTapFPX5ygz
	ho48KfBkj26LFBRbqhFX9yzkJ8KGCh/hYyCSkRfHIr8K8Szgf0V8Cg/26pMbKlb4DpLqbdPzHXx
	f7LkrtcOplyIThL+yKR2E0dvAKRwVz0WUtcW9+C/HUCul51n30dXtWMpbMZNRtzRLuggGHmQrMD
	swAnli+uqIABKzA5T8CVWIti4ngrRMqjf8h8RK8U9VDQqsMzGmy51xo36K9Fo7OxsspqsMSeCI8
	XTTY8YD75r9C4hOdyITsoyBNAVWrPLD6fPq4Ehb5LKFuz28q7rvQBRSKjFXVlsBUV7PUbZhR0Co
	y1lDQ=
X-Google-Smtp-Source: AGHT+IFEsc1qZOuWRAAkyRNnNZ2Vit1sRj4YvitU/IhJG0Vc2xsnI9fjQ01jyLofTpmOHPK/wEH/lA==
X-Received: by 2002:a17:907:da0:b0:af0:3bac:4f88 with SMTP id a640c23a62f3a-af03bac510fmr326278466b.26.1753119480257;
        Mon, 21 Jul 2025 10:38:00 -0700 (PDT)
Received: from fedora.tux.internal (85.191.78.244.dynamic.dhcp.aura-net.dk. [85.191.78.244])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aec6ca315d5sm715812566b.98.2025.07.21.10.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 10:37:59 -0700 (PDT)
From: Bruno Thomsen <bruno.thomsen@gmail.com>
To: linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bruno Thomsen <bruno.thomsen@gmail.com>
Subject: [PATCH] ARM: dts: am33xx-l4: fix UART compatible
Date: Mon, 21 Jul 2025 19:37:41 +0200
Message-ID: <20250721173741.6369-1-bruno.thomsen@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes the following dtschema check warning:

serial@0 (ti,am3352-uart): compatible: 'oneOf' conditional failed, one must be fixed:
	['ti,am3352-uart', 'ti,omap3-uart'] is too long
	'ti,am3352-uart' is not one of ['ti,am64-uart', 'ti,j721e-uart']
	'ti,am654-uart' was expected
	from schema $id: http://devicetree.org/schemas/serial/8250_omap.yaml#

Signed-off-by: Bruno Thomsen <bruno.thomsen@gmail.com>
---
 arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi b/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
index d6a143abae5f..cef24aafed1a 100644
--- a/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi
@@ -200,7 +200,7 @@ SYSC_OMAP2_SOFTRESET |
 			ranges = <0x0 0x9000 0x1000>;
 
 			uart0: serial@0 {
-				compatible = "ti,am3352-uart", "ti,omap3-uart";
+				compatible = "ti,am3352-uart";
 				clock-frequency = <48000000>;
 				reg = <0x0 0x1000>;
 				interrupts = <72>;
@@ -1108,7 +1108,7 @@ SYSC_OMAP2_SOFTRESET |
 			ranges = <0x0 0x22000 0x1000>;
 
 			uart1: serial@0 {
-				compatible = "ti,am3352-uart", "ti,omap3-uart";
+				compatible = "ti,am3352-uart";
 				clock-frequency = <48000000>;
 				reg = <0x0 0x1000>;
 				interrupts = <73>;
@@ -1139,7 +1139,7 @@ SYSC_OMAP2_SOFTRESET |
 			ranges = <0x0 0x24000 0x1000>;
 
 			uart2: serial@0 {
-				compatible = "ti,am3352-uart", "ti,omap3-uart";
+				compatible = "ti,am3352-uart";
 				clock-frequency = <48000000>;
 				reg = <0x0 0x1000>;
 				interrupts = <74>;
@@ -1770,7 +1770,7 @@ SYSC_OMAP2_SOFTRESET |
 			ranges = <0x0 0xa6000 0x1000>;
 
 			uart3: serial@0 {
-				compatible = "ti,am3352-uart", "ti,omap3-uart";
+				compatible = "ti,am3352-uart";
 				clock-frequency = <48000000>;
 				reg = <0x0 0x1000>;
 				interrupts = <44>;
@@ -1799,7 +1799,7 @@ SYSC_OMAP2_SOFTRESET |
 			ranges = <0x0 0xa8000 0x1000>;
 
 			uart4: serial@0 {
-				compatible = "ti,am3352-uart", "ti,omap3-uart";
+				compatible = "ti,am3352-uart";
 				clock-frequency = <48000000>;
 				reg = <0x0 0x1000>;
 				interrupts = <45>;
@@ -1828,7 +1828,7 @@ SYSC_OMAP2_SOFTRESET |
 			ranges = <0x0 0xaa000 0x1000>;
 
 			uart5: serial@0 {
-				compatible = "ti,am3352-uart", "ti,omap3-uart";
+				compatible = "ti,am3352-uart";
 				clock-frequency = <48000000>;
 				reg = <0x0 0x1000>;
 				interrupts = <46>;

base-commit: 89be9a83ccf1f88522317ce02f854f30d6115c41
-- 
2.50.1


