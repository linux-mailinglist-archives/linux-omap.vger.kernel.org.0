Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 611F843FA15
	for <lists+linux-omap@lfdr.de>; Fri, 29 Oct 2021 11:40:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231526AbhJ2JnH (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 29 Oct 2021 05:43:07 -0400
Received: from mail-ua1-f47.google.com ([209.85.222.47]:36712 "EHLO
        mail-ua1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229927AbhJ2JnG (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 29 Oct 2021 05:43:06 -0400
Received: by mail-ua1-f47.google.com with SMTP id e10so17075114uab.3;
        Fri, 29 Oct 2021 02:40:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kxaElWGr4Lmnn2exo86aWmthYySNpu5Jzk9GyO0DlvQ=;
        b=D0SFi0fE92ToZfNkSTGl8eYA+2J8+9d3rXxlfV+JYpTCa2KqfYZPRVR74vkugnK5bf
         RmoxqY9REL+K7LHS0GfbBwVR4ism+23Af334rNZcCgtWxlezQzy9KRahnjyZJxUFZdHA
         +NkFAGRvRViEJ8MYq/dL2AE+QvLZLo6pUZn5kghm3rci6mG8VgBXHWfn5/l+0+0woCCB
         EDUpsjVFcEtGA4vZA4Nd+Q+N4CQ3O9UD3f968nElVsRiha4za4VYrLEiQ8HL3jNnN7kO
         ZvHP5ntNaSq865WqjUITZnh3TLQfl4n+dNydwEa0mJ42st0BU0BwDSPEnSgpR2RwwV0C
         cZKw==
X-Gm-Message-State: AOAM531MxsdWGU9cY5UqGYX7HZQ2SXhRx45KQurB8xsSRXXjTQ5VV7te
        zDjdx6kr+z6M9zGRPoPeWrJbkBx0I2QtWw==
X-Google-Smtp-Source: ABdhPJz1NSk172EumyENO/IVnefP+yBDh6gDEJxGrmAk0jRfM9Be6k/oazHi+nm4nu9130NjfLdM+w==
X-Received: by 2002:a67:b24e:: with SMTP id s14mr10922853vsh.27.1635500437873;
        Fri, 29 Oct 2021 02:40:37 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com. [209.85.222.49])
        by smtp.gmail.com with ESMTPSA id r10sm894826vkp.27.2021.10.29.02.40.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 Oct 2021 02:40:37 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id h4so17066703uaw.1;
        Fri, 29 Oct 2021 02:40:37 -0700 (PDT)
X-Received: by 2002:a05:6102:3a0e:: with SMTP id b14mr10173444vsu.41.1635500437263;
 Fri, 29 Oct 2021 02:40:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1634822085.git.geert+renesas@glider.be> <1f6bf58d76efc2e869b800534b818d1451ef98a2.1634822085.git.geert+renesas@glider.be>
 <YXtIsCnJ+L5zqCVk@robh.at.kernel.org> <YXusEUpTBUdvS7LY@shell.armlinux.org.uk>
 <CAMuHMdX+Ke54zyi2Z2ROk-2xpbcXU6+FFH71gEz0vEBXCAgVXw@mail.gmail.com> <YXu/zwjYqoqYgfLx@shell.armlinux.org.uk>
In-Reply-To: <YXu/zwjYqoqYgfLx@shell.armlinux.org.uk>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Fri, 29 Oct 2021 11:40:26 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUFp_GN-GLtrXVDQP5A8iM-jLWTQbM0p4g1bdVokxhOaw@mail.gmail.com>
Message-ID: <CAMuHMdUFp_GN-GLtrXVDQP5A8iM-jLWTQbM0p4g1bdVokxhOaw@mail.gmail.com>
Subject: Re: [PATCH 3/3] [RFC] dt-bindings: display: bridge: nxp,tda998x:
 Convert to json-schema
To:     "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc:     Rob Herring <robh@kernel.org>,
        =?UTF-8?Q?Beno=C3=AEt_Cousson?= <bcousson@baylibre.com>,
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

Hi Russell,

On Fri, Oct 29, 2021 at 11:33 AM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
> On Fri, Oct 29, 2021 at 10:28:22AM +0200, Geert Uytterhoeven wrote:
> > No, you can still use port:
> >
> > +oneOf:
> > +  - required:
> > +      - port
> > +  - required:
> > +      - ports
> >
> > When using ports, no further requirements are set, but perhaps port@0
> > should be made required in that case?
>
> Maybe I don't understand the binding description then, but to me it
> looks like you require both port@0 and port@1.

"make dtbs_check" disagrees.

> The reality of the driver is that it makes almost no use of the graph
> itself, except via drm_of_find_possible_crtcs() to find the connected
> CRTCs. If it is connected to an I2S source, then it probably needs a
> port specification for that. If someone wants to describe the HDMI
> connector (which I don't see any point in) then they likely need a

I can't comment on the point of describing the HDMI connector.

> port specification for that too. However, the driver itself doesn't
> care about any of those.

DT describes hardware, not software limitations.

> So, describing the port nodes makes no sense.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
