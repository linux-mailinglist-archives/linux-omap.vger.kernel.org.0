Return-Path: <linux-omap+bounces-4764-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDABC08B4B
	for <lists+linux-omap@lfdr.de>; Sat, 25 Oct 2025 07:27:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E0E9E4E1C3E
	for <lists+linux-omap@lfdr.de>; Sat, 25 Oct 2025 05:27:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D7280298CA2;
	Sat, 25 Oct 2025 05:27:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="aadn7s8H"
X-Original-To: linux-omap@vger.kernel.org
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681621CAA7B;
	Sat, 25 Oct 2025 05:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761370064; cv=none; b=dVx7WtUeXlbGf6Wtta7eLe6bnlDy1YJemA2MTchNeoVLN54Xp3W6FeDGHaNwgeRoX9X7e63uUWBytvVWDHKxXUovU4yrPXfMjkK504e9Eh3YyFMD+0gmLQPodr3+F8qjE1oZrwbD4LqbhKmLDRaJ9s5bUey9Ma5FdI2LulDome4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761370064; c=relaxed/simple;
	bh=T3/zY8kw1Mev1iNmTNBpghm/uKV9g60ZaH2PkeyOdvk=;
	h=Message-ID:Subject:From:To:CC:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ncEJojElLuQ1JK9QCiGZyi/0p1vaMn8H/tde2gHjR4VvPq0Ru1PkGcxcofvfgV04P1XRbY1FOdOsW7WJQF7wS0oskCapNMF92fk4xU3nXmmVVvk/GGhknr15u1A4MD1jOk7yGcof5Aj/S2mu3jR4yBv41RRiNoQtqh0Eh+90BbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=aadn7s8H; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59P5RFED882330;
	Sat, 25 Oct 2025 00:27:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761370035;
	bh=T3/zY8kw1Mev1iNmTNBpghm/uKV9g60ZaH2PkeyOdvk=;
	h=Subject:From:To:CC:Date:In-Reply-To:References;
	b=aadn7s8HRWMCq7myzp0vFzP/odwrszfXobbGvJpMjGmLXxuulpQ/QEC90vVlrtS18
	 2zQ8T1nekg2FbJAnHVTNpCFE8xIwKHPCBQmqiZAPiqE9UcNQzE1LSsXY96Z9SUnzDr
	 I23B1AgaBW2+P/KtvPKOSsiNLB4Ge1lZzwCrtG7s=
Received: from DFLE200.ent.ti.com (dfle200.ent.ti.com [10.64.6.58])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59P5REVD4077799
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 25 Oct 2025 00:27:15 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Sat, 25 Oct
 2025 00:27:14 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Sat, 25 Oct 2025 00:27:14 -0500
Received: from [10.24.73.74] (uda0492258.dhcp.ti.com [10.24.73.74])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59P5RAQN1443472;
	Sat, 25 Oct 2025 00:27:10 -0500
Message-ID: <7151c443585fc1c68327385582cd2dbca620a810.camel@ti.com>
Subject: Re: [PATCH v2 net-next 3/4] net: davinci_mdio: use new iterator
 mdiobus_for_each_phy
From: Siddharth Vadapalli <s-vadapalli@ti.com>
To: Heiner Kallweit <hkallweit1@gmail.com>
CC: Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>,
        "Clark
 Wang" <xiaoning.wang@nxp.com>,
        Roger Quadros <rogerq@kernel.org>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        <imx@lists.linux.dev>, <linux-omap@vger.kernel.org>,
        Andrew Lunn <andrew@lunn.ch>, Andrew Lunn
	<andrew+netdev@lunn.ch>,
        Russell King - ARM Linux <linux@armlinux.org.uk>,
        Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
        "Eric
 Dumazet" <edumazet@google.com>,
        David Miller <davem@davemloft.net>,
        Siddharth
 Vadapalli <s-vadapalli@ti.com>
Date: Sat, 25 Oct 2025 10:57:19 +0530
In-Reply-To: <aadd3bd7-5cc5-45f5-b14d-d0b63629d612@gmail.com>
References: <9c6aeec5-f651-4cf0-8cca-d2455048e89e@gmail.com>
	 <aadd3bd7-5cc5-45f5-b14d-d0b63629d612@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.1-1 
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

On Fri, 2025-10-24 at 22:23 +0200, Heiner Kallweit wrote:
> Use new iterator mdiobus_for_each_phy() to simplify the code.
>=20
> Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>

Reviewed-by: Siddharth Vadapalli <s-vadapalli@ti.com>

Regards,
Siddharth.

