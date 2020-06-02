Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DF83F1EC1BD
	for <lists+linux-omap@lfdr.de>; Tue,  2 Jun 2020 20:24:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbgFBSYb (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Tue, 2 Jun 2020 14:24:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726139AbgFBSYb (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Tue, 2 Jun 2020 14:24:31 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE040C08C5C3
        for <linux-omap@vger.kernel.org>; Tue,  2 Jun 2020 11:24:30 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id mb16so13734149ejb.4
        for <linux-omap@vger.kernel.org>; Tue, 02 Jun 2020 11:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ScERK/mJtzfpHxvmlaUf1mObMaQePkT0Fb4iHyumpT8=;
        b=mi2pqEPFdVSVruBZqBFQglIeWbr7dHFIV04+Zs7NI9FmcMe+VIFp7FBoFzL/G8zM0q
         1Ln1G/ACLb6v4L5gsIGBLJ/ot+wV2xF4Uo3QDvb3dwvV1K0XH2lpNZdiH8yO7+wodOf6
         zWtnJsPDKo7LDsx2Iz14oXO9SmKNJu3072l7gxkGs0GPnRA3ghSznaV4/CWlfOeNCSyx
         yFLYaUf3ZehK6g0hBNBThER7lKuou/JIujr3Zp1O/07vK3JEDPg4eAPJx1+y08jawl1Z
         65/GYDSKpHpsr1cXXpOSuB/cy4Ah3UljMMpiaCFUlq6cINCfWnfnRtTrQU1MyFUkiNMG
         fMvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ScERK/mJtzfpHxvmlaUf1mObMaQePkT0Fb4iHyumpT8=;
        b=hnRFt3c+cOIbSfalSER7WPy1mfToXjwsS+H5GpRkt4gZKRqxt7ydikN4IB6WPPOz8R
         Kl3bIXyX7g9p43OAn1E9KLC2kUszMXEfRFaKvUe1+9qXM2c9oXTgfnfg4ys0PlVdNs3O
         jfs96xh3uqNZZXmQ4KMJpp9qOLbvGtRPa3pOAkkzfd50Y+WHJ4qK4bgg5x8Q9qk9zNgE
         zFn2eNAYk+/BQbfZdYt8TAn+rQjILcGOlBQ0Me8b0WBl8hdSj9TUSwH5c/IkmwgE2+qQ
         fB2NnWA/uZgic1URGT6FSMV8brpa1e5cZkYJY8hxp2dh9xSnFB6zExFkKuybuoEzmekB
         hqiw==
X-Gm-Message-State: AOAM532G1DvcsgIwruQB52+cD4KpNAYMZb3H6CfWrxdizKKqDDbLyhSR
        3Dzr3YE3fDslSnDZG8DYFKfiyg==
X-Google-Smtp-Source: ABdhPJzNqi0MnKQeX4fi+7IoeKx/H/jIAfnNcU0IWd6A5k8embb5CjFNsKUpq7Jt5RozAoi4g5RRkg==
X-Received: by 2002:a17:906:651:: with SMTP id t17mr25633280ejb.394.1591122269431;
        Tue, 02 Jun 2020 11:24:29 -0700 (PDT)
Received: from x1 (i59F66838.versanet.de. [89.246.104.56])
        by smtp.gmail.com with ESMTPSA id v12sm1945405eda.39.2020.06.02.11.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2020 11:24:28 -0700 (PDT)
Date:   Tue, 2 Jun 2020 20:24:25 +0200
From:   Drew Fustini <drew@beagleboard.org>
To:     Grygorii Strashko <grygorii.strashko@ti.com>
Cc:     Tony Lindgren <tony@atomide.com>, linux-omap@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Suman Anna <s-anna@ti.com>,
        Haojian Zhuang <haojian.zhuang@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-gpio@vger.kernel.org, jkridner@beagleboard.org,
        robertcnelson@gmail.com
Subject: Re: [PATCH] ARM: dts: AM33xx-l4: add gpio-ranges
Message-ID: <20200602182425.GA862776@x1>
References: <20200602131428.GA496390@x1>
 <803e2d78-28ba-0816-dbb5-d441d7659a91@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <803e2d78-28ba-0816-dbb5-d441d7659a91@ti.com>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Tue, Jun 02, 2020 at 04:44:03PM +0300, Grygorii Strashko wrote:
> 
> 
> On 02/06/2020 16:14, Drew Fustini wrote:
> > Add gpio-ranges properties to the gpio controller nodes.
> > 
> > These gpio-ranges were created based on "Table 9-10. CONTROL_MODULE
> > REGISTERS" in the  "AM335x Technical Reference Manual" [0] and "Table
> > 4-2. Pin Attributes" in the "AM335x Sitara Processor datasheet" [1].
> > A csv file with this data is available for reference [2].
> 
> It will be good if you can explain not only "what" is changed, but
> also "why" it's needed in commit message.

That is a good point.

One reason for this patch is I think it makes sense to add gpio-ranges
properties as they describe the relationship between a gpio line and
pin control register that exists in the hardware.  For example, GPMC_A0
pin has mode 7 which is labeled gpio1_16. The conf_gpmc_a0 register is
at offset 840h which makes it pin 16.

The other reason is that I would like to patch omap_gpio_set_config()
to call gpiochip_generic_config() for PIN_CONFIG_PULL_{UP,DOWN}. It
currently fails at pinctrl_get_device_gpio_range():

  omap_gpio_set_config()  
  |- gpiochip_generic_config()
     |- pinctrl_gpio_set_config()
        |- gpio_to_pin()
           |- pinctrl_get_device_gpio_range() [no gpio-ranges so fails]


Thank you,
Drew
