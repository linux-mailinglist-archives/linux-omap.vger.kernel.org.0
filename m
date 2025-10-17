Return-Path: <linux-omap+bounces-4690-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF84BEBB51
	for <lists+linux-omap@lfdr.de>; Fri, 17 Oct 2025 22:41:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5911A34B37C
	for <lists+linux-omap@lfdr.de>; Fri, 17 Oct 2025 20:41:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FA0C264A76;
	Fri, 17 Oct 2025 20:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YLqvfo6G"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E486C233155
	for <linux-omap@vger.kernel.org>; Fri, 17 Oct 2025 20:40:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760733654; cv=none; b=m5Qbc8rX1H9k77z0wFHoUjaUOd4iwK76FTUTZltuVVKGPEwdwp3T7L2DIXir4tdgnCVqoDRypBMOWFQJexqIvWasugxU4x59xPcMc0S3tej34tVojWAECdtX9ipJNId6kGh4Ikr0Cy8Cu9j1t1+ik050jXpR9CdrrP5+5xvFNwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760733654; c=relaxed/simple;
	bh=8dhd1HXzFActeTedsUZUHugfOjaScZqGphRCS6J2J0w=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=tAgtob2pqHfFFBlBc73DWuWfHb5b+sKBfCFB3DNlTbbNt7hB2J6pU7LmgiEjJKjH1TMMgeYz8u3wM1EzL/w/7O4nBGu4TfgX5p4d57zDNjeeTCjfgsl+EIR4CU/IgjqaOPUqZU6UKUgHa/MdUMJJsB2AMeTgfrpUqP/uRXY+WzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YLqvfo6G; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3ee64bc6b85so2602080f8f.3
        for <linux-omap@vger.kernel.org>; Fri, 17 Oct 2025 13:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760733651; x=1761338451; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=FbWi40dvkp8CFY0Wjk1kGU5vumCQD6DLglX3zNBQstg=;
        b=YLqvfo6GPWXdaP+bTle/blH2/anaBklXamdg21V45uBosOw6+NBfc+qwqTTFJwyesk
         1bc4MZeN6XCei5x4QeUuY6u+DUedxWd9qly2t9oifnC2OyH9XVhhh/ZKP2l28vufbiT4
         ZUMb7zdjySHl0F6PcJQHq4cULWH1fvkKWLLhQ3870dYLSdhDqAAN0ci1GToqPetuBhVw
         dsJlQ2fP5ounepXPUQNNdiNR1XhUbLKGdnP7e2WkdfL+pwIvnfL/vBYJ67BUgWtfQUB/
         E99UMYlonCURCpJsak45Nvm9od+X0Osk7cjnUty0IpDe3mPhb79qWqjVlkPLDn7Tc10R
         p1xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760733651; x=1761338451;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FbWi40dvkp8CFY0Wjk1kGU5vumCQD6DLglX3zNBQstg=;
        b=jwrzAToX6f8M5RQFUVBAppIRT6+dOKFBy6BFpZa8Qbk9DCg/taERRuFNx8C+UysVzW
         Dd1ln1ow8XAw3/420X3EC8dVnj2I3qR8l2O6v1noXMh4Z3Iryg/61PX7m1EdyDXRxpkp
         YZmd/RPyyv8GZpADX4eyWNQDpUPH5xLBB/2l/3IQz0CUpi+44t+qzBILmTbnEwlJPds5
         jGoeDsJfB6MIWlpUd47DioAzmSuwxD+rRY89qiqNWJp6OUHRmlTstQadCtMn5zZZ2zSN
         y+zpVPEN90dIgNZgE8qg56Zp5/hsh1JQxM9zJ9r5zHEtNG5sPBMEyNFTvXhP11g+NA46
         fH+w==
X-Forwarded-Encrypted: i=1; AJvYcCVb91drrQJmEbFR1jDFq4y6ryQfC0W17N0n+cFepJIMolqF2qiqK5ViCZU2MXJu5w4KEjeYUQGR22rj@vger.kernel.org
X-Gm-Message-State: AOJu0YyPHm1mp/aHcThakUGuLeW7Xr6yrmalmEPCWZ8cmh4L+FSUsvYJ
	LecoGMqh1gR0FRT+ImmKLyaWJBuFFoPdevtO+uPb62yTaxj1CXoqLD6i
X-Gm-Gg: ASbGncsM4SYoFpp6BI9++bU2A2nd3iD9GAGwbEMYRFmoT/uymbYNWXMLTGQEypFeyO1
	J3ShPYBJKWo3r2Y01Wo0QhZQkLCGAxD/MlB8l/gkyYuskRmJ++RNvAj0AWReJAkgU3eijfreR2Z
	qYQneFvTLNP9b/LMgm098rv4e4QhhWmH5RaJeC10BIaBwewYJOdK3qPhDvF4kAEwZrI0+uuyDyO
	rtd9KwDI6MeG7MSroUfIbouZjJnMRAbk7iaRnbk2WBGyB5/CsQi6zCotK5URPEx7s7qO5aH1G2x
	EKu5asUm36xItr4thNZO448lZ6cPKLb/BafRiJxlcOgAdyGxr/EFx4kxBwvYCb+HpYYa5uH13AN
	idwoq14GyQpyFyT+w8U5tjpw19dyYq8CVUH1jRh8/XnuUyndN8RHuDgmEO87ZXLrC1XKYV/4GEb
	bXKlH0TjNAB0V0b/UtapqSFruVX6pLVnULvwR/bPTERxcG9gAFWWdQdz8YokWhM+FmZF9ULSSSm
	58eE88K2FxsnP9tWOkd3ZoZHCTlnaYgCOeOjJx5souBE/IVD8I=
X-Google-Smtp-Source: AGHT+IHjTYPZJL+g/HWuD/r0IbHdpjbAXn8TX9jhRHNkV2dhyqZ6ULzINTbC+hXeGu3b5YCOlCwWfg==
X-Received: by 2002:a5d:5f82:0:b0:426:fb28:7962 with SMTP id ffacd0b85a97d-42704dd3690mr3960957f8f.61.1760733651138;
        Fri, 17 Oct 2025 13:40:51 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f33:9c00:f581:27c5:5f61:b9b? (p200300ea8f339c00f58127c55f610b9b.dip0.t-ipconnect.de. [2003:ea:8f33:9c00:f581:27c5:5f61:b9b])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-427f00ce678sm1228595f8f.51.2025.10.17.13.40.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 13:40:50 -0700 (PDT)
Message-ID: <7d33ee44-8558-40d9-b258-2942b2caf95f@gmail.com>
Date: Fri, 17 Oct 2025 22:41:12 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next 1/4] net: phy: add iterator phy_for_each
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
References: <68a7779c-acc2-45fc-b262-14d52e929b01@gmail.com>
Content-Language: en-US
Autocrypt: addr=hkallweit1@gmail.com; keydata=
 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
In-Reply-To: <68a7779c-acc2-45fc-b262-14d52e929b01@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Add an iterator for all PHY's on a MII bus, and phy_find_next()
as a prerequisite.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/phy_device.c | 14 +++++++-------
 include/linux/phy.h          | 11 ++++++++++-
 2 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 7a67c900e..72d58b38d 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1214,22 +1214,22 @@ int phy_get_c45_ids(struct phy_device *phydev)
 EXPORT_SYMBOL(phy_get_c45_ids);
 
 /**
- * phy_find_first - finds the first PHY device on the bus
+ * phy_find_next - finds the next PHY device on the bus
  * @bus: the target MII bus
+ * @pos: cursor
  */
-struct phy_device *phy_find_first(struct mii_bus *bus)
+struct phy_device *phy_find_next(struct mii_bus *bus, struct phy_device *pos)
 {
-	struct phy_device *phydev;
-	int addr;
+	for (int addr = pos ? pos->mdio.addr + 1 : 0;
+	     addr < PHY_MAX_ADDR; addr++) {
+		struct phy_device *phydev = mdiobus_get_phy(bus, addr);
 
-	for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
-		phydev = mdiobus_get_phy(bus, addr);
 		if (phydev)
 			return phydev;
 	}
 	return NULL;
 }
-EXPORT_SYMBOL(phy_find_first);
+EXPORT_SYMBOL_GPL(phy_find_next);
 
 /**
  * phy_prepare_link - prepares the PHY layer to monitor link status
diff --git a/include/linux/phy.h b/include/linux/phy.h
index 3c7634482..b0497f47b 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -1848,7 +1848,7 @@ int phy_sfp_probe(struct phy_device *phydev,
 	          const struct sfp_upstream_ops *ops);
 struct phy_device *phy_attach(struct net_device *dev, const char *bus_id,
 			      phy_interface_t interface);
-struct phy_device *phy_find_first(struct mii_bus *bus);
+struct phy_device *phy_find_next(struct mii_bus *bus, struct phy_device *pos);
 int phy_attach_direct(struct net_device *dev, struct phy_device *phydev,
 		      u32 flags, phy_interface_t interface);
 int phy_connect_direct(struct net_device *dev, struct phy_device *phydev,
@@ -1875,6 +1875,15 @@ bool phy_check_valid(int speed, int duplex, unsigned long *features);
 int phy_restart_aneg(struct phy_device *phydev);
 int phy_reset_after_clk_enable(struct phy_device *phydev);
 
+static inline struct phy_device *phy_find_first(struct mii_bus *bus)
+{
+	return phy_find_next(bus, NULL);
+}
+
+#define phy_for_each(_bus, _phydev)			\
+	for (_phydev = phy_find_first(_bus); _phydev;	\
+	     _phydev = phy_find_next(_bus, _phydev))
+
 #if IS_ENABLED(CONFIG_PHYLIB)
 int phy_start_cable_test(struct phy_device *phydev,
 			 struct netlink_ext_ack *extack);
-- 
2.51.1.dirty



