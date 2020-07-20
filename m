Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6508D226F32
	for <lists+linux-omap@lfdr.de>; Mon, 20 Jul 2020 21:49:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730943AbgGTTpn (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 20 Jul 2020 15:45:43 -0400
Received: from mail-io1-f66.google.com ([209.85.166.66]:45437 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726491AbgGTTpm (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 20 Jul 2020 15:45:42 -0400
Received: by mail-io1-f66.google.com with SMTP id e64so18882093iof.12;
        Mon, 20 Jul 2020 12:45:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=xQsmS1nuNNMhwcv8QeFvMXKBGicLJoHnG01faUUSAw8=;
        b=Ot8sfIbS2GZn/RI4is1DBa4VXZVopj0cpmrjW0LFOJ29WIPlncfDO6wuBKiuyx5g0d
         FsGWkY/QjnoAKbiNi/nt4AIhhsFVpSAY/nbpvpwZLVCC63ODXvmUopoCkRx9YK6Q61/Y
         ip80H4+vkIqqnNXgKrOfpryHOypusrwBTgqftpnUq0rl8pZIbdqbsJJ6uL3CDMle9Wsz
         oQ4s/cNqnjvOEBLivZxvfIPedgTlxA8hG3BYK37e8eV11S8r1N2B3jXqi8J5hHFKtWXf
         L/UJIoUvcJssQS926TENza8Cfvrxms8g4BTtIclhUSijeDvtEksOwALJn2dA2pFSIMHd
         LcRw==
X-Gm-Message-State: AOAM531YMfYKTpnmH8sCJ0eit11XkD1LsQwH40wV9RGqWEWvPCMYEN+H
        fy38UYWoIHOxDvpYXuIfRW0uOdpvlA==
X-Google-Smtp-Source: ABdhPJxWNBElu2kmELWUndpSOychi1LRff+1CaxEYTUH0DiLdWblGSE7U8N4YbRRh91aTfZ8c8X4Iw==
X-Received: by 2002:a05:6602:2207:: with SMTP id n7mr23979335ion.162.1595274341749;
        Mon, 20 Jul 2020 12:45:41 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id n1sm9277565ilo.68.2020.07.20.12.45.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 12:45:41 -0700 (PDT)
Received: (nullmailer pid 2884955 invoked by uid 1000);
        Mon, 20 Jul 2020 19:45:38 -0000
Date:   Mon, 20 Jul 2020 13:45:38 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     devicetree@vger.kernel.org, slongerbeam@gmail.com,
        linux-media@vger.kernel.org, laurent.pinchart@ideasonboard.com,
        linux-renesas-soc@vger.kernel.org,
        =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        "moderated list:ARM/STM32 ARCHITECTURE" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>
Subject: Re: [PATCH 05/13] dt-bindings: media: ov5640: Make bus-type mandatory
Message-ID: <20200720194538.GA2872607@bogus>
References: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
 <20200717132859.237120-6-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200717132859.237120-6-jacopo+renesas@jmondi.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Jul 17, 2020 at 03:28:51PM +0200, Jacopo Mondi wrote:
> The ov5640 driver supports both a parallel data interface and a
> CSI-2 serial data interface.
> 
> Depending on which interface is in use, the required endpoint
> properties are different. In order to be able to validate if a
> device node is compliant with the dt-schema bindings, start by
> making the bus-type a mandatory property, and add it to all the
> existing users of ov5640 in mainline DTS.

You can't really make a property required on an existing binding. That 
breaks compatibility. Are all the users of the below boards okay with 
that?

There should be a default defined if 'bus-type' is not present.

> 
> On top of this, endpoint properties validation will be implemented,
> conditionally to the reported bus type.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  Documentation/devicetree/bindings/media/i2c/ov5640.yaml    | 6 ++++++
>  arch/arm/boot/dts/dra72-evm-common.dtsi                    | 1 +
>  arch/arm/boot/dts/dra76-evm.dts                            | 1 +
>  arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi              | 1 +
>  arch/arm/boot/dts/imx6qdl-icore.dtsi                       | 1 +
>  arch/arm/boot/dts/imx6qdl-sabrelite.dtsi                   | 1 +
>  arch/arm/boot/dts/imx6qdl-sabresd.dtsi                     | 1 +
>  arch/arm/boot/dts/stm32mp157c-ev1.dts                      | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-a64-amarula-relic.dts | 1 +
>  arch/arm64/boot/dts/allwinner/sun50i-a64-pinetab.dts       | 1 +
>  arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi                  | 1 +
>  arch/arm64/boot/dts/ti/k3-am654-base-board.dts             | 1 +
>  12 files changed, 17 insertions(+)
