Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC8AC223FEA
	for <lists+linux-omap@lfdr.de>; Fri, 17 Jul 2020 17:49:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726858AbgGQPsz (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 17 Jul 2020 11:48:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726322AbgGQPsz (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 17 Jul 2020 11:48:55 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5745C0619D2;
        Fri, 17 Jul 2020 08:48:54 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id q4so13299925lji.2;
        Fri, 17 Jul 2020 08:48:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=h11XOtehZDloRQK9LLWJgIGaRhspppMNqDAzBiX5ad0=;
        b=Vl3NEvpnwvvHcMUF3NitR+46Z8sGTxKpnmW2tSGbSZI5WEMW3t/cfVkfrQKwFVLfmn
         qeYWAms1UJZ0u2rgIpGXKPqzQRww21hWUFCIGkYU5iU2aI2DNB/ORCPOtTw84QooEoxU
         RYowe2rX5Fdj+dRoNdNiG6L6UUa+Alrbcl8abG9racjlDwSa72vWTml3oZe1LVxEno23
         8HqvAdO0M0ijRxSL52knF8JcEemEUtGDRuqD43LXb5rbnu/qG8BBreBmnwIir7x5vGFu
         M9aVkD5RibFZ132rkt+/LOK5QNQiB843eekX8O2TxJo2RHEHnZOn30hEob39Xp0gVhf+
         8DpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=h11XOtehZDloRQK9LLWJgIGaRhspppMNqDAzBiX5ad0=;
        b=OcxAdtBkUGH+WxOJ7X7+bilGNiZsr1N2MZhhfMh/59EFre5MAjLXVr/S5gkYQMuf8v
         A720dS8BlqDBhkEUFlQpJionh83WzLYrGXOvAPUpH7DMGqcOsT9DEpTosHINWU70USed
         WhxIAjgNHwH6zvbjwVKM7N11ufVG2lSKNBdNBSY5nZjtdb90RHjB5gVtnFeyX5OQ14Uj
         1B+aoeBGNEQwFYOY8ZCA7qA9xmiQoKwr0nBMGb1W5xfOvSMLwJsutIpDoIb0O1p1/2lT
         BLK1Yd2B4K+XOYHEY7LyjbUOqY9LADdgnzqfLVqkizuytRq5JKfDv4+QGS5daNuQ6NEl
         8V5Q==
X-Gm-Message-State: AOAM533XuFiFXvCPjKZH8r8dBNvwK61VDGrg47pDmXkRL2h5H2HYI5Ml
        4UkKd4AcGCKO0FzNIjl59YFRYWtam1e5RrfAaxI=
X-Google-Smtp-Source: ABdhPJwIzsbxel7UyqOZp+lBviG9zAjrG/Jz3iqThbVW0psJDeH5ulOp2LIDuUFpVJDNfOVaozw3oLVmHULgDPnkduQ=
X-Received: by 2002:a2e:a375:: with SMTP id i21mr4928341ljn.403.1595000933299;
 Fri, 17 Jul 2020 08:48:53 -0700 (PDT)
MIME-Version: 1.0
References: <20200717132859.237120-1-jacopo+renesas@jmondi.org> <20200717132859.237120-6-jacopo+renesas@jmondi.org>
In-Reply-To: <20200717132859.237120-6-jacopo+renesas@jmondi.org>
From:   Fabio Estevam <festevam@gmail.com>
Date:   Fri, 17 Jul 2020 12:48:42 -0300
Message-ID: <CAOMZO5Ap2_3hECqB5K3tbD-0URq0hJrMoNDwq6WmUMVojahfJg@mail.gmail.com>
Subject: Re: [PATCH 05/13] dt-bindings: media: ov5640: Make bus-type mandatory
To:     Jacopo Mondi <jacopo+renesas@jmondi.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Steve Longerbeam <slongerbeam@gmail.com>,
        linux-media <linux-media@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@st.com>,
        "moderated list:ARM/STM32 ARCHITECTURE" 
        <linux-stm32@st-md-mailman.stormreply.com>,
        Maxime Ripard <mripard@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Jacopo,

On Fri, Jul 17, 2020 at 10:25 AM Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:

> diff --git a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
> index 503f8b78615c..16e6c2dc629a 100644
> --- a/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
> +++ b/Documentation/devicetree/bindings/media/i2c/ov5640.yaml
> @@ -73,6 +73,9 @@ properties:
>            remote-endpoint:
>              description: A phandle to the bus receiver's endpoint node.
>
> +          bus-type:
> +            enum: [4, 5]

Can we have an explanation for what the values 4 and 5 mean in the yaml doc?

Looking at the series I see that 4 means MIPI-CSI2 and 5 means
parallel interface, but this is not too obvious (at least for me).

Or maybe we could use a string definition instead of hard coding 4 and 5?
