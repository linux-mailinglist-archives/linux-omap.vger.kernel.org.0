Return-Path: <linux-omap+bounces-4772-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 18813C09E8C
	for <lists+linux-omap@lfdr.de>; Sat, 25 Oct 2025 20:48:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 842B33BB80C
	for <lists+linux-omap@lfdr.de>; Sat, 25 Oct 2025 18:48:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 218422D978A;
	Sat, 25 Oct 2025 18:48:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Em2A6sPD"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE2E2248B4
	for <linux-omap@vger.kernel.org>; Sat, 25 Oct 2025 18:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761418105; cv=none; b=JkitoJSi62Zxj4LNXJGBHn345rGvVq92jzyoEaHqx37es10nGjixmF+IaoUc50JCyQ5+TeYi8XQ4Nfb0ukK4XQmOKj9r0zAodEOVjRr+cjup1BmX+aYtknde1lEotM30mSz7s/j+q+hqU7TSNgCcop0zgPUQ4HBcJxRrU9GbVpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761418105; c=relaxed/simple;
	bh=lB4Dxkt0TRaUBnvTCUZDfEdUI4b45T5lSgIADYdoQt0=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=AU9BoHvMWekFDGElc2RigE9/dpO6f09Ae1LofDucrR3WblppFcrqyV8uoGGmIunVz/JhKch66vSfF/Y4kIPYJlhVSXTGABS8g+CRrS7UePkC+5hvGXNqLlqdRrfuPLJc7zhiZYWFZVacJNi511GsJp9cJ3nJTfYIHn7U/3RKbcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Em2A6sPD; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-427015003eeso2907940f8f.0
        for <linux-omap@vger.kernel.org>; Sat, 25 Oct 2025 11:48:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761418102; x=1762022902; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/4DEObF2TnlPKzUdiOnUGsTpjwM4e9ytvSs5bWLyvVw=;
        b=Em2A6sPDDz+TmipDd/iUHNmzRzHsGXT9ZP4wxNR0RSlSI3HMatMmqqVyNeYwDPkNeu
         3oiPnWGKt4fSNW7MT3CWy97NjPmqrQVohIi3mu1GoWQsL+311krIWj6e695twndKlbTW
         ZX1bTP84f79YKff3PQ9bhxf6rcdIK59SaKxnuB9QSHpkxVf1+bFS6+f4gtHsGt0aGECy
         CeiJTXAwlHyvY7S9h+nhkzGyRP/1LCk3Z+qTR4Lq8f2cpZ4qhoBA7u6tTFPvNFPRtYTA
         Ln8kJLM/JB8p0Z93deiNKjOFy5bXLVLNyS48GGk1N12I6tYqyoVZp6YxG+8xeslXvf9N
         KGlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761418102; x=1762022902;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/4DEObF2TnlPKzUdiOnUGsTpjwM4e9ytvSs5bWLyvVw=;
        b=oqIHzOqIdxeZWusZaUqLTjW73cN6alvCoxwFBzMcSGzh+hl3pILM6XpNfOzljKxX2h
         LOwWM8mHhIQeT6yKfbE9lS/yu/Rja1wC3+i+18+vjWBmGLfttZXgRwNO6Qa1jmT+TORm
         lxHuVaglDrmV4c9QqIYnX2nGi7mLR46oefvcU3cTLq7Me17+GHJrrx5IJuaKQx+Rw4Zd
         Ka3s1xIdSjAKecoMeJ57cVe68t1HJ5fvZ3TkDKLbxwxzMc0Sb+7hMkFSmb+T2k4L34jJ
         CtiUZ7osoYaKCMfxmUHC2/Mak2vOwBlGYxlARRpvnMhZhy6a5jb+bQlEo65WaFPngnJQ
         jAzw==
X-Forwarded-Encrypted: i=1; AJvYcCWuUkDOJvhZ+hiCeIImEGSIV+O6uxHdVQWP8iWZGwR2kAeZwpU9O28x7qhnwbGxVP5L7dDzpVX+1K4R@vger.kernel.org
X-Gm-Message-State: AOJu0Yys16vuPei/hLgJfIZJeVhUSaX/jYhjlflWPCGWpGA8uhD7N1Td
	u9Kl5lxQ7P5nZCjykxPDmDdefvYeN9gH/Z6gJQdAjl7e3cBeRITKNSBg
X-Gm-Gg: ASbGncv2iHykzsIlVpJ9z55Bv1UBwEcAXWHG0yyGKv5EWR0Zdf+iFWP8msoCT9q3JU3
	dFf/inANiW9CaKMgok67raPzy2tI6fqrwDBDhDak6fgWgQaDhQR+OmJ95N7WV7L72XPzv7PhDhw
	7p+7X4ngWl4Jj1PLBe0DgJ2//RUANqktKoBHSXQDZuqjGyu1/+ZRWZioPPI1RivJIEkR79kvD0o
	iME7jazwwytON46m/Lth7clD0MO+Sna1ufcb6Al8C/gHTOoXIaRsqFAfQRauVQGDTLZAm15usg9
	8TbIcYlsRL9hFfMXAlblvKqfAYI3Dn01U5Zj5TIt6jzhlWZ176Hhx33W4wbmviQ+7gd/QEpkXzj
	hLhuvU9HmU1W9+aSzO3gFOdUqQaj5UZx/CTtL4vR1IKaIy+OXAv5OW46siRvXttDBjvXPaAd9X2
	+MdDEOlErYn52aZS6gIpFxFo/1j1ruxFAPQIf7yXBWMQ8kMMHUGBomX0g1bolhLQY/tF6JeK7HU
	Hx1DO60gGj69dP7ycr98Gmet9LXkKBSiFGrUj9My+Y+tvHSUT9wZg==
X-Google-Smtp-Source: AGHT+IHCcJrVSR0S/2bwLvXjTXNpPmTtljDkbM3kYmLozHWMGTFvMyAitKH80oZ9JGOJZmbETpzfsQ==
X-Received: by 2002:a05:6000:4310:b0:428:3f7c:bcf7 with SMTP id ffacd0b85a97d-4283f7cbf5fmr20516277f8f.62.1761418102292;
        Sat, 25 Oct 2025 11:48:22 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f39:8b00:d401:6211:9005:e76e? (p200300ea8f398b00d40162119005e76e.dip0.t-ipconnect.de. [2003:ea:8f39:8b00:d401:6211:9005:e76e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952b7a94sm5404597f8f.5.2025.10.25.11.48.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Oct 2025 11:48:21 -0700 (PDT)
Message-ID: <07fc63e8-53fd-46aa-853e-96187bba9d44@gmail.com>
Date: Sat, 25 Oct 2025 20:48:20 +0200
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>,
 Clark Wang <xiaoning.wang@nxp.com>, Siddharth Vadapalli
 <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 linux-omap@vger.kernel.org, imx@lists.linux.dev
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v3 net-next 0/4] net: phy: add iterator mdiobus_for_each_phy
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Add and use an iterator for all PHY's on a MII bus, and phy_find_next()
as a prerequisite.

v2:
- rename iterator to mdiobus_for_each_phy
v3:
- add missing return value description for phy_find_next

Heiner Kallweit (4):
  net: phy: add iterator mdiobus_for_each_phy
  net: fec: use new iterator mdiobus_for_each_phy
  net: davinci_mdio: use new iterator mdiobus_for_each_phy
  net: phy: use new iterator mdiobus_for_each_phy in
    mdiobus_prevent_c45_scan

 drivers/net/ethernet/freescale/fec_main.c |  8 ++------
 drivers/net/ethernet/ti/davinci_mdio.c    | 14 +++++---------
 drivers/net/phy/mdio_bus_provider.c       | 13 ++++---------
 drivers/net/phy/phy_device.c              | 16 +++++++++-------
 include/linux/phy.h                       | 11 ++++++++++-
 5 files changed, 30 insertions(+), 32 deletions(-)

-- 
2.51.1


