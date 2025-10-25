Return-Path: <linux-omap+bounces-4775-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5F5C09EBC
	for <lists+linux-omap@lfdr.de>; Sat, 25 Oct 2025 20:52:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8EBF81B24EE5
	for <lists+linux-omap@lfdr.de>; Sat, 25 Oct 2025 18:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BA809302758;
	Sat, 25 Oct 2025 18:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j82R5tR6"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58CE18E1F
	for <linux-omap@vger.kernel.org>; Sat, 25 Oct 2025 18:52:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761418334; cv=none; b=tCWL93sRfTRiPiuo/tQrFlE1N7kiyOYhJ1V04ARolTY40FJUGWyXnhZa9/QqG/Rb/MzFsQWCFpMC4EB+zTUEMzDIurL/7og949qe10UhFpYC6jk7s3BmL6YpbG4u6PCfD+oGsJCjD6M56PwP1zEHlMB/QK453/74Pd4Kk4KD0P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761418334; c=relaxed/simple;
	bh=DjzMNMITkdHrQn+TK/Lp9x4kSBfLr/Q4TTfQSfBhlXg=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=p2ocR6OUa8nDi7SOMvYpXKL7NVagU0MkME/ltCGe+ZPAy0WYMnOBy2yPo1mJ84wRgOFM8HAJR6wUlXb7Icme6P7dTO9bMZHe2PLkLEusUymLJgG8MN5Ct+gBKZ14XmasUKP+BeT+IxemNYI4YU5zEXpwzUkz1iQ+7M59eZlr0yA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j82R5tR6; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3ee130237a8so2116245f8f.0
        for <linux-omap@vger.kernel.org>; Sat, 25 Oct 2025 11:52:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761418331; x=1762023131; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ReDAp/8LpQ3zDb8wx9z+hWL5nB06qpMyYSjY/XtFYNM=;
        b=j82R5tR61sAssvtn/lzVVgkr00DrsculR+mszjRom1Fax9vEPq/MTpt23abV4q3ts3
         P/UgoAbzrWTH6VnYnTvKH3fiPbdqMLd3mu7kbinR5gMkBkJMWAhst73NOSsjkyu8u8GB
         SNDO4EIc7nhUSiK5cpxzmp/BW/mb0CggqzAr712hZRPw03jiuUo7BuXM4MkuJ9gx/W0/
         EZxdtzymvC3ooR23C6wfxe7rnCEVmIISKnPrys/aOyAfnqUOHnD6R1TU2NicTElYY2s5
         Fily8V77zN3KDTmFYr9N8+d7f1LQ63gLQTEuE38WZwj7WmfLd/OlbrpZUPhO/+3wrYog
         UG9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761418331; x=1762023131;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ReDAp/8LpQ3zDb8wx9z+hWL5nB06qpMyYSjY/XtFYNM=;
        b=rxRQZmwHTSoBwfX8+VT22I2P8uJOWoWJpQgLgdD5zQRGh20QeoynG7p0BJXnapyOnc
         zmnqcCif5PKj7VorofnlvmiMMVZ43gmtdkl6eQn5ZDJp65vRh/6v9XHLSNjg6Zixn4PG
         BzPg2AffLP+qEVIsDI2AvE2jvDOBInwaGW1h/k5Ms7JF3yhd1L0evCqQ+dUnq4Eu1BnH
         h2kOi70cx8sDkwdF6I4la6fBmiNbYvtHTvejrrHq/S6THnPsBpGyQncZXCLQm2fZpiGd
         yRGc53uTB+Qbppmg2qa0qKarH390vA6Aqiti6mPC+Mt3yT09VK7bnY6PzTcISIr42qC3
         RvuA==
X-Forwarded-Encrypted: i=1; AJvYcCWne7VSjO8P63sUUogWGEgfl/0x+axeINMDbL0G0CYd5A64yr0s/EEGexIZ2J/momkq7a9FhyjIj+3J@vger.kernel.org
X-Gm-Message-State: AOJu0YxhCnG9rGcryUq7R3HWYnlfUD9J6houbsqKenrfpLetTesBGay1
	vwL5UeA4rHFxgmLzd10urpCrqUe6fN8H9LSv9JOdEhBiICrfd1dXYIEa
X-Gm-Gg: ASbGncskE5EYnhOuuVR3myd/odZz8AsrVVc2P+cSBYgxYfQBKCl7TLtf6lfR4jxdczA
	SxLYxZiIkTWJpBFhlXviURc/pA5amYdwSz7AOMoicdggrbdLvlZJBIq3ixgHnsNaF8L1fbjcL/L
	Sk51VIG9ae5I0BJfI+jLP58Gu99eOc8vkhImWxmI7U89ko2r7Gg4d6hOFpGv5Sh1aZAT6VI7qJo
	IKAANbZD6rB1+NOB1pk98ficsZlLsC5ZlTSluCp43BvjCZ1ndxvMbOIue2hJ+WI/unpfOsvLSBS
	up/GXEflbS1UqlRfcjkB4GTCDuaUPoD+hBwJR1EjTY+EdbDfE3RkFYrW18uDpN+aKSRyNIifu/A
	OAyE2YrSgguOszGAN+wg6YhAEungahxqYYWMnRICRDODuxIsH9b4F/wLuIxwqM6E1LCNPY8gZ35
	osLjx+gaPzYZart+SJ7eoC2Sz6ggzmxvC9FUEUb3bvyzXnnO4fH09HuMQvefAVudeKBujILC884
	IQZ3QJeI3/rKY0uApUdb+L3ojkQP9yKI5e16dlxsy0=
X-Google-Smtp-Source: AGHT+IHCy6CuHWreuhY0kzq3aXI1LYVdpD3LbDxQTXXB3GVcd1wp3XcWvi9HhxFTqvcu//8jL+NjOQ==
X-Received: by 2002:a05:6000:2411:b0:405:3028:1bf2 with SMTP id ffacd0b85a97d-42990753148mr5404740f8f.62.1761418331081;
        Sat, 25 Oct 2025 11:52:11 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f39:8b00:d401:6211:9005:e76e? (p200300ea8f398b00d40162119005e76e.dip0.t-ipconnect.de. [2003:ea:8f39:8b00:d401:6211:9005:e76e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952cbc16sm4853730f8f.15.2025.10.25.11.52.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Oct 2025 11:52:10 -0700 (PDT)
Message-ID: <326d1337-2c22-42e3-a152-046ac5c43095@gmail.com>
Date: Sat, 25 Oct 2025 20:52:09 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 net-next 3/4] net: davinci_mdio: use new iterator
 mdiobus_for_each_phy
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

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>
Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/ethernet/ti/davinci_mdio.c | 14 +++++---------
 1 file changed, 5 insertions(+), 9 deletions(-)

diff --git a/drivers/net/ethernet/ti/davinci_mdio.c b/drivers/net/ethernet/ti/davinci_mdio.c
index 68507126b..713ed4ef6 100644
--- a/drivers/net/ethernet/ti/davinci_mdio.c
+++ b/drivers/net/ethernet/ti/davinci_mdio.c
@@ -548,8 +548,8 @@ static int davinci_mdio_probe(struct platform_device *pdev)
 	struct davinci_mdio_data *data;
 	struct resource *res;
 	struct phy_device *phy;
-	int ret, addr;
 	int autosuspend_delay_ms = -1;
+	int ret;
 
 	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
 	if (!data)
@@ -652,14 +652,10 @@ static int davinci_mdio_probe(struct platform_device *pdev)
 		goto bail_out;
 
 	/* scan and dump the bus */
-	for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
-		phy = mdiobus_get_phy(data->bus, addr);
-		if (phy) {
-			dev_info(dev, "phy[%d]: device %s, driver %s\n",
-				 phy->mdio.addr, phydev_name(phy),
-				 phy->drv ? phy->drv->name : "unknown");
-		}
-	}
+	mdiobus_for_each_phy(data->bus, phy)
+		dev_info(dev, "phy[%d]: device %s, driver %s\n",
+			 phy->mdio.addr, phydev_name(phy),
+			 phy->drv ? phy->drv->name : "unknown");
 
 	return 0;
 
-- 
2.51.1




