Return-Path: <linux-omap+bounces-1557-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A97809102EC
	for <lists+linux-omap@lfdr.de>; Thu, 20 Jun 2024 13:35:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8821D1C2160D
	for <lists+linux-omap@lfdr.de>; Thu, 20 Jun 2024 11:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8448D1ABCD3;
	Thu, 20 Jun 2024 11:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ebLIvKuc"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833C11ABCA5
	for <linux-omap@vger.kernel.org>; Thu, 20 Jun 2024 11:35:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718883308; cv=none; b=ZfOZAJtgI2zZ4SpsHV6e/9ZjLXJ9clXQlW7wwwzBCBMxBXM8lr64H852aK4XHWD72DBDeKwIu8UU4OWYL8mRFGg4qo7oibjjHV9b+P+bf3rhdBE3bXUquGJx5NCDkmnPf6EHS2AYGayIzXPHjLdsoZhPLJKa7E7V+TtTzV1j3Hg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718883308; c=relaxed/simple;
	bh=YHKoaWAcJ+E4X2k8gwY2x6AxEmhfp7BeziwiF4EyNK8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=IxdowZJf5X1iYHNARWeuTVGtlH+znSZ5r4BvOLdU493JFtCxw82Fscblc1S1DemFs0L33b07hSFNpJ78ZSgvRdjhvzcDOfpxB3ZrCL+FjXGTWSoi3nwI9TTaqo8FiFW60dDb0X7cVS3Yu9teswF97CD9dtebMwqUJnSSCozukpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ebLIvKuc; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4247f36f689so2327235e9.1
        for <linux-omap@vger.kernel.org>; Thu, 20 Jun 2024 04:35:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1718883304; x=1719488104; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Glq2tMaifuOAdzvop5Ltj2KSs2eGaTbj/dbnplQsCrE=;
        b=ebLIvKucc63hXPA5fGq1RDYhuSO78iZgWRIehIyIyZBZDiAvNy3fa89ebWEem/ijgi
         XlQEGU3tUHs8emv9FCgfAgUoj4dqAjjROgNUVeDoPCpBGk7VNt8b7zvq2ho00Gu+n32b
         9y8aEibQ8r7pR7jaeBebUTAusaMLribWl1KVuFBMwcaCWY8a4XFs4xgDllK8kHRKj/je
         l75T2jw482dbTmlZcaGVYQQ3znl4c/SyfpYUb0LXiNCtryBawbNnA9VqfcoCBglZaF7k
         3sKYLI9Jc5jYglptJYMIjatFD3QtW1fcAjrZTtZHtYBe0h2zE+k732kVKHb7W+J7S4PE
         kq0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718883304; x=1719488104;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Glq2tMaifuOAdzvop5Ltj2KSs2eGaTbj/dbnplQsCrE=;
        b=fRY7WnAoXYl1DJAoL0HZbNki5CoXwcuNptlzqhwujU2C7aBo7Rw/bxKZMvOM/ZMke3
         blVwC8gO8P32EQ/eZtSjIUNAsP9WR29iBS+L3GQIis9Y7TZpxaYoRRXNRwjgHWH74bBj
         rfRXkKUGiCGs4/yGttkYRfPAhw1ABhtxUyhq4HMaXdZ03t8E1gndv8m4ZR2BmX3o4uBA
         VMyAP1J7KUKAuJazfTfR6xx1OVYgyriOZsXYjq7eEXaDc0YwT75YxlFP2wxAnOQ0z4yf
         RYKY8VBVHEc729v4uRXyeRr4fXniZ0z6/n6gKfl/dbFcdff2S2Re26uVvKkIvzjvxt4V
         lecQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwX0hLyePf8IpXbSraof6TZFMaT6ta8j07dp7IwgruHcDMhrQyKoZeQaEO5el/1o6w5g58tuLB0kpJho2cggwkyfaMXrMUiXQ1wg==
X-Gm-Message-State: AOJu0YwfVyqZM+xpHUVTNsxkb1NQbqCosKwGWYE4Vkpnjg9M92H7HWe+
	tBOMmZGvGmtLFROSrQ9BeQKHIJDTsTGuLoPUkOWN35NuEA8I79qt8QQr9JQskGM=
X-Google-Smtp-Source: AGHT+IEC333EUO2VdZZgiMKDT3IOG5Ndy0ctNQWLEfPi1WjOb00373ugVPyZ9Tm+mewPfuUng+mSoQ==
X-Received: by 2002:a05:600c:3587:b0:422:683b:df4d with SMTP id 5b1f17b1804b1-4247507831emr41097855e9.8.1718883303885;
        Thu, 20 Jun 2024 04:35:03 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.137])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42471e6623fsm49708985e9.1.2024.06.20.04.35.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 04:35:03 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 0/7] dt-bindings: i2c: few fixes and cleanups
Date: Thu, 20 Jun 2024 13:34:48 +0200
Message-Id: <20240620-dt-bindings-i2c-clean-v1-0-3a1016a95f9d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANgTdGYC/x3MMQqAMAxA0atIZgM1qINXEYe2iRqQKK2IIN7d4
 viG/x/IklQyDNUDSS7NultBU1cQV2+LoHIxkKPW9eSQTwxqrLZkVIoYN/GGofMuEM8sUaC0R5J
 Z7/87Tu/7AQPg29pnAAAA
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Sergiu Moga <sergiu.moga@microchip.com>, Benson Leung <bleung@chromium.org>, 
 Guenter Roeck <groeck@chromium.org>, Doug Anderson <dianders@chromium.org>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 =?utf-8?q?Ricardo_Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Vignesh R <vigneshr@ti.com>, 
 Kamal Dasu <kamal.dasu@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Wolfram Sang <wsa+renesas@sang-engineering.com>, 
 Chris Brandt <chris.brandt@renesas.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Pierre-Yves MORDRET <pierre-yves.mordret@foss.st.com>
Cc: linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 chrome-platform@lists.linux.dev, linux-tegra@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, linux-omap@vger.kernel.org, 
 Kamal Dasu <kdasu.kdev@gmail.com>, linux-renesas-soc@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, stable@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1821;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=YHKoaWAcJ+E4X2k8gwY2x6AxEmhfp7BeziwiF4EyNK8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmdBPbcGv1s7Mfb86Y03fTN++vt3SrVwitqTmvp
 PjKNhugL8mJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZnQT2wAKCRDBN2bmhouD
 1y3MD/4rvCpsB6iB+y+tU/COMJL7PG9Y86Yyz+XvNfpgy86am4K1TLbZ8Sny/9oXRnShDlLPq/H
 WiNVGeCHtmrCa3ns9Jjbxz52NuAFSa4yTyjWIy3ibTBkbeR1Jr+y86y6Lnv8NvzK44v+XbcI5FM
 ci6uH4KG8b1CwU/1rDDA4gWiT7JPEAQZPkeydJ9KLakahgPTbDOkifM37vjYLxJTJSjwlodAK3r
 uKRtEQxP3pAIeHlAgV3DAi8tKwnkGOOQ3tC9iiiaYTT+CyA9Hn/NQlojUkPMhfS3ye0/HGpmyi5
 livlJ9EPWJC2C7sTZ/4OTHny8BtNU5OE6n1gdOXk8y9ueRkfdABW66IDoOdoIpqoBMcFw+CkYh5
 yyzUAUVllosS7j+wrPK0iy+fAhjPZyvfuss2n+Sf8P+Jx8kghLANqPkAoaLuIqSWLnbFCJoME3d
 JHdsLZlsNq5W0y4cobEBTs6744XtWrd5KZXuYR72LcpvLkJZSJZ4DP7o1vpCTvhzHbbfPTY8Z9e
 tMoCB76WkcZC51GzYi3x9I8y/5hjhOwDIxZr7D7fxKR0fhM+STQZ0LaLlihTtceBvZ5fH96mO5F
 UQM2j755vk4CruBVO2fMSo9ABYwLZaXAtpTv0sWlOH8eVmDRYEKM4kamjLlpi/VHebYYg5nrVlz
 ZconbQdG6ZzLgsA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Few fixes for I2C controller schemas. The third patch (atmel,at91sam)
depends on first, so I suggest not splitting this into fixes branch but
take as is via next branch.

Best regards,
Krzysztof

---
Krzysztof Kozlowski (7):
      dt-bindings: i2c: atmel,at91sam: correct path to i2c-controller schema
      dt-bindings: i2c: google,cros-ec-i2c-tunnel: correct path to i2c-controller schema
      dt-bindings: i2c: atmel,at91sam: drop unneeded address/size-cells
      dt-bindings: i2c: nvidia,tegra20: drop unneeded address/size-cells
      dt-bindings: i2c: samsung,s3c2410: drop unneeded address/size-cells
      dt-bindings: i2c: ti,omap4: reference i2c-controller.yaml schema
      dt-bindings: i2c: adjust indentation in DTS example to coding style

 .../devicetree/bindings/i2c/atmel,at91sam-i2c.yaml |  10 +-
 .../devicetree/bindings/i2c/brcm,brcmstb-i2c.yaml  |  28 +++---
 .../bindings/i2c/google,cros-ec-i2c-tunnel.yaml    |   2 +-
 .../devicetree/bindings/i2c/i2c-demux-pinctrl.yaml | 106 ++++++++++-----------
 .../bindings/i2c/nvidia,tegra20-i2c.yaml           |   6 --
 .../devicetree/bindings/i2c/renesas,iic-emev2.yaml |  14 +--
 .../devicetree/bindings/i2c/renesas,rcar-i2c.yaml  |  20 ++--
 .../devicetree/bindings/i2c/renesas,riic.yaml      |  34 +++----
 .../bindings/i2c/renesas,rmobile-iic.yaml          |  24 ++---
 .../bindings/i2c/samsung,s3c2410-i2c.yaml          |   6 --
 .../devicetree/bindings/i2c/st,stm32-i2c.yaml      |  66 ++++++-------
 .../devicetree/bindings/i2c/ti,omap4-i2c.yaml      |  64 +++++--------
 12 files changed, 174 insertions(+), 206 deletions(-)
---
base-commit: 76db4c64526c5e8ba0f56ad3d890dce8f9b00bbc
change-id: 20240620-dt-bindings-i2c-clean-b5a0b2dfdece

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


