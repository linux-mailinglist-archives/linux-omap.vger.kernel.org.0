Return-Path: <linux-omap+bounces-4745-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 90785C04EC9
	for <lists+linux-omap@lfdr.de>; Fri, 24 Oct 2025 10:03:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5056C401385
	for <lists+linux-omap@lfdr.de>; Fri, 24 Oct 2025 07:57:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B3EF2F7AD7;
	Fri, 24 Oct 2025 07:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZP5q4gcC"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D732F7AB9
	for <linux-omap@vger.kernel.org>; Fri, 24 Oct 2025 07:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761292643; cv=none; b=iLjVgu8pdRe++lzKHzoD9V/VhXb1Ryytj3G89dJNa6t8dOGbszgxTQEhNPODSzTVrAOYvtK5HTpFEGHYpn1ejLudSRxG/KXoc2SsBi9OS93As7pIa3k2XummjU432OtBlBHFZPQ5zPIx3AwHN7a23jxR8JQvarIzD/02hWLRYi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761292643; c=relaxed/simple;
	bh=TJaSEjKE+CKYl2acjXXkTcFRDFXy50ypbA4mzY0NH34=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kJFK7gFTYn/4/8ehPSK8gISeaX+ymrBEv/TiEh0XkVuooJV9/3PuKIGlpU8U9oSA1TlXCVTeKkToB5X4VUI8kiI1gWuKwx0aTRIjGdAeqDdDq9cnwltnBQVnZvTTGhBhWamoLVimKbrQhOnDiWosHoEkY8FOMIP+HyED4HpM31Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZP5q4gcC; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-290aaff555eso17453165ad.2
        for <linux-omap@vger.kernel.org>; Fri, 24 Oct 2025 00:57:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761292640; x=1761897440; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s87dYxMf5XJtMF4s03dPIhXUNwiwE7LkdwCFsT1npMU=;
        b=ZP5q4gcC3LSh6fJQQ85cMsl7bxppXPLHfNYddjsG0af6n4jP0Dc3q8Nfl/2viNFiYa
         O+Etl9RqCFto7gkF1eTpD/hgIsgqVghg5vevZWX991MuDhDI760Si2hxkDfwtUgJvaK3
         BqQsn/4/RY9bEcHl9aM9zaU8Po00rhKhus8ElAV06Dqu1tWePZdrCFbbSf4TBJMvT2Nj
         Rzo0IonbvFZQ/hzSXDXJmCU5aZSm/ZEcikjzIEQaELergGpW/b4LeODvZ+K7U+bLDHiw
         K+y61wf+q1UyHyfySZY4r3mKrKv3dKDm1FxVGkx1+ogDVLH7zsaP5ivJnncNCllelIO7
         2bIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761292640; x=1761897440;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s87dYxMf5XJtMF4s03dPIhXUNwiwE7LkdwCFsT1npMU=;
        b=wjiXmMVdUNU0Nb3UFWpJkRQdaVECKKk4Wz0O2g2wLDAr1xdbtF95SAVQdwpxuupR2p
         5t8fYQP8QRpt9wi7n/6kVXjY3Zp3elZ8hI5Um2JhKgTOsxlCEiAqK3PNlWPbD2A685nl
         AU7w/5lTMtoAx8hsiiX/bGiVSt+61xBnRzOUa9b479w1m9ZvpccLrHyUTwBeZv3LeK5F
         JFmsVQR59ZFm5uamA3fyzpMYmqP3pxF8YW80XIJncvofS0AFOKU0OGnFkxwr9R6uquLG
         5z/pnU4lFB3sSYkZv27Nhqfqva09mBtUHJ4v6Fz09B8Y85SUj42LlSN13MPh0wAJS2N2
         ZNFA==
X-Forwarded-Encrypted: i=1; AJvYcCUc6UPHatHwYb/51Vab0u2hRlfLFGVaFOSBCrl3HJK4EQC8e1nYDmpKt8j5hrXJSqy4kyfKNIa61aho@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3cfhyoE97HjxPO5wbGj8/CijLrfu06WMvnYBCaFsN1mTXeBVd
	6uVEGHPakjzgLlUoLoR/zIoznsbjzcqCC8Go5Fqv4qqZ0MP7Vm0Os5zc3D2PzA==
X-Gm-Gg: ASbGncukNnYXS8IIrPRSry+XJ4pYz59j8HAmN1Tbv9GBn8THENLqfmjgT8yAf1JLZYJ
	upkuRAKgCDb+N2iwU9tau0nX0vsMGKVDU9UFNZUPdvT5w7nzdmD4SlmhgPpNTUJj0Yn7YlvNtPu
	uDaySxL9BqORTdLxAvsAUkpK6lstDF1DI142IDa5xBoq9ar03y1oHHBlSmlX5nxQcbJJgkIgxVn
	A3RRaxBrPYlxPJHaPsagUDSKQQP0CVMymdFL/aNDcjG4FrYhVLDy7qNIbUjqH5rhRu6VDUVETHt
	ZKBv2lfsSRL3BgIR8R5+i4qgJTfnS3/NMsHdOBumSQxLjMuTl5l8lLdVsafXVDtIe3lACMHV97g
	qioLmKyFWoqmrm3K/rvcs+jEiXi1gdfSTqyhV4XGdIEZKdno0sEbaTiNqLy8i5ehmf0gPJLU/aT
	j4N/P78UQLvjTpfEOcNnMhOx4P91RMJzg=
X-Google-Smtp-Source: AGHT+IEdrf9PFaVdu2IVtpCx1gbcOMrajzzsslPU/SnB8ZKTCBPtAF+KqI/4qBnjQdn1ghA3PMmmeA==
X-Received: by 2002:a17:903:8c7:b0:26b:3aab:f6bf with SMTP id d9443c01a7336-290cc2f83fcmr355173915ad.42.1761292640576;
        Fri, 24 Oct 2025 00:57:20 -0700 (PDT)
Received: from Black-Pearl.localdomain ([27.7.191.116])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2946dfd045esm46608205ad.64.2025.10.24.00.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 00:57:20 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Subject: [PATCH v5 0/3] dt-bindings: mmc: ti,omap2430-sdhci: Add json
 schema for the text binding
Date: Fri, 24 Oct 2025 07:57:07 +0000
Message-Id: <20251024-ti-sdhci-omap-v5-0-df5f6f033a38@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFQx+2gC/13QwWoDIRDG8VcJnjtBR121p75H6MG6Y3agmw1rk
 JSw714TShM8fgO//2FuotDKVMT77iZWqlx4ObVh33YiTfF0JOCxbYESrbQqwIWhjFNiWOZ4hiB
 d9sZlZ7UUzZxXynx99A6fbU9cLsv688hXdb/+lVB3papAwRBsGohics5/HOfI3/u0zOJeqvjUQ
 fpeI0hwGND5II3H3Gv9r5VUqte66WC8o4wjWRt6bV51/4Nqms5jGnSM9CW9ftXbtv0CjbTk9mQ
 BAAA=
X-Change-ID: 20250519-ti-sdhci-omap-907f847f7530
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Barker <paul.barker@sancloud.com>, 
 Marc Murphy <marc.murphy@sancloud.com>, Tony Lindgren <tony@atomide.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.14.3

Create a YAML binding for ti,omap2430-sdhci and fix vmmc-supply
property typo for a DTS file.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
Changes in v5:
- Removed "ti,needs-special-reset", "ti,needs-special-hs-handling" and
  "cap-mmc-dual-data-rate" properties from sdhci node and YAML.
- Removed if conditon for the property "ti,needs-special-reset" from YAML.
- Link to v4: https://lore.kernel.org/r/20251019-ti-sdhci-omap-v4-0-fdc63aaeb083@gmail.com

Changes in v4:
- Removed type for the property pinctrl-names.
- Link to v3: https://lore.kernel.org/r/20251011-ti-sdhci-omap-v3-0-9487ef2de559@gmail.com

Changes in v3:
- Reverted the changes on removing ti,needs-special-reset, ti,needs-special-hs-handling
  cap-mmc-dual-data-rate from the DTS.
- Fixed a typo to resolve the errors identified by dtb_check.
- Changed commit message to justify the modified changes.
- Defined if-then statements for compatibles to add required properties.
- Removed "ti-hwmods" property from the YAML.
- Link to v2: https://lore.kernel.org/r/20250908-ti-sdhci-omap-v2-0-72927890482f@gmail.com

Changes in v2:
- Changed MAINTAINERS to "Kishon Vijay Abraham".
- Renamed the YAML file name to "ti,omap2430-sdhci.yaml" from
  "sdhci-omap.yaml".
- Dropped unnecessary or unused properties from DTS and made these
  changes as a seperate commit as there is no user of it.
- Removed previously defined properties like ti,needs-special-reset,
  ti,needs-special-hs-handling and cap-mmc-dual-data-rate from the YAML.
- Changed the commit message to elaborate the reasons for modifications.
- Removed the pattern property for pinctrl and redefined it in a regular format.
- Modified the description of the property "clock-frequency".
- Changed the subject line for the binding patch.
- Link to v1: https://lore.kernel.org/r/20250523-ti-sdhci-omap-v1-1-695c6eeac778@gmail.com

---
Charan Pedumuru (3):
      arm: dts: ti: omap: am335x-pepper: Fix vmmc-supply property typo
      arm: dts: ti: omap: Drop unnecessary properties for SDHCI node
      dt-bindings: mmc: ti,omap2430-sdhci: convert to DT schema

 .../devicetree/bindings/mmc/sdhci-omap.txt         |  43 ------
 .../devicetree/bindings/mmc/ti,omap2430-sdhci.yaml | 169 +++++++++++++++++++++
 arch/arm/boot/dts/ti/omap/am335x-pepper.dts        |   2 +-
 .../ti/omap/am335x-sancloud-bbe-extended-wifi.dts  |   1 -
 arch/arm/boot/dts/ti/omap/am33xx-l4.dtsi           |   2 -
 arch/arm/boot/dts/ti/omap/am33xx.dtsi              |   1 -
 arch/arm/boot/dts/ti/omap/am4372.dtsi              |   1 -
 arch/arm/boot/dts/ti/omap/am437x-l4.dtsi           |   2 -
 arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts  |   2 -
 arch/arm/boot/dts/ti/omap/am57xx-cl-som-am57x.dts  |   1 -
 10 files changed, 170 insertions(+), 54 deletions(-)
---
base-commit: ed61cb3d78d585209ec775933078e268544fe9a4
change-id: 20250519-ti-sdhci-omap-907f847f7530

Best regards,
-- 
Charan Pedumuru <charan.pedumuru@gmail.com>


