Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B983C265645
	for <lists+linux-omap@lfdr.de>; Fri, 11 Sep 2020 02:58:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725385AbgIKA6W (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 10 Sep 2020 20:58:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725280AbgIKA6U (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 10 Sep 2020 20:58:20 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30575C061573;
        Thu, 10 Sep 2020 17:58:20 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id nw23so11465645ejb.4;
        Thu, 10 Sep 2020 17:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jms.id.au; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Cxz6Kgxq7jatws0G3p9mdGTrUWQSctB2DFS0bYO6Ojo=;
        b=I/FT26ZMke89o+R7EJ2Aje+2MzCZNT4TZP901O7MUuoJylUVJUgvF6AjdakQdO8NiZ
         DF8XXBbbppuRdAhjbROMcN4jfDcF+D/mUw5hFL+4KEUIjbi5j1KEw2Witb7aD1VSkp55
         LQd/F9LQzLy3MdX8zgLSt4xC6PpWFIjZHey9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Cxz6Kgxq7jatws0G3p9mdGTrUWQSctB2DFS0bYO6Ojo=;
        b=Z91eOfJ+b/Vn81Bst98dMWW2IU5eaIKTnBWmaXL0wlqWLm3HNalwIT0YYevYwj7d9v
         Hsa1vEBnwoXqTZsn5xPf3fh0WS/dY74+rO+Khxv/hjDAU3hX+Xyh78a4D/VQRhZny+x8
         8dz22G4QQuzRmO5RZr6PsFe26HKK32W6ebkcJF6bbeDSQF3cbasMTgYI+mJZ7hlAhPus
         lbRyA4XXHCYyvVfWfm9DipST1ycf7/eYo4yCSdyPaWU6JEAujcml5WPWKg8xHMrMbJzv
         NcycTi2XhqeUmTEeCKHV34ChXdN8CrdfsaKDmYeSKpLUOcqfMis+H+ICaYeC8rjaeyoj
         SckA==
X-Gm-Message-State: AOAM530V9Fk3OVFDSyyR34cEoXWxxXmfw1tXyDg8zS0Tnk0Td/0JQp1f
        /rQzo7hBHcM0ucGFTb9o6i4Hvxfq2yu82MNPSSg=
X-Google-Smtp-Source: ABdhPJzAAzwOGCqc8Dnsefhddi0bmKYOxyuP9uc74zjJGVpiHt0ExaXYevQVTAi52dogax1ztBNqJ2xxXB6fQgx+i2U=
X-Received: by 2002:a17:906:7cc6:: with SMTP id h6mr11643958ejp.266.1599785898793;
 Thu, 10 Sep 2020 17:58:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200910175733.11046-1-krzk@kernel.org> <20200910175733.11046-13-krzk@kernel.org>
In-Reply-To: <20200910175733.11046-13-krzk@kernel.org>
From:   Joel Stanley <joel@jms.id.au>
Date:   Fri, 11 Sep 2020 00:58:05 +0000
Message-ID: <CACPK8XfmDySpkCw8nkmns-euGQE6JTqZLVO6JhvFJiRqNosRuQ@mail.gmail.com>
Subject: Re: [PATCH v2 12/15] ARM: dts: aspeed: align GPIO hog names with dtschema
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Russell King <linux@armlinux.org.uk>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andrew Jeffery <andrew@aj.id.au>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Tero Kristo <t-kristo@ti.com>, Nishanth Menon <nm@ti.com>,
        Michal Simek <michal.simek@xilinx.com>,
        Guenter Roeck <linux@roeck-us.net>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-omap@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-aspeed <linux-aspeed@lists.ozlabs.org>,
        linux-mediatek@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 10 Sep 2020 at 17:59, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> dtschema for pca95xx expects GPIO hogs to end with 'hog' prefix.

This is a bit ugly. Do we have to go down this path?


>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts |  2 +-
>  arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts  | 16 ++++++++--------
>  2 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> index 1fa233d2da26..0aa437486a0d 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-ibm-rainier.dts
> @@ -560,7 +560,7 @@
>                 gpio-controller;
>                 #gpio-cells = <2>;
>
> -               smbus0 {
> +               smbus0-hog {
>                         gpio-hog;
>                         gpios = <4 GPIO_ACTIVE_HIGH>;
>                         output-high;
> diff --git a/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts b/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
> index cb85168f6761..577c211c469e 100644
> --- a/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
> +++ b/arch/arm/boot/dts/aspeed-bmc-opp-mihawk.dts
> @@ -827,7 +827,7 @@
>                                 gpio-controller;
>                                 #gpio-cells = <2>;
>
> -                               smbus0 {
> +                               smbus0-hog {
>                                         gpio-hog;
>                                         gpios = <4 GPIO_ACTIVE_HIGH>;
>                                         output-high;
> @@ -852,7 +852,7 @@
>                                 gpio-controller;
>                                 #gpio-cells = <2>;
>
> -                               smbus1 {
> +                               smbus1-hog {
>                                         gpio-hog;
>                                         gpios = <4 GPIO_ACTIVE_HIGH>;
>                                         output-high;
> @@ -900,7 +900,7 @@
>                                 gpio-controller;
>                                 #gpio-cells = <2>;
>
> -                               smbus2 {
> +                               smbus2-hog {
>                                         gpio-hog;
>                                         gpios = <4 GPIO_ACTIVE_HIGH>;
>                                         output-high;
> @@ -925,7 +925,7 @@
>                                 gpio-controller;
>                                 #gpio-cells = <2>;
>
> -                               smbus3 {
> +                               smbus3-hog {
>                                         gpio-hog;
>                                         gpios = <4 GPIO_ACTIVE_HIGH>;
>                                         output-high;
> @@ -992,7 +992,7 @@
>                                 gpio-controller;
>                                 #gpio-cells = <2>;
>
> -                               smbus4 {
> +                               smbus4-hog {
>                                         gpio-hog;
>                                         gpios = <4 GPIO_ACTIVE_HIGH>;
>                                         output-high;
> @@ -1017,7 +1017,7 @@
>                                 gpio-controller;
>                                 #gpio-cells = <2>;
>
> -                               smbus5 {
> +                               smbus5-hog {
>                                         gpio-hog;
>                                         gpios = <4 GPIO_ACTIVE_HIGH>;
>                                         output-high;
> @@ -1065,7 +1065,7 @@
>                                 gpio-controller;
>                                 #gpio-cells = <2>;
>
> -                               smbus6 {
> +                               smbus6-hog {
>                                         gpio-hog;
>                                         gpios = <4 GPIO_ACTIVE_HIGH>;
>                                         output-high;
> @@ -1090,7 +1090,7 @@
>                                 gpio-controller;
>                                 #gpio-cells = <2>;
>
> -                               smbus7 {
> +                               smbus7-hog {
>                                         gpio-hog;
>                                         gpios = <4 GPIO_ACTIVE_HIGH>;
>                                         output-high;
> --
> 2.17.1
>
