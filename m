Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 172EA226F3A
	for <lists+linux-omap@lfdr.de>; Mon, 20 Jul 2020 21:49:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728733AbgGTTr2 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 20 Jul 2020 15:47:28 -0400
Received: from mail-io1-f67.google.com ([209.85.166.67]:34557 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726491AbgGTTr1 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 20 Jul 2020 15:47:27 -0400
Received: by mail-io1-f67.google.com with SMTP id q74so18945049iod.1;
        Mon, 20 Jul 2020 12:47:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=wami5ld0z9FHvbWVsYveEHQ9/pc5tADPd3tpSIEvVUM=;
        b=DtzuNnCvJf1kWNw5RVf7hcRW6jFHoqH0k/yIC7F32ZClDeJn315BVJPrGBlsHJFIPg
         4ileIHe9G/4FdiNWcgmpg1/QI/+9dIT3y/exiRM+hElC3QdufY3vQ4Ml9zfBVCMXh/zw
         xJ+unj1ChWld+SGa6DciCf6/cUq3wzpFK4XSNYzeZU/1CgJE1mp63QgRFSO4PmgFDFXI
         T0TZd5xr8Tn6iM0ZpjX8rnxJCpnHo/DPyppN527pZG3nyCjDniyQrmCNCJIA0DouSUNA
         6OmMz6oN3tZDCnLTV8/jLnJKjrjyb8527+scNvp/YM+LBp7ey9mjGfnMLLDvyv8EgrlB
         m67A==
X-Gm-Message-State: AOAM532axaqMjO/v3Cswu9Mm9AFMF2IKfUvMHwABejigWyMKVhXjFao4
        cRJR6KYVf/DSVzSENOo9eg==
X-Google-Smtp-Source: ABdhPJwYhcD+ech3tTx1xgCvhsZ+suOtxjFUk2x6J6Yy5dtevlrrdBMQER6Ts4r7Gt8P/VVQIziInA==
X-Received: by 2002:a05:6602:2ac8:: with SMTP id m8mr25005533iov.36.1595274446734;
        Mon, 20 Jul 2020 12:47:26 -0700 (PDT)
Received: from xps15 ([64.188.179.252])
        by smtp.gmail.com with ESMTPSA id b24sm9347565ioh.6.2020.07.20.12.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2020 12:47:25 -0700 (PDT)
Received: (nullmailer pid 2887462 invoked by uid 1000);
        Mon, 20 Jul 2020 19:47:24 -0000
Date:   Mon, 20 Jul 2020 13:47:24 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        Chen-Yu Tsai <wens@csie.org>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Tero Kristo <t-kristo@ti.com>,
        Fabio Estevam <festevam@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        Andy Gross <agross@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, robh+dt@kernel.org,
        Tony Lindgren <tony@atomide.com>, slongerbeam@gmail.com,
        linux-media@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        Maxime Ripard <mripard@kernel.org>, Nishanth Menon <nm@ti.com>,
        linux-renesas-soc@vger.kernel.org,
        laurent.pinchart@ideasonboard.com
Subject: Re: [PATCH 07/13] dt-bindings: media: ov5640: Remove clock-lanes
Message-ID: <20200720194724.GA2887432@bogus>
References: <20200717132859.237120-1-jacopo+renesas@jmondi.org>
 <20200717132859.237120-8-jacopo+renesas@jmondi.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200717132859.237120-8-jacopo+renesas@jmondi.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, 17 Jul 2020 15:28:53 +0200, Jacopo Mondi wrote:
> The ov5640 does not support routing the clock signal to a different
> lane, and the property has value fixed to 0.
> 
> Remove the property from the bindings and update its users
> accordingly.
> 
> Signed-off-by: Jacopo Mondi <jacopo+renesas@jmondi.org>
> ---
>  Documentation/devicetree/bindings/media/i2c/ov5640.yaml | 6 ------
>  arch/arm/boot/dts/dra72-evm-common.dtsi                 | 1 -
>  arch/arm/boot/dts/dra76-evm.dts                         | 1 -
>  arch/arm/boot/dts/imx6-logicpd-baseboard.dtsi           | 1 -
>  arch/arm/boot/dts/imx6qdl-icore.dtsi                    | 1 -
>  arch/arm/boot/dts/imx6qdl-sabrelite.dtsi                | 1 -
>  arch/arm/boot/dts/imx6qdl-sabresd.dtsi                  | 1 -
>  arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi               | 1 -
>  arch/arm64/boot/dts/ti/k3-am654-base-board.dts          | 1 -
>  9 files changed, 14 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
