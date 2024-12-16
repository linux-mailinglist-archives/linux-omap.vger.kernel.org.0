Return-Path: <linux-omap+bounces-2830-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC6869F3CDA
	for <lists+linux-omap@lfdr.de>; Mon, 16 Dec 2024 22:32:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F14E916B284
	for <lists+linux-omap@lfdr.de>; Mon, 16 Dec 2024 21:32:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 213CA1D516A;
	Mon, 16 Dec 2024 21:32:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RJpi1Jz8"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A7711D4169;
	Mon, 16 Dec 2024 21:32:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734384751; cv=none; b=IgMlc5iVgPvuh5AbKXoqarM0qa3uq/W2/LGZ1wG6UPY7RTXNYyOkD8Mafg4pPRseurwKc2KQYIraDzeyx57m+tKBF3OgNBnrKi7Ed2ObXcTR0Ww8W09fTR4kM8/IyIR21oazMsnpu/vDbfmyeFVucai0gYMKzo54A/Mi+A2pOeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734384751; c=relaxed/simple;
	bh=U/zST6JYUxGJKL7jJGXlS1cIYnJzygZ4YGA+dYLdzME=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=btR7FAAbk7NXh1S4v0+XjX7hj2s1/wjCl5Zgx1B0APQh+zPnyf+UAr4Nbv4VmrqB2ZwrwKMAyPtA1gn3Op5+VkJCNjuRLAs0s0tAkkVRSQe/Vle13Z5VHA89Q6kUdzYRqkEuCP3aNqiWNCqSouvPnrhqvTi8prthxKqRhlMbyf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RJpi1Jz8; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aab9e281bc0so411035466b.3;
        Mon, 16 Dec 2024 13:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734384748; x=1734989548; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=bwO9tdXr1idXR/uXrFQHcSjvfE+8jcO756dXKibbGSI=;
        b=RJpi1Jz8klOjmLRnddGIJVqvIYOgDCWld7qojeLU7VUEyqctXiSShYgkdWxMXaupd/
         4G6kKH9Qg7r7rMHMlBuHoq8hUU80neUfEnKV0qJ1ttwzmbYApolfKrcmod8/CEU/CzZ5
         jGPUxF5J1xQXBXzmRaiUOka71Tb0Jy0A0zJrUqqpp5Yy7n4JhGlVgzI+QqlKsrPqlaww
         jScxoAROBIQ5LRoTSAskb3ToY49T5vQZE+x+7F300rgOlWoTmcWjypkHL6VmeQmOVwcj
         RXUclspCJxJTMxP+VoNFztloIEdMskb1GZ9061HA9TVUfck1Jl/XIHsg6icfwCs64h1k
         uAEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734384748; x=1734989548;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bwO9tdXr1idXR/uXrFQHcSjvfE+8jcO756dXKibbGSI=;
        b=GNkKMqrMq1QZKNfY+IxwiqndzOM/utkBHjoXUD+6z6AD8B604/Cvjx8U9qAUxrmxyU
         6UZcCD1wnVpOcJUMf9Y9Qq9b4haMeF51hva4IXgKNq4k598rSHwT1cyOXxQeKTmgB4tm
         Hpw3Sfgsw4ZcrD4W0JAf5M2JDxSUVAkJ4UtOi7Cp/H1WRmfU5C3ewSZHdyz7PR0mwIrc
         ATw1ZM2GFcn2Qdzqs89m5SLeUrOZhN8wmhgvlWQzG0ruKAyOJRIEIE/lUQV17JCofJML
         18qCKr3e92+37txLDmOyMUhn/CoCxbYTpRr62IcaJrE1nv++V/KyHtqJGwxfMFoCXMaf
         Am/w==
X-Forwarded-Encrypted: i=1; AJvYcCUMLE07pSHdNMA7gaCns7osHlWyLdfhuv4/Ldinbb3SaJx/BL/sCqjmQQeJkopBgGkrWJi8ADqYJNCN@vger.kernel.org, AJvYcCV37LH4YYK6ceIIu292QS+5/E4263nR5VB0hp1fJknapPSRZruUb6yBQcpScIz8qz5NSNlfC6rO@vger.kernel.org
X-Gm-Message-State: AOJu0YyNsjwImq0m6IeTmq++uP7lj/aT5U+lWy6Ova91uFrH5TayYbna
	Ww9pNQE6UMc9RWxV9X1AsmvR8aJxQ9tLMfWLUV+WBKOLkYczTCzU
X-Gm-Gg: ASbGncuLCvxXvGYaSgDu3gD3GxyUYV+OaqQKIjDlFL2qm9hkJ1e3komF6F1M9QJ20SM
	MtGnKubXTLP0VDUk+Y7xUm4Fb2XrLQtTx5QmUXgWQq9wr+7emsJOPbPpHQByExI8nLfRrws6bd1
	NKzliiAKRaBQw6UO1Cu9qTg7JhGLVZsTJdZKL9jmQ9BkSvigeT/rpTfahYCQ7rG9ynOLb9KYXZs
	o/jr7NeD6SIiVosWEh8RAc4/l3GN4NTxa6q7OXKsmh2SS8EinPQaJMIqO7nWzTyur8qpm7Sihpk
	m5nDySJxqKtEUsCFfGweQaTE0LtRBVl36Sw22NOz+eLTk7ExTJLRQVVeoMAcGCoibw0DiQwEnhg
	JF3CoP7W80bew6lWEJoBt7GBCFoqRD7i7Zo2p81AqgXwspf3z
X-Google-Smtp-Source: AGHT+IFZUS23FzRZht7cuplHlJEZRhxkQmibWhek8xaIMlbolLo+B4tiDpuhK8gB9W/MnnihjBEBgg==
X-Received: by 2002:a17:907:94cf:b0:aa6:b473:ea49 with SMTP id a640c23a62f3a-aab7795860emr1101458866b.19.1734384748025;
        Mon, 16 Dec 2024 13:32:28 -0800 (PST)
Received: from ?IPV6:2a02:3100:a874:3500:f430:df67:6714:d87b? (dynamic-2a02-3100-a874-3500-f430-df67-6714-d87b.310.pool.telefonica.de. [2a02:3100:a874:3500:f430:df67:6714:d87b])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aab96005f73sm371424666b.4.2024.12.16.13.32.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 13:32:26 -0800 (PST)
Message-ID: <d08a798e-8565-422c-b2ed-121794db077f@gmail.com>
Date: Mon, 16 Dec 2024 22:32:25 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next 2/3] net: ethernet: ti: cpsw: disable PHY EEE
 advertisement
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

It seems the cpsw MAC doesn't support EEE. See e.g. the commit message of
ce2899428ec0 ("ARM: dts: am335x-baltos: disable EEE for Atheros 8035 PHY").
There are cases where this causes issues if the PHY's on both sides have
negotiated EEE. As a workaround EEE modes of the PHY are marked broken
in DT, effectively disabling EEE advertisement.
Improve this by using new function phy_disable_eee() in the MAC driver.
This properly disables EEE advertisement, and allows to remove the
eee-broken-xxx properties from DT. As EEE is disabled anyway, we can
remove also the set_eee ethtool op.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/ethernet/ti/cpsw.c         |  3 ++-
 drivers/net/ethernet/ti/cpsw_ethtool.c | 12 ------------
 drivers/net/ethernet/ti/cpsw_new.c     |  3 ++-
 drivers/net/ethernet/ti/cpsw_priv.h    |  1 -
 4 files changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/ti/cpsw.c b/drivers/net/ethernet/ti/cpsw.c
index 4ef8cf6ea..1e290ee8e 100644
--- a/drivers/net/ethernet/ti/cpsw.c
+++ b/drivers/net/ethernet/ti/cpsw.c
@@ -635,6 +635,8 @@ static void cpsw_slave_open(struct cpsw_slave *slave, struct cpsw_priv *priv)
 
 	slave->phy = phy;
 
+	phy_disable_eee(slave->phy);
+
 	phy_attached_info(slave->phy);
 
 	phy_start(slave->phy);
@@ -1225,7 +1227,6 @@ static const struct ethtool_ops cpsw_ethtool_ops = {
 	.get_link_ksettings	= cpsw_get_link_ksettings,
 	.set_link_ksettings	= cpsw_set_link_ksettings,
 	.get_eee	= cpsw_get_eee,
-	.set_eee	= cpsw_set_eee,
 	.nway_reset	= cpsw_nway_reset,
 	.get_ringparam = cpsw_get_ringparam,
 	.set_ringparam = cpsw_set_ringparam,
diff --git a/drivers/net/ethernet/ti/cpsw_ethtool.c b/drivers/net/ethernet/ti/cpsw_ethtool.c
index 21d55a180..bdc4db0d1 100644
--- a/drivers/net/ethernet/ti/cpsw_ethtool.c
+++ b/drivers/net/ethernet/ti/cpsw_ethtool.c
@@ -434,18 +434,6 @@ int cpsw_get_eee(struct net_device *ndev, struct ethtool_keee *edata)
 		return -EOPNOTSUPP;
 }
 
-int cpsw_set_eee(struct net_device *ndev, struct ethtool_keee *edata)
-{
-	struct cpsw_priv *priv = netdev_priv(ndev);
-	struct cpsw_common *cpsw = priv->cpsw;
-	int slave_no = cpsw_slave_index(cpsw, priv);
-
-	if (cpsw->slaves[slave_no].phy)
-		return phy_ethtool_set_eee(cpsw->slaves[slave_no].phy, edata);
-	else
-		return -EOPNOTSUPP;
-}
-
 int cpsw_nway_reset(struct net_device *ndev)
 {
 	struct cpsw_priv *priv = netdev_priv(ndev);
diff --git a/drivers/net/ethernet/ti/cpsw_new.c b/drivers/net/ethernet/ti/cpsw_new.c
index a98bcc5eb..be4d90c1c 100644
--- a/drivers/net/ethernet/ti/cpsw_new.c
+++ b/drivers/net/ethernet/ti/cpsw_new.c
@@ -778,6 +778,8 @@ static void cpsw_slave_open(struct cpsw_slave *slave, struct cpsw_priv *priv)
 
 	slave->phy = phy;
 
+	phy_disable_eee(slave->phy);
+
 	phy_attached_info(slave->phy);
 
 	phy_start(slave->phy);
@@ -1209,7 +1211,6 @@ static const struct ethtool_ops cpsw_ethtool_ops = {
 	.get_link_ksettings	= cpsw_get_link_ksettings,
 	.set_link_ksettings	= cpsw_set_link_ksettings,
 	.get_eee		= cpsw_get_eee,
-	.set_eee		= cpsw_set_eee,
 	.nway_reset		= cpsw_nway_reset,
 	.get_ringparam		= cpsw_get_ringparam,
 	.set_ringparam		= cpsw_set_ringparam,
diff --git a/drivers/net/ethernet/ti/cpsw_priv.h b/drivers/net/ethernet/ti/cpsw_priv.h
index 1f448290b..f2fc55d92 100644
--- a/drivers/net/ethernet/ti/cpsw_priv.h
+++ b/drivers/net/ethernet/ti/cpsw_priv.h
@@ -497,7 +497,6 @@ int cpsw_get_link_ksettings(struct net_device *ndev,
 int cpsw_set_link_ksettings(struct net_device *ndev,
 			    const struct ethtool_link_ksettings *ecmd);
 int cpsw_get_eee(struct net_device *ndev, struct ethtool_keee *edata);
-int cpsw_set_eee(struct net_device *ndev, struct ethtool_keee *edata);
 int cpsw_nway_reset(struct net_device *ndev);
 void cpsw_get_ringparam(struct net_device *ndev,
 			struct ethtool_ringparam *ering,
-- 
2.47.1



