Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E77957CE74
	for <lists+linux-omap@lfdr.de>; Thu, 21 Jul 2022 17:03:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230428AbiGUPD3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 21 Jul 2022 11:03:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbiGUPD3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 21 Jul 2022 11:03:29 -0400
Received: from lahtoruutu.iki.fi (lahtoruutu.iki.fi [IPv6:2a0b:5c81:1c1::37])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D4F484EFE
        for <linux-omap@vger.kernel.org>; Thu, 21 Jul 2022 08:03:28 -0700 (PDT)
Received: from macbook.musicnaut.iki.fi (85-76-14-0-nat.elisa-mobile.fi [85.76.14.0])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: aaro.koskinen)
        by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 9B7571B0009A;
        Thu, 21 Jul 2022 18:03:22 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
        t=1658415803;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=wmUr7P7loIwU+O4/xUYMlcD7PoCmV1mZmwnEsc7cOac=;
        b=U1sZIU9ylMc+aBWQfJ15FiaGvIpWrFiZvKzO/uG7PI+G4zNPIaOVzxeKC3JpYP3dhqqRuw
        5Xf4trT0YDgC78hooPsIlW+oybHzSqEnS7C6X5xAR/MuNxvJGOvXcBLtuHH8dgF2huwF47
        Wn7GgrbvWMnQ8qPc80DV25DMF8pCnTYC7g0QhrbgeMDDYdrnQwUGtMP22PnGvamRo4H9UV
        +RnkT9qok8k933Irzcq1eX/l1zeV+3elbUSJMD03WzfbFvRAdKNo7jbEaSv08JUDfrxQA5
        8qbbD6nvKxkSwO68NIuMiqXc10qXBAVfSBGtcSHZwojjq2e1g25zfdrBzLVq1g==
Date:   Thu, 21 Jul 2022 18:03:20 +0300
From:   Aaro Koskinen <aaro.koskinen@iki.fi>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org,
        Arnd Bergmann <arnd@arndb.de>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org
Subject: Re: [PATCH 10/13] ARM: omap1: add Kconfig dependencies for unused
 boards
Message-ID: <20220721150320.GA9385@macbook.musicnaut.iki.fi>
References: <20220721141722.2414719-1-arnd@kernel.org>
 <20220721141722.2414719-11-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220721141722.2414719-11-arnd@kernel.org>
ARC-Seal: i=1; s=lahtoruutu; d=iki.fi; t=1658415803; a=rsa-sha256;
        cv=none;
        b=CrwmEAxgeIdvsFyvAs+J9W2Ae60rZbGzJL5B+Q7eP+SDYTQmzDr9u+JWOfL8AqVTJZJ8a5
        Ox0hBdBCz/cjWrBY9YNIWxSQO/gmXQo4eqSEKNPk97onldbVWUOTgz2mmbpJ/AooX4qsz5
        GCi56TaGpdqqbaDnRgTcOTCfnXo/md145zzEpLkVqCo6dIg+TvFjN+Lu/oFyK6J9pDvPb/
        /hgajIGBBSM9oi1uUXbRVPfN3SGyBH4mEk4A14BI7lxfQ9KNa4gwl4nAz8qvL11MhAVwbq
        A6GBEuqqjFuN5suCT7D8SJO5Fpz13HQFgBtV6Td6iS3ucc1c6g14PuRrkEe+Lg==
ARC-Authentication-Results: i=1;
        ORIGINATING;
        auth=pass smtp.auth=aaro.koskinen smtp.mailfrom=aaro.koskinen@iki.fi
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
        s=lahtoruutu; t=1658415802;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=wmUr7P7loIwU+O4/xUYMlcD7PoCmV1mZmwnEsc7cOac=;
        b=gQjjnLL/fOMxdgP762hO/fQ/zrned3csXWYaOQN5tHz5pM4bdSiKSmZnAUuG1u7b9wpnZh
        Tdnf0nzSKkWrN8t2T/90g50HGEoiqsOs92wNrdZ2CBJrg20DP5bWURmBBK52ImRQwu25Yi
        +7KGZBOq6JKw7OORVCoFrIv2KdWf3obAZrT1bdGF2KDZk8pPRUT+f5cHeWEj3rwU8tLnx2
        fcGyI7hl8DrVTtmaujOEb4Ey2kLHc+TXS+eRIKBryneSq7G9A0jmfZycV9MFGU3VRuxsT9
        CKnW1aUK+VA41lBsT4cfSrnygpqjT/byjvMd7U/eOY3OOcWKeCM/pi4Ib5ZQuQ==
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,
        SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi,

On Thu, Jul 21, 2022 at 04:17:19PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> Legacy board files with no known users are planned to get removed in
> early 2023, and this covers the majority of the omap1 boards as well.
> 
> According to Tony, the actual users are all on OSK, Nokia770, and
> AMS-Delta. Additionally, the sx1 and palmte boards are supported by qemu,
> which is convenient for testing, so all five stay around past the initial
> board removal.

Actually also Palm TE gets tested with real hardware, I haven't got the
kernel working on QEMU.

> As omap1 is now part of the multiplatform build and uses the common-clk
> framework, it has become easier to convert these to use devicetree
> based booting in the future.
> 
> Cc: Aaro Koskinen <aaro.koskinen@iki.fi>

Acked-by: Aaro Koskinen <aaro.koskinen@iki.fi>

> Cc: Janusz Krzysztofik <jmkrzyszt@gmail.com>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: linux-omap@vger.kernel.org
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  arch/arm/configs/omap1_defconfig |  9 ---------
>  arch/arm/mach-omap1/Kconfig      | 10 ++++++++++
>  2 files changed, 10 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm/configs/omap1_defconfig b/arch/arm/configs/omap1_defconfig
> index 3f72d2ff7644..54a9f50122af 100644
> --- a/arch/arm/configs/omap1_defconfig
> +++ b/arch/arm/configs/omap1_defconfig
> @@ -25,17 +25,8 @@ CONFIG_ARCH_OMAP850=y
>  CONFIG_ARCH_OMAP16XX=y
>  # CONFIG_OMAP_MUX is not set
>  CONFIG_OMAP_RESET_CLOCKS=y
> -CONFIG_MACH_OMAP_INNOVATOR=y
> -CONFIG_MACH_OMAP_H2=y
> -CONFIG_MACH_OMAP_H3=y
> -CONFIG_MACH_HERALD=y
>  CONFIG_MACH_OMAP_OSK=y
> -CONFIG_MACH_OMAP_PERSEUS2=y
> -CONFIG_MACH_OMAP_FSAMPLE=y
> -CONFIG_MACH_VOICEBLUE=y
>  CONFIG_MACH_OMAP_PALMTE=y
> -CONFIG_MACH_OMAP_PALMZ71=y
> -CONFIG_MACH_OMAP_PALMTT=y
>  CONFIG_MACH_SX1=y
>  CONFIG_MACH_NOKIA770=y
>  CONFIG_MACH_AMS_DELTA=y
> diff --git a/arch/arm/mach-omap1/Kconfig b/arch/arm/mach-omap1/Kconfig
> index cbeb2b3ba86e..538a960257cc 100644
> --- a/arch/arm/mach-omap1/Kconfig
> +++ b/arch/arm/mach-omap1/Kconfig
> @@ -132,6 +132,7 @@ comment "OMAP Board Type"
>  config MACH_OMAP_INNOVATOR
>  	bool "TI Innovator"
>  	depends on ARCH_OMAP15XX || ARCH_OMAP16XX
> +	depends on UNUSED_BOARD_FILES
>  	help
>            TI OMAP 1510 or 1610 Innovator board support. Say Y here if you
>            have such a board.
> @@ -139,6 +140,7 @@ config MACH_OMAP_INNOVATOR
>  config MACH_OMAP_H2
>  	bool "TI H2 Support"
>  	depends on ARCH_OMAP16XX
> +	depends on UNUSED_BOARD_FILES
>  	help
>  	  TI OMAP 1610/1611B H2 board support. Say Y here if you have such
>  	  a board.
> @@ -146,6 +148,7 @@ config MACH_OMAP_H2
>  config MACH_OMAP_H3
>  	bool "TI H3 Support"
>  	depends on ARCH_OMAP16XX
> +	depends on UNUSED_BOARD_FILES
>  	help
>  	  TI OMAP 1710 H3 board support. Say Y here if you have such
>  	  a board.
> @@ -153,6 +156,7 @@ config MACH_OMAP_H3
>  config MACH_HERALD
>  	bool "HTC Herald"
>  	depends on ARCH_OMAP850
> +	depends on UNUSED_BOARD_FILES
>  	help
>  	  HTC Herald smartphone support (AKA T-Mobile Wing, ...)
>  
> @@ -166,6 +170,7 @@ config MACH_OMAP_OSK
>  config OMAP_OSK_MISTRAL
>  	bool "Mistral QVGA board Support"
>  	depends on MACH_OMAP_OSK
> +	depends on UNUSED_BOARD_FILES
>  	help
>  	  The OSK supports an optional add-on board with a Quarter-VGA
>  	  touchscreen, PDA-ish buttons, a resume button, bicolor LED,
> @@ -174,6 +179,7 @@ config OMAP_OSK_MISTRAL
>  config MACH_OMAP_PERSEUS2
>  	bool "TI Perseus2"
>  	depends on ARCH_OMAP730
> +	depends on UNUSED_BOARD_FILES
>  	help
>  	  Support for TI OMAP 730 Perseus2 board. Say Y here if you have such
>  	  a board.
> @@ -181,6 +187,7 @@ config MACH_OMAP_PERSEUS2
>  config MACH_OMAP_FSAMPLE
>  	bool "TI F-Sample"
>  	depends on ARCH_OMAP730
> +	depends on UNUSED_BOARD_FILES
>  	help
>  	  Support for TI OMAP 850 F-Sample board. Say Y here if you have such
>  	  a board.
> @@ -197,6 +204,7 @@ config MACH_OMAP_PALMTE
>  config MACH_OMAP_PALMZ71
>  	bool "Palm Zire71"
>  	depends on ARCH_OMAP15XX
> +	depends on UNUSED_BOARD_FILES
>  	help
>  	 Support for the Palm Zire71 PDA. To boot the kernel,
>  	 you'll need a PalmOS compatible bootloader; check out
> @@ -206,6 +214,7 @@ config MACH_OMAP_PALMZ71
>  config MACH_OMAP_PALMTT
>  	bool "Palm Tungsten|T"
>  	depends on ARCH_OMAP15XX
> +	depends on UNUSED_BOARD_FILES
>  	help
>  	  Support for the Palm Tungsten|T PDA. To boot the kernel, you'll
>  	  need a PalmOS compatible bootloader (Garux); check out
> @@ -246,6 +255,7 @@ config MACH_AMS_DELTA
>  config MACH_OMAP_GENERIC
>  	bool "Generic OMAP board"
>  	depends on ARCH_OMAP15XX || ARCH_OMAP16XX
> +	depends on UNUSED_BOARD_FILES
>  	help
>            Support for generic OMAP-1510, 1610 or 1710 board with
>            no FPGA. Can be used as template for porting Linux to
> -- 
> 2.29.2
> 

A.
