Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E27520E32C
	for <lists+linux-omap@lfdr.de>; Tue, 30 Jun 2020 00:02:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730158AbgF2VMa (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Mon, 29 Jun 2020 17:12:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727009AbgF2S5o (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Mon, 29 Jun 2020 14:57:44 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77469C00F804
        for <linux-omap@vger.kernel.org>; Mon, 29 Jun 2020 05:29:03 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id a1so16347569ejg.12
        for <linux-omap@vger.kernel.org>; Mon, 29 Jun 2020 05:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nLPL88OfKWPjoDgMrUq7HX0bJ21PFQyFVAStT19x/30=;
        b=PSx0WywEstp6kzCgrb2T780nS7vnNFzJS+U+DK53C0PhGN6LZvYDc2EFvOEAdEmhEj
         RUqqwUYHPI+moJOm1Lu+qDnTY8k7w4i1ZmDLAcEGCt5/VfkthQIciG4scNhgkF7qBZsF
         vapojTxZMy6hzLbJ19FtwmOG4LeFbtDfvu2hGXI5r15prpIVDn5Q6Ex36/ORxBC8HOMu
         p8sNi03zdwEm4JKaNFhsJFwkK43/7a69OrK8KLs3I2Jj3FUWqdHQLOJ+ViEJxwPsy3tk
         RJ+tPHTitdFJ/MPwm7Oci+jsb+VVt/S6RIkCjMGIh8K6vN3UA3j4206+/RBfGp3XCb1e
         Wcrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nLPL88OfKWPjoDgMrUq7HX0bJ21PFQyFVAStT19x/30=;
        b=GUljHLRFvnOs4k6/3uz8qwcEwSGeLEFInnpsQtS5rqcjLF/b7GPIOAGmGozt/t9SMx
         wrYf5/fM+DfgfypRJTses1AvGzRgFhrEu6a+5mD8m7CjNf3+9O4iJ7Jsb26Gshj8xQq9
         nKq5QecqhytBhewLRVgkRgEhrb1wr5620Arg8XtuMOwrpwSoCe5jC29IiPwN3BNJB3CV
         pvuoRxE5MEGz4W3qCgQkJM20fdBuQe9agsxDJN454OXEM6Ak3hF9vkSQeJprpjlhEtBW
         oc358H/PRHYdcQQKCwK33D1uKOefx2z3VC/xC3UzM2ObnCr2VUnMRXNHqJtdwjwzRBln
         3TAA==
X-Gm-Message-State: AOAM533FCxEBmD47tqdZk60L/7jViM/blhrHm4OD/mg0oj6ywNZVIaDW
        cD2CJX9YEK9YCjdyt/R+f+agYg==
X-Google-Smtp-Source: ABdhPJysnXFWJwpJ6uF9IEbsegahi3Y1+BUPbpahxlycTv66BVhVh2m/VMBwbtCgMcpWhDDWY9vklw==
X-Received: by 2002:a17:906:fa15:: with SMTP id lo21mr14416147ejb.156.1593433742019;
        Mon, 29 Jun 2020 05:29:02 -0700 (PDT)
Received: from x1 (i59F66838.versanet.de. [89.246.104.56])
        by smtp.gmail.com with ESMTPSA id a1sm18278094ejk.125.2020.06.29.05.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2020 05:29:01 -0700 (PDT)
Date:   Mon, 29 Jun 2020 14:28:58 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Tony Lindgren <tony@atomide.com>, Rob Herring <robh+dt@kernel.org>,
        linux-omap@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        devicetree@vger.kernel.org, bcousson@baylibre.com,
        Jason Kridner <jkridner@beagleboard.org>,
        Robert Nelson <robertcnelson@gmail.com>
Subject: Re: [PATCH v3 0/3] pinctrl: single: support #pinctrl-cells = 2
Message-ID: <20200629122858.GA506802@x1>
References: <20200622172951.524306-1-drew@beagleboard.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200622172951.524306-1-drew@beagleboard.org>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Mon, Jun 22, 2020 at 07:29:48PM +0200, Drew Fustini wrote:
> Currently, pinctrl-single only allows #pinctrl-cells = 1.
> 
> This series will allow pinctrl-single to also support #pinctrl-cells = 2
> 
> If "pinctrl-single,pins" has 3 arguments (offset, conf, mux) then
> pcs_parse_one_pinctrl_entry() does an OR operation on to get the
> value to store in the register.
>     
> To take advantage of #pinctrl-cells = 2, the AM33XX_PADCONF macro in
> omap.h is modified to keep pin conf and pin mux values separate.
> 
> change log:
> - v3: change order of patches to make sure the pinctrl-single.c patch
>   does not break anything without the dts patches
> 
> - v2: remove outer parentheses from AM33XX_PADCONF macro as it causes a
>   compile error in dtc.  I had added it per suggestion from checkpatch
>   about having parentheses around complex values.
> 
> Drew Fustini (3):
>   pinctrl: single: parse #pinctrl-cells = 2
>   ARM: dts: change AM33XX_PADCONF macro separate conf and mux
>   ARM: dts: am33xx-l4: change #pinctrl-cells from 1 to 2
> 
>  arch/arm/boot/dts/am33xx-l4.dtsi   |  2 +-
>  drivers/pinctrl/pinctrl-single.c   | 11 +++++++++--
>  include/dt-bindings/pinctrl/omap.h |  2 +-
>  3 files changed, 11 insertions(+), 4 deletions(-)
> 
> -- 
> 2.25.1
> 

Hi Tony - do you think this series is useful as-is?

Or do you want to see some usage of the seperate conf and mux values
first?

thanks,
drew
