Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4896C3550E
	for <lists+linux-omap@lfdr.de>; Wed,  5 Jun 2019 03:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726465AbfFEBtk (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 4 Jun 2019 21:49:40 -0400
Received: from new1-smtp.messagingengine.com ([66.111.4.221]:47625 "EHLO
        new1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726341AbfFEBtj (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 4 Jun 2019 21:49:39 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailnew.nyi.internal (Postfix) with ESMTP id 45F982B9D;
        Tue,  4 Jun 2019 21:49:36 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
  by compute4.internal (MEProxy); Tue, 04 Jun 2019 21:49:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aj.id.au; h=
        mime-version:message-id:in-reply-to:references:date:from:to:cc
        :subject:content-type; s=fm2; bh=5lblV6whuyon6OL16TV6XUN4rxNeQLZ
        D1Ta+8cUulP4=; b=hUcwSOA4BopmnIcV6GljectTz3afJaNq2OqBxbNOmHdJ+yh
        6Wh4JNWD86lLXgOB4Xg1p/xcJej+hbAorGPbeYegF0tgcyw4PIbtxgT5BDor+Vri
        6ELaWhOil0fAk3xmyX9Hh87R5bZsj/bNYQdZNPQPVwtP+Eqmdv4Yvxuno39FfKUT
        leNXbjgu+viK7Cdbf1BfEHeOkrspFc7hiEHqW0gNcs9/Y/6CFTQLNBDRZ+zIWYq0
        HlhsjrUtBu0w9yfxC0EMueAmIQOgb4QAdZ7cTGDZmqCLC6E+r+eWuQn5EHFCWcb9
        8H6UYwmQ6vcIuOv6NCxf8APQ7TlQNJ8E7oRRQhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=5lblV6
        whuyon6OL16TV6XUN4rxNeQLZD1Ta+8cUulP4=; b=ZBs5KtRIh/p2GYoOGfDuMn
        oBkNUcYe+b3yk8lGRTo+cqgBIwoxUrglB//z7wLHgCqgneQQ7p6VjWAxpzF0Grr9
        Ne+e6QASBpvswUKO63XYYGPXivSCd+hnonQ+oQzNdrrDjfnidEHR3bB3OT7DjpyS
        lawUeDdPXHokwMd2C8DrqT7BumAwW2wuytKWG3tcxRzVYuQJF+9AOiMaYApRLJla
        7wKcu2gYnEDGiL13/FPbLDOW/T94vl8Gs3cBHbluFQimk05qAaojKK1CVrtqsUee
        o+Vq5yuIDL0TzEd2isEUkSh3Eoqex/l3pXWwvlwdY8qL/nt1TPNaw8p1LfiX5GIw
        ==
X-ME-Sender: <xms:qx_3XJy3XZMGv3VGMK3diBY4SreHuxaxILlshQpOAoOiHT5GJnEw0w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudeguddghedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkjghffffhvffutgesthdtredtreertdenucfhrhhomhepfdetnhgu
    rhgvficulfgvfhhfvghrhidfuceorghnughrvgifsegrjhdrihgurdgruheqnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegrnhgurhgvfiesrghjrdhiugdrrghunecuvehluhhsthgv
    rhfuihiivgeptd
X-ME-Proxy: <xmx:qx_3XNqO_kWuO_9NYOffWstR--q6t3tRpBMPJLQlknZ5mKxQDJ_xlQ>
    <xmx:qx_3XBPsYHGlzMJ27vG3zTNeoXq7V3ALiPgIWGdZITZUJCgJzFKIcg>
    <xmx:qx_3XJcsbLyEywbcsqQfuAQhqdwjY7pevbRavGa1yGO6crN-srfI3A>
    <xmx:sB_3XN8g9EDqmYdIVOYTAphEE89SPZXghInWJ6gryKUMRXby_e76yQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
        id 38485E00A1; Tue,  4 Jun 2019 21:49:31 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-650-g74f8db0-fmstable-20190604v3
Mime-Version: 1.0
Message-Id: <803127fd-80ab-43ef-b7c3-118218f64084@www.fastmail.com>
In-Reply-To: <1559636093-26005-1-git-send-email-krzk@kernel.org>
References: <1559636093-26005-1-git-send-email-krzk@kernel.org>
Date:   Wed, 05 Jun 2019 11:19:30 +0930
From:   "Andrew Jeffery" <andrew@aj.id.au>
To:     "Krzysztof Kozlowski" <krzk@kernel.org>, arm@kernel.org,
        "Arnd Bergmann" <arnd@arndb.de>, "Olof Johansson" <olof@lixom.net>,
        "Russell King" <linux@armlinux.org.uk>,
        "Joel Stanley" <joel@jms.id.au>,
        "Nicolas Ferre" <nicolas.ferre@microchip.com>,
        "Alexandre Belloni" <alexandre.belloni@bootlin.com>,
        "Ludovic Desroches" <ludovic.desroches@microchip.com>,
        "Shawn Guo" <shawnguo@kernel.org>,
        "Sascha Hauer" <s.hauer@pengutronix.de>,
        "Pengutronix Kernel Team" <kernel@pengutronix.de>,
        "Fabio Estevam" <festevam@gmail.com>,
        "NXP Linux Team" <linux-imx@nxp.com>,
        "Vladimir Zapolskiy" <vz@mleia.com>,
        "Sylvain Lemieux" <slemieux.tyco@gmail.com>,
        "Jason Cooper" <jason@lakedaemon.net>,
        "Andrew Lunn" <andrew@lunn.ch>,
        "Gregory Clement" <gregory.clement@bootlin.com>,
        "Sebastian Hesselbarth" <sebastian.hesselbarth@gmail.com>,
        "Aaro Koskinen" <aaro.koskinen@iki.fi>,
        "Tony Lindgren" <tony@atomide.com>,
        "Dinh Nguyen" <dinguyen@kernel.org>,
        "Marc Gonzalez" <marc.w.gonzalez@free.fr>,
        "Mans Rullgard" <mans@mansr.com>,
        "Liviu Dudau" <liviu.dudau@arm.com>,
        "Sudeep Holla" <sudeep.holla@arm.com>,
        "Lorenzo Pieralisi" <lorenzo.pieralisi@arm.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org, linux-omap@vger.kernel.org
Cc:     "Geert Uytterhoeven" <geert+renesas@glider.be>
Subject: Re: [PATCH v2] ARM: configs: Remove useless UEVENT_HELPER_PATH
Content-Type: text/plain
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org



On Tue, 4 Jun 2019, at 17:45, Krzysztof Kozlowski wrote:
> Remove the CONFIG_UEVENT_HELPER_PATH because:
> 1. It is disabled since commit 1be01d4a5714 ("driver: base: Disable
>    CONFIG_UEVENT_HELPER by default") as its dependency (UEVENT_HELPER) was
>    made default to 'n',
> 2. It is not recommended (help message: "This should not be used today
>    [...] creates a high system load") and was kept only for ancient
>    userland,
> 3. Certain userland specifically requests it to be disabled (systemd
>    README: "Legacy hotplug slows down the system and confuses udev").
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> ---
> 
> Changes since v2:
> 1. Remove unrelated files.
> 2. Add Geert's ack.
> ---
>  arch/arm/configs/acs5k_defconfig          | 1 -
>  arch/arm/configs/acs5k_tiny_defconfig     | 1 -
>  arch/arm/configs/am200epdkit_defconfig    | 1 -
>  arch/arm/configs/aspeed_g4_defconfig      | 1 -
>  arch/arm/configs/aspeed_g5_defconfig      | 1 -
>  arch/arm/configs/at91_dt_defconfig        | 1 -
>  arch/arm/configs/axm55xx_defconfig        | 1 -
>  arch/arm/configs/cm_x2xx_defconfig        | 1 -
>  arch/arm/configs/cm_x300_defconfig        | 1 -
>  arch/arm/configs/cns3420vb_defconfig      | 1 -
>  arch/arm/configs/colibri_pxa270_defconfig | 1 -
>  arch/arm/configs/colibri_pxa300_defconfig | 1 -
>  arch/arm/configs/corgi_defconfig          | 1 -
>  arch/arm/configs/dove_defconfig           | 1 -
>  arch/arm/configs/em_x270_defconfig        | 1 -
>  arch/arm/configs/ep93xx_defconfig         | 1 -
>  arch/arm/configs/eseries_pxa_defconfig    | 1 -
>  arch/arm/configs/ezx_defconfig            | 1 -
>  arch/arm/configs/gemini_defconfig         | 1 -
>  arch/arm/configs/h3600_defconfig          | 1 -
>  arch/arm/configs/h5000_defconfig          | 1 -
>  arch/arm/configs/imote2_defconfig         | 1 -
>  arch/arm/configs/imx_v4_v5_defconfig      | 1 -
>  arch/arm/configs/iop13xx_defconfig        | 1 -
>  arch/arm/configs/iop32x_defconfig         | 1 -
>  arch/arm/configs/iop33x_defconfig         | 1 -
>  arch/arm/configs/ixp4xx_defconfig         | 1 -
>  arch/arm/configs/jornada720_defconfig     | 1 -
>  arch/arm/configs/keystone_defconfig       | 1 -
>  arch/arm/configs/ks8695_defconfig         | 1 -
>  arch/arm/configs/lpc32xx_defconfig        | 1 -
>  arch/arm/configs/magician_defconfig       | 1 -
>  arch/arm/configs/moxart_defconfig         | 1 -
>  arch/arm/configs/multi_v5_defconfig       | 1 -
>  arch/arm/configs/mv78xx0_defconfig        | 1 -
>  arch/arm/configs/mvebu_v5_defconfig       | 1 -
>  arch/arm/configs/mvebu_v7_defconfig       | 1 -
>  arch/arm/configs/nhk8815_defconfig        | 1 -
>  arch/arm/configs/nuc910_defconfig         | 1 -
>  arch/arm/configs/nuc950_defconfig         | 1 -
>  arch/arm/configs/nuc960_defconfig         | 1 -
>  arch/arm/configs/omap1_defconfig          | 1 -
>  arch/arm/configs/orion5x_defconfig        | 1 -
>  arch/arm/configs/palmz72_defconfig        | 1 -
>  arch/arm/configs/pcm027_defconfig         | 1 -
>  arch/arm/configs/prima2_defconfig         | 1 -
>  arch/arm/configs/pxa168_defconfig         | 1 -
>  arch/arm/configs/pxa3xx_defconfig         | 1 -
>  arch/arm/configs/pxa910_defconfig         | 1 -
>  arch/arm/configs/pxa_defconfig            | 1 -
>  arch/arm/configs/realview_defconfig       | 1 -
>  arch/arm/configs/s3c2410_defconfig        | 1 -
>  arch/arm/configs/s3c6400_defconfig        | 1 -
>  arch/arm/configs/s5pv210_defconfig        | 1 -
>  arch/arm/configs/sama5_defconfig          | 1 -
>  arch/arm/configs/socfpga_defconfig        | 1 -
>  arch/arm/configs/spear13xx_defconfig      | 1 -
>  arch/arm/configs/spear3xx_defconfig       | 1 -
>  arch/arm/configs/spear6xx_defconfig       | 1 -
>  arch/arm/configs/spitz_defconfig          | 1 -
>  arch/arm/configs/tango4_defconfig         | 1 -
>  arch/arm/configs/tct_hammer_defconfig     | 1 -
>  arch/arm/configs/u300_defconfig           | 1 -
>  arch/arm/configs/u8500_defconfig          | 1 -
>  arch/arm/configs/vexpress_defconfig       | 1 -
>  arch/arm/configs/viper_defconfig          | 1 -
>  arch/arm/configs/xcep_defconfig           | 1 -
>  arch/arm/configs/zeus_defconfig           | 1 -
>  arch/arm/configs/zx_defconfig             | 1 -
>  69 files changed, 69 deletions(-)
> 
> diff --git a/arch/arm/configs/acs5k_defconfig 
> b/arch/arm/configs/acs5k_defconfig
> index d04ee19e5b75..bcb8bda09158 100644
> --- a/arch/arm/configs/acs5k_defconfig
> +++ b/arch/arm/configs/acs5k_defconfig
> @@ -30,7 +30,6 @@ CONFIG_INET=y
>  CONFIG_IP_PNP=y
>  CONFIG_IP_PNP_DHCP=y
>  # CONFIG_IPV6 is not set
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_MTD=y
>  CONFIG_MTD_BLOCK=y
>  CONFIG_MTD_CFI=y
> diff --git a/arch/arm/configs/acs5k_tiny_defconfig 
> b/arch/arm/configs/acs5k_tiny_defconfig
> index 25c593df41d1..e802cdebfd0b 100644
> --- a/arch/arm/configs/acs5k_tiny_defconfig
> +++ b/arch/arm/configs/acs5k_tiny_defconfig
> @@ -25,7 +25,6 @@ CONFIG_INET=y
>  # CONFIG_INET_XFRM_MODE_TUNNEL is not set
>  # CONFIG_INET_XFRM_MODE_BEET is not set
>  # CONFIG_IPV6 is not set
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_MTD=y
>  CONFIG_MTD_BLOCK=y
>  CONFIG_MTD_CFI=y
> diff --git a/arch/arm/configs/am200epdkit_defconfig 
> b/arch/arm/configs/am200epdkit_defconfig
> index 8c9b6ea46188..622436f44783 100644
> --- a/arch/arm/configs/am200epdkit_defconfig
> +++ b/arch/arm/configs/am200epdkit_defconfig
> @@ -37,7 +37,6 @@ CONFIG_BT_RFCOMM_TTY=y
>  CONFIG_BT_BNEP=m
>  CONFIG_BT_HCIUART=m
>  CONFIG_BT_HCIUART_H4=y
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_MTD=y
>  CONFIG_MTD_BLOCK=y
>  CONFIG_MTD_CFI=y
> diff --git a/arch/arm/configs/aspeed_g4_defconfig 
> b/arch/arm/configs/aspeed_g4_defconfig
> index 190d6e9d3296..3255547e9d51 100644
> --- a/arch/arm/configs/aspeed_g4_defconfig
> +++ b/arch/arm/configs/aspeed_g4_defconfig
> @@ -64,7 +64,6 @@ CONFIG_VLAN_8021Q=y
>  CONFIG_NET_NCSI=y
>  CONFIG_BPF_STREAM_PARSER=y
>  # CONFIG_WIRELESS is not set
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_DEVTMPFS=y
>  CONFIG_DEVTMPFS_MOUNT=y
>  # CONFIG_PREVENT_FIRMWARE_BUILD is not set
> diff --git a/arch/arm/configs/aspeed_g5_defconfig 
> b/arch/arm/configs/aspeed_g5_defconfig
> index 407ffb7655a8..ab97b17d6d3f 100644
> --- a/arch/arm/configs/aspeed_g5_defconfig
> +++ b/arch/arm/configs/aspeed_g5_defconfig
> @@ -64,7 +64,6 @@ CONFIG_VLAN_8021Q=y
>  CONFIG_NET_NCSI=y
>  CONFIG_BPF_STREAM_PARSER=y
>  # CONFIG_WIRELESS is not set
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_DEVTMPFS=y
>  CONFIG_DEVTMPFS_MOUNT=y
>  # CONFIG_PREVENT_FIRMWARE_BUILD is not set

For the ASPEED bits:

Acked-by: Andrew Jeffery <andrew@aj.id.au>

> diff --git a/arch/arm/configs/at91_dt_defconfig 
> b/arch/arm/configs/at91_dt_defconfig
> index a88e31449880..309c55a8d107 100644
> --- a/arch/arm/configs/at91_dt_defconfig
> +++ b/arch/arm/configs/at91_dt_defconfig
> @@ -46,7 +46,6 @@ CONFIG_IP_PNP_RARP=y
>  CONFIG_IPV6_SIT_6RD=y
>  CONFIG_CFG80211=y
>  CONFIG_MAC80211=y
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_DEVTMPFS=y
>  CONFIG_DEVTMPFS_MOUNT=y
>  # CONFIG_STANDALONE is not set
> diff --git a/arch/arm/configs/axm55xx_defconfig 
> b/arch/arm/configs/axm55xx_defconfig
> index 53864316bee1..31bfe1647d28 100644
> --- a/arch/arm/configs/axm55xx_defconfig
> +++ b/arch/arm/configs/axm55xx_defconfig
> @@ -78,7 +78,6 @@ CONFIG_INET_IPCOMP=y
>  CONFIG_NETWORK_PHY_TIMESTAMPING=y
>  CONFIG_BRIDGE=y
>  # CONFIG_WIRELESS is not set
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_DEVTMPFS=y
>  CONFIG_DEVTMPFS_MOUNT=y
>  CONFIG_MTD=y
> diff --git a/arch/arm/configs/cm_x2xx_defconfig 
> b/arch/arm/configs/cm_x2xx_defconfig
> index 2789837ea24c..fa997ae2673e 100644
> --- a/arch/arm/configs/cm_x2xx_defconfig
> +++ b/arch/arm/configs/cm_x2xx_defconfig
> @@ -45,7 +45,6 @@ CONFIG_BT_RFCOMM=m
>  CONFIG_BT_BNEP=m
>  CONFIG_BT_HIDP=m
>  CONFIG_LIB80211=m
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_FW_LOADER=m
>  CONFIG_MTD=y
>  CONFIG_MTD_CMDLINE_PARTS=y
> diff --git a/arch/arm/configs/cm_x300_defconfig 
> b/arch/arm/configs/cm_x300_defconfig
> index 569a5ed70c55..2f7acde2d921 100644
> --- a/arch/arm/configs/cm_x300_defconfig
> +++ b/arch/arm/configs/cm_x300_defconfig
> @@ -45,7 +45,6 @@ CONFIG_BT_BNEP_PROTO_FILTER=y
>  CONFIG_BT_HIDP=m
>  CONFIG_BT_HCIBTUSB=m
>  CONFIG_LIB80211=m
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_MTD=y
>  CONFIG_MTD_BLOCK=y
>  CONFIG_MTD_RAW_NAND=y
> diff --git a/arch/arm/configs/cns3420vb_defconfig 
> b/arch/arm/configs/cns3420vb_defconfig
> index 419b73564f29..89df0a55a065 100644
> --- a/arch/arm/configs/cns3420vb_defconfig
> +++ b/arch/arm/configs/cns3420vb_defconfig
> @@ -27,7 +27,6 @@ CONFIG_AEABI=y
>  CONFIG_ZBOOT_ROM_TEXT=0x0
>  CONFIG_ZBOOT_ROM_BSS=0x0
>  CONFIG_CMDLINE="console=ttyS0,38400 mem=128M root=/dev/mmcblk0p1 ro 
> rootwait"
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_MTD=y
>  CONFIG_MTD_CMDLINE_PARTS=y
>  CONFIG_MTD_BLOCK=y
> diff --git a/arch/arm/configs/colibri_pxa270_defconfig 
> b/arch/arm/configs/colibri_pxa270_defconfig
> index a54e1f32139f..52bad9a544a0 100644
> --- a/arch/arm/configs/colibri_pxa270_defconfig
> +++ b/arch/arm/configs/colibri_pxa270_defconfig
> @@ -49,7 +49,6 @@ CONFIG_BT_BNEP_MC_FILTER=y
>  CONFIG_BT_BNEP_PROTO_FILTER=y
>  CONFIG_BT_HIDP=m
>  CONFIG_CFG80211=y
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_CONNECTOR=y
>  CONFIG_MTD=y
>  CONFIG_MTD_BLOCK=y
> diff --git a/arch/arm/configs/colibri_pxa300_defconfig 
> b/arch/arm/configs/colibri_pxa300_defconfig
> index 8364407e0abf..446134c70a33 100644
> --- a/arch/arm/configs/colibri_pxa300_defconfig
> +++ b/arch/arm/configs/colibri_pxa300_defconfig
> @@ -14,7 +14,6 @@ CONFIG_IP_MULTICAST=y
>  CONFIG_IP_PNP=y
>  CONFIG_SYN_COOKIES=y
>  CONFIG_IPV6=y
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_SCSI=y
>  CONFIG_BLK_DEV_SD=y
>  CONFIG_CHR_DEV_SG=y
> diff --git a/arch/arm/configs/corgi_defconfig 
> b/arch/arm/configs/corgi_defconfig
> index 58d7deec7e1b..e4f6442588e7 100644
> --- a/arch/arm/configs/corgi_defconfig
> +++ b/arch/arm/configs/corgi_defconfig
> @@ -81,7 +81,6 @@ CONFIG_BT_HCIBT3C=m
>  CONFIG_BT_HCIBLUECARD=m
>  CONFIG_BT_HCIBTUART=m
>  CONFIG_BT_HCIVHCI=m
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_MTD=y
>  CONFIG_MTD_CMDLINE_PARTS=y
>  CONFIG_MTD_BLOCK=y
> diff --git a/arch/arm/configs/dove_defconfig 
> b/arch/arm/configs/dove_defconfig
> index 2f01e84b3d8c..e70c997d5f4c 100644
> --- a/arch/arm/configs/dove_defconfig
> +++ b/arch/arm/configs/dove_defconfig
> @@ -31,7 +31,6 @@ CONFIG_IP_PNP=y
>  CONFIG_IP_PNP_DHCP=y
>  CONFIG_IP_PNP_BOOTP=y
>  # CONFIG_IPV6 is not set
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_DEVTMPFS=y
>  CONFIG_DEVTMPFS_MOUNT=y
>  CONFIG_MTD=y
> diff --git a/arch/arm/configs/em_x270_defconfig 
> b/arch/arm/configs/em_x270_defconfig
> index 858289b7f1de..d08f02014755 100644
> --- a/arch/arm/configs/em_x270_defconfig
> +++ b/arch/arm/configs/em_x270_defconfig
> @@ -41,7 +41,6 @@ CONFIG_BT_BNEP=m
>  CONFIG_BT_HIDP=m
>  CONFIG_BT_HCIBTUSB=m
>  CONFIG_LIB80211=m
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_FW_LOADER=m
>  CONFIG_MTD=y
>  CONFIG_MTD_CMDLINE_PARTS=y
> diff --git a/arch/arm/configs/ep93xx_defconfig 
> b/arch/arm/configs/ep93xx_defconfig
> index 14889a785f07..ef2d2a820c30 100644
> --- a/arch/arm/configs/ep93xx_defconfig
> +++ b/arch/arm/configs/ep93xx_defconfig
> @@ -50,7 +50,6 @@ CONFIG_IPV6=y
>  # CONFIG_INET6_XFRM_MODE_TUNNEL is not set
>  # CONFIG_INET6_XFRM_MODE_BEET is not set
>  # CONFIG_IPV6_SIT is not set
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  # CONFIG_FW_LOADER is not set
>  CONFIG_MTD=y
>  CONFIG_MTD_REDBOOT_PARTS=y
> diff --git a/arch/arm/configs/eseries_pxa_defconfig 
> b/arch/arm/configs/eseries_pxa_defconfig
> index bc76cf5399b6..56452fa03d56 100644
> --- a/arch/arm/configs/eseries_pxa_defconfig
> +++ b/arch/arm/configs/eseries_pxa_defconfig
> @@ -40,7 +40,6 @@ CONFIG_CFG80211=m
>  CONFIG_MAC80211=m
>  CONFIG_MAC80211_RC_PID=y
>  # CONFIG_MAC80211_RC_MINSTREL is not set
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  # CONFIG_STANDALONE is not set
>  CONFIG_MTD=m
>  CONFIG_MTD_RAW_NAND=m
> diff --git a/arch/arm/configs/ezx_defconfig 
> b/arch/arm/configs/ezx_defconfig
> index eb966ac6de1d..4e28771beecd 100644
> --- a/arch/arm/configs/ezx_defconfig
> +++ b/arch/arm/configs/ezx_defconfig
> @@ -160,7 +160,6 @@ CONFIG_BT_HCIVHCI=m
>  CONFIG_BT_MRVL=m
>  CONFIG_BT_MRVL_SDIO=m
>  # CONFIG_WIRELESS is not set
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_FW_LOADER=m
>  CONFIG_CONNECTOR=m
>  CONFIG_MTD=y
> diff --git a/arch/arm/configs/gemini_defconfig 
> b/arch/arm/configs/gemini_defconfig
> index ef9aae89907d..f012e81a2fe4 100644
> --- a/arch/arm/configs/gemini_defconfig
> +++ b/arch/arm/configs/gemini_defconfig
> @@ -22,7 +22,6 @@ CONFIG_PM=y
>  CONFIG_NET=y
>  CONFIG_UNIX=y
>  CONFIG_INET=y
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_DEVTMPFS=y
>  CONFIG_MTD=y
>  CONFIG_MTD_BLOCK=y
> diff --git a/arch/arm/configs/h3600_defconfig 
> b/arch/arm/configs/h3600_defconfig
> index 175881b7da7c..4d91e41cb628 100644
> --- a/arch/arm/configs/h3600_defconfig
> +++ b/arch/arm/configs/h3600_defconfig
> @@ -25,7 +25,6 @@ CONFIG_IRLAN=m
>  CONFIG_IRNET=m
>  CONFIG_IRCOMM=m
>  # CONFIG_WIRELESS is not set
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_MTD=y
>  CONFIG_MTD_REDBOOT_PARTS=y
>  CONFIG_MTD_BLOCK=y
> diff --git a/arch/arm/configs/h5000_defconfig 
> b/arch/arm/configs/h5000_defconfig
> index e90d1dfeb188..3946c6087327 100644
> --- a/arch/arm/configs/h5000_defconfig
> +++ b/arch/arm/configs/h5000_defconfig
> @@ -32,7 +32,6 @@ CONFIG_IP_PNP=y
>  # CONFIG_INET_XFRM_MODE_BEET is not set
>  # CONFIG_INET_DIAG is not set
>  # CONFIG_IPV6 is not set
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_MTD=y
>  CONFIG_MTD_BLOCK=y
>  CONFIG_MTD_CFI=y
> diff --git a/arch/arm/configs/imote2_defconfig 
> b/arch/arm/configs/imote2_defconfig
> index 82f5b938e395..770469f61c3e 100644
> --- a/arch/arm/configs/imote2_defconfig
> +++ b/arch/arm/configs/imote2_defconfig
> @@ -138,7 +138,6 @@ CONFIG_BRIDGE=m
>  # CONFIG_BRIDGE_IGMP_SNOOPING is not set
>  CONFIG_IEEE802154=y
>  # CONFIG_WIRELESS is not set
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_DEVTMPFS=y
>  CONFIG_DEVTMPFS_MOUNT=y
>  CONFIG_FW_LOADER=m
> diff --git a/arch/arm/configs/imx_v4_v5_defconfig 
> b/arch/arm/configs/imx_v4_v5_defconfig
> index f2cf0722e8e1..2b2d617e279d 100644
> --- a/arch/arm/configs/imx_v4_v5_defconfig
> +++ b/arch/arm/configs/imx_v4_v5_defconfig
> @@ -47,7 +47,6 @@ CONFIG_IP_PNP_DHCP=y
>  # CONFIG_INET_DIAG is not set
>  # CONFIG_IPV6 is not set
>  CONFIG_NETFILTER=y
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_DEVTMPFS=y
>  CONFIG_DEVTMPFS_MOUNT=y
>  CONFIG_IMX_WEIM=y
> diff --git a/arch/arm/configs/iop13xx_defconfig 
> b/arch/arm/configs/iop13xx_defconfig
> index a73b6a31a4ab..30cdb287e1b4 100644
> --- a/arch/arm/configs/iop13xx_defconfig
> +++ b/arch/arm/configs/iop13xx_defconfig
> @@ -34,7 +34,6 @@ CONFIG_IPV6=y
>  # CONFIG_INET6_XFRM_MODE_TUNNEL is not set
>  # CONFIG_INET6_XFRM_MODE_BEET is not set
>  # CONFIG_IPV6_SIT is not set
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_MTD=y
>  CONFIG_MTD_REDBOOT_PARTS=y
>  CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED=y
> diff --git a/arch/arm/configs/iop32x_defconfig 
> b/arch/arm/configs/iop32x_defconfig
> index f63362b665eb..18a21faa834c 100644
> --- a/arch/arm/configs/iop32x_defconfig
> +++ b/arch/arm/configs/iop32x_defconfig
> @@ -30,7 +30,6 @@ CONFIG_IPV6=y
>  # CONFIG_INET6_XFRM_MODE_TUNNEL is not set
>  # CONFIG_INET6_XFRM_MODE_BEET is not set
>  # CONFIG_IPV6_SIT is not set
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_MTD=y
>  CONFIG_MTD_REDBOOT_PARTS=y
>  CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED=y
> diff --git a/arch/arm/configs/iop33x_defconfig 
> b/arch/arm/configs/iop33x_defconfig
> index d22f832ccfd6..089eca43214a 100644
> --- a/arch/arm/configs/iop33x_defconfig
> +++ b/arch/arm/configs/iop33x_defconfig
> @@ -28,7 +28,6 @@ CONFIG_IPV6=y
>  # CONFIG_INET6_XFRM_MODE_TUNNEL is not set
>  # CONFIG_INET6_XFRM_MODE_BEET is not set
>  # CONFIG_IPV6_SIT is not set
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_MTD=y
>  CONFIG_MTD_REDBOOT_PARTS=y
>  CONFIG_MTD_REDBOOT_PARTS_UNALLOCATED=y
> diff --git a/arch/arm/configs/ixp4xx_defconfig 
> b/arch/arm/configs/ixp4xx_defconfig
> index 39ebcce3bc2f..27e7c0714b96 100644
> --- a/arch/arm/configs/ixp4xx_defconfig
> +++ b/arch/arm/configs/ixp4xx_defconfig
> @@ -104,7 +104,6 @@ CONFIG_NET_CLS_RSVP6=m
>  CONFIG_NET_CLS_ACT=y
>  CONFIG_NET_ACT_POLICE=y
>  CONFIG_NET_PKTGEN=m
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_MTD=y
>  CONFIG_MTD_REDBOOT_PARTS=y
>  CONFIG_MTD_BLOCK=y
> diff --git a/arch/arm/configs/jornada720_defconfig 
> b/arch/arm/configs/jornada720_defconfig
> index 3dcc2f4ab7b7..9f079be2b84b 100644
> --- a/arch/arm/configs/jornada720_defconfig
> +++ b/arch/arm/configs/jornada720_defconfig
> @@ -24,7 +24,6 @@ CONFIG_IRDA=m
>  CONFIG_IRLAN=m
>  CONFIG_IRCOMM=m
>  CONFIG_SA1100_FIR=m
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_BLK_DEV_LOOP=y
>  CONFIG_BLK_DEV_NBD=y
>  CONFIG_BLK_DEV_SD=y
> diff --git a/arch/arm/configs/keystone_defconfig 
> b/arch/arm/configs/keystone_defconfig
> index 72fee57aad2f..3d5f5b501330 100644
> --- a/arch/arm/configs/keystone_defconfig
> +++ b/arch/arm/configs/keystone_defconfig
> @@ -115,7 +115,6 @@ CONFIG_VLAN_8021Q=y
>  CONFIG_CAN=m
>  CONFIG_CAN_C_CAN=m
>  CONFIG_CAN_C_CAN_PLATFORM=m
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_DEVTMPFS=y
>  CONFIG_DEVTMPFS_MOUNT=y
>  CONFIG_DMA_CMA=y
> diff --git a/arch/arm/configs/ks8695_defconfig 
> b/arch/arm/configs/ks8695_defconfig
> index b8b91d790e9b..df62d4dfbbb7 100644
> --- a/arch/arm/configs/ks8695_defconfig
> +++ b/arch/arm/configs/ks8695_defconfig
> @@ -28,7 +28,6 @@ CONFIG_INET=y
>  CONFIG_IP_PNP=y
>  CONFIG_IP_PNP_DHCP=y
>  # CONFIG_IPV6 is not set
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_MTD=y
>  CONFIG_MTD_REDBOOT_PARTS=y
>  CONFIG_MTD_CMDLINE_PARTS=y
> diff --git a/arch/arm/configs/lpc32xx_defconfig 
> b/arch/arm/configs/lpc32xx_defconfig
> index 6d5a0067e66d..0cdc6c7974b3 100644
> --- a/arch/arm/configs/lpc32xx_defconfig
> +++ b/arch/arm/configs/lpc32xx_defconfig
> @@ -40,7 +40,6 @@ CONFIG_IP_PNP_BOOTP=y
>  # CONFIG_INET_XFRM_MODE_BEET is not set
>  # CONFIG_INET_DIAG is not set
>  # CONFIG_WIRELESS is not set
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_DEVTMPFS=y
>  CONFIG_DEVTMPFS_MOUNT=y
>  # CONFIG_FW_LOADER is not set
> diff --git a/arch/arm/configs/magician_defconfig 
> b/arch/arm/configs/magician_defconfig
> index 6116c44678b9..e6486c959220 100644
> --- a/arch/arm/configs/magician_defconfig
> +++ b/arch/arm/configs/magician_defconfig
> @@ -53,7 +53,6 @@ CONFIG_BT_BNEP_MC_FILTER=y
>  CONFIG_BT_BNEP_PROTO_FILTER=y
>  CONFIG_BT_HIDP=m
>  CONFIG_BT_HCIBTUSB=m
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_MTD=y
>  CONFIG_MTD_CMDLINE_PARTS=y
>  CONFIG_MTD_BLOCK=y
> diff --git a/arch/arm/configs/moxart_defconfig 
> b/arch/arm/configs/moxart_defconfig
> index 6a11669fa536..9b98761e51c9 100644
> --- a/arch/arm/configs/moxart_defconfig
> +++ b/arch/arm/configs/moxart_defconfig
> @@ -38,7 +38,6 @@ CONFIG_IP_PNP_DHCP=y
>  # CONFIG_INET_DIAG is not set
>  # CONFIG_IPV6 is not set
>  # CONFIG_WIRELESS is not set
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_DEVTMPFS=y
>  CONFIG_DEVTMPFS_MOUNT=y
>  # CONFIG_PREVENT_FIRMWARE_BUILD is not set
> diff --git a/arch/arm/configs/multi_v5_defconfig 
> b/arch/arm/configs/multi_v5_defconfig
> index 63b5a8824f0f..70d482d0a880 100644
> --- a/arch/arm/configs/multi_v5_defconfig
> +++ b/arch/arm/configs/multi_v5_defconfig
> @@ -72,7 +72,6 @@ CONFIG_NET_DSA=y
>  CONFIG_NET_PKTGEN=m
>  CONFIG_CFG80211=y
>  CONFIG_MAC80211=y
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_DEVTMPFS=y
>  CONFIG_DEVTMPFS_MOUNT=y
>  CONFIG_IMX_WEIM=y
> diff --git a/arch/arm/configs/mv78xx0_defconfig 
> b/arch/arm/configs/mv78xx0_defconfig
> index e9567513f068..b39b1300a459 100644
> --- a/arch/arm/configs/mv78xx0_defconfig
> +++ b/arch/arm/configs/mv78xx0_defconfig
> @@ -36,7 +36,6 @@ CONFIG_IP_PNP_DHCP=y
>  CONFIG_IP_PNP_BOOTP=y
>  # CONFIG_IPV6 is not set
>  CONFIG_NET_PKTGEN=m
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_MTD=y
>  CONFIG_MTD_CMDLINE_PARTS=y
>  CONFIG_MTD_BLOCK=y
> diff --git a/arch/arm/configs/mvebu_v5_defconfig 
> b/arch/arm/configs/mvebu_v5_defconfig
> index 0e5577a31851..226f2e97c6e2 100644
> --- a/arch/arm/configs/mvebu_v5_defconfig
> +++ b/arch/arm/configs/mvebu_v5_defconfig
> @@ -62,7 +62,6 @@ CONFIG_NET_SWITCHDEV=y
>  CONFIG_NET_PKTGEN=m
>  CONFIG_CFG80211=y
>  CONFIG_MAC80211=y
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_DEVTMPFS=y
>  CONFIG_DEVTMPFS_MOUNT=y
>  CONFIG_MTD=y
> diff --git a/arch/arm/configs/mvebu_v7_defconfig 
> b/arch/arm/configs/mvebu_v7_defconfig
> index 48f7b4277b8d..82201f75a231 100644
> --- a/arch/arm/configs/mvebu_v7_defconfig
> +++ b/arch/arm/configs/mvebu_v7_defconfig
> @@ -40,7 +40,6 @@ CONFIG_BT=y
>  CONFIG_BT_MRVL=y
>  CONFIG_BT_MRVL_SDIO=y
>  CONFIG_CFG80211=y
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_DEVTMPFS=y
>  CONFIG_DEVTMPFS_MOUNT=y
>  CONFIG_MTD=y
> diff --git a/arch/arm/configs/nhk8815_defconfig 
> b/arch/arm/configs/nhk8815_defconfig
> index 2ecb049daf61..3f35761dc9ff 100644
> --- a/arch/arm/configs/nhk8815_defconfig
> +++ b/arch/arm/configs/nhk8815_defconfig
> @@ -45,7 +45,6 @@ CONFIG_BT_HCIUART=m
>  CONFIG_BT_HCIUART_H4=y
>  CONFIG_BT_HCIUART_BCSP=y
>  CONFIG_BT_HCIVHCI=m
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_MTD=y
>  CONFIG_MTD_TESTS=m
>  CONFIG_MTD_CMDLINE_PARTS=y
> diff --git a/arch/arm/configs/nuc910_defconfig 
> b/arch/arm/configs/nuc910_defconfig
> index c0d152c02fba..63dba62c3326 100644
> --- a/arch/arm/configs/nuc910_defconfig
> +++ b/arch/arm/configs/nuc910_defconfig
> @@ -13,7 +13,6 @@ CONFIG_AEABI=y
>  CONFIG_CMDLINE="root=/dev/ram0 console=ttyS0,115200n8 
> rdinit=/sbin/init mem=64M"
>  CONFIG_KEXEC=y
>  CONFIG_FPE_NWFPE=y
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_MTD=y
>  CONFIG_MTD_BLOCK=y
>  CONFIG_MTD_CFI=y
> diff --git a/arch/arm/configs/nuc950_defconfig 
> b/arch/arm/configs/nuc950_defconfig
> index 8dde1186c2ef..cb5a8788ebe8 100644
> --- a/arch/arm/configs/nuc950_defconfig
> +++ b/arch/arm/configs/nuc950_defconfig
> @@ -19,7 +19,6 @@ CONFIG_KEXEC=y
>  CONFIG_FPE_NWFPE=y
>  CONFIG_BINFMT_AOUT=y
>  CONFIG_BINFMT_MISC=y
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_MTD=y
>  CONFIG_MTD_BLOCK=y
>  CONFIG_MTD_CFI=y
> diff --git a/arch/arm/configs/nuc960_defconfig 
> b/arch/arm/configs/nuc960_defconfig
> index 6bb784f8eb5b..f7af84e23a05 100644
> --- a/arch/arm/configs/nuc960_defconfig
> +++ b/arch/arm/configs/nuc960_defconfig
> @@ -19,7 +19,6 @@ CONFIG_KEXEC=y
>  CONFIG_FPE_NWFPE=y
>  CONFIG_BINFMT_AOUT=y
>  CONFIG_BINFMT_MISC=y
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_MTD=y
>  CONFIG_MTD_BLOCK=y
>  CONFIG_MTD_CFI=y
> diff --git a/arch/arm/configs/omap1_defconfig 
> b/arch/arm/configs/omap1_defconfig
> index f24a857e8733..0c43c589f191 100644
> --- a/arch/arm/configs/omap1_defconfig
> +++ b/arch/arm/configs/omap1_defconfig
> @@ -79,7 +79,6 @@ CONFIG_BT_RFCOMM=y
>  CONFIG_BT_RFCOMM_TTY=y
>  CONFIG_BT_BNEP=y
>  CONFIG_BT_HIDP=y
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  # CONFIG_STANDALONE is not set
>  # CONFIG_PREVENT_FIRMWARE_BUILD is not set
>  CONFIG_CONNECTOR=y
> diff --git a/arch/arm/configs/orion5x_defconfig 
> b/arch/arm/configs/orion5x_defconfig
> index 077e0fde1ff9..4bdbb036ac26 100644
> --- a/arch/arm/configs/orion5x_defconfig
> +++ b/arch/arm/configs/orion5x_defconfig
> @@ -59,7 +59,6 @@ CONFIG_IP_PNP_BOOTP=y
>  # CONFIG_IPV6 is not set
>  CONFIG_NET_DSA=y
>  CONFIG_NET_PKTGEN=m
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_MTD=y
>  CONFIG_MTD_CMDLINE_PARTS=y
>  CONFIG_MTD_BLOCK=y
> diff --git a/arch/arm/configs/palmz72_defconfig 
> b/arch/arm/configs/palmz72_defconfig
> index ade09bfcba56..4a3fd82c2a0c 100644
> --- a/arch/arm/configs/palmz72_defconfig
> +++ b/arch/arm/configs/palmz72_defconfig
> @@ -30,7 +30,6 @@ CONFIG_IP_PNP_BOOTP=y
>  # CONFIG_INET_XFRM_MODE_TUNNEL is not set
>  # CONFIG_INET_XFRM_MODE_BEET is not set
>  # CONFIG_IPV6 is not set
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_BLK_DEV_LOOP=y
>  # CONFIG_INPUT_MOUSEDEV_PSAUX is not set
>  CONFIG_INPUT_EVDEV=y
> diff --git a/arch/arm/configs/pcm027_defconfig 
> b/arch/arm/configs/pcm027_defconfig
> index 9c88a193490c..a8c53228b0c1 100644
> --- a/arch/arm/configs/pcm027_defconfig
> +++ b/arch/arm/configs/pcm027_defconfig
> @@ -35,7 +35,6 @@ CONFIG_IP_PNP=y
>  # CONFIG_INET_XFRM_MODE_BEET is not set
>  # CONFIG_INET_DIAG is not set
>  # CONFIG_IPV6 is not set
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_MTD=y
>  CONFIG_MTD_CMDLINE_PARTS=y
>  CONFIG_MTD_BLOCK=y
> diff --git a/arch/arm/configs/prima2_defconfig 
> b/arch/arm/configs/prima2_defconfig
> index 7cc8e8e4d296..be19aa127595 100644
> --- a/arch/arm/configs/prima2_defconfig
> +++ b/arch/arm/configs/prima2_defconfig
> @@ -16,7 +16,6 @@ CONFIG_PREEMPT=y
>  CONFIG_AEABI=y
>  CONFIG_KEXEC=y
>  CONFIG_BINFMT_MISC=y
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_BLK_DEV_LOOP=y
>  CONFIG_BLK_DEV_RAM=y
>  CONFIG_BLK_DEV_RAM_SIZE=8192
> diff --git a/arch/arm/configs/pxa168_defconfig 
> b/arch/arm/configs/pxa168_defconfig
> index e7c7b91b6de2..0947f022954d 100644
> --- a/arch/arm/configs/pxa168_defconfig
> +++ b/arch/arm/configs/pxa168_defconfig
> @@ -24,7 +24,6 @@ CONFIG_UNIX=y
>  CONFIG_INET=y
>  CONFIG_IP_PNP=y
>  # CONFIG_IPV6 is not set
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  # CONFIG_STANDALONE is not set
>  # CONFIG_PREVENT_FIRMWARE_BUILD is not set
>  # CONFIG_BLK_DEV is not set
> diff --git a/arch/arm/configs/pxa3xx_defconfig 
> b/arch/arm/configs/pxa3xx_defconfig
> index 02997bcbfe8a..06bbc7a59b60 100644
> --- a/arch/arm/configs/pxa3xx_defconfig
> +++ b/arch/arm/configs/pxa3xx_defconfig
> @@ -26,7 +26,6 @@ CONFIG_IP_PNP=y
>  # CONFIG_INET_XFRM_MODE_BEET is not set
>  # CONFIG_INET_DIAG is not set
>  # CONFIG_IPV6 is not set
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  # CONFIG_STANDALONE is not set
>  # CONFIG_PREVENT_FIRMWARE_BUILD is not set
>  CONFIG_MTD=y
> diff --git a/arch/arm/configs/pxa910_defconfig 
> b/arch/arm/configs/pxa910_defconfig
> index 3aff71e6dae5..b21196372158 100644
> --- a/arch/arm/configs/pxa910_defconfig
> +++ b/arch/arm/configs/pxa910_defconfig
> @@ -24,7 +24,6 @@ CONFIG_UNIX=y
>  CONFIG_INET=y
>  CONFIG_IP_PNP=y
>  # CONFIG_IPV6 is not set
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  # CONFIG_STANDALONE is not set
>  # CONFIG_PREVENT_FIRMWARE_BUILD is not set
>  # CONFIG_BLK_DEV is not set
> diff --git a/arch/arm/configs/pxa_defconfig 
> b/arch/arm/configs/pxa_defconfig
> index a02dd4cf6138..787c3f9be414 100644
> --- a/arch/arm/configs/pxa_defconfig
> +++ b/arch/arm/configs/pxa_defconfig
> @@ -156,7 +156,6 @@ CONFIG_MAC80211=m
>  CONFIG_RFKILL=y
>  CONFIG_RFKILL_INPUT=y
>  CONFIG_RFKILL_GPIO=m
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_DEVTMPFS=y
>  CONFIG_DEVTMPFS_MOUNT=y
>  CONFIG_CONNECTOR=y
> diff --git a/arch/arm/configs/realview_defconfig 
> b/arch/arm/configs/realview_defconfig
> index 8884723b827e..8a056cc0c1ec 100644
> --- a/arch/arm/configs/realview_defconfig
> +++ b/arch/arm/configs/realview_defconfig
> @@ -34,7 +34,6 @@ CONFIG_IP_PNP=y
>  CONFIG_IP_PNP_DHCP=y
>  CONFIG_IP_PNP_BOOTP=y
>  # CONFIG_IPV6 is not set
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_MTD=y
>  CONFIG_MTD_CMDLINE_PARTS=y
>  CONFIG_MTD_AFS_PARTS=y
> diff --git a/arch/arm/configs/s3c2410_defconfig 
> b/arch/arm/configs/s3c2410_defconfig
> index b697e9af84f9..95b5a4ffddea 100644
> --- a/arch/arm/configs/s3c2410_defconfig
> +++ b/arch/arm/configs/s3c2410_defconfig
> @@ -178,7 +178,6 @@ CONFIG_CFG80211=m
>  CONFIG_MAC80211=m
>  CONFIG_MAC80211_MESH=y
>  CONFIG_MAC80211_LEDS=y
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_MTD=y
>  CONFIG_MTD_CMDLINE_PARTS=y
>  CONFIG_MTD_REDBOOT_PARTS=y
> diff --git a/arch/arm/configs/s3c6400_defconfig 
> b/arch/arm/configs/s3c6400_defconfig
> index 3e5ead3a49fc..59a258d504aa 100644
> --- a/arch/arm/configs/s3c6400_defconfig
> +++ b/arch/arm/configs/s3c6400_defconfig
> @@ -17,7 +17,6 @@ CONFIG_MACH_SMARTQ7=y
>  CONFIG_MACH_WLF_CRAGG_6410=y
>  CONFIG_CMDLINE="console=ttySAC0,115200 root=/dev/ram init=/linuxrc 
> initrd=0x51000000,6M ramdisk_size=6144"
>  CONFIG_VFP=y
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_MODULES=y
>  CONFIG_MODULE_UNLOAD=y
>  # CONFIG_BLK_DEV_BSG is not set
> diff --git a/arch/arm/configs/s5pv210_defconfig 
> b/arch/arm/configs/s5pv210_defconfig
> index fd4f28aabda6..70919716f815 100644
> --- a/arch/arm/configs/s5pv210_defconfig
> +++ b/arch/arm/configs/s5pv210_defconfig
> @@ -40,7 +40,6 @@ CONFIG_BT_HCIUART=m
>  CONFIG_BT_HCIUART_BCM=y
>  CONFIG_CFG80211=m
>  CONFIG_MAC80211=m
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_DEVTMPFS=y
>  CONFIG_DEVTMPFS_MOUNT=y
>  CONFIG_BLK_DEV_LOOP=y
> diff --git a/arch/arm/configs/sama5_defconfig 
> b/arch/arm/configs/sama5_defconfig
> index 6275f4fb3e5e..ef785340e6f8 100644
> --- a/arch/arm/configs/sama5_defconfig
> +++ b/arch/arm/configs/sama5_defconfig
> @@ -56,7 +56,6 @@ CONFIG_CAN_M_CAN=y
>  CONFIG_CFG80211=y
>  CONFIG_MAC80211=y
>  CONFIG_MAC80211_LEDS=y
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_DEVTMPFS=y
>  CONFIG_DEVTMPFS_MOUNT=y
>  # CONFIG_STANDALONE is not set
> diff --git a/arch/arm/configs/socfpga_defconfig 
> b/arch/arm/configs/socfpga_defconfig
> index 6701a975e785..fe2e1e82e233 100644
> --- a/arch/arm/configs/socfpga_defconfig
> +++ b/arch/arm/configs/socfpga_defconfig
> @@ -44,7 +44,6 @@ CONFIG_PCI=y
>  CONFIG_PCI_MSI=y
>  CONFIG_PCIE_ALTERA=y
>  CONFIG_PCIE_ALTERA_MSI=y
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_DEVTMPFS=y
>  CONFIG_DEVTMPFS_MOUNT=y
>  CONFIG_MTD=y
> diff --git a/arch/arm/configs/spear13xx_defconfig 
> b/arch/arm/configs/spear13xx_defconfig
> index 8ee3679ca8b2..3b206a31902f 100644
> --- a/arch/arm/configs/spear13xx_defconfig
> +++ b/arch/arm/configs/spear13xx_defconfig
> @@ -28,7 +28,6 @@ CONFIG_IP_PNP=y
>  CONFIG_IP_PNP_DHCP=y
>  CONFIG_IP_PNP_BOOTP=y
>  CONFIG_NET_IPIP=y
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_MTD=y
>  CONFIG_MTD_OF_PARTS=y
>  CONFIG_MTD_BLOCK=y
> diff --git a/arch/arm/configs/spear3xx_defconfig 
> b/arch/arm/configs/spear3xx_defconfig
> index 5d88c4817f41..fc5f71c765ed 100644
> --- a/arch/arm/configs/spear3xx_defconfig
> +++ b/arch/arm/configs/spear3xx_defconfig
> @@ -13,7 +13,6 @@ CONFIG_MACH_SPEAR310=y
>  CONFIG_MACH_SPEAR320=y
>  CONFIG_BINFMT_MISC=y
>  CONFIG_NET=y
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_MTD=y
>  CONFIG_MTD_OF_PARTS=y
>  CONFIG_MTD_BLOCK=y
> diff --git a/arch/arm/configs/spear6xx_defconfig 
> b/arch/arm/configs/spear6xx_defconfig
> index 5b410f0a365b..52a56b8ce6a7 100644
> --- a/arch/arm/configs/spear6xx_defconfig
> +++ b/arch/arm/configs/spear6xx_defconfig
> @@ -10,7 +10,6 @@ CONFIG_PLAT_SPEAR=y
>  CONFIG_ARCH_SPEAR6XX=y
>  CONFIG_BINFMT_MISC=y
>  CONFIG_NET=y
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_MTD=y
>  CONFIG_MTD_OF_PARTS=y
>  CONFIG_MTD_BLOCK=y
> diff --git a/arch/arm/configs/spitz_defconfig 
> b/arch/arm/configs/spitz_defconfig
> index 09f6fe432eef..4fb51d665abb 100644
> --- a/arch/arm/configs/spitz_defconfig
> +++ b/arch/arm/configs/spitz_defconfig
> @@ -78,7 +78,6 @@ CONFIG_BT_HCIBT3C=m
>  CONFIG_BT_HCIBLUECARD=m
>  CONFIG_BT_HCIBTUART=m
>  CONFIG_BT_HCIVHCI=m
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_MTD=y
>  CONFIG_MTD_CMDLINE_PARTS=y
>  CONFIG_MTD_BLOCK=y
> diff --git a/arch/arm/configs/tango4_defconfig 
> b/arch/arm/configs/tango4_defconfig
> index 68eb16e583ac..cbc9ade78f14 100644
> --- a/arch/arm/configs/tango4_defconfig
> +++ b/arch/arm/configs/tango4_defconfig
> @@ -33,7 +33,6 @@ CONFIG_IP_PNP_DHCP=y
>  # CONFIG_INET_XFRM_MODE_TUNNEL is not set
>  # CONFIG_INET_XFRM_MODE_BEET is not set
>  # CONFIG_IPV6 is not set
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_DEVTMPFS=y
>  CONFIG_DEVTMPFS_MOUNT=y
>  CONFIG_MTD=y
> diff --git a/arch/arm/configs/tct_hammer_defconfig 
> b/arch/arm/configs/tct_hammer_defconfig
> index d0a9e5dd9135..3a9503fe84cb 100644
> --- a/arch/arm/configs/tct_hammer_defconfig
> +++ b/arch/arm/configs/tct_hammer_defconfig
> @@ -22,7 +22,6 @@ CONFIG_FPE_NWFPE=y
>  CONFIG_NET=y
>  CONFIG_PACKET=y
>  CONFIG_UNIX=y
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  # CONFIG_PREVENT_FIRMWARE_BUILD is not set
>  CONFIG_MTD=y
>  CONFIG_MTD_BLOCK=y
> diff --git a/arch/arm/configs/u300_defconfig 
> b/arch/arm/configs/u300_defconfig
> index 9f16487c0eb0..8223397db047 100644
> --- a/arch/arm/configs/u300_defconfig
> +++ b/arch/arm/configs/u300_defconfig
> @@ -22,7 +22,6 @@ CONFIG_ZBOOT_ROM_BSS=0x0
>  CONFIG_CMDLINE="root=/dev/ram0 rw rootfstype=rootfs 
> console=ttyAMA0,115200n8 lpj=515072"
>  CONFIG_CPU_IDLE=y
>  # CONFIG_SUSPEND is not set
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  # CONFIG_PREVENT_FIRMWARE_BUILD is not set
>  CONFIG_MTD=y
>  CONFIG_MTD_CMDLINE_PARTS=y
> diff --git a/arch/arm/configs/u8500_defconfig 
> b/arch/arm/configs/u8500_defconfig
> index e2151a7aaf49..e6b98b6eb88d 100644
> --- a/arch/arm/configs/u8500_defconfig
> +++ b/arch/arm/configs/u8500_defconfig
> @@ -38,7 +38,6 @@ CONFIG_CFG80211_DEBUGFS=y
>  CONFIG_MAC80211=y
>  CONFIG_MAC80211_LEDS=y
>  CONFIG_CAIF=y
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_DEVTMPFS=y
>  CONFIG_DEVTMPFS_MOUNT=y
>  CONFIG_BLK_DEV_RAM=y
> diff --git a/arch/arm/configs/vexpress_defconfig 
> b/arch/arm/configs/vexpress_defconfig
> index d170da388389..25753552277a 100644
> --- a/arch/arm/configs/vexpress_defconfig
> +++ b/arch/arm/configs/vexpress_defconfig
> @@ -45,7 +45,6 @@ CONFIG_IP_PNP_BOOTP=y
>  # CONFIG_WIRELESS is not set
>  CONFIG_NET_9P=y
>  CONFIG_NET_9P_VIRTIO=y
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_DEVTMPFS=y
>  CONFIG_DMA_CMA=y
>  CONFIG_MTD=y
> diff --git a/arch/arm/configs/viper_defconfig 
> b/arch/arm/configs/viper_defconfig
> index 218bfb6c9b24..2ff16168d9c2 100644
> --- a/arch/arm/configs/viper_defconfig
> +++ b/arch/arm/configs/viper_defconfig
> @@ -41,7 +41,6 @@ CONFIG_BT_BNEP=m
>  CONFIG_BT_HCIUART=m
>  CONFIG_BT_HCIUART_H4=y
>  CONFIG_BT_HCIUART_BCSP=y
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_FW_LOADER=m
>  CONFIG_MTD=y
>  CONFIG_MTD_REDBOOT_PARTS=y
> diff --git a/arch/arm/configs/xcep_defconfig 
> b/arch/arm/configs/xcep_defconfig
> index 2eda24635e65..f1fbdfc5c8c6 100644
> --- a/arch/arm/configs/xcep_defconfig
> +++ b/arch/arm/configs/xcep_defconfig
> @@ -43,7 +43,6 @@ CONFIG_IP_PNP_BOOTP=y
>  # CONFIG_INET_XFRM_MODE_BEET is not set
>  # CONFIG_INET_DIAG is not set
>  # CONFIG_IPV6 is not set
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  # CONFIG_PREVENT_FIRMWARE_BUILD is not set
>  # CONFIG_FW_LOADER is not set
>  CONFIG_MTD_COMPLEX_MAPPINGS=y
> diff --git a/arch/arm/configs/zeus_defconfig 
> b/arch/arm/configs/zeus_defconfig
> index 8c01047801b8..aa3023c9a011 100644
> --- a/arch/arm/configs/zeus_defconfig
> +++ b/arch/arm/configs/zeus_defconfig
> @@ -39,7 +39,6 @@ CONFIG_BT_HCIUART_BCSP=y
>  CONFIG_CFG80211=m
>  CONFIG_LIB80211=m
>  CONFIG_MAC80211=m
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_MTD=y
>  CONFIG_MTD_REDBOOT_PARTS=y
>  CONFIG_MTD_REDBOOT_PARTS_READONLY=y
> diff --git a/arch/arm/configs/zx_defconfig 
> b/arch/arm/configs/zx_defconfig
> index dfc061d87d2f..c4070c19ea6c 100644
> --- a/arch/arm/configs/zx_defconfig
> +++ b/arch/arm/configs/zx_defconfig
> @@ -41,7 +41,6 @@ CONFIG_ZBOOT_ROM_TEXT=0x0
>  CONFIG_ZBOOT_ROM_BSS=0x0
>  CONFIG_CMDLINE="console=ttyAMA0,115200 debug earlyprintk root=/dev/ram 
> rw rootwait"
>  #CONFIG_NET is not set
> -CONFIG_UEVENT_HELPER_PATH="/sbin/hotplug"
>  CONFIG_DEVTMPFS=y
>  CONFIG_DEVTMPFS_MOUNT=y
>  CONFIG_DMA_CMA=y
> -- 
> 2.7.4
> 
>
