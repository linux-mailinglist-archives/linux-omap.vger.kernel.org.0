Return-Path: <linux-omap+bounces-4753-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id EB955C080BC
	for <lists+linux-omap@lfdr.de>; Fri, 24 Oct 2025 22:24:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B9FFE1C26A21
	for <lists+linux-omap@lfdr.de>; Fri, 24 Oct 2025 20:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 305072F1FD2;
	Fri, 24 Oct 2025 20:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HoZxjjrC"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347A61F5846
	for <linux-omap@vger.kernel.org>; Fri, 24 Oct 2025 20:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761337471; cv=none; b=E+Gct5kbHi59iX8avhGYFOr17zy9vnwfNjxEBelJ5+sN8Zeiay0v7+14BZK/i+Ezz/wSehT0/d9dFbmFogpZKGEwpfmPZWVhgsbDQEvHP+jJQvrskQ4AOEi3JEqSnj5TN7R2+jj5FWbtHocObYdBeJ6tJOQ+D3QjkIIK7lNEJ+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761337471; c=relaxed/simple;
	bh=++qhl4KSNWgMDQx7EKaOxJp4oYwDNeFiiI+BE3om2D0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=CZ/d+GlcoINyaAs1cLdt0xyzyTZMDTcvyMdYx3HjeSVOumv92mcr9n0+r2QinCNMCPUV7msof0xPaywaOSwu2lF1n91iw9GU8V0HmlMCZ3PUS+HpjUz1LiKPVSQZfJoNPrIJtd8CclLhDc91Ug89DiRTH39GdoPRrBZ1mQxH+QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HoZxjjrC; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-475dab5a5acso2061235e9.0
        for <linux-omap@vger.kernel.org>; Fri, 24 Oct 2025 13:24:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761337468; x=1761942268; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=rioMXLIytYS2vDdWj/lGi+EnzevNN/0HrVqMOMW5YCw=;
        b=HoZxjjrCR+7CJzkNnwTA8g6TIF9/or+lRBPPJ3DdO/eQh12XEJLX0aNe4dmdqV48Dq
         MHSc2+Y7Y/wR+pFhhWPg+8G1V7eIFPDggN2W582d3Z5O++2kh4+dCIEQqv9yCj6YpPdl
         sGncTEppX+yigvmnNe+3QKDDQTwkxCMwXlKMJBF60GJ3bbozetiDd87c6koGS7rL6qd4
         noMu2qf1z0gNBFCCy6eS68W9BahcubBbjGC1GGiSM3tnMlG5AIIu/J0o6e5CQ4nE0mth
         YETfqz1136XKxSWjLKVd9aBniYQUUVunuRGcD1F9OlF1oiaM0hffi2qtPb8oHoZmDYHB
         pPyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761337468; x=1761942268;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rioMXLIytYS2vDdWj/lGi+EnzevNN/0HrVqMOMW5YCw=;
        b=tCuSOvz+rKHNmHBHofDPRLHBPNkyxagwg+gu1jFfEEz2XCtGq6My7phAE+7PoCyvHd
         KGhxWMLMoYofyEhNqupkVDjja56H0wHau673x+V1nqC40CDEBcE7rJi/ICTlvrlDlgUs
         f6wASm8izuK1a6Z09ojCRQhmZuuV6dKIa8neL174y781e+6mpzf5M4qfxT0YN4b44GRJ
         Wx57iZPqqAzlh8dN5g2BMQ75uc4vTKD1d44tPC96uR9NVgjyTAVX1nzyuufCScxbE+94
         Rc0DhzBsC/B0O/v9atQrG8DmQWo+UUjjidCYIIs25Sbx0zEjrOznM/GRPO9u+xoo9YJ8
         Pd6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUdsHiZN45FnTeesO647nOYOlxMCHkto5P1+F7aKBiFX1Q75SkWZHUvLnFkegAoibCHdqNeXZc+LHh5@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0Sf0VuET+MRvLmpwUqW/uatIW3EtuqKBmKTBC46HgtUA+av/9
	AmbUk6NkCfti187ZY3DxMQhV1dM/UQctzGt2cOqxh8CPaS8rswLsJr8w
X-Gm-Gg: ASbGncul/8p0tS1Swrg7L4VtFoeWYMsqd9EXX4cmM9Gvspg7t6TAWhLNiDWdYWpFPNA
	fitkdhdrB89inNeKCzJ+Fcq4y3O+l8DbweARk0kAjnApuUe+RrtbGf8YDWc0zyMT6jHNIqZXwl/
	RgZX5zEFaOxRO6xr7PlQA8mqQVNaV1oNaUAiN/z24z0TWG8NMaivlnXQ3ZxEtU075PtUe51tSLO
	4XZq3WZLLQRoV9jZaWlbd44Gm3jDMiXIYr9p5uPegaYjJnH/6XNZl4vZEpx3s7DlXav9q9Qylmt
	P4ViX47vySB0/XE3voxsM4iZsusJhRdgb/jJTkUHxOaODD89ETkO6TCk2sR1nv990YbR0+0je2Y
	1jBKHyGvOBxaxlsrz+R+LE2cU/aABAvM9WUx1Erky2TTpwuZLyKKdfuLCRoLQUS8CnjIbJgqZvN
	hV0lZMc72bZJ3FTJwsoj/MIJ+jmDFdFLDqZThAl1KcDUrOiO+URnsQTed1uoUs3av12WecswYV7
	+Jj6Ze/44BhKjYLlpp3dBrmawbqWl0iBnVi5YCkm9nHK2cEuTEgug==
X-Google-Smtp-Source: AGHT+IFvkMy9ImiLMjxrS/vtOqh/phODRx7SpqbTlevH9/NaywagA6Pk9+aMessugMQEw6aFP7tbog==
X-Received: by 2002:a05:600c:870b:b0:46e:3709:d88a with SMTP id 5b1f17b1804b1-4711791cb7amr244732645e9.33.1761337468408;
        Fri, 24 Oct 2025 13:24:28 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f20:af00:7cba:4f15:bb68:cf78? (p200300ea8f20af007cba4f15bb68cf78.dip0.t-ipconnect.de. [2003:ea:8f20:af00:7cba:4f15:bb68:cf78])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-475dd035dc2sm317515e9.5.2025.10.24.13.24.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 13:24:27 -0700 (PDT)
Message-ID: <39ea8bae-e9d0-42f0-be4f-cc3f75e4b2a1@gmail.com>
Date: Fri, 24 Oct 2025 22:24:38 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v2 net-next 4/4] net: phy: use new iterator
 mdiobus_for_each_phy in mdiobus_prevent_c45_scan
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Clark Wang <xiaoning.wang@nxp.com>, Siddharth Vadapalli
 <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, imx@lists.linux.dev,
 linux-omap@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>
References: <9c6aeec5-f651-4cf0-8cca-d2455048e89e@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <9c6aeec5-f651-4cf0-8cca-d2455048e89e@gmail.com>
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



