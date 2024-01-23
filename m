Return-Path: <linux-omap+bounces-347-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DFAB8389C1
	for <lists+linux-omap@lfdr.de>; Tue, 23 Jan 2024 09:56:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 43C241F26A8C
	for <lists+linux-omap@lfdr.de>; Tue, 23 Jan 2024 08:56:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79D7A5811E;
	Tue, 23 Jan 2024 08:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b="lRH3PTy8"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BD556B9C
	for <linux-omap@vger.kernel.org>; Tue, 23 Jan 2024 08:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706000174; cv=none; b=dd3MvvsLBVT2SvV5lOwYvU56A/iTKvicsT3795fRzHMI9+LfmgqY/zVrQnJwKtCkJjeLTajTjFORWgcXesBC1PrhYe27qr2kOwmLiyALrwH0nt87LUhvNI9ZGY0x5LaoZgMcQMSJW+rWdeNfEwu7NIOn+HkY/fK9Evp58GzZfrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706000174; c=relaxed/simple;
	bh=UbZpuuG4uka77rC7oYur/G0F1HHDFkfKHzQhKOVf/Hs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cnuuva3ZuSkwraLYw3eFrCgwEtZWPDVabJn1TTcvpSSUkqN1lzdW000q4EgFYyP59vH84SJ33FGMneN9xXm4zG0Qu2UrHhdPg6ZEymp/AFvMfzVKeSiu6cgzNyp1kAQL7aZpQ78a/BD9pfWpTCZHzsXoy66AjzJ5qSkqtCjYPRA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (2048-bit key) header.d=smile-fr.20230601.gappssmtp.com header.i=@smile-fr.20230601.gappssmtp.com header.b=lRH3PTy8; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-337d6d7fbd5so2927705f8f.0
        for <linux-omap@vger.kernel.org>; Tue, 23 Jan 2024 00:56:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20230601.gappssmtp.com; s=20230601; t=1706000169; x=1706604969; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wFcIZVRBuGmI6oo+XAGNh6fVSdHoDJwDRRf+EtGPyVM=;
        b=lRH3PTy8k+l8l7gmFe/HCiJLIgzULXbVACc46ii06L+nrkO2eaU+oJyTBVyBsRFjoM
         hmTn4NMdeg5+W3Pe2MEI4rE3it5Niv7Kuy/6ILf2NXH1wEFEXe+AjYtXS7lSXhP9/p1o
         q7xT4OpmCPt5YZlGxOsgtZQaU6m3Uhi/5CdGsv4GBLCIbxc79Z8V8jIN/2WJfnxZaBqM
         BNGVN/SJ5QJmtLOKnuMMKlyakdtwYEXV8tlSlUHpuS10TjahuFBvT2thXQSEVXTOcHaz
         kqoTF+stlfd+DqxlUxk1TU0rm8XwY5yAbD8AmDbkWJ1p7eU0Ekay7YlfADYpnZ2lxRoD
         m6Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706000169; x=1706604969;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wFcIZVRBuGmI6oo+XAGNh6fVSdHoDJwDRRf+EtGPyVM=;
        b=fshXk10LAVs27dU1jUDBQ6eDpbDwUpbbf6K/tx1FXMcKEgOGBadlx/2wDSlp8A0WFd
         5YNcVnj7VeuW0xlm1Ak4gDp1A/SA+kKNQOT6Ffymfxtuzl5Ur1Vkjd1wb3KZBOccm8dZ
         wvraFnvPXzxgc3dzxNmjGiwETVIEydh0d5FrmQI0wawDtVxgN28RXTeQ353XK5hqXb++
         YeDK3jAFCL4G5zpkfeOMQ2JYmfk0AVuBC2JpgEBBVEM8eq8Ja0+TgbwNZCFqA8j157Oq
         VO1jgfC+gM9Ggu3PpWCFFyUm2mK3C3jCUWLZYCcWkQyBJi8U7tmOS+8IBUY8S072KFO6
         3rqA==
X-Gm-Message-State: AOJu0Yw04jjiEG3aYeBNdCgYXfnc/QYzFFm6BA2orWRq0dVxOh3sq8TV
	sD2w4qNAJ0y/g8NfOTip7LC3AOn3OFVYDfwHDILJ7fgnPlAEmBKLRMSFmjZ+NEDwblpTDE64qVb
	5
X-Google-Smtp-Source: AGHT+IFpjN1wc+0DKy9J5c6zDOYRsqHh1e9XHuY73Fg02jNGapVorBgxhWZTdv4ZjWjTdGL5rQ7OEA==
X-Received: by 2002:a05:600c:5247:b0:40c:269c:518f with SMTP id fc7-20020a05600c524700b0040c269c518fmr271293wmb.115.1706000169666;
        Tue, 23 Jan 2024 00:56:09 -0800 (PST)
Received: from P-NTS-Evian.home (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr. [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
        by smtp.gmail.com with ESMTPSA id t18-20020a05600c199200b0040e5951f199sm41404795wmq.34.2024.01.23.00.56.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 00:56:09 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: linux-omap@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: =?UTF-8?q?Beno=C3=AEt=20Cousson?= <bcousson@baylibre.com>,
	Tony Lindgren <tony@atomide.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Romain Naour <romain.naour@skf.com>
Subject: [PATCH v2 1/3] ARM: dts: ti: omap: add missing phy_gmii_sel unit address for dra7 SoC
Date: Tue, 23 Jan 2024 09:55:49 +0100
Message-ID: <20240123085551.733155-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Romain Naour <romain.naour@skf.com>

phy_gmii_sel node have 'reg' so it must have unit address to fix dtc
W=1 warnings:

  Warning (unit_address_vs_reg): /ocp/interconnect@4a000000/segment@0/target-module@2000/scm@0/scm_conf@0/phy-gmii-sel: node has a reg or ranges property, but no unit name

Signed-off-by: Romain Naour <romain.naour@skf.com>
---
v2: update commit log
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


