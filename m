Return-Path: <linux-omap+bounces-3043-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A13CA07324
	for <lists+linux-omap@lfdr.de>; Thu,  9 Jan 2025 11:28:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 48D61168CD1
	for <lists+linux-omap@lfdr.de>; Thu,  9 Jan 2025 10:28:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D867B2163AE;
	Thu,  9 Jan 2025 10:26:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b="jLd4bilF"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E389215F64
	for <linux-omap@vger.kernel.org>; Thu,  9 Jan 2025 10:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736418395; cv=none; b=JS7I7YyuLCvP2AWjX/al6h39Yh0t2hwWvQrur9tjAjmDbjh6Iyo7055kU8CToyws3+MPFzlvVWmF6NL0za7KKBU2XZ8tGZXC6z79WD4P/j+gsA7kyY52LTmGEyEoNqtI4sI6dzG9evkWBh2VwNrnfU5ryRT7fK7+zyK/hRvX+js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736418395; c=relaxed/simple;
	bh=s1Vp0vE+JZuIfFByjDarMB20Md4OazyQnGOq1VFGBRw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bspUSjPi0gDGJDv9iPXGBCGjAeh3c3LH4+3JbGwMnLEnXtr6n3noMLX+uVxWX4Gt8QSucZQvOSUYBs3Ooef7StrT08HWHneFAyGsLISdylhHpuAVfudtUNg0ZS1NnZebNYmMOThO+VW0BxGZ7uEkI2F/ecqee8oMjSUckHCcorg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr; spf=pass smtp.mailfrom=smile.fr; dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr header.b=jLd4bilF; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=smile.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=smile.fr
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-385deda28b3so463825f8f.0
        for <linux-omap@vger.kernel.org>; Thu, 09 Jan 2025 02:26:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1736418392; x=1737023192; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+OViREEuGAiMfB4rZqhC91yfl47kcGwQZ64TnKipNok=;
        b=jLd4bilFG18Rtmmnc3A6A72pRSbpfxHqA5jDdhRduhZeQvP0JKplq98fVtEAQDE6Xv
         DF8UOnmtw9v2I5Lkzyjxk54dAR1ox0J3HoEodFozxJ90QXHM8PnzXqHEu4mC6/57rlYZ
         rITxHp2aJY9Y9HeuYxItw8HZTR9s69CA+UIls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736418392; x=1737023192;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+OViREEuGAiMfB4rZqhC91yfl47kcGwQZ64TnKipNok=;
        b=e0C4J2xX7Gc65hCEjwVqDpXHlPokVitC1JqH65p7exZ9Q2+Wqp0ggPHJIreNhd0uw9
         KMP6jnIv9e0w71N1e+5e77onsdt59QCn9JwsbwFYj7xAjhH0yp3ByYxawp8ABWXREyAO
         4WAmACrK0D2xmUGrnqgNxHqqDKqaulT/AyY48briuHwLdzLt9sOuIdB7h2fyRJNro+XP
         Oivemj9WqF0Nor0ph8WN2kbapt/OCBpMDMtJHF6OlFNES5Hwt/CCcHXQaLHlikyDTPIN
         CCTy3YcAIpkmtMHIcd5Mba/yNGKFI/jGDSiPBox5y1k3Xq0g5aH5IlT9dXZU3UdenO2G
         AwrA==
X-Forwarded-Encrypted: i=1; AJvYcCUVFBV9XR2ru1kL/LjG31SnzreiuUjF3ER+T7sNm18rN4VnFM0U/PdEIRbcu/qPkiT8TN/+mX+hUYIO@vger.kernel.org
X-Gm-Message-State: AOJu0YwcxTiyVS93eTOn+4k4Gh7sttCavIl+cuBk/weGVysjTY3EID5i
	JA8SmBBM0t+gzQuwjneK3e0ww5NCmGgfsEFlUWr+5ncXmIvkD+8lNTCBKsDpJqI=
X-Gm-Gg: ASbGncsUq9K7juyNmY/YXkpEZvaDmL2pJPtb8hgarKIb2ZorpqQkdQdfWeixzneJuty
	Ve8jBVtPq67qrZnULf05FEIpSu2sgDuqSVBOUTtbCwiYhlVQLfgdWKWdjWMlvxObkiFV/WLpcL/
	d/sjqpa3bkUHjCH+am79QzujoA2GMlD+RVNNS/Yrvhkn71snLufe1YvGxoKBKkns9e7vJ+02M4i
	StPI3Gt5TMoV9rAmS7EcHFIt7Dv1SwaAPnX9zqMd62p+QZGBhgTcvLXpfdAiYOn2p+LfHLPNGdF
	dLS2I1EZ8na0+49BhiCAjoq+7QNPU5y4oVu/9R8KBoZaJml9o5zsag==
X-Google-Smtp-Source: AGHT+IGaEL7/48iU7IgiC7jE7AFgeQlcCSooxUQXpvnoV1/pZwI5FcyPuiKT2LVnasDagT56K+Pa0w==
X-Received: by 2002:a5d:5f82:0:b0:385:e1a8:e28e with SMTP id ffacd0b85a97d-38a872faed5mr5844671f8f.10.1736418391609;
        Thu, 09 Jan 2025 02:26:31 -0800 (PST)
Received: from P-NTS-Evian.home (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr. [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e38d013sm1435595f8f.58.2025.01.09.02.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 02:26:31 -0800 (PST)
From: Romain Naour <romain.naour@smile.fr>
To: devicetree@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	robh@kernel.org,
	kristo@kernel.org,
	vigneshr@ti.com,
	nm@ti.com,
	afd@ti.com,
	Romain Naour <romain.naour@skf.com>
Subject: [PATCH v4 1/2] dt-bindings: mfd: syscon: Add ti,j721e-acspcie-proxy-ctrl compatible
Date: Thu,  9 Jan 2025 11:26:26 +0100
Message-ID: <20250109102627.1366753-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Romain Naour <romain.naour@skf.com>

The ACSPCIE_PROXY_CTRL registers within the CTRL_MMR space of TI's J721e
SoC are used to drive the reference clock to the PCIe Endpoint device via
the PAD IO Buffers. Add the compatible for allowing the PCIe driver to
obtain the regmap for the ACSPCIE_CTRL register within the System
Controller device-tree node in order to enable the PAD IO Buffers.

The Technical Reference Manual for J721e SoC with details of the
ASCPCIE_CTRL registers is available at:
https://www.ti.com/lit/zip/spruil1

Signed-off-by: Romain Naour <romain.naour@skf.com>
---
v4: Add missing change in the second list (From Andrew Davis) [1]
  Rebase after the ti,j784s4-acspcie-proxy-ctrl compatible fix [2]
  [1] https://lore.kernel.org/linux-devicetree/20250103174524.28768-1-afd@ti.com/
  [2] https://lore.kernel.org/linux-devicetree/20250103174524.28768-2-afd@ti.com/

v3: new commit
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 0e68c69e7bc9..1f3e67f432e7 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -115,6 +115,7 @@ select:
           - ti,am625-dss-oldi-io-ctrl
           - ti,am62p-cpsw-mac-efuse
           - ti,am654-dss-oldi-io-ctrl
+          - ti,j721e-acspcie-proxy-ctrl
           - ti,j784s4-acspcie-proxy-ctrl
           - ti,j784s4-pcie-ctrl
           - ti,keystone-pllctrl
@@ -213,6 +214,7 @@ properties:
           - ti,am625-dss-oldi-io-ctrl
           - ti,am62p-cpsw-mac-efuse
           - ti,am654-dss-oldi-io-ctrl
+          - ti,j721e-acspcie-proxy-ctrl
           - ti,j784s4-acspcie-proxy-ctrl
           - ti,j784s4-pcie-ctrl
           - ti,keystone-pllctrl
-- 
2.47.1


