Return-Path: <linux-omap+bounces-2248-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2AF985733
	for <lists+linux-omap@lfdr.de>; Wed, 25 Sep 2024 12:31:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C187F1F24D24
	for <lists+linux-omap@lfdr.de>; Wed, 25 Sep 2024 10:31:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AEFB15DBAE;
	Wed, 25 Sep 2024 10:31:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eGX3S6vz"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BE8412D758;
	Wed, 25 Sep 2024 10:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727260294; cv=none; b=DlgOelzXrCBVbrliuLZo8M7y6A+LzJmXgz14fYoEuUxWND+jJn5TotWR9Hsrhpim4RM2edgxTlO1W12mC6htFhhECRbCV2/oDG6r6F6mxhdQvOo/kZLUB0qIwz1KgfQEcZS4vGZcc/+0X3vPkCeph47RQKrQ/xvSAiD7bLoBSrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727260294; c=relaxed/simple;
	bh=qLSJxra/NcqdeZkNSJ0sTyQlAP5XAkHkm+ogyHLRmjo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=YidlUpCkRRru3YlRQF7qpANVlqKb/BQom6i54yBK2s5hbIE0Bl3UFi/lnPwj2UIgG6qu5ZrBR6TNJuQWqE+Lww/1Jl6HUo1CAMbbk63Le29pU6P93zrA/9eg2U/1aXRxAiHA3GLxcMgm2BtvhbuoPO6WutV6ahWtL7vlrvLFA7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eGX3S6vz; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5365b6bd901so7785680e87.2;
        Wed, 25 Sep 2024 03:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727260291; x=1727865091; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jrmf20tbzUs7Mdo75kEoEfr2UsKXf7hiFJq4VlRLhn0=;
        b=eGX3S6vzbJV9dX4Y9Al3oeYsIMdGaZVQ296fyvykJKMzpyFMw0hDe6DUG7+auzGrxq
         6ngxEmxlETV9QX/w6QOMyTZZhBmeZqeTqyLZ88od3ieG5cygf4rKZAkLD2GSJVwCb8KH
         c+tVn38gOsFGA0zMQQfw7gaZq585A/X7A/becmnYjvVyNbIzRWaHGYEy7XjMWK6WfSLt
         5IAsOIUTBJiMbHPdA5o5pkzN/32c0SvqnQkm9yMZsEunUOrPwmTeh48GHP1Oa9x+0sjG
         jf9vb15svpg6wmC5Efc6hDcykV999WXlPPQ15Hw5nnjtXNRkBIqDcMRdIfdvJpbKFTJy
         LCXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727260291; x=1727865091;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jrmf20tbzUs7Mdo75kEoEfr2UsKXf7hiFJq4VlRLhn0=;
        b=Rntcgx1xX3avEEc6akOeUd2N4SF6Y8NylKQSOLvajfWP7TSCwTtOHrm6upGBRBKVVD
         LPKB0GsPkxWU6E2Yc76PqXf7eSzVLajAZY0aBxiUi3jVmFi/OaLnHGg5Ksnpzh5bvgds
         TZz55/GlwWElSfUWcsU9XRPNvCdVaQ3Nx58+YO5MC2An4MxI6ZLZEVtrvDNtlhlhaGXt
         25SKjL5y/PG+UV0d2VEgqjBYPKLViSBixhrePUufkXF6HNfdciYMKxfHJSBThad8vt2g
         dm12cE99W50Su+MKUjIaR3seYdVwlSV0uaoY9teTv1o00dxLHJHXRfxTAPUIujHYtJKG
         2Ajg==
X-Forwarded-Encrypted: i=1; AJvYcCUCVqTrCuvOxwQ2C+NiiIowtlHX0T32bqBjC1nP3t8sP53CWVKcTIQ8NjHS9mmQQRW9/Rlf3DcLc0u80nEn@vger.kernel.org, AJvYcCVFLhLOOyDKGinlb8biG/B5om57f2KZ9e/TCRqcE6YxLRDFuZA4vFwhtg6OUbdf2L5/V1K84N5g9ZZ0@vger.kernel.org
X-Gm-Message-State: AOJu0YxpUMujKGPcZ/buHHe9ystopGMcaUHEv3ahQU8mpMEG41ME9QQ4
	hU/rRdiHlPGnhI/4Ags2VgUkELZgFCXJ9Tmd8LKsAm+vVQSCe/t1WVxCg+XR
X-Google-Smtp-Source: AGHT+IE3m4WD6Sb7jchwSPBjoFhGFf5DaX9VC67Z0LPJbbpbGo7gPCT98ZFbLUYAnM1nnitbvMoW+g==
X-Received: by 2002:a05:6512:ac9:b0:530:e1ee:d95 with SMTP id 2adb3069b0e04-5387048aa6bmr1283273e87.1.1727260290742;
        Wed, 25 Sep 2024 03:31:30 -0700 (PDT)
Received: from [192.168.1.11] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-537a85e0642sm482437e87.27.2024.09.25.03.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 03:31:29 -0700 (PDT)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Date: Wed, 25 Sep 2024 12:31:16 +0200
Subject: [PATCH] ARM: dts: ti: dra7: Remove double include of clock
 bindings
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240925-dra7-v1-1-3fe33a84bcd7@gmail.com>
X-B4-Tracking: v=1; b=H4sIAHTm82YC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDSyNT3ZSiRHPdlLS0NIukZBNLYzNTJaDSgqLUtMwKsDHRsbW1ANACcTN
 WAAAA
X-Change-ID: 20240925-dra7-dfff8bc49365
To: =?utf-8?q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>, 
 Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=858;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=qLSJxra/NcqdeZkNSJ0sTyQlAP5XAkHkm+ogyHLRmjo=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBm8+Z7l+2QvKa6Qn4Q+hyzGmg8OXJCHLxPadgJS
 7RVdxZrW5WJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZvPmewAKCRCIgE5vWV1S
 MpU6EAC7ZK3lmnh3r65YlDaFHPwpYyi+pWIwPYTrobupv/Av5aC1SCcoIW72y9k0toDXjxNdWf2
 GrEYDIRSIxf68g7+cWm2p5C//BgOxK5Unozi+leiAAC3jMcTgALjC9P2KEbITpns1Nrf8pFDcJ4
 M8RYfQBmnjxctkntSP1iJ6Hj5BMAaSVd63jFOeGuoyTsxLSLDeQcG7S3ahIabp8u/BsIBDXkHZG
 5PQbgkLX1oAqGKeC12lbshVnxpYYi7+tolWKKczJT9k6jPUQ2jiJFs0O657mEkbxMLCii/AzmvH
 NNaM90MGkgo+xDR+A6d44p+bb8jHPKiD8/yatKyDdb7ja9GgE7/H6uDWF/HXiwGkuN2eNaoD7wY
 ZRhWPQu9pzlhkKI2nWwMKCuoKh52KOr0y3ZhVjYfDrGp2K+viWkrMyQ5po4lVuaaHcaDmH2zk8U
 sHgNDbt+0CcvrcQl2eOATlLgeJdpRjxqIcjSjU00miDuiWdlRArDSSENKMz2BE66N/l/Gy8fOrj
 SCG295E/+jDAgwXfoD9MP5zd2gWj62cgCed8xi4dTMqh3DliEtgcGjJc0L7WJlM1geu22mr8/Ry
 HBaNnkVKjFdAsst/cVevYQlHTez1VstozEzXMiThHDfhEK5C1/gL1HfPyyWZYBe2Ctk71D+bfu2
 zGy2YgM9Sxp8wjA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

There is no need to include the same file twice.

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
 arch/arm/boot/dts/ti/omap/dra7.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/boot/dts/ti/omap/dra7.dtsi b/arch/arm/boot/dts/ti/omap/dra7.dtsi
index 3f3e52e3b37526eb41db0ea13b4c6c962864519b..ba90e44f83e7571b5686bf47ca3c09472eb555b9 100644
--- a/arch/arm/boot/dts/ti/omap/dra7.dtsi
+++ b/arch/arm/boot/dts/ti/omap/dra7.dtsi
@@ -9,7 +9,6 @@
 #include <dt-bindings/clock/dra7.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/pinctrl/dra.h>
-#include <dt-bindings/clock/dra7.h>
 
 #define MAX_SOURCES 400
 

---
base-commit: 33cc938e65a98f1d29d0a18403dbbee050dcad9a
change-id: 20240925-dra7-dfff8bc49365

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>


