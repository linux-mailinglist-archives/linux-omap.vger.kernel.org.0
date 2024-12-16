Return-Path: <linux-omap+bounces-2831-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABE19F3CDD
	for <lists+linux-omap@lfdr.de>; Mon, 16 Dec 2024 22:33:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5F89A16B489
	for <lists+linux-omap@lfdr.de>; Mon, 16 Dec 2024 21:33:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77CD71D54C0;
	Mon, 16 Dec 2024 21:33:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h+vSgEKw"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8169313211A;
	Mon, 16 Dec 2024 21:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734384807; cv=none; b=EEfa4m/e/gJQwRcPRmcXe/neU8l4Vsed7WuMfGGPN0zoNi5Fk1dcWwIboV4bJenA2KpDwd5tHxRAt0c/KqAbW0g1yhGEHIRZ4p6TEQmUQel5C1QqZKDVB0eMKyroLttSMMyr+vcgwqVPR2u0woCk0SjyDAVy0gbIHtya7ohh15E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734384807; c=relaxed/simple;
	bh=WeSJYYEJamXFZuAp5NptMjVCmKp6AIv7xjF54IzOwbI=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=uPilhiTVwTtpb2HAni3PL2V8fhXjO5D1RuDbLSbNXHU1tHQYGCey8u1LVLzXpS5O9fVg6tGIKwwK/WggGB9wVhC0sdORfIUgH/KkYPf6lI7wpF0bDEIo8zbt0g19T8Ytbu4KV4kgN4eZtsXGILkOntjbKVTl2aDqKteo9jTlKKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h+vSgEKw; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aa66c1345caso175085466b.3;
        Mon, 16 Dec 2024 13:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734384804; x=1734989604; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=U7e10MhhpCSq1BTGXAoLHau/IyiGxwYN2adRjiojyEc=;
        b=h+vSgEKwpb8Fi0uUYccHCzr0jd0UKhT7S9+ruocgFuFhA1gGUBwIupKI6K22d1oZb4
         UG2KUS+j5TItQnJmNQgl6Q5NWx6ArTlFTpTAtumPdyDAd3rxyn10IVciM5h4aY5WctAQ
         uTm8FT5tMEMZab2FKu4Pw7+yHHCL1THKh04py1wW5DDA8jm3b4gEeXQwkGEjh4ER4PZo
         GApt8cyLM5DfLoRoX5jg5XTRDqX+lnW/Ei1Ueafkks2z4vRc6YmMSl/dJD14aFg+HW00
         0aaAzo2zSVhGRwxbQDk0i+nGjlRo7psRrN29Ne7fzlq+Q1x8aQnwrC48Yuwu6NwlqBBZ
         6yZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734384804; x=1734989604;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U7e10MhhpCSq1BTGXAoLHau/IyiGxwYN2adRjiojyEc=;
        b=e8Un98OavdN+7CtseOusxptvw9NGbSgZ/k+6dkZTqlZDiYN8SOFpYE4BNKDeWmi6Oi
         3m8uKvXhVTkq5WMO83vznAO4YRd51JGYagS+gloj7SjBfJj+KiPq6mVmulwllxIwWinD
         1GhJ3J7P/mcmgTtYB3Y7UcOCs91RZkXdZ9sBs99hH2Uz8hciAYIh9Vw394Q3+jyjqg6k
         f9xbIkWLbppZfQEqx/dTCnndUjqn80TS0ri+rabj2iAEEDyw/perZecCx96gkITBV1bP
         is0k8Igi7cHXJDHMlZ3qjcTPiZHNwwybAvAIEJb7XWynJGrpYvbe8T0u03bFQUx25/N5
         kbyA==
X-Forwarded-Encrypted: i=1; AJvYcCVjAzMQ0e4rBaKYlopxZDFFSEEUc21QjoN0YWhBJ5r2UXL+Rph+LfnJpASKIdHAhBinjysnYUmv@vger.kernel.org, AJvYcCX6Nv2NPOY+7EFQeViyd6NM+Fv+O0w9kZ/4Sa/evQyE4q+2OmVsP0xHIiSwaSBKTD9GBFsvYgMprYOk@vger.kernel.org
X-Gm-Message-State: AOJu0YyOEVHz2/z6aRIJulj72IdW3I6zLy/8zRqkGFVGZPfCeK3zqeEL
	5mzQXlDXKOhlNT1Oo0H2auOW2UWhQ7CaqI6F9q6fIOgqJcrolf89
X-Gm-Gg: ASbGncva069AJvU6Go5EF6+DO2ovyqMz+G74SDvammEutUITVhZLNzWu8IwVFDiOOvb
	WYMOTqQBK6SSxHGid+DTVSkvW1z7nt3UXRKHgk980N2mlFOBurknkbeB0EhYtpJ37PotYd15TNq
	tPgzlynU2Q/cagWkThq/A4I0jBDWNIrrTNzUvTuwgd0aqVKbPiUThmMda1MzCeoF/0I3VRK15vh
	iBRZ7chWo2xzdT4GQXvmMDoDDH9ZGLoGKGSMjCKD0z89Gwyj5ko3rHTEPerFu9zuQ6on0vmHd7l
	LbBt7Y1ZhnR6hNsQpm4Tq5uXjzPdBsF2RjsCJG83VljHqNdxfYTiM7KaahQj8LIIPPdbHPT1eO2
	82JjJJAS1Szs2+RPaQa3uvNHrCxvbEZ+9Oqnq7xq+HCCzCDvG
X-Google-Smtp-Source: AGHT+IHFu+toXmaFZ5AkIdQ/2qGfvYOWXKiO1658/O4ok9zvAvIeRqr7Z8J9NCYGc6e6ZeQWmudOhg==
X-Received: by 2002:a17:907:3d8f:b0:aa6:3223:19e6 with SMTP id a640c23a62f3a-aab77eda8e7mr1468655266b.60.1734384803708;
        Mon, 16 Dec 2024 13:33:23 -0800 (PST)
Received: from ?IPV6:2a02:3100:a874:3500:f430:df67:6714:d87b? (dynamic-2a02-3100-a874-3500-f430-df67-6714-d87b.310.pool.telefonica.de. [2a02:3100:a874:3500:f430:df67:6714:d87b])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aab9608834fsm370708766b.86.2024.12.16.13.33.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 13:33:22 -0800 (PST)
Message-ID: <4a3f337e-cb76-46cc-bacb-c2ed8160619c@gmail.com>
Date: Mon, 16 Dec 2024 22:33:21 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next 3/3] ARM: dts: ti/omap: remove eee-broken properties
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Tony Lindgren <tony@atomide.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Russell King - ARM Linux <linux@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 David Miller <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Simon Horman <horms@kernel.org>
Cc: linux-omap@vger.kernel.org,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
References: <5139374e-7151-4d0d-8ba9-9ec3d9b52f67@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <5139374e-7151-4d0d-8ba9-9ec3d9b52f67@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Now that the cpsw(-new) MAC driver disables PHY EEE advertisement,
we can remove the eee-broken-xxx workaround.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi      | 2 --
 arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts | 1 -
 arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts | 2 --
 3 files changed, 5 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi b/arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi
index ae2e8dffb..e69e5e817 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi
+++ b/arch/arm/boot/dts/ti/omap/am335x-baltos.dtsi
@@ -354,8 +354,6 @@ &davinci_mdio_sw {
 
 	phy1: ethernet-phy@1 {
 		reg = <7>;
-		eee-broken-100tx;
-		eee-broken-1000t;
 	};
 };
 
diff --git a/arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts b/arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts
index fd91a3c01..8b86918bd 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dts
@@ -96,7 +96,6 @@ &cpsw_port2 {
 &davinci_mdio_sw {
 	phy1: ethernet-phy@6 {
 		reg = <6>;
-		eee-broken-1000t;
 	};
 };
 
diff --git a/arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts b/arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts
index e6a18954e..e8007a8fd 100644
--- a/arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts
+++ b/arch/arm/boot/dts/ti/omap/am5729-beagleboneai.dts
@@ -492,8 +492,6 @@ &davinci_mdio_sw {
 
 	phy0: ethernet-phy@4 {
 		reg = <4>;
-		eee-broken-100tx;
-		eee-broken-1000t;
 	};
 };
 
-- 
2.47.1



