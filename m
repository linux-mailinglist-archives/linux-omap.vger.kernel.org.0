Return-Path: <linux-omap+bounces-4663-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B0ABCF26F
	for <lists+linux-omap@lfdr.de>; Sat, 11 Oct 2025 10:44:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id F0F93189E70F
	for <lists+linux-omap@lfdr.de>; Sat, 11 Oct 2025 08:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B0EF423C4F2;
	Sat, 11 Oct 2025 08:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O5DuNRQt"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FBD41DD543
	for <linux-omap@vger.kernel.org>; Sat, 11 Oct 2025 08:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760172239; cv=none; b=WYs+IMNHFKvrTCIbn8poehYe1iKw7OSEmJlyfzNxubfU6gkVISrs9vosznX1gMsLovzpZodSXTtgGdj5o5+/GV6GFnRt+Mgjx1ILc6iXztm+1QOor1ZA4FrD5DkGEa2wbo17pEdCJlLvCPbhKu6hHhNF5aBtOJsbflmTHw85K/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760172239; c=relaxed/simple;
	bh=nIQkVkS00h/ZO5JRy6iR8QPChIVXZPi7LdPe3MlLTBo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uvNQ4tFiRoaneC9hGiMYNzXBddUXKmmEqJijt3mLqTr+Bnfj0DwjW9Y8Szh6pjLdDoiVmR0w1QvwfK18zlxIeh5P0IfkkYnKJBFUqwAnI2cNAU2ubTNtz0dRLvZ9xznwQ59QS2tIxkBXL5L1Xu8ZlV+ghuNskFhdS64ecGxWpLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O5DuNRQt; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-782e93932ffso2616193b3a.3
        for <linux-omap@vger.kernel.org>; Sat, 11 Oct 2025 01:43:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760172233; x=1760777033; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VqCd8yW9EYi9BPy6lU/qWlREPsP6CT/SF7s5Ft32XtM=;
        b=O5DuNRQtwvGH5+igVtg+6vsBk/2wnFLdS5+Ei+kZIGED2MX67fS9D53HV/p/Fi1k+D
         LHiWVtFKetOSTdNIDl2d8IW29fXquialQiDQY7N4tVJM89WryinaHrMBHTILLTek6dkE
         iYk9sqFAhSP1rh8BfFUmPpOqaAuSKSCRjaPdlw/TSRySVgZWQs5nPp3Zusb++XMxef6y
         5r1y13HatTxSup5ukmRwXDxhVi06OUoDJ3mMVi3Y1tzBORjXfAgOYOrYLMAuzTpEiul0
         Pca7FRKmI/kw5ZBvIN1NsPcHRyOCOQpD6sg+tPO+uVKgF+qRXxxLYwqimoLJB07WKsIx
         jpXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760172233; x=1760777033;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VqCd8yW9EYi9BPy6lU/qWlREPsP6CT/SF7s5Ft32XtM=;
        b=NWTbCR1s2hWBWZG0fXkR0dZptE1UXNLx+HvkjmtW6qh73NtUZtaBl29rUdpYlGJdBb
         r5Aqau7axshOz9gGuxKF9nsFFaxuKbZBQi0Myydr2nTRrdhu3Uayxg6bjd8+PIDDya0b
         9kyvG+L4vos/EgGf9WbinwxZUI44TiShBaYHdVW3Z/4P84BZXd3OC9EYZzb98BFClaRX
         CKn+P95C+Xo6aTZ5EeDKtUN+uN1KXm/YVyMqT5E3DXXyOfF3nAAGTnRzaWYfsPHqb/9T
         mehhcdm60UvX2P1jIoK2/G3q5Y4CqLrtb3nbizqGLb7Q4+bAgs4I1m2/+WI3vXtxtp09
         B3XA==
X-Forwarded-Encrypted: i=1; AJvYcCW7SdQmxWvKE/MVbfaQiqCRqaOPVCBDtvXleLf79Nu2o8umxd4R1rrFW7tHbO1Hep9L5OnKfH//fPTZ@vger.kernel.org
X-Gm-Message-State: AOJu0Ywy9pogHhN4fVnjKn2N1R+iamX9tRQX8UbJkVX1Cpvrm2cCAddP
	WhIGuwfyNdVpcsyWLrbinGJtA8HYDsDuYiV/mavqj+fcwTG3S/BdFYf4
X-Gm-Gg: ASbGncs2lxvXMWKO5lqIhqjT0hMRcQmdIlu1fDElMzjvynRvCnzCURooExOcyAih2t7
	rLPHx2jf9sFI1x+vA1webFGHNWJqP+9iaJcNk/Fpwg2/HD/d8KebnW3lvoanIxHsQjbD+Fgo/0z
	/0E7ZnNJoH1XjYiiApmhTFONQMakzwt7SnPYiy8mEgKiopenCz3Co2dnnweHRUeXbeVWEe3wWNE
	4DHCdEh/kv6HteXg50WvzmJnlFGqa7oc+scj6a0NjJgbABHUV7VTfAFPjdZRcVM6aejmUnFU6PY
	pH5max1MHc4QcBkIxUGM+Tg4ZZAfq9TjR9JDTwCo1S1WuiFKKQM/j9naXgQYi3zi5CyJMwHTVlk
	eO+duVnw8UV4Yq5xNxSqROToDrv6DZaOdtqef7PVy9+XdwFNyZtawe4jDTqPPKSxcGRVm
X-Google-Smtp-Source: AGHT+IGTnRLwiun6qqczOPoNp2kFINO5SVtG6H2filW9Od839rhihT2CIxXWcMLbKI3mPbR5HTEQEg==
X-Received: by 2002:a05:6a20:939e:b0:2fb:add5:5583 with SMTP id adf61e73a8af0-32da8133300mr20569059637.24.1760172233455;
        Sat, 11 Oct 2025 01:43:53 -0700 (PDT)
Received: from Black-Pearl.localdomain ([157.50.164.155])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7992d09659esm5401090b3a.45.2025.10.11.01.43.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Oct 2025 01:43:53 -0700 (PDT)
From: Charan Pedumuru <charan.pedumuru@gmail.com>
Subject: [PATCH v3 0/2] dt-bindings: mmc: ti,omap2430-sdhci: Add json
 schema for the text binding
Date: Sat, 11 Oct 2025 08:40:22 +0000
Message-Id: <20251011-ti-sdhci-omap-v3-0-9487ef2de559@gmail.com>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPYX6mgC/13M0QqDIBiG4VsZHu8fapm6o93H2IGY1g8rQ0M2o
 nufxWCjw++D91lIchFdItfTQqLLmDCMZVTnE7G9GTsH2JZNOOWCCqZhRkhtbxHCYCbQVHpVSy9
 FRUlppug8vnbv/ii7xzSH+N75zLb3K/HqIGUGDBotbOOcsVKqWzcYfF5sGMgmZf6rNVXHmgMFy
 TWXStNacf9fr+v6AddTdwzoAAAA
X-Change-ID: 20250519-ti-sdhci-omap-907f847f7530
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Barker <paul.barker@sancloud.com>, 
 Marc Murphy <marc.murphy@sancloud.com>, Tony Lindgren <tony@atomide.com>, 
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, 
 Charan Pedumuru <charan.pedumuru@gmail.com>
X-Mailer: b4 0.14.2

Create a YAML binding for ti,omap2430-sdhci and fix vmmc-supply
property typo for a DTS file.

Signed-off-by: Charan Pedumuru <charan.pedumuru@gmail.com>
---
Note: The property "ti,needs-special-reset" was not removed from DTS cause it will
      disrupt the compilation for other compatibles as the node &mmc is used for all
      compatibles for some DTS files.

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
Charan Pedumuru (2):
      arm: dts: ti: omap: am335x-pepper: Fix vmmc-supply property typo
      dt-bindings: mmc: ti,omap2430-sdhci: convert to DT schema

 .../devicetree/bindings/mmc/sdhci-omap.txt         |  43 -----
 .../devicetree/bindings/mmc/ti,omap2430-sdhci.yaml | 202 +++++++++++++++++++++
 arch/arm/boot/dts/ti/omap/am335x-pepper.dts        |   2 +-
 3 files changed, 203 insertions(+), 44 deletions(-)
---
base-commit: ed61cb3d78d585209ec775933078e268544fe9a4
change-id: 20250519-ti-sdhci-omap-907f847f7530

Best regards,
-- 
Charan Pedumuru <charan.pedumuru@gmail.com>


