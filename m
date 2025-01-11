Return-Path: <linux-omap+bounces-3089-lists+linux-omap=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id AA029A0A6AD
	for <lists+linux-omap@lfdr.de>; Sun, 12 Jan 2025 00:38:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC87B16810E
	for <lists+linux-omap@lfdr.de>; Sat, 11 Jan 2025 23:38:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9195A1BDABE;
	Sat, 11 Jan 2025 23:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i9LXH4uB"
X-Original-To: linux-omap@vger.kernel.org
Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A340918FC7E;
	Sat, 11 Jan 2025 23:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736638723; cv=none; b=SQv9D7DuECEgnMT3B5nZYLI+a9whqNthYpmWERXWALbaUSgi3zfwA+DdaBYcbknp0igC0k1o30xvr+VVLQX2aIEXv1RD6lXngmnz/873Chph7wsVo8CWq8Vr3+z1bgnuL2RBXmGbwlWaJt4eao9C4xwqVtXsWmTGLnliR31HPSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736638723; c=relaxed/simple;
	bh=FSTwPLy6DPUHJWyvtcZkx0zy2EepS5FHcGB09vkShdk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QLsK+oa0KXWyF5W6NnrGhBtK4ZirCiy0GHctll9rE8mel4paOqkXB97QNjHNH8D3DCbfqsMFEIqNwuZNfTYAQ62iJlrJWicEjUcjkcT+wy09TbRP7nVzVOt3by1Zg+hRSA1U554BYMVVPM03QlBSd4ztFLNjm7jFTlcp5aI+mQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i9LXH4uB; arc=none smtp.client-ip=209.85.166.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-io1-f51.google.com with SMTP id ca18e2360f4ac-844e9b8b0b9so243457039f.0;
        Sat, 11 Jan 2025 15:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736638721; x=1737243521; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GSmGDNX9CC2d3HL4afoZjaMZrOh6/NAEiJbAyqPRBEo=;
        b=i9LXH4uBr0Hb+h1JxkaBAQi33gTsUU3FTwfgT5P4NiNl5l7k+BpaKifFytGhAH6C+X
         shMyfU+nvsN0lNG7WM3xwEl1g5sYcnGU8x7TfmGmBmFtVUrojJOtndMd97X5NeWK8GbP
         vw0bvx0+nbF90aitrKrkErgAHqyvJ3k4oYyHFQURxiyRdTjeMfCc2ILFJnKX391mlaNk
         fRTcXIpJLscaabC3UZUSsYVI0c5REfhHx0OPOvslJjrBPqK31tseIeb7X0cLA/x0DUby
         yfAVL9BVOIn6qBKUw29RVKowAX1rf71cyo6ov6GgRKmdqWGevmnwriJ3HbXQ+hfzTiVq
         BMSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736638721; x=1737243521;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GSmGDNX9CC2d3HL4afoZjaMZrOh6/NAEiJbAyqPRBEo=;
        b=QqIf0TXPPdZESctT4SV606Ge8ozEYxSYnpTU6s+2n9JdcLysUg6f6SWVEnjIxIrpwj
         myOjmM3YT+8NWWJYJB4RKrea1jmkfVklaZlu5ADQI9yKnle+zKSpmGXQDaQ76gG4jUUC
         vcEv1aOlUcNjU3Zk+Oy6yYvBY0IJF0Sk3EiCXG4bGNbY19k22ME+PA6rFyO2u1u3Cd45
         VGFgHqp2ZKxp2whiUJuXnPyM8QrEPEEzo0R4eE7p1vhL8L6qcsTOi/oTiZHZkbvLOSQw
         hwZHnn0fuDNBkEw6mfq7vVL35LX7Mge5APXGAtMdst1IVY3HOBSbWp5nCh1c3Wiznn6l
         qrJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQ3WaTExfhJnLFb8D2YAyzIRT0NRl7jBbm+pkqUlKxfwsfL5M6qvCwwcJhlOIElfVTzf5B/ucOqryFJg==@vger.kernel.org, AJvYcCV2PTy/HabEF739Rtzok0N2JB8oC0rnqoe3QOuDeLlcm7VrTBgJUqUChIEx/F/XvLLjU1B5BzZF@vger.kernel.org, AJvYcCVDisvpVKH63AzgKGhi+8DG/Q6PDO0eIE4BAwLlC3VYIO1zZ7GVkmmW6Lsn6F9cLHC1xWk3Lvd/mrh9@vger.kernel.org, AJvYcCW822iJwd5tsb25hDbfVmCkadlR82E1yGzaOU7LZvn2sTIWGxkXueUT9/dpFMvA/DDz+XwHMHPXYbmCHwv5@vger.kernel.org
X-Gm-Message-State: AOJu0YzkOVzFCvQ9HQLK5jHf8jv4bvnZtf2TTDlUHySdIPrlRFpFhf24
	DWfUMGNSzjr0BZVl2784TjQGXQgRaKaAwyCgxIDlf7/7Aga6crm3jRZbMX0o0M17kKYTYCRtnaj
	d0m78gRVeXq7HQEle0c5ZiQmJEdI=
X-Gm-Gg: ASbGncvIWzfw1zDwpvI57lLP9XUtxJUcwdK3hD/n5Tg0F/NyHfN4trz5VQJ4Aii3Paj
	t1jAlUU/Qwd0cqK+oJQuokp/qyrfs5Zo8gius
X-Google-Smtp-Source: AGHT+IH6Z6JztDq8NnTac66FF1FRfOdf7YDCCFhupP4kXxxaC7X0XENWJ4B8Agrqh55Q23BphIsV5KAlzt5FAVergck=
X-Received: by 2002:a05:6e02:1607:b0:3cd:d08a:5c99 with SMTP id
 e9e14a558f8ab-3ce3a87a5d9mr120667135ab.8.1736638720742; Sat, 11 Jan 2025
 15:38:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-omap@vger.kernel.org
List-Id: <linux-omap.vger.kernel.org>
List-Subscribe: <mailto:linux-omap+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-omap+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250109105600.41297-1-basharath@couthit.com> <20250110055906.65086-7-basharath@couthit.com>
In-Reply-To: <20250110055906.65086-7-basharath@couthit.com>
From: Jason Xing <kerneljasonxing@gmail.com>
Date: Sun, 12 Jan 2025 07:38:04 +0800
X-Gm-Features: AbW1kva3z-1aEzVTv2r3xLbpbKMOSjkZCC8BNOujNXCLZUG9WKMOdO0gPkmPI7o
Message-ID: <CAL+tcoD6WuJH6yXaEGvuz_s3sROPXtEMeZw1hBNQvb6wnKKr-w@mail.gmail.com>
Subject: Re: [RFC PATCH 06/10] net: ti: prueth: Adds HW timestamping support
 for PTP using PRU-ICSS IEP module
To: Basharath Hussain Khaja <basharath@couthit.com>
Cc: danishanwar@ti.com, rogerq@kernel.org, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com, 
	ssantosh@kernel.org, tony@atomide.com, richardcochran@gmail.com, 
	parvathi@couthit.com, schnelle@linux.ibm.com, rdunlap@infradead.org, 
	diogo.ivo@siemens.com, m-karicheri2@ti.com, horms@kernel.org, 
	jacob.e.keller@intel.com, m-malladi@ti.com, javier.carrasco.cruz@gmail.com, 
	afd@ti.com, s-anna@ti.com, linux-arm-kernel@lists.infradead.org, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org, pratheesh@ti.com, 
	prajith@ti.com, vigneshr@ti.com, praneeth@ti.com, srk@ti.com, rogerq@ti.com, 
	krishna@couthit.com, pmohan@couthit.com, mohan@couthit.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 10, 2025 at 2:01=E2=80=AFPM Basharath Hussain Khaja
<basharath@couthit.com> wrote:
>
> From: Roger Quadros <rogerq@ti.com>
>
> PRU-ICSS IEP module, which is capable of timestamping RX and
> TX packets at HW level, is used for time synchronization by PTP4L.
>
> This change includes interaction between firmware and user space
> application (ptp4l) with required packet timestamps. The driver
> initializes the PRU firmware with appropriate mode and configuration
> flags. Firmware updates local registers with the flags set by driver
> and uses for further operation. RX SOF timestamp comes along with
> packet and firmware will rise interrupt with TX SOF timestamp after
> pushing the packet on to the wire.
>
> IEP driver is available in upstream and we are reusing for hardware
> configuration for ICSSM as well. On top of that we have extended it
> with the changes for AM57xx SoC.
>
> Extended ethtool for reading HW timestamping capability of the PRU
> interfaces.
>
> Currently ordinary clock (OC) configuration has been validated with
> Linux ptp4l.
>
> Signed-off-by: Roger Quadros <rogerq@ti.com>
> Signed-off-by: Andrew F. Davis <afd@ti.com>
> Signed-off-by: Parvathi Pudi <parvathi@couthit.com>
> Signed-off-by: Basharath Hussain Khaja <basharath@couthit.com>
> ---
>  drivers/net/ethernet/ti/icssg/icss_iep.c      |  42 ++
>  drivers/net/ethernet/ti/icssm/icssm_ethtool.c |  26 +
>  drivers/net/ethernet/ti/icssm/icssm_prueth.c  | 443 +++++++++++++++++-
>  drivers/net/ethernet/ti/icssm/icssm_prueth.h  |  11 +
>  .../net/ethernet/ti/icssm/icssm_prueth_ptp.h  |  85 ++++
>  5 files changed, 605 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/net/ethernet/ti/icssm/icssm_prueth_ptp.h
>
> diff --git a/drivers/net/ethernet/ti/icssg/icss_iep.c b/drivers/net/ether=
net/ti/icssg/icss_iep.c
> index 768578c0d958..9a2ea13703d8 100644
> --- a/drivers/net/ethernet/ti/icssg/icss_iep.c
> +++ b/drivers/net/ethernet/ti/icssg/icss_iep.c
> @@ -937,11 +937,53 @@ static const struct icss_iep_plat_data am654_icss_i=
ep_plat_data =3D {
>         .config =3D &am654_icss_iep_regmap_config,
>  };
>
> +static const struct icss_iep_plat_data am57xx_icss_iep_plat_data =3D {
> +       .flags =3D ICSS_IEP_64BIT_COUNTER_SUPPORT |
> +                ICSS_IEP_SLOW_COMPEN_REG_SUPPORT,
> +       .reg_offs =3D {
> +               [ICSS_IEP_GLOBAL_CFG_REG] =3D 0x00,
> +               [ICSS_IEP_COMPEN_REG] =3D 0x08,
> +               [ICSS_IEP_SLOW_COMPEN_REG] =3D 0x0C,
> +               [ICSS_IEP_COUNT_REG0] =3D 0x10,
> +               [ICSS_IEP_COUNT_REG1] =3D 0x14,
> +               [ICSS_IEP_CAPTURE_CFG_REG] =3D 0x18,
> +               [ICSS_IEP_CAPTURE_STAT_REG] =3D 0x1c,
> +
> +               [ICSS_IEP_CAP6_RISE_REG0] =3D 0x50,
> +               [ICSS_IEP_CAP6_RISE_REG1] =3D 0x54,
> +
> +               [ICSS_IEP_CAP7_RISE_REG0] =3D 0x60,
> +               [ICSS_IEP_CAP7_RISE_REG1] =3D 0x64,
> +
> +               [ICSS_IEP_CMP_CFG_REG] =3D 0x70,
> +               [ICSS_IEP_CMP_STAT_REG] =3D 0x74,
> +               [ICSS_IEP_CMP0_REG0] =3D 0x78,
> +               [ICSS_IEP_CMP0_REG1] =3D 0x7c,
> +               [ICSS_IEP_CMP1_REG0] =3D 0x80,
> +               [ICSS_IEP_CMP1_REG1] =3D 0x84,
> +
> +               [ICSS_IEP_CMP8_REG0] =3D 0xc0,
> +               [ICSS_IEP_CMP8_REG1] =3D 0xc4,
> +               [ICSS_IEP_SYNC_CTRL_REG] =3D 0x180,
> +               [ICSS_IEP_SYNC0_STAT_REG] =3D 0x188,
> +               [ICSS_IEP_SYNC1_STAT_REG] =3D 0x18c,
> +               [ICSS_IEP_SYNC_PWIDTH_REG] =3D 0x190,
> +               [ICSS_IEP_SYNC0_PERIOD_REG] =3D 0x194,
> +               [ICSS_IEP_SYNC1_DELAY_REG] =3D 0x198,
> +               [ICSS_IEP_SYNC_START_REG] =3D 0x19c,
> +       },
> +       .config =3D &am654_icss_iep_regmap_config,
> +};
> +
>  static const struct of_device_id icss_iep_of_match[] =3D {
>         {
>                 .compatible =3D "ti,am654-icss-iep",
>                 .data =3D &am654_icss_iep_plat_data,
>         },
> +       {
> +               .compatible =3D "ti,am5728-icss-iep",
> +               .data =3D &am57xx_icss_iep_plat_data,
> +       },
>         {},
>  };
>  MODULE_DEVICE_TABLE(of, icss_iep_of_match);
> diff --git a/drivers/net/ethernet/ti/icssm/icssm_ethtool.c b/drivers/net/=
ethernet/ti/icssm/icssm_ethtool.c
> index cce3276d5565..86d62d64dc4d 100644
> --- a/drivers/net/ethernet/ti/icssm/icssm_ethtool.c
> +++ b/drivers/net/ethernet/ti/icssm/icssm_ethtool.c
> @@ -7,6 +7,7 @@
>
>  #include <linux/if_bridge.h>
>  #include "icssm_prueth.h"
> +#include "../icssg/icss_iep.h"
>
>  #define PRUETH_MODULE_VERSION "0.2"
>  #define PRUETH_MODULE_DESCRIPTION "PRUSS Ethernet driver"
> @@ -189,12 +190,37 @@ static void icssm_emac_get_regs(struct net_device *=
ndev,
>         regs->version =3D PRUETH_REG_DUMP_GET_VER(prueth);
>  }
>
> +static int icssm_emac_get_ts_info(struct net_device *ndev,
> +                                 struct kernel_ethtool_ts_info *info)
> +{
> +       struct prueth_emac *emac =3D netdev_priv(ndev);
> +
> +       if ((PRUETH_IS_EMAC(emac->prueth) && !emac->emac_ptp_tx_irq))
> +               return ethtool_op_get_ts_info(ndev, info);
> +
> +       info->so_timestamping =3D
> +               SOF_TIMESTAMPING_TX_HARDWARE |
> +               SOF_TIMESTAMPING_TX_SOFTWARE |
> +               SOF_TIMESTAMPING_RX_HARDWARE |
> +               SOF_TIMESTAMPING_RX_SOFTWARE |
> +               SOF_TIMESTAMPING_SOFTWARE |
> +               SOF_TIMESTAMPING_RAW_HARDWARE;

In addtion to what Richard suggested, there is no need to re-mark the
following flags "SOF_TIMESTAMPING_RX_SOFTWARE" and
"SOF_TIMESTAMPING_SOFTWARE", please see __ethtool_get_ts_info().

Thanks,
Jason

