Return-Path: <linux-omap+bounces-1397-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D7CD8CCB5E
	for <lists+linux-omap@lfdr.de>; Thu, 23 May 2024 06:28:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 85C861F21B57
	for <lists+linux-omap@lfdr.de>; Thu, 23 May 2024 04:28:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B807D54750;
	Thu, 23 May 2024 04:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U18rOPfz"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF58121362;
	Thu, 23 May 2024 04:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716438481; cv=none; b=rAVxuzhLdjgWGMawePP6JgrM6hsTXH5niluX8Ip5LUiOvpIK8oL7VvECcWB9JXU7ePgS1OHpUtHBYjP7DQpH673ONEOTUx0IUDmjRpjLa1ITP2iEfej1nnDG5uIHL4cF+nfE1+DaHH9Llp1KZ14McnXNmZTQUG7fTRlT4VJFnBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716438481; c=relaxed/simple;
	bh=kg0vDCZE3Sr0m++mwJzUr9KmPYN+QyJtuSg5/+VM0Vo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=U0kV9axPauM2Q7A8rmez3N2crVY/c+TN1ND2TGMxdo2Vo8vi1E3MFKMoPuwgB6w6+8FvE92FUBY1XQKyZj16ZfD5lDnuHLCUNwIR4F//VYGyilS9uPaBszlQzpm5p7ukm9BuYDOUGgwF66F76Vj9Z0IwJv3YeRYKrq7FQx+98Bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U18rOPfz; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-571be483ccaso10696851a12.2;
        Wed, 22 May 2024 21:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716438478; x=1717043278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aLv+CQXekteymTi7LH8Cffmlg26XMDlTY03oC8KCX8Q=;
        b=U18rOPfzBVOwZTxoIAeBXK6YWc8hpNSTORRYUznOcBrVSevpksflyKPXHbfKGyPVC/
         Og7Tgcj1CmdZ7wFTj7UfJn/zmxsz4gFMGGdmkVSjs1pbseEJN12t0a8BRXNpKEQMp32N
         +fwiwsAILQxr/MJUyaeskV2M0H9xJ4jmGoe9pyyPByEtZX3QWOm6KgxWAEY3ZXi6AP1h
         rkuKwOd24mgDexbyvUZTXH5hWPBceofNJIrhHsnp/gfg9g7rLFEZg55erHnkx9aqmvgO
         ReC4YrfxWdEGyf3nk7eMbITnlcu2VvaffSW9Al9/yFQCEPlS34vluqb/NTqkz3lJMggu
         AokQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716438478; x=1717043278;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aLv+CQXekteymTi7LH8Cffmlg26XMDlTY03oC8KCX8Q=;
        b=IzoEtUTCxRdpd5bGbkuDj+dkNnUuppv2//Yf+hco2ue1o+8dNzUxmWpT6lhyWFYvWr
         4/+kRD2Srg1D7sw7dVh3iVDd9q5zisT6lQ7ZvczW6Qb9e1+8S9MXbk2MZQaVk7yVC33+
         /6UoRW4HGsF3vfXcqAGlQIBWxK5f+thkQUD8LRHdnnoFaA3QEr2vzz4o5TdFCXheE0vY
         UxcisZepuNqe+HHaJb8wx+61nuU9P2A2xVJ6wY8OCcKVaLFTJM34fYfPLX6404eQua/P
         t6/OW55va2q2uybZ/QlsjBIoIlwBzVzmW7B2txuHWfCH5yaarSGQh1aXkLamXz0DuQuD
         Vzbg==
X-Forwarded-Encrypted: i=1; AJvYcCX5e788rGkUoctWMt/dG3dDnzzLdDlC4kO5XE367Dm+ZSP1Lk8fRTRFM27yvcnGAgc6bNvzqy53jMArTksab1f5Pj49aP20e9xO5Q==
X-Gm-Message-State: AOJu0YznSJ5LNXRxoNMuzVYpRDKXoXKo7t+UU/WjWkoI9cbQMSDknth4
	Q/TbiP2p9OtaxvARj06aicnQDPzRElGBYnOm+8O2SQ8zYdt3C6F2
X-Google-Smtp-Source: AGHT+IEABJIJRi2xyujrDhXEgGBEtUJZ9mCywroIgEk/FF2rhQyneDrQGqeW+Teu5gAyJfsQRgV4Ow==
X-Received: by 2002:a17:906:ca11:b0:a62:187b:e7f5 with SMTP id a640c23a62f3a-a622819ad50mr209860866b.57.1716438478086;
        Wed, 22 May 2024 21:27:58 -0700 (PDT)
Received: from localhost.lan (031011218106.poznan.vectranet.pl. [31.11.218.106])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a5a17b01652sm1872112566b.167.2024.05.22.21.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 May 2024 21:27:57 -0700 (PDT)
From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
To: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org,
	=?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <rafal@milecki.pl>
Subject: [PATCH] ARM: dts: omap: convert NVMEM content to layout syntax
Date: Thu, 23 May 2024 06:27:50 +0200
Message-Id: <20240523042750.26238-1-zajec5@gmail.com>
X-Mailer: git-send-email 2.35.3
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Rafał Miłecki <rafal@milecki.pl>

Use cleaner (and non-deprecated) bindings syntax. See commit
bd912c991d2e ("dt-bindings: nvmem: layouts: add fixed-layout") for
details.

Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
---
 .../boot/dts/ti/omap/am335x-bone-common.dtsi  | 64 +++++++++++++------
 arch/arm/boot/dts/ti/omap/am335x-boneblue.dts | 12 ++--
 2 files changed, 52 insertions(+), 24 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi b/arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi
index 2d0216840ff5..898f862acf3e 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am335x-bone-common.dtsi
@@ -221,10 +221,14 @@ baseboard_eeprom: baseboard_eeprom@50 {
 		reg = <0x50>;
 		vcc-supply = <&ldo4_reg>;
 
-		#address-cells = <1>;
-		#size-cells = <1>;
-		baseboard_data: baseboard_data@0 {
-			reg = <0 0x100>;
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			baseboard_data: baseboard_data@0 {
+				reg = <0 0x100>;
+			};
 		};
 	};
 };
@@ -239,40 +243,60 @@ &i2c2 {
 	cape_eeprom0: cape_eeprom0@54 {
 		compatible = "atmel,24c256";
 		reg = <0x54>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		cape0_data: cape_data@0 {
-			reg = <0 0x100>;
+
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			cape0_data: cape_data@0 {
+				reg = <0 0x100>;
+			};
 		};
 	};
 
 	cape_eeprom1: cape_eeprom1@55 {
 		compatible = "atmel,24c256";
 		reg = <0x55>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		cape1_data: cape_data@0 {
-			reg = <0 0x100>;
+
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			cape1_data: cape_data@0 {
+				reg = <0 0x100>;
+			};
 		};
 	};
 
 	cape_eeprom2: cape_eeprom2@56 {
 		compatible = "atmel,24c256";
 		reg = <0x56>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		cape2_data: cape_data@0 {
-			reg = <0 0x100>;
+
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			cape2_data: cape_data@0 {
+				reg = <0 0x100>;
+			};
 		};
 	};
 
 	cape_eeprom3: cape_eeprom3@57 {
 		compatible = "atmel,24c256";
 		reg = <0x57>;
-		#address-cells = <1>;
-		#size-cells = <1>;
-		cape3_data: cape_data@0 {
-			reg = <0 0x100>;
+
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			cape3_data: cape_data@0 {
+				reg = <0 0x100>;
+			};
 		};
 	};
 };
diff --git a/arch/arm/boot/dts/ti/omap/am335x-boneblue.dts b/arch/arm/boot/dts/ti/omap/am335x-boneblue.dts
index 801399702547..8878da773d67 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-boneblue.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-boneblue.dts
@@ -317,10 +317,14 @@ baseboard_eeprom: baseboard_eeprom@50 {
 		compatible = "atmel,24c256";
 		reg = <0x50>;
 
-		#address-cells = <1>;
-		#size-cells = <1>;
-		baseboard_data: baseboard_data@0 {
-			reg = <0 0x100>;
+		nvmem-layout {
+			compatible = "fixed-layout";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			baseboard_data: baseboard_data@0 {
+				reg = <0 0x100>;
+			};
 		};
 	};
 };
-- 
2.35.3


