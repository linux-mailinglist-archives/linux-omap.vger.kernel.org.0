Return-Path: <linux-omap+bounces-3191-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 696F5A19EE8
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jan 2025 08:26:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3692D3A4B3F
	for <lists+linux-omap@lfdr.de>; Thu, 23 Jan 2025 07:26:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AEBA520B7F3;
	Thu, 23 Jan 2025 07:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b="sClbXXEv"
X-Original-To: linux-omap@vger.kernel.org
Received: from server.wki.vra.mybluehostin.me (server.wki.vra.mybluehostin.me [162.240.238.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 980B220B21B;
	Thu, 23 Jan 2025 07:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.240.238.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737617163; cv=none; b=Sa1SXKZuBr19moHJ/KqghYU5LukWZQWvSYi6dzDwGAO9ImKWan0vN+41mRqErzj0fDLN3OlKCa1+mEZ6fVstdp7Xf3C2akpGGeEg+Hau4IiUfGt+pBIg9RhgZNSK9fjyvdrb5rguo6BL//n5gO9WExx+WkVTPxwKjmHtWjJO7Bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737617163; c=relaxed/simple;
	bh=+oTU2f7QVgMPnI5TDOFIx60vS3POz6R+KAMidl+5BuU=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=qqL4aHeBL7b/9b1XOm1HD1+/G3IMPe2FzuKbhHjb8d8s1Y3hFGJENgYcEvw0SZtvc87rrfwEAjS6o6f/26JvbwByUXa6lhhCK90eh5wLm6FZfGWwH4qAbXYULOrH8Js5iFup9zW6qW1+ZN+hkKeSebPW62dLbZHOkYU1w9dTR98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com; spf=pass smtp.mailfrom=couthit.com; dkim=pass (2048-bit key) header.d=couthit.com header.i=@couthit.com header.b=sClbXXEv; arc=none smtp.client-ip=162.240.238.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=couthit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=couthit.com
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=couthit.com
	; s=default; h=Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:
	References:In-Reply-To:Message-ID:Cc:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=veVVuKJ87/rWDfKKk1AslmxtqJaSaNITyAxbJjSZqBs=; b=sClbXXEvBxiDWOPpHjgna2Gr/r
	y7v1+u6od2V3kWR5Nd3lCCR2kHu5jhH6cUl4U9+h//cIsVEFI3Gyiba6S9Q82ZyoN4iwE2FIsqS3W
	DsxNnFTErn3b2PRzsPP0aO1xORwztmfTzvrZan4K5x7E1Y0CAPiBY4UJljzuJNZUzVxXW7Rbb6pdR
	zFlvVbaokqMzbs96DSwagskLz3Km6HfJXaGxuzfEcM2jKKTtiijosYTR6xjXZ6hlBV8jb4jL3W9SA
	r7PzG6sPpqv/jKYGPQ3jXs3ARB9GfbCtT8gfF15l/jQ2WFZPzE5ki1LeF45zlZ870NkaxDng6OGoV
	+UMB5CsA==;
Received: from [122.175.9.182] (port=20914 helo=zimbra.couthit.local)
	by server.wki.vra.mybluehostin.me with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <basharath@couthit.com>)
	id 1tarb9-0008NK-2D;
	Thu, 23 Jan 2025 12:55:56 +0530
Received: from zimbra.couthit.local (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTPS id 81E7F1781A7D;
	Thu, 23 Jan 2025 12:55:49 +0530 (IST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.couthit.local (Postfix) with ESMTP id 623C21782495;
	Thu, 23 Jan 2025 12:55:49 +0530 (IST)
Received: from zimbra.couthit.local ([127.0.0.1])
	by localhost (zimbra.couthit.local [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id CgdwGL9ompX1; Thu, 23 Jan 2025 12:55:49 +0530 (IST)
Received: from zimbra.couthit.local (zimbra.couthit.local [10.10.10.103])
	by zimbra.couthit.local (Postfix) with ESMTP id 1E2E41781A7D;
	Thu, 23 Jan 2025 12:55:49 +0530 (IST)
Date: Thu, 23 Jan 2025 12:55:48 +0530 (IST)
From: Basharath Hussain Khaja <basharath@couthit.com>
To: Jason Xing <kerneljasonxing@gmail.com>
Cc: basharath <basharath@couthit.com>, danishanwar <danishanwar@ti.com>, 
	rogerq <rogerq@kernel.org>, andrew+netdev <andrew+netdev@lunn.ch>, 
	davem <davem@davemloft.net>, edumazet <edumazet@google.com>, 
	kuba <kuba@kernel.org>, pabeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, krzk+dt <krzk+dt@kernel.org>, 
	conor+dt <conor+dt@kernel.org>, nm <nm@ti.com>, 
	ssantosh <ssantosh@kernel.org>, tony <tony@atomide.com>, 
	richardcochran <richardcochran@gmail.com>, 
	parvathi <parvathi@couthit.com>, schnelle <schnelle@linux.ibm.com>, 
	rdunlap <rdunlap@infradead.org>, diogo ivo <diogo.ivo@siemens.com>, 
	m-karicheri2 <m-karicheri2@ti.com>, horms <horms@kernel.org>, 
	jacob e keller <jacob.e.keller@intel.com>, 
	m-malladi <m-malladi@ti.com>, 
	javier carrasco cruz <javier.carrasco.cruz@gmail.com>, 
	afd <afd@ti.com>, s-anna <s-anna@ti.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	netdev <netdev@vger.kernel.org>, 
	devicetree <devicetree@vger.kernel.org>, 
	linux-kernel <linux-kernel@vger.kernel.org>, 
	linux-omap <linux-omap@vger.kernel.org>, 
	pratheesh <pratheesh@ti.com>, prajith <prajith@ti.com>, 
	vigneshr <vigneshr@ti.com>, praneeth <praneeth@ti.com>, 
	srk <srk@ti.com>, rogerq <rogerq@ti.com>, 
	krishna <krishna@couthit.com>, pmohan <pmohan@couthit.com>, 
	mohan <mohan@couthit.com>
Message-ID: <507763040.391350.1737617148913.JavaMail.zimbra@couthit.local>
In-Reply-To: <CAL+tcoD6WuJH6yXaEGvuz_s3sROPXtEMeZw1hBNQvb6wnKKr-w@mail.gmail.com>
References: <20250109105600.41297-1-basharath@couthit.com> <20250110055906.65086-7-basharath@couthit.com> <CAL+tcoD6WuJH6yXaEGvuz_s3sROPXtEMeZw1hBNQvb6wnKKr-w@mail.gmail.com>
Subject: Re: [RFC PATCH 06/10] net: ti: prueth: Adds HW timestamping support
 for PTP using PRU-ICSS IEP module
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: Zimbra 8.8.15_GA_3968 (ZimbraWebClient - FF113 (Linux)/8.8.15_GA_3968)
Thread-Topic: prueth: Adds HW timestamping support for PTP using PRU-ICSS IEP module
Thread-Index: wTJ8No/eSvZZY8f30NQgDnaEMvdq2w==
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.wki.vra.mybluehostin.me
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - couthit.com
X-Get-Message-Sender-Via: server.wki.vra.mybluehostin.me: authenticated_id: smtp@couthit.com
X-Authenticated-Sender: server.wki.vra.mybluehostin.me: smtp@couthit.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

> On Fri, Jan 10, 2025 at 2:01=E2=80=AFPM Basharath Hussain Khaja
> <basharath@couthit.com> wrote:
>>
>> From: Roger Quadros <rogerq@ti.com>
>>
>> PRU-ICSS IEP module, which is capable of timestamping RX and
>> TX packets at HW level, is used for time synchronization by PTP4L.
>>
>> This change includes interaction between firmware and user space
>> application (ptp4l) with required packet timestamps. The driver
>> initializes the PRU firmware with appropriate mode and configuration
>> flags. Firmware updates local registers with the flags set by driver
>> and uses for further operation. RX SOF timestamp comes along with
>> packet and firmware will rise interrupt with TX SOF timestamp after
>> pushing the packet on to the wire.
>>
>> IEP driver is available in upstream and we are reusing for hardware
>> configuration for ICSSM as well. On top of that we have extended it
>> with the changes for AM57xx SoC.
>>
>> Extended ethtool for reading HW timestamping capability of the PRU
>> interfaces.
>>
>> Currently ordinary clock (OC) configuration has been validated with
>> Linux ptp4l.
>>
>> Signed-off-by: Roger Quadros <rogerq@ti.com>
>> Signed-off-by: Andrew F. Davis <afd@ti.com>
>> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
>> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
>> ---
>>  drivers/net/ethernet/ti/icssg/icss_iep.c      |  42 ++
>>  drivers/net/ethernet/ti/icssm/icssm_ethtool.c |  26 +
>>  drivers/net/ethernet/ti/icssm/icssm_prueth.c  | 443 +++++++++++++++++-
>>  drivers/net/ethernet/ti/icssm/icssm_prueth.h  |  11 +
>>  .../net/ethernet/ti/icssm/icssm_prueth_ptp.h  |  85 ++++
>>  5 files changed, 605 insertions(+), 2 deletions(-)
>>  create mode 100644 drivers/net/ethernet/ti/icssm/icssm_prueth_ptp.h
>>
>> diff --git a/drivers/net/ethernet/ti/icssg/icss_iep.c
>> b/drivers/net/ethernet/ti/icssg/icss_iep.c
>> index 768578c0d958..9a2ea13703d8 100644
>> --- a/drivers/net/ethernet/ti/icssg/icss_iep.c
>> +++ b/drivers/net/ethernet/ti/icssg/icss_iep.c
>> @@ -937,11 +937,53 @@ static const struct icss_iep_plat_data
>> am654_icss_iep_plat_data =3D {
>>         .config =3D &am654_icss_iep_regmap_config,
>>  };
>>
>> +static const struct icss_iep_plat_data am57xx_icss_iep_plat_data =3D {
>> +       .flags =3D ICSS_IEP_64BIT_COUNTER_SUPPORT |
>> +                ICSS_IEP_SLOW_COMPEN_REG_SUPPORT,
>> +       .reg_offs =3D {
>> +               [ICSS_IEP_GLOBAL_CFG_REG] =3D 0x00,
>> +               [ICSS_IEP_COMPEN_REG] =3D 0x08,
>> +               [ICSS_IEP_SLOW_COMPEN_REG] =3D 0x0C,
>> +               [ICSS_IEP_COUNT_REG0] =3D 0x10,
>> +               [ICSS_IEP_COUNT_REG1] =3D 0x14,
>> +               [ICSS_IEP_CAPTURE_CFG_REG] =3D 0x18,
>> +               [ICSS_IEP_CAPTURE_STAT_REG] =3D 0x1c,
>> +
>> +               [ICSS_IEP_CAP6_RISE_REG0] =3D 0x50,
>> +               [ICSS_IEP_CAP6_RISE_REG1] =3D 0x54,
>> +
>> +               [ICSS_IEP_CAP7_RISE_REG0] =3D 0x60,
>> +               [ICSS_IEP_CAP7_RISE_REG1] =3D 0x64,
>> +
>> +               [ICSS_IEP_CMP_CFG_REG] =3D 0x70,
>> +               [ICSS_IEP_CMP_STAT_REG] =3D 0x74,
>> +               [ICSS_IEP_CMP0_REG0] =3D 0x78,
>> +               [ICSS_IEP_CMP0_REG1] =3D 0x7c,
>> +               [ICSS_IEP_CMP1_REG0] =3D 0x80,
>> +               [ICSS_IEP_CMP1_REG1] =3D 0x84,
>> +
>> +               [ICSS_IEP_CMP8_REG0] =3D 0xc0,
>> +               [ICSS_IEP_CMP8_REG1] =3D 0xc4,
>> +               [ICSS_IEP_SYNC_CTRL_REG] =3D 0x180,
>> +               [ICSS_IEP_SYNC0_STAT_REG] =3D 0x188,
>> +               [ICSS_IEP_SYNC1_STAT_REG] =3D 0x18c,
>> +               [ICSS_IEP_SYNC_PWIDTH_REG] =3D 0x190,
>> +               [ICSS_IEP_SYNC0_PERIOD_REG] =3D 0x194,
>> +               [ICSS_IEP_SYNC1_DELAY_REG] =3D 0x198,
>> +               [ICSS_IEP_SYNC_START_REG] =3D 0x19c,
>> +       },
>> +       .config =3D &am654_icss_iep_regmap_config,
>> +};
>> +
>>  static const struct of_device_id icss_iep_of_match[] =3D {
>>         {
>>                 .compatible =3D "ti,am654-icss-iep",
>>                 .data =3D &am654_icss_iep_plat_data,
>>         },
>> +       {
>> +               .compatible =3D "ti,am5728-icss-iep",
>> +               .data =3D &am57xx_icss_iep_plat_data,
>> +       },
>>         {},
>>  };
>>  MODULE_DEVICE_TABLE(of, icss_iep_of_match);
>> diff --git a/drivers/net/ethernet/ti/icssm/icssm_ethtool.c
>> b/drivers/net/ethernet/ti/icssm/icssm_ethtool.c
>> index cce3276d5565..86d62d64dc4d 100644
>> --- a/drivers/net/ethernet/ti/icssm/icssm_ethtool.c
>> +++ b/drivers/net/ethernet/ti/icssm/icssm_ethtool.c
>> @@ -7,6 +7,7 @@
>>
>>  #include <linux/if_bridge.h>
>>  #include "icssm_prueth.h"
>> +#include "../icssg/icss_iep.h"
>>
>>  #define PRUETH_MODULE_VERSION "0.2"
>>  #define PRUETH_MODULE_DESCRIPTION "PRUSS Ethernet driver"
>> @@ -189,12 +190,37 @@ static void icssm_emac_get_regs(struct net_device =
*ndev,
>>         regs->version =3D PRUETH_REG_DUMP_GET_VER(prueth);
>>  }
>>
>> +static int icssm_emac_get_ts_info(struct net_device *ndev,
>> +                                 struct kernel_ethtool_ts_info *info)
>> +{
>> +       struct prueth_emac *emac =3D netdev_priv(ndev);
>> +
>> +       if ((PRUETH_IS_EMAC(emac->prueth) && !emac->emac_ptp_tx_irq))
>> +               return ethtool_op_get_ts_info(ndev, info);
>> +
>> +       info->so_timestamping =3D
>> +               SOF_TIMESTAMPING_TX_HARDWARE |
>> +               SOF_TIMESTAMPING_TX_SOFTWARE |
>> +               SOF_TIMESTAMPING_RX_HARDWARE |
>> +               SOF_TIMESTAMPING_RX_SOFTWARE |
>> +               SOF_TIMESTAMPING_SOFTWARE |
>> +               SOF_TIMESTAMPING_RAW_HARDWARE;
>=20
> In addtion to what Richard suggested, there is no need to re-mark the
> following flags "SOF_TIMESTAMPING_RX_SOFTWARE" and
> "SOF_TIMESTAMPING_SOFTWARE", please see __ethtool_get_ts_info().
>=20

Yes. This module always uses IEP HW timestamping both on RX side and TX sid=
e=20
for better precision. We will clean this in the next version.

Thanks & Best Regards,
Basharath

