Return-Path: <linux-omap+bounces-4749-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E52C0805C
	for <lists+linux-omap@lfdr.de>; Fri, 24 Oct 2025 22:20:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C90383BFF3E
	for <lists+linux-omap@lfdr.de>; Fri, 24 Oct 2025 20:20:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC17F2F0689;
	Fri, 24 Oct 2025 20:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gY6vZaVx"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB0D2EFD88
	for <linux-omap@vger.kernel.org>; Fri, 24 Oct 2025 20:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761337209; cv=none; b=Tv3trrtshsTdu21sLUJ7uqRcz4rJ8btjOkeANEuhE/x9TRrzwuRcIjU3YiKckT54UlMmW6y59XTajBZgWekzsqDfAnqYY59NEzXNmiiv4ZoSPsf3bbahxf15GZos89dnJlkFhkrDFeCCm8o62stoEM7nTix2ZmoOKj9RvqCsjK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761337209; c=relaxed/simple;
	bh=k5tU3T43p95wD4ZxBY159klzDKkJYzTtwU4h2HolU08=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=nFS/s5bs4nnrsUJiMcd6m7v1hSG3AWYzvPWML3G3a46DOwRuFbevqKOTBABKlObg7/aTamZ7AoUePDSCMbxsQbrVVXMMUIYQifYsuXuWXCkh5L/NEoRcFm3yxrgfBK1GvP6TSO6VivMhZHVo2fcce5QCJmVtuCToh5SNvisSkyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gY6vZaVx; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-475ca9237c2so13450075e9.3
        for <linux-omap@vger.kernel.org>; Fri, 24 Oct 2025 13:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761337203; x=1761942003; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89cTnVVRD/y4pnuvzSBknWngxyxloYfQfIWpcoSurb4=;
        b=gY6vZaVxCsR5prpJXn3FkRrHITm8dFrA+tTLAE0UZbypFl3fiiV8vLPGPMg+vKTBwC
         mYEZm+cca6aCChf/8GDoIQERU7aLLGTJCtXsQFI1LMhWEFjipw2HKBzWoaJxQ767l1Ei
         iqDHN6E+GsQE/7Ru5btnliUwM5h7Ywoo0ocN/HhZjpWqSuR2opwraQ7jxxBSMO/HwAMK
         qIGeGvlflDcbXzb3iNl1IXNB/Xrr0Py9MqZWD8PE1Y6fQ/wQyV1EWhLKz+OKsS/7xqD7
         9EjAqodL+UFiPk7fOIOWrCO6HObPCIgwe6fjy1ur6r6Ii+tpE13s45QAIkDnWmYfcQnL
         9YQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761337203; x=1761942003;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=89cTnVVRD/y4pnuvzSBknWngxyxloYfQfIWpcoSurb4=;
        b=m6P6TdvbwzrumA9ond1Z/cucAzYzwyU0bf5YxfhmZXJYN8UubReA7Jma6pBeF4dJLJ
         qV8U+Y2oCoW89awfk+yN/mZFG0hBs7txLvs395q/h6mnhohiCi5IBR/NU85qVlfsm1aM
         XUHikiBfNTfYYwKpnMoUiVUt+fmmOrnhVR5eYJZRy+CkAFi10373AiKcAScqEhxpfeSa
         xsomhmstJwTV3MBJkqdCJJydhvGwK8+frx0HXz9tm3U/BvnZjwIvV9QkIXrnEnzM0o53
         IIdwcfJj6VTFyZZWEnzF4qfFydWxEzIGhj6f01w4BXc+yCMqLU6bXM1vhzIFPj8dvnZ3
         2gww==
X-Forwarded-Encrypted: i=1; AJvYcCWFA+Y+7vYoNRILybQg1fmNlNiwwelV5VSOD9JEi6ISGPepUUL0D8kfo46AKiagPgI5sUjAlUH19S5x@vger.kernel.org
X-Gm-Message-State: AOJu0YzSxuIz9LXovAfJue9+Uj6Pw1HxMCO8dCyLZIT6QxRUByBkfKdP
	ofAPyV42i2pqioGzkKaN4KcioyUUa91FY/l7OyIRp7xhQ/wCji0vEXDn4WRVmA==
X-Gm-Gg: ASbGncuGdp2a7g4/nElwctlVxqWMTh+115o7Nr82ZfuMGexDKu+xmXGuR+CpNVCANQd
	DN3COY5KOKi/nnntjG29DdOAxwFNR68jE3FpbWm/ccVcmj/5Ff0AWmwTEuiK9za0oeJG8G67aE9
	RZ+fYEN3O1+lDem4KHuKvISoYLjO6+ML9iduBSMrSx6LHp1A5Kax0ODhKCL1OGGSegcmMe6qQhQ
	UyKwbviDBHOVO+53DuKFa5gYXsHghmo94MOFb9GLF23cJxI0CCGtSrA8mXrEiSkAgEiQuGfpmA6
	x4FAim8EDQic8aqmXf5XYjoq5etWdjJeNDDaMB2lmQ1FlrpCT9Soe5bZ6ifTXcRfSmoHhhzjEkN
	uUsbnhYRY3YEflU7tU7VTgcSltDzPiNrGDJzM0XWLNGvrMuAopeJFUAZwSuteEGLmX86s7VL0sD
	Fii9Tsl2kZC7E4OaWeYPDe8oa9dR3Hq03WI1/qaLgrlGfpj2ERw4s2+hpmbtPaLcnfUmPT5+xMR
	zCZ+ltmsIRftDQFWwKFlBgI4XyfPyMYN63Ef0QANxM=
X-Google-Smtp-Source: AGHT+IF2t1PUIrYokqkaMcPoc81FuEECKHfpaMWlqxlZWlCT+8fXzPcvUctzrRkg6V5vZBUt6VjHVw==
X-Received: by 2002:a05:600c:4e48:b0:475:dba3:9ca with SMTP id 5b1f17b1804b1-475dba30c74mr3620735e9.39.1761337202833;
        Fri, 24 Oct 2025 13:20:02 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f20:af00:7cba:4f15:bb68:cf78? (p200300ea8f20af007cba4f15bb68cf78.dip0.t-ipconnect.de. [2003:ea:8f20:af00:7cba:4f15:bb68:cf78])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dcbb41c0sm292835e9.1.2025.10.24.13.20.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Oct 2025 13:20:02 -0700 (PDT)
Message-ID: <9c6aeec5-f651-4cf0-8cca-d2455048e89e@gmail.com>
Date: Fri, 24 Oct 2025 22:20:12 +0200
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
 <s-vadapalli@ti.com>, Roger Quadros <rogerq@kernel.org>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>, imx@lists.linux.dev,
 linux-omap@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, David Miller <davem@davemloft.net>
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH v2 net-next 0/4] net: phy: add iterator mdiobus_for_each_phy
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Add and use an iterator for all PHY's on a MII bus, and phy_find_next()
as a prerequisite.

v2:
- rename iterator to mdiobus_for_each_phy

Heiner Kallweit (4):
  net: phy: add iterator mdiobus_for_each_phy
  net: fec: use new iterator mdiobus_for_each_phy
  net: davinci_mdio: use new iterator mdiobus_for_each_phy
  net: phy: use new iterator mdiobus_for_each_phy in
    mdiobus_prevent_c45_scan

 drivers/net/ethernet/freescale/fec_main.c |  8 ++------
 drivers/net/ethernet/ti/davinci_mdio.c    | 14 +++++---------
 drivers/net/phy/mdio_bus_provider.c       | 13 ++++---------
 drivers/net/phy/phy_device.c              | 14 +++++++-------
 include/linux/phy.h                       | 11 ++++++++++-
 5 files changed, 28 insertions(+), 32 deletions(-)

-- 
2.51.1


