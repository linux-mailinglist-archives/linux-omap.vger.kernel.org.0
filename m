Return-Path: <linux-omap+bounces-4774-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 228E6C09EAD
	for <lists+linux-omap@lfdr.de>; Sat, 25 Oct 2025 20:50:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1C95C1B24E3D
	for <lists+linux-omap@lfdr.de>; Sat, 25 Oct 2025 18:51:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43697302758;
	Sat, 25 Oct 2025 18:50:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="etxHobF/"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486AD2DCF71
	for <linux-omap@vger.kernel.org>; Sat, 25 Oct 2025 18:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761418246; cv=none; b=F2Exi8Ecvti81OuVSTf7Nb3XjcJAMscLS06R7WWZFgOT14hA15ljTBfPzRY5t0ZWOrupMt0Wwg/Rf45NnkadPliDUUfukrcbVdXK5GQCRlZPWZq5WOzf/uRh3gId1BM3BaUCT89dviTF/vCeRvKhaJyCF554j1zMEhZ7TelFC/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761418246; c=relaxed/simple;
	bh=r+DKdsODkadGXvvNZ/S8XJoz2FiQFDPW4f1v2XCikQ0=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=nOCzpdtm+veXf5A4/spqILUhttGhhlcjbrWEtH9jWOUvtncWxbQka+6E6Sb8hkfKh/bhdrVHv4au75mWWr7Fp1Ck6lrPcdmbfFTai25opph0tShJpUHeiLa7p8Tguystrdf87fmFPMVusPRHY6od6a+xscpRP5Yah6FLjPuZVOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=etxHobF/; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3ece1102998so2228990f8f.2
        for <linux-omap@vger.kernel.org>; Sat, 25 Oct 2025 11:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761418243; x=1762023043; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=98yfEBiDPGFeXKIHXMIyU3z8Qaq+Qc8MiRUCJmNKTJo=;
        b=etxHobF/0l0iyRd93R5XTp1VM6h9lRdWCh4AwKUtawmcOMxiX2Ty2yb14JkC1nZoyt
         ooAr/YgehYifssk6rnFMzoFJdZ8MCVZJQYP9JcAwqj8ORTOBU8I0mz5NmNXCIw1KlMGO
         7oJAfv2RwwWDaJB4buNj2FIFgAusVUCuFooAQ33kXl0h+v/GsCigld8ZD5dNT3a+lXNN
         NAEit7uCVTbzAYjGwptXFUAC/5ntUI3YlVHGTYa6MEYjESYBiALq5OoOVdlDVbdMt5Ov
         oE3ZBfI1orOGawN6ZE5zzX5T5tnsJhWfYJ/UPmHlSu7JUE+8efQ4EmVn6iiZwR3+ED+5
         PnCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761418243; x=1762023043;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=98yfEBiDPGFeXKIHXMIyU3z8Qaq+Qc8MiRUCJmNKTJo=;
        b=qqjmuZ9j/067ibIdwPaueK7P3ZvMX/6rJgKL2XLb3J9TfcwHcUQkzocYF6V7KeMBxF
         K2djomkMywHvYe4V6+vZtZo3x0tDlgBRUJdxZfu8D14iE2f1KkWSycjGrPdsMWeUudsG
         v7KS7BPktPs+V5XFt5CQGfYMJWKhZD2o7FII26T/wLlj2p4RAV1p3WJsTxd5mf4/Hyys
         QEiqAsuzPRSeLqM6+BP8EP5mzu3YSKAAc1zNJqosdPSM48ZcQtsynzs4R1M4QlFzoO5G
         Cx21aiZDOr2J/FrefDHQXkeO9jaZcNuQeEjacl1Ot9HoZvMD5JwZmukOA6Pn4VR8zlCn
         7zLQ==
X-Forwarded-Encrypted: i=1; AJvYcCUS3pOPj4BBG0kdDXpiq/jtpxdPi0uA5NrolK1uXv3LxY/YBxlLyZp8cI8La/RqPKjnMqoCKSR4UGab@vger.kernel.org
X-Gm-Message-State: AOJu0Ywujskap7nxbYmYxsFZO+F6SpsKOV4oRAM8xbuQgcWXxYZqmKKs
	hB7BZmq9caa6bmGuuNiao7cBYyOXDuXuIB4Xkh/7FN6skMUL3HM5NbS+
X-Gm-Gg: ASbGncu4eRkDjVeDDz0fMDRbUHK2RdVpSRD242kEP/vfMiZbeH3ic+631QmuQVflwCQ
	U6kF10W0pwWZlwXQ+Bq4CA2fueIe9ioyuMexmNkPqHpvp6NhX961ld+D2tadC28x0uBD2cbvC4r
	Moyn3x672lb9dd/XEa3LXA8eiPuQuKFuLyt0/9d5mYOgQ5/ropjN2XjTPD7Eqy1nCoT2lmj23zd
	IAghK2gUk/0zkw/pr8h2Hq9Tk2cIOGi8QKJvJ7N58ld9lESHCEeOFfSHlE1Ekzjo3yOGcyEi7ms
	T47GW6JuVMPM5vXHDOVstmJgmfaHefUXoWbPfb2sYrXrs7FX4PtvpMb7nHdrUbfYTTBgNmbp1/1
	j03F6Obd2zEd4aXN5OOZtkDFney+MwsNfBuBrK+ELvuuSno5l5fEEI0qbzStD7HGxVdQQttBiM/
	phhsXm82Fm3hnngT4hRwk//14MAnaUzJnfyJDNXP09uQMYpKkZze/svhzXulxzDqqim6Z9Nv/Km
	xYpVOfItAw9AqiNRQgl+GLA3YVJb+Z+qKSby1gBsnZmNbABswJbVg==
X-Google-Smtp-Source: AGHT+IFr5ewN20AMLA9nfDxm/iJ4PC3aoQ2jPi+BAKHx+DPN5+GH/t/L6cIO//luoXtmLREO5RcziA==
X-Received: by 2002:a5d:64c5:0:b0:427:55e:9a5c with SMTP id ffacd0b85a97d-4298a04e8f8mr6979655f8f.23.1761418243388;
        Sat, 25 Oct 2025 11:50:43 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f39:8b00:d401:6211:9005:e76e? (p200300ea8f398b00d40162119005e76e.dip0.t-ipconnect.de. [2003:ea:8f39:8b00:d401:6211:9005:e76e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952d3532sm5118118f8f.20.2025.10.25.11.50.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Oct 2025 11:50:43 -0700 (PDT)
Message-ID: <65eb9490-5666-4b4a-8d26-3fca738b1315@gmail.com>
Date: Sat, 25 Oct 2025 20:50:41 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH v3 net-next 2/4] net: fec: use new iterator
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

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/ethernet/freescale/fec_main.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/freescale/fec_main.c b/drivers/net/ethernet/freescale/fec_main.c
index 1edcfaee6..c60ed8bac 100644
--- a/drivers/net/ethernet/freescale/fec_main.c
+++ b/drivers/net/ethernet/freescale/fec_main.c
@@ -2552,7 +2552,6 @@ static int fec_enet_mii_init(struct platform_device *pdev)
 	int err = -ENXIO;
 	u32 mii_speed, holdtime;
 	u32 bus_freq;
-	int addr;
 
 	/*
 	 * The i.MX28 dual fec interfaces are not equal.
@@ -2667,11 +2666,8 @@ static int fec_enet_mii_init(struct platform_device *pdev)
 	of_node_put(node);
 
 	/* find all the PHY devices on the bus and set mac_managed_pm to true */
-	for (addr = 0; addr < PHY_MAX_ADDR; addr++) {
-		phydev = mdiobus_get_phy(fep->mii_bus, addr);
-		if (phydev)
-			phydev->mac_managed_pm = true;
-	}
+	mdiobus_for_each_phy(fep->mii_bus, phydev)
+		phydev->mac_managed_pm = true;
 
 	mii_cnt++;
 
-- 
2.51.1




