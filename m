Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 14FDD43FA6B
	for <lists+linux-omap@lfdr.de>; Fri, 29 Oct 2021 12:03:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231679AbhJ2KFf (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 29 Oct 2021 06:05:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231594AbhJ2KFf (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 29 Oct 2021 06:05:35 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FF33C061570;
        Fri, 29 Oct 2021 03:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=7buZtiLc/ouuXxjLHbN2EnvR8r028Iyhe9uJXHmOVko=; b=1Vfjr47/HgOcxMDeXVf0ljPiRC
        5jQx6W6+7+KXiL4bf8qA0+eRURpDuwbDcvZH0t0X/rn5D2K6BHzqlSxkTkWJk398cFDpt2Af7SBHo
        4l2TuWDsKyYYMnxmgwLEkeLlgxIRwumKsMr/Qyr1Z+5ZOInfPjUT3H16Nvdmz3ChQKF0DKIkKpAF3
        avQZCxUblXjviaQI9hZKhX6P2Rbs1hfa8IA5VaG/1HaZgho0RfWKRhWGcgSp0aGvayKnAcU7xR93l
        Mmehd8N+kRdfdZl9Xl3UEUNB47ZGQ5JVytLyHi6+oKv1galh7wZU39uoydqI5XvVnngWqeUH3CEA4
        D/otjkQA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:55378)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1mgOiy-0008Tt-1X; Fri, 29 Oct 2021 11:03:00 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1mgOiv-0001Vw-Ru; Fri, 29 Oct 2021 11:02:57 +0100
Date:   Fri, 29 Oct 2021 11:02:57 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Rob Herring <robh@kernel.org>,
        =?iso-8859-1?Q?Beno=EEt?= Cousson <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        DRI Development <dri-devel@lists.freedesktop.org>,
        "open list:TI ETHERNET SWITCH DRIVER (CPSW)" 
        <linux-omap@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 3/3] [RFC] dt-bindings: display: bridge: nxp,tda998x:
 Convert to json-schema
Message-ID: <YXvG0Xz6XgiS6jwD@shell.armlinux.org.uk>
References: <cover.1634822085.git.geert+renesas@glider.be>
 <1f6bf58d76efc2e869b800534b818d1451ef98a2.1634822085.git.geert+renesas@glider.be>
 <YXtIsCnJ+L5zqCVk@robh.at.kernel.org>
 <YXusEUpTBUdvS7LY@shell.armlinux.org.uk>
 <CAMuHMdX+Ke54zyi2Z2ROk-2xpbcXU6+FFH71gEz0vEBXCAgVXw@mail.gmail.com>
 <YXu/zwjYqoqYgfLx@shell.armlinux.org.uk>
 <CAMuHMdUFp_GN-GLtrXVDQP5A8iM-jLWTQbM0p4g1bdVokxhOaw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUFp_GN-GLtrXVDQP5A8iM-jLWTQbM0p4g1bdVokxhOaw@mail.gmail.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Fri, Oct 29, 2021 at 11:40:26AM +0200, Geert Uytterhoeven wrote:
> Hi Russell,
> 
> On Fri, Oct 29, 2021 at 11:33 AM Russell King (Oracle)
> <linux@armlinux.org.uk> wrote:
> > On Fri, Oct 29, 2021 at 10:28:22AM +0200, Geert Uytterhoeven wrote:
> > > No, you can still use port:
> > >
> > > +oneOf:
> > > +  - required:
> > > +      - port
> > > +  - required:
> > > +      - ports
> > >
> > > When using ports, no further requirements are set, but perhaps port@0
> > > should be made required in that case?
> >
> > Maybe I don't understand the binding description then, but to me it
> > looks like you require both port@0 and port@1.
> 
> "make dtbs_check" disagrees.
> 
> > The reality of the driver is that it makes almost no use of the graph
> > itself, except via drm_of_find_possible_crtcs() to find the connected
> > CRTCs. If it is connected to an I2S source, then it probably needs a
> > port specification for that. If someone wants to describe the HDMI
> > connector (which I don't see any point in) then they likely need a
> 
> I can't comment on the point of describing the HDMI connector.
> 
> > port specification for that too. However, the driver itself doesn't
> > care about any of those.
> 
> DT describes hardware, not software limitations.

Sigh. There's no point discussing this further, my replies seem to be
interpreted out of context.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
