Return-Path: <linux-omap+bounces-348-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FEE8389C2
	for <lists+linux-omap@lfdr.de>; Tue, 23 Jan 2024 09:56:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E5131F26CEC
	for <lists+linux-omap@lfdr.de>; Tue, 23 Jan 2024 08:56:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2170C5787B;
	Tue, 23 Jan 2024 08:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b="g3DmXNPq"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E92A5787D
	for <linux-omap@vger.kernel.org>; Tue, 23 Jan 2024 08:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706000174; cv=none; b=A0YRZ4mD8ZdCV/8eqwJ+9NUXouUC9DkGAFyzJAhIXwg59HHFZXJLmI/Td0foMuCvsSOUFufzZPHX7IK8Cbs6Ix5ViJDM/8d2KVH0fVb2Xn1FZfIEh0KJmrpVTbtSla/lnDILRUP6CUNyCkIGFzZEPFS4dG7Gb2kyelfSsIY3uu8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706000174; c=relaxed/simple;
	bh=5OgjiDY8gFojfH9SR9EFMCO+3Tt+IGdV4+q55yO3dXs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I4WUK71oF7w9mOJV5m/7yJoFjSPKoIDmH5irjPPe/cltzIapdX1GIUjZIpgLZ14Sqqou7IDU3kdT8exHPH4gyztz4YqTZ4Th1SccyG7QY/UbEub4jA8HFAK320Re8HF6qqp/DPapcrE5ItYaWNaN5pU0RJH9Y98ADnxjCblNOPQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b=g3DmXNPq; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40ebfb442fbso1649405e9.2
        for <linux-omap@vger.kernel.org>; Tue, 23 Jan 2024 00:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1706000170; x=1706604970; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IaQKDL42oJIcMo8HBXtLjTk+N1bugS7DFO3MX6ryR0M=;
        b=g3DmXNPqqOwAcuLKnapca++SzfZdMpNwVQ/CIPghkITUIQRqKJ2ybZUc+Db8S2HkYB
         8xGjAh9b0jXeTCTp3HtPZWwHptkRZ+ZgLvO5YPTM4IpA1O7Gs6AZLiMsEDZ1/WXUmokr
         Y/MP/BURPWBPGCGSI8QGIi+fFLvh2t/Grpro0jdsrMPYM12T7L8VvSz+9RQxrJsEdaDW
         PnN18tCZyAjKrx+5Z5+e0lrDHV9SSOrbxfLZLczfHYvwPugLW4r1Rg/zm0DwByytGpBc
         LBvjCY/XiNKf9OqFJYIY6iIVsWhBsqx3FhPf5bNIKXmjW7W+BmuBQL0y3LKlVpKiBDFT
         bWBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706000170; x=1706604970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IaQKDL42oJIcMo8HBXtLjTk+N1bugS7DFO3MX6ryR0M=;
        b=anKVxThzVZQMPtw/EdkP4+yg6JkyhkrM4dhqi0cLs1Z9Qa1x9C6gYDhSqnGvZ1368c
         y83fbnV2F5LDXY+0LKjmK4p15jd70U8iQhD2Op160AfjPjW9FCwtuOwBEayNWaDY7BIG
         4FV+GzqioTnJkQqywKwzaVtehTIZGJSMq+w4EMQMm38libr4u0EKvnKHhejsAUZr7r/4
         fKLE6dwIdmoCii+VCPlj3yz/AxkychaQmGRVbxOuTQXGSx2gYg+oXeWoQIR445xiAK4k
         tyOaoNswYDRNEW5rF7lXHiTmFcbrZVoOflOyhP9028GCotCTCLyfJXU6KqFfu8WFsNZq
         HOrQ==
X-Gm-Message-State: AOJu0YyJEYH/nclRMIyHmiNLxcsyJgz9NqfmWPxdLcb+LuClh85YxrUj
	/3xVbI1H79jJ1eIT/47aTUVr5Q1UF9eSyWB0tKjFyjQvJnxerbhay83cdsC7YYiBLEMOC4hVtei
	Y
X-Google-Smtp-Source: AGHT+IHA6O2+0G95pEMDOUvM9MaBlJ/b+zc9aDx30LpMFVUun8NwfoAeefsI+uPoLMuAGco4DkAM8w==
X-Received: by 2002:a05:600c:b98:b0:40e:88b6:4e85 with SMTP id fl24-20020a05600c0b9800b0040e88b64e85mr185487wmb.184.1706000170763;
        Tue, 23 Jan 2024 00:56:10 -0800 (PST)
Received: from P-NTS-Evian.home (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr. [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
        by smtp.gmail.com with ESMTPSA id t18-20020a05600c199200b0040e5951f199sm41404795wmq.34.2024.01.23.00.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 00:56:10 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Romain Naour <romain.naour@skf.com>
Subject: [PATCH v2 3/3] ARM: dts: ti: omap: add missing abb_{mpu,ivahd,dspeve,gpu} unit addresses for dra7 SoC
Date: Tue, 23 Jan 2024 09:55:51 +0100
Message-ID: <20240123085551.733155-3-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240123085551.733155-1-romain.naour@smile.fr>
References: <20240123085551.733155-1-romain.naour@smile.fr>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Romain Naour <romain.naour@skf.com>

abb_{mpu,ivahd,dspeve,gpu} have 'reg' so they must have unit address to fix dtc
W=1 warnings:

  Warning (unit_address_vs_reg): /ocp/regulator-abb-mpu: node has a reg or ranges property, but no unit name
  Warning (unit_address_vs_reg): /ocp/regulator-abb-ivahd: node has a reg or ranges property, but no unit name
  Warning (unit_address_vs_reg): /ocp/regulator-abb-dspeve: node has a reg or ranges property, but no unit name
  Warning (unit_address_vs_reg): /ocp/regulator-abb-gpu: node has a reg or ranges property, but no unit name

Signed-off-by: Romain Naour <romain.naour@skf.com>
---
v2: update commit log
---
 arch/arm/boot/dts/ti/omap/dra7.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/dra7.dtsi b/arch/arm/boot/dts/ti/omap/dra7.dtsi
index 6509c742fb58..565ac7691a2a 100644
--- a/arch/arm/boot/dts/ti/omap/dra7.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dra7.dtsi
@@ -638,7 +638,7 @@ mmu_ipu2: mmu@0 {
 			};
 		};
 
-		abb_mpu: regulator-abb-mpu {
+		abb_mpu: regulator-abb-mpu@4ae07ddc {
 			compatible = "ti,abb-v3";
 			regulator-name = "abb_mpu";
 			#address-cells = <0>;
@@ -671,7 +671,7 @@ abb_mpu: regulator-abb-mpu {
 			>;
 		};
 
-		abb_ivahd: regulator-abb-ivahd {
+		abb_ivahd: regulator-abb-ivahd@4ae07e34 {
 			compatible = "ti,abb-v3";
 			regulator-name = "abb_ivahd";
 			#address-cells = <0>;
@@ -704,7 +704,7 @@ abb_ivahd: regulator-abb-ivahd {
 			>;
 		};
 
-		abb_dspeve: regulator-abb-dspeve {
+		abb_dspeve: regulator-abb-dspeve@4ae07e30 {
 			compatible = "ti,abb-v3";
 			regulator-name = "abb_dspeve";
 			#address-cells = <0>;
@@ -737,7 +737,7 @@ abb_dspeve: regulator-abb-dspeve {
 			>;
 		};
 
-		abb_gpu: regulator-abb-gpu {
+		abb_gpu: regulator-abb-gpu@4ae07de4 {
 			compatible = "ti,abb-v3";
 			regulator-name = "abb_gpu";
 			#address-cells = <0>;
-- 
2.43.0


