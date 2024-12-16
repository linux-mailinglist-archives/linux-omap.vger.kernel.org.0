Return-Path: <linux-omap+bounces-2829-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DD49F3CD5
	for <lists+linux-omap@lfdr.de>; Mon, 16 Dec 2024 22:31:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3B4DD16A0DC
	for <lists+linux-omap@lfdr.de>; Mon, 16 Dec 2024 21:31:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5ADD1D47C7;
	Mon, 16 Dec 2024 21:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FVIPFWgW"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D827A13211A;
	Mon, 16 Dec 2024 21:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734384684; cv=none; b=peSF/AlTgZYOxzZdNdNBKhtapt1gOyUJjtm3dTXXdciuWRtpks1CsZNuue7yJ/YUKFuW+VIRrq22i6wfX/3nAwy+OSxR3z1JBgEipkx9b5pdNqnPpU07wotIsPSWKEEGwc/6guk7EHhhh5XmYI+v7nQ46oXNNe0b4+DzLwP+4cM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734384684; c=relaxed/simple;
	bh=1heIaVjafuMRqv060qHM95xO2Q28LnAICpMZWVwfRbA=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=pYB+ak8Z9bZoGIvVlXYp1LP55T+q5E1I79bzM9Rc+mHPEOYzzIBeWdNpHBpQRLWEkLfX8w8JAzbXKXHtDzgveK+afPvIhYDNxq9PV6Er6w/f4eGK9eof+Wt4YN0ELnd9eHG5gbT6McX3R1g6GJWy5pr1DxjiTzbA0iN+dXMBG6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FVIPFWgW; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-aa670ffe302so860488566b.2;
        Mon, 16 Dec 2024 13:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734384681; x=1734989481; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=kSuXfROTVbyuayO3u4H6FBZFuoCVmqEGrg9mDm0Xbqo=;
        b=FVIPFWgWRuC5j+ROJUfPkr18K2cz+mGrHR3DjVOkTMZ+khsZMSS7UCOr8r3alf10gN
         DaYVQRImK8FuAP/UzzL1zOxnLH6w29FL0TqqOddURzxh0ytfZTG3mfiLoitoHisHS6K8
         QCnXNrobXzhuIRuUliNqSjLQX1mNNmpFK+YsJEtiSxi0yMU2ibwEGwqEv4Fl2H1MKxDE
         JNBEtbsYrbst8nmxTtY8/UvQDrJKWM5rCZMbWPuEjwdVQkWauHngklPuXFGpCWEWUYFK
         tcNWxaT5oOi6ntZ3gjR955Q2oq30lWgmt9msaF73kR613x2kczMP2Tjpkbhtpq7OXpxH
         R0hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734384681; x=1734989481;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kSuXfROTVbyuayO3u4H6FBZFuoCVmqEGrg9mDm0Xbqo=;
        b=j7qDEchmVKI8MOYlGgKN9NgduW0WRXWhniWmGAyCMViR/n0zygRaW7L07JnCi94bu5
         x/ikgaSMZtf9ye12vgnYZhbS9UM7vdCjXSUm0vMHokFACn5pqdHCz1rjK5t8dDO7lnj7
         /rOs0vwkJ8yzaFPUlxNVY6/LXBwjgvEYFEjDDL+BR01t+tYAEWA0aRSqy+twVzkTrfV/
         WyLPK+nwcsIWzV+bm/fhlbEoKOM2IU0SbxrtAadBIyUpomId2w3rfGbtg0nuCvVEExKp
         VyHsTWpDzDjCNvZgAT3gF3RXUoK3yV3WMkyOBIdUZbidA01iEKw05QzZiO6evOr7HSg+
         1RyA==
X-Forwarded-Encrypted: i=1; AJvYcCWj8bGNWzoKEGfHonNi3J2n+ocyNWVQpmtRLdZDCxVoi8mB7JdL2epqqOQyV/DHZQBcK3n//lJj@vger.kernel.org, AJvYcCXSyBRxjalOjaY+lEcnW6Dals1adY6bghFa4OR987JROyzNuLgvZQAGSprKmhcwZn2Me1nW3BGN+xti@vger.kernel.org
X-Gm-Message-State: AOJu0YyAduGk/go7DzNAhD6pqgBHo75y75FBL4NYboDMAOxX72nMpjv+
	cuHZL1opgFGf9kTdXiAicLIY5JmwlMnTZ8GEG+NCSJsB01OTwM8I
X-Gm-Gg: ASbGncvKyBdhDlNBgiRiliXSxUUVL3DlLKxa0emUqSfOs2XLdQxcW2GOjGQ8aFt8VLj
	Fti9diJujAnYhjkbuB6Osq4VJQv5Fcau0q/NQvaFRABWziQWum8PK1sBTneK6kiupVJwtt0HNOo
	rnHOPnQi8fi2cEAss2VaZTzkDCGdG0UkUI9EWg2etV7uExh4flPpuqvPbGvTuV+j0jqu6vwhrMY
	5/xDUhe9G/5873u2BH39yWwuYTp8uGKM05krHkDdmHJqEJ8Ara3ei5OpX7PsI+L6E0nAJ+bO4DO
	VWYepKG3I7KiKK0OVyHqVF8iiyVS/yl13d6gl87QPohED9UEkMH1REhtaRPNM6P+aziUWLm1SYo
	SnwRtSXuSXUMaSMyLYHDOVdkOt3b+HsRThg0FMd6EoQlQGDSS
X-Google-Smtp-Source: AGHT+IF5Nh+RdAeNHqBQ9BCQXNhrhQGj0Nk6GRgYN4kWHLkIsrnFi3YNTsib14QN+Y9p6bw9Y/5OGA==
X-Received: by 2002:a17:906:2932:b0:aa6:ab70:4a7d with SMTP id a640c23a62f3a-aab77ee9adbmr1253487666b.58.1734384680811;
        Mon, 16 Dec 2024 13:31:20 -0800 (PST)
Received: from ?IPV6:2a02:3100:a874:3500:f430:df67:6714:d87b? (dynamic-2a02-3100-a874-3500-f430-df67-6714-d87b.310.pool.telefonica.de. [2a02:3100:a874:3500:f430:df67:6714:d87b])
        by smtp.googlemail.com with ESMTPSA id a640c23a62f3a-aab963c54c7sm368743066b.195.2024.12.16.13.31.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Dec 2024 13:31:19 -0800 (PST)
Message-ID: <fd51738c-dcd6-4d61-b8c5-faa6ac0f1026@gmail.com>
Date: Mon, 16 Dec 2024 22:31:18 +0100
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next 1/3] net: phy: add phy_disable_eee
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

If a MAC driver doesn't support EEE, then the PHY shouldn't advertise it.
Add phy_disable_eee() for this purpose.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/net/phy/phy_device.c | 16 ++++++++++++++++
 include/linux/phy.h          |  1 +
 2 files changed, 17 insertions(+)

diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
index b26bb33cd..fe18a12c4 100644
--- a/drivers/net/phy/phy_device.c
+++ b/drivers/net/phy/phy_device.c
@@ -2993,6 +2993,22 @@ void phy_support_eee(struct phy_device *phydev)
 }
 EXPORT_SYMBOL(phy_support_eee);
 
+/**
+ * phy_disable_eee - Disable EEE for the PHY
+ * @phydev: Target phy_device struct
+ *
+ * This function is used by MAC drivers for MAC's which don't support EEE.
+ * It disables EEE on the PHY layer.
+ */
+void phy_disable_eee(struct phy_device *phydev)
+{
+	linkmode_zero(phydev->supported_eee);
+	linkmode_zero(phydev->advertising_eee);
+	phydev->eee_cfg.tx_lpi_enabled = false;
+	phydev->eee_cfg.eee_enabled = false;
+}
+EXPORT_SYMBOL_GPL(phy_disable_eee);
+
 /**
  * phy_support_sym_pause - Enable support of symmetrical pause
  * @phydev: target phy_device struct
diff --git a/include/linux/phy.h b/include/linux/phy.h
index e597a32cc..5bc71d599 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -2071,6 +2071,7 @@ void phy_advertise_eee_all(struct phy_device *phydev);
 void phy_support_sym_pause(struct phy_device *phydev);
 void phy_support_asym_pause(struct phy_device *phydev);
 void phy_support_eee(struct phy_device *phydev);
+void phy_disable_eee(struct phy_device *phydev);
 void phy_set_sym_pause(struct phy_device *phydev, bool rx, bool tx,
 		       bool autoneg);
 void phy_set_asym_pause(struct phy_device *phydev, bool rx, bool tx);
-- 
2.47.1



