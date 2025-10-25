Return-Path: <linux-omap+bounces-4776-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 63B7DC09ECE
	for <lists+linux-omap@lfdr.de>; Sat, 25 Oct 2025 20:53:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E0DC1B25084
	for <lists+linux-omap@lfdr.de>; Sat, 25 Oct 2025 18:53:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 457F7303A29;
	Sat, 25 Oct 2025 18:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GZO4qKC5"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51728302758
	for <linux-omap@vger.kernel.org>; Sat, 25 Oct 2025 18:52:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761418380; cv=none; b=D36TmiC4ZLhCEKDeHmZBCPm88gOtg1g14fSjMwPrSL9NV77dB5YcGVtOeqUhWgqa5DhSkZmFcVCiLN7MNVgzNGmaxAQOrQjArf88eiVLO5LOVs/E48LTFCHpNwuX9rRFK9KTslZZLlSfu6ZtNVVCUX9baDcSQnfEUb0Tt8GL+V8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761418380; c=relaxed/simple;
	bh=++qhl4KSNWgMDQx7EKaOxJp4oYwDNeFiiI+BE3om2D0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=ItxZJE2XW2undAepGonfqmJ+XFHzDApcfaKjGwfLg1hSQKMvqs/mi5WPQc6V3pBWC8kj88zDR0vRnsBYFqkEJdSr8xOMkaKG8ObJpCf2Do28Fkx/B7kCkBGoJA/h4Q5LaNexKcAaNNXR4C8sP02SVL5UT3C6/fV70VTHDvje7rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GZO4qKC5; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-426f1574a14so2054542f8f.3
        for <linux-omap@vger.kernel.org>; Sat, 25 Oct 2025 11:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761418378; x=1762023178; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rioMXLIytYS2vDdWj/lGi+EnzevNN/0HrVqMOMW5YCw=;
        b=GZO4qKC5D2lL11tAL4EnhVD4WSzMIC0bkomTeb7tAIPui4CRsQ8fEkJWo17jgFtjy8
         he9O7U4Prz0NSOqqPwIjiRbieWPWKwty3Js7j+5siXSGBs7euA97A//cU9s7TDDi5sgs
         zrMUpJ7xy8YJY1ww8mifC03yyrlU+bUg8rhXbMJpkjhnerpiOhEVgmfgsJbQUvLe6PNu
         YX5ouMw/MelavN8XFstKowe3vkaHS/FAn2P79WWA3SO3+1Um5BUzGQethhIV9XfMj93U
         l3eA97iEfAtRMOBNBkge0B8FFSq/JjJlWU2nJliZ+0qB2R1rG9oHru1NQWVuB8UKdmu1
         3+VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761418378; x=1762023178;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rioMXLIytYS2vDdWj/lGi+EnzevNN/0HrVqMOMW5YCw=;
        b=Q2lfAcYsPDHU4fZqSHymazbuAhG7vBtcnpno8OBrRlhaX0hIoUiNgQlvY9n+vFa2HP
         9IRm9Qvzap6vmnJjRE2EnHlyikLvMTDVTzGzhnRRnlycg59uZ5D2GanlNRfuNjBqGGA0
         sgWpITwxlvKR32pJnX0vBM2wL6uz6N+FrEgwN/IOStb2HTp6q0/OZhRM0TI+tYgFbjmc
         vTIXW8uwgfqcpFlao//1Rsb4vEtpd2EfWU+6k6nea6e9r+ZOAwZTazHegyEyW4KOXAV0
         Ke7QZk1F2jlh/t6Q0eMaSQiqvXmOyTYpuaXhRybVa9bt6mlW6/WYZTSm7z9nUn0OnVRY
         WtkA==
X-Forwarded-Encrypted: i=1; AJvYcCW1DwD/KOnRx7uiu41RlcOgg/JkbIgmv7q82D1ZH0Zgkk3Icrwul1euXTciATnOe0bLO+hyWADdrbBs@vger.kernel.org
X-Gm-Message-State: AOJu0YzQ4XTBzL0DHESfxr0pZzOAMlrV1aJ6S+qmo+YN/EqCQhm3Q0L+
	TqbHY1z3s5SzjcTKSXA42f+g3sdmt+YH5Sf39UetOxFzdHHQqqVkn9U0
X-Gm-Gg: ASbGncsOaj9NwQJvh/bZ14Cc7Cmvm9rqU03TZE7oaDQDNxwP+XMNybV4xc0Xks3yA/z
	FkJ4InWLbFU00MXICF8kw0QCiE+a8gx5Z4osa2y+3PXzpCl2EVDDq53RSGjTa+Z9GPaPYN1BdTu
	drj+/JV5XTIuI6kx7Zs3d6roYBF0M0c0YY5wBOu1kVweqNRjuh1UrujBkvr8qOgj4cGQm9E4YCO
	p4TN4FH6p3GboaU0hoSP+8vPGlV2I/QpelhRHrRzHllk5MCFpKjf3YySggeAcvx43LqmyriUB9W
	JYHJgmDrqV6pkdpbeb323G69t7JCVAxFFe7CGk5f+XmH6b2Oxjj4slQ0NKq2vLIQNOKerl3C0JV
	vIZawejZZQCpXNXi8VCwchSab2zYEgRc8Rp6dkZLW4/YcW+UMFSGxa9G6EqRwP7X7eOPl+5DEFK
	UES1LcaAquMTLA3wBkxEwHjnk9PzWOfncviee/TqVMFDhxlGdljblgnNkUhMkjHhXGNhecjUOQQ
	ibqgN9GdFcesYXNb+Iq8DLEIkWQ82WkxSTtMdxa83w=
X-Google-Smtp-Source: AGHT+IFje2vw71LCSYtKx715VjGao8U1JqPzcYNORegl3cXgFepLRp8cL8qgkSfxNKDPItoF8ydqmw==
X-Received: by 2002:a05:6000:24ca:b0:428:3fa7:77ff with SMTP id ffacd0b85a97d-4298a04e599mr7818417f8f.14.1761418377510;
        Sat, 25 Oct 2025 11:52:57 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f39:8b00:d401:6211:9005:e76e? (p200300ea8f398b00d40162119005e76e.dip0.t-ipconnect.de. [2003:ea:8f39:8b00:d401:6211:9005:e76e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952cb55asm4956750f8f.17.2025.10.25.11.52.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Oct 2025 11:52:57 -0700 (PDT)
Message-ID: <6d792b1e-d23d-4b7e-a94f-89c6617b620f@gmail.com>
Date: Sat, 25 Oct 2025 20:52:56 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 net-next 4/4] net: phy: use new iterator
 mdiobus_for_each_phy in mdiobus_prevent_c45_scan
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Clark Wang <xiaoning.wang@nxp.com>, Siddharth Vadapalli
 <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 linux-omap@vger.kernel.org, imx@lists.linux.dev
References: <07fc63e8-53fd-46aa-853e-96187bba9d44@gmail.com>
Content-Language: en-US
In-Reply-To: <07fc63e8-53fd-46aa-853e-96187bba9d44@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Use new iterator mdiobus_for_each_phy() to simplify the code.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/mdio_bus_provider.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/net/phy/mdio_bus_provider.c b/drivers/net/phy/mdio_bus_provider.c
index a2391d4b7..4b0637405 100644
--- a/drivers/net/phy/mdio_bus_provider.c
+++ b/drivers/net/phy/mdio_bus_provider.c
@@ -249,20 +249,15 @@ static int mdiobus_scan_bus_c45(struct mii_bus *bus)
  */
 static bool mdiobus_prevent_c45_scan(struct mii_bus *bus)
 {
-	int i;
+	struct phy_device *phydev;
 
-	for (i = 0; i < PHY_MAX_ADDR; i++) {
-		struct phy_device *phydev;
-		u32 oui;
-
-		phydev = mdiobus_get_phy(bus, i);
-		if (!phydev)
-			continue;
-		oui = phydev->phy_id >> 10;
+	mdiobus_for_each_phy(bus, phydev) {
+		u32 oui = phydev->phy_id >> 10;
 
 		if (oui == MICREL_OUI)
 			return true;
 	}
+
 	return false;
 }
 
-- 
2.51.1




