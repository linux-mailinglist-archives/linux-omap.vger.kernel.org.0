Return-Path: <linux-omap+bounces-4773-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DA617C09EA7
	for <lists+linux-omap@lfdr.de>; Sat, 25 Oct 2025 20:50:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DB976400B34
	for <lists+linux-omap@lfdr.de>; Sat, 25 Oct 2025 18:50:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A4882302758;
	Sat, 25 Oct 2025 18:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ca3NAAkW"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D022D879E
	for <linux-omap@vger.kernel.org>; Sat, 25 Oct 2025 18:49:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761418196; cv=none; b=GzvIVAN2phFg4cp6aIG4xEU8OCAret2XuD+2Qi0aXcXII8G3/yDVhI0Pv/UTiVVpzGM9mPqD7zQzfyXbFn4HQRMTzaiqlPSrVsbhnlspn6sWoF4u5OuJ/hAk7ssyrKbJ4Gk5jkL1CJr9JDvla3f4DLF8Ptg13Cx0jJDhfilmjDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761418196; c=relaxed/simple;
	bh=1c8VwZwCLQgKitT09IMgpoLdbo8O8tL2/Cjsynfmiis=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=eB6f35umjog3S1NvycuzdLdJCWwHOBy4aDRXQKDZeS9j8azTrB55n7HJs+6a3a+6Kel43hiJtbW3DgxP8oC04dxwub5rzlg8GOOcPxRcad/83bDUqJXYZ5xytQechoYOWUFrur4qHunegCcUd6h50ZcYCo+VMFz9IKX80bUAhSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ca3NAAkW; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-475dae5d473so9026135e9.2
        for <linux-omap@vger.kernel.org>; Sat, 25 Oct 2025 11:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761418193; x=1762022993; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YOP1Dq47ETt740QI5S9S9RVh1nYdnTXk8kdvsRVfgJc=;
        b=ca3NAAkWkdg+Ph+CIgrAy43Fgad3W/eugC+H++UsA0R3k3diAdYU4qr4bqsJGUzIMv
         wwg8hhVXqFKQ3i7wvRuH3uL1jLzG64E+PvL1+POvaYzMUR2XkPkItXpJMCiyHwDWKYgF
         MsabGKpmTtvEiR58Grbvy0gND2GHJLOPhcOLvQt82ADXzZnzLGI6CHMd1mlE65AdVP/N
         BjlVFUoNNcZSZYKjsSWPoQ8FicBaiBt4aPmV6OwVqoshpdmQ9yUs7a4Zp9scaZ2fxM8X
         6Lx0TcsuGmf/XdQAK3H65jRHDLtsSFd5bmWuL+y2UxtBnw29zbE/2qTcWvnXLYOGJA4K
         2UUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761418193; x=1762022993;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YOP1Dq47ETt740QI5S9S9RVh1nYdnTXk8kdvsRVfgJc=;
        b=LFJm1jNdqOVqfoCYBVWthVuH5dmSUjki/JfPT1SQMzkXFYUeM+htJN5NvlX4M2KPyk
         iVCdFbxIH+z0WAjefPqta3s2lCPSl650GxzzTxGHipnhPKMMvEttGO9RYCAhA7trn61R
         N5Q9lq/2FUCbBIB5iSwwdVSq0TvYq+6bjtsqOmIEl7V4g8J5J7gD6UvC4RlI7A5nzmRT
         V4rzJ1E8+2NCU1Gr/Er3Wa5kO/LnAHRlf3xSOKC4A50B8GdyNEqspIkN+3s+0ccmviGP
         xku8VG5RRZf9hv+iG4l8MTflCarJaATC5zPOrZxj2Ldn6HFxY4gqaHG82lb5fUghqNIq
         kIBg==
X-Forwarded-Encrypted: i=1; AJvYcCV4hU+2E1JQqN1fUVB/A9uOnrBHxE3zgQrLBEsbJO0yDZMDs08iKtHYluB3Nr7r5xnZj8cpDZpVZyyA@vger.kernel.org
X-Gm-Message-State: AOJu0YxHd/qfnkmmHmAaaCxdyfZ33U55J1/dhp6bIM5407Eq1KLBRstT
	TjTDK68VowRwsL6a2/LeQorCmMdEGb/HL6HqUF3H4Dsn/ZaB8tH+Y+sc
X-Gm-Gg: ASbGncu8TFEvnKy2MooA7bQJ4/GjdAzFYJKcgSNpPfTKpwOWBO7NIMCEvR+eZ9HLnm7
	XC/0Y4rC13ZsBGTXT12jveCCZhJHNufTnFzqx+XdoDVsYQYKjMTDCACE+FluHyqYLlthGW3f6G7
	i6HyGwh18zUhroSgSMd+8oLsd7iuDRqvpqMOQaoqxzrSpc3ergCVHJT2sTLJPNj+sgZTVp5X9KG
	Z7TtZQAeMstVaChLc5yOLurd+/Z2RcHIlbC9rD/gpc21AcUAV/U76XL58KYW8R2SoY//yM1uHx/
	GRBEGZ+NU7+ub5ofi5snGQFWaSOe62idqzLAhtzdlJBbOBQnqsE8KD8R4Y4nzGtq7RRwyyii4xZ
	1kjGn8BjAARLfQGiyWrX3fYqka/eBFykRTKZ90CBIZE74aoFJvLEJtEuVdWXcFXqupwzfr1gHO6
	h1Zyumkxwl/heHoXOd6/8b5iseA6/fAxaa+i03UyTv/8a6IAKH66FUtutSUNQ2U/fh0m3Uf/xSM
	/HVTWKDY8kvjYH9l340SZ7oLW7DyeIRxTI/D5qEKdSpyZ9CLoSc7A==
X-Google-Smtp-Source: AGHT+IGg1HBIr268jUp/OkiHLu7m8BYHJzQgps2UOW+w9yzyN2Jc6WgsG9eUuNap4D78HMtAusreFQ==
X-Received: by 2002:a05:600c:4f09:b0:475:de14:db25 with SMTP id 5b1f17b1804b1-475de14dc59mr17418675e9.28.1761418192733;
        Sat, 25 Oct 2025 11:49:52 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f39:8b00:d401:6211:9005:e76e? (p200300ea8f398b00d40162119005e76e.dip0.t-ipconnect.de. [2003:ea:8f39:8b00:d401:6211:9005:e76e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7b22sm4903790f8f.9.2025.10.25.11.49.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Oct 2025 11:49:52 -0700 (PDT)
Message-ID: <cd112f15-401a-43d9-8525-9ff0965a68cd@gmail.com>
Date: Sat, 25 Oct 2025 20:49:50 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 net-next 1/4] net: phy: add iterator mdiobus_for_each_phy
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

Add an iterator for all PHY's on a MII bus, and phy_find_next()
as a prerequisite.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
v3:
- add missing return value description for phy_find_next
---
 drivers/net/phy/phy_device.c | 16 +++++++++-------
 include/linux/phy.h          | 11 ++++++++++-
 2 files changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index 7a67c900e..c4fbacbc3 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -1214,22 +1214,24 @@ int phy_get_c45_ids(struct phy_device *phydev)
 EXPORT_SYMBOL(phy_get_c45_ids);
 
 /**
- * phy_find_first - finds the first PHY device on the bus
+ * phy_find_next - finds the next PHY device on the bus
  * @bus: the target MII bus
+ * @pos: cursor
+ *
+ * Return: next phy_device on the bus, or NULL
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
index 3c7634482..3809ca705 100644
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
+#define mdiobus_for_each_phy(_bus, _phydev)		\
+	for (_phydev = phy_find_first(_bus); _phydev;	\
+	     _phydev = phy_find_next(_bus, _phydev))
+
 #if IS_ENABLED(CONFIG_PHYLIB)
 int phy_start_cable_test(struct phy_device *phydev,
 			 struct netlink_ext_ack *extack);
-- 
2.51.1



