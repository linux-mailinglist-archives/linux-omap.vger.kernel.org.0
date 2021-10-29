Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62E1F43F890
	for <lists+linux-omap@lfdr.de>; Fri, 29 Oct 2021 10:09:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232374AbhJ2IL3 (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 29 Oct 2021 04:11:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232305AbhJ2IL3 (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 29 Oct 2021 04:11:29 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F7E1C061570;
        Fri, 29 Oct 2021 01:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=PTrXKesBhRHIvuuaQcXDWtZjhJf5sWDq+qzw8TaYbK4=; b=us2E3Ql3HpgbS057DqM4Mg/Tg+
        x6U994wj9AXbi+Oe82YLlv2CBQ4crM0CUcJWxcDfoZDOHt3vTsAfjDwGO6KHBF4cJOJ7Sa4i76clm
        SerDH4VjMU9LetKGRIYQThnFdnfHwRfMuKs/1/71PX4TIY/T8eipjgHlJVaD980DxYKw7f3njr9L1
        p7uRJJ6ExsJxrSabISJD9dcxVMU+PFWQ2uwAbLj1GWiYVJlxlQUtmSmiIbbFbYZNitc7oLrAlxgA/
        aCqf2rpvKtmPtBQKTLZ3fIdI6OWx4zDWpDp6ypykqfS9N6sIY/D7clsh9v14I6PXLO9XHjWE1V9Jq
        bmw20bSw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55372)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1mgMwX-0008Ng-TD; Fri, 29 Oct 2021 09:08:53 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1mgMwT-0001Rn-7R; Fri, 29 Oct 2021 09:08:49 +0100
Date:   Fri, 29 Oct 2021 09:08:49 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Rob Herring <robh@kernel.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 3/3] [RFC] dt-bindings: display: bridge: nxp,tda998x:
 Convert to json-schema
Message-ID: <YXusEUpTBUdvS7LY@shell.armlinux.org.uk>
References: <cover.1634822085.git.geert+renesas@glider.be>
 <1f6bf58d76efc2e869b800534b818d1451ef98a2.1634822085.git.geert+renesas@glider.be>
 <YXtIsCnJ+L5zqCVk@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YXtIsCnJ+L5zqCVk@robh.at.kernel.org>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, Oct 28, 2021 at 08:04:48PM -0500, Rob Herring wrote:
> On Thu, Oct 21, 2021 at 03:18:53PM +0200, Geert Uytterhoeven wrote:
> > +    properties:
> > +      port@0:
> > +        type: object
> > +        description: FIXME
> 
> Looks like the input from the example
> 
> > +
> > +      port@1:
> > +        type: object
> > +        description: FIXME
> 
> Presumably the output to connector or another bridge.

This is changing the binding. The original had:

Required node:
  - port: Input port node with endpoint definition, as described
        in Documentation/devicetree/bindings/graph.txt

The above change appears to require that tda998x now has two ports.
This goes against current usage in DT and the example.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
