Return-Path: <linux-omap+bounces-333-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F118361BE
	for <lists+linux-omap@lfdr.de>; Mon, 22 Jan 2024 12:32:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B83AA1C2352F
	for <lists+linux-omap@lfdr.de>; Mon, 22 Jan 2024 11:32:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7FF113A8E1;
	Mon, 22 Jan 2024 11:21:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b="LfbbG201"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E90F83A8CE
	for <linux-omap@vger.kernel.org>; Mon, 22 Jan 2024 11:20:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705922460; cv=none; b=Zzu/zdRNvF9GKcPrn566ASegMFHEjcXap4zGH1nzluie6dZt6SN+BsU7v8XtrqBiYJH9C5mYS0nVdh/tf6Klp0H2GgG8BMIygFcjxjs1oz+ZiSinKYDjh5nxT+oPWfFArQr6SmW6qhnya2WtLMnzuQ6A1ie8jhVKMWev9S6OieY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705922460; c=relaxed/simple;
	bh=me6p/OKvDglGBw9mvdYiyo+bS5a2wn8BwggaJ28XARw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cI29tzRs1dTNNxb9uG3KCdgwrcHOomr55Yoq1LfV7jjtLZuwmLn1V545G3a2qM1dJYNqEKNvzDPSucDMIVxjIFARUlZDkjcQ7ZwwchEO9cw4RgKrnTtbopVkLvw8IRN5kxC1zZkLlOw6FRAt547+PznwLiiU26JUV3KyycocGWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b=LfbbG201; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-40e913e3f03so38909125e9.3
        for <linux-omap@vger.kernel.org>; Mon, 22 Jan 2024 03:20:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1705922455; x=1706527255; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jlqe1/+a0OpvnCfjOm9NQe3CEd+0psKx+OdGCZhqSIE=;
        b=LfbbG201QJ1UyW31On2FZagYIfrkajQ9a4F2dK22yMOWK9lJ1mJhYR9JoypbFhVcbb
         H+QiJS2PofxRzSLVg0m03JUb0dJHNRS0EVcVbp9geAHC7AUqD5JASYPEw7fyQQcapHGA
         ms5eomunoplJ3CY3DfBqBCqYR7oAGoSg0/bGSh/325GxIj+cdti+Q5Gk73Tqs2+kAyla
         JRMNNby3tjVAxPUwuAwG7+nzLUt4mUD5EbHcFNQ5dmfuNnzLnpJ+1/LDF248Y1c6amps
         CvSle8UhIYiS/T7TfHhIwzGAIQEfd3uugj+tzpkVrYWVW09BNeekcUAJ2awEcwVIGA1k
         OBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705922455; x=1706527255;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jlqe1/+a0OpvnCfjOm9NQe3CEd+0psKx+OdGCZhqSIE=;
        b=s2miTWEZYVCwh14V38qzdBY5pj2K1vGQ2ee37DEt3lC+IA5l/dyybCeCd1lufif7Xs
         cMgfz1yhJNu2lrPKSErG9t3hZ0BPIBHox2+N0VJ4Bx6PGDKrXH1TWXR/tuIOpUrcKsdz
         QU9sr/zhfR2gy319nFS4WMTkGBKHtLPpxKspwfkTpTX0qCUNDLDOgmsi0qNWDshEUTMs
         IBnllOLTYLI2r/1c842ZpgTROAzCyAwyr/TinZVDZE3RXTSQCd0/H1OUiDfkQrde53UK
         IGj/VTsldETC0Jq7aqkYuFjsTmfMqbej78ObNsSfLbgjn0ZHnxCLu8O69d08jaxTPpPC
         dBzA==
X-Gm-Message-State: AOJu0YxBwL8G6EimSWquOECL9SoXPIP0AfRpSdCH9MiMRVu7+dMYg4GA
	gIYDXeBjjuwvRhZE1xlxj2Rnj2Qfc25tuooxViZz2B/hsoUnCuYmYDbfBV36eBybqoKJaAqIakl
	R
X-Google-Smtp-Source: AGHT+IHvfkw2smn9cmfM1OhegGUtFLf/D7oCxwZ1nWibdK7qw3IxMx70WNUOJvwiLIg/QPSO+SNCwg==
X-Received: by 2002:a05:600c:4506:b0:40e:b179:5806 with SMTP id t6-20020a05600c450600b0040eb1795806mr268817wmo.174.1705922455263;
        Mon, 22 Jan 2024 03:20:55 -0800 (PST)
Received: from P-NTS-Evian.home (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr. [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
        by smtp.gmail.com with ESMTPSA id w18-20020a05600c475200b0040d2d33312csm39204614wmo.2.2024.01.22.03.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 03:20:55 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Romain Naour <romain.naour@skf.com>
Subject: [PATCH 1/3] arch/arm/boot/dts/dra7-l4.dtsi: add missing unit addresse
Date: Mon, 22 Jan 2024 12:19:46 +0100
Message-ID: <20240122111948.416444-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Romain Naour <romain.naour@skf.com>

phy_gmii_sel node have 'reg' so it must have unit address.

Fixes:
Warning (unit_address_vs_reg): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/phy-gmii-sel: node has a reg or ranges property, but no unit name

Signed-off-by: Romain Naour <romain.naour@skf.com>
---
 arch/arm/boot/dts/ti/omap/dra7-l4.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi b/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi
index 5733e3a4ea8e..6e67d99832ac 100644
--- a/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dra7-l4.dtsi
@@ -80,7 +80,7 @@ pbias_mmc_reg: pbias_mmc_omap5 {
 						};
 					};
 
-					phy_gmii_sel: phy-gmii-sel {
+					phy_gmii_sel: phy-gmii-sel@554 {
 						compatible = "ti,dra7xx-phy-gmii-sel";
 						reg = <0x554 0x4>;
 						#phy-cells = <1>;
-- 
2.43.0


