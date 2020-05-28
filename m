Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3356D1E5C70
	for <lists+linux-omap@lfdr.de>; Thu, 28 May 2020 11:52:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387584AbgE1JwC (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Thu, 28 May 2020 05:52:02 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:38681 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387440AbgE1JwB (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Thu, 28 May 2020 05:52:01 -0400
Received: by mail-lf1-f67.google.com with SMTP id 202so16214744lfe.5;
        Thu, 28 May 2020 02:51:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=C1jeUHCaajt+ex7tP6wzXy2BUh7vgRg4hvPENzAT8xU=;
        b=dBi7PMI7inivJdVtZcESqmcfp0orcZs4UcpSJtgA0YsoVuP85KjKdnKCx1RtPERDwO
         HiAXf6JIYEfSnR1tU1YIXsoXLWcC2GVnTYejQ7Yjy7h3c3SUlTV9ZQ3flGDyUF2x/ktm
         74pTUVCoe5Ea+C66tJHdef6D5okQ9U+Nscd/wiKz+TrBAJ+YZl91cdFKur5on4ZRrB9n
         SRGBtV7mcmjSSunZcT304ohNg6l4JJGOSryjYWvCbIduDxBWWXriXDqmt0ggHXpvKMX5
         bRjJ+iAogGmRjGroeIANj3iZAHs8MVpNV3npRFMLyICuMa2k5u6h/1j2xooSOHw5Pq0C
         pZig==
X-Gm-Message-State: AOAM532PDh8KauUbVpdSA2i+wupd89vpcNV6V7IMp0NMLxbbRhMpfchD
        30Ef4Jtc9+FqGmi9dGMzLM8=
X-Google-Smtp-Source: ABdhPJxaMoiBxiBTkBBuuHSa7VweEudLSh4UTf5kllxZAlKXbN2ojWNXhY+cVfOP6GXjVB9EEWKZUw==
X-Received: by 2002:a19:a405:: with SMTP id q5mr1237521lfc.164.1590659518686;
        Thu, 28 May 2020 02:51:58 -0700 (PDT)
Received: from xi.terra (c-beaee455.07-184-6d6c6d4.bbcust.telenor.se. [85.228.174.190])
        by smtp.gmail.com with ESMTPSA id a10sm1507517ljd.126.2020.05.28.02.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2020 02:51:57 -0700 (PDT)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
        (envelope-from <johan@kernel.org>)
        id 1jeFCZ-0003RU-3w; Thu, 28 May 2020 11:51:51 +0200
Date:   Thu, 28 May 2020 11:51:51 +0200
From:   Johan Hovold <johan@kernel.org>
To:     Rob Herring <robh@kernel.org>
Cc:     Tony Lindgren <tony@atomide.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>,
        Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Lee Jones <lee.jones@linaro.org>, Jiri Slaby <jslaby@suse.cz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Peter Hurley <peter@hurleysoftware.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH 3/6] dt-bindings: serdev: ngsm: Add binding for GNSS
 child node
Message-ID: <20200528095151.GE10358@localhost>
References: <20200512214713.40501-1-tony@atomide.com>
 <20200512214713.40501-4-tony@atomide.com>
 <20200527192817.GA2587830@bogus>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200527192817.GA2587830@bogus>
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Wed, May 27, 2020 at 01:28:17PM -0600, Rob Herring wrote:
> On Tue, May 12, 2020 at 02:47:10PM -0700, Tony Lindgren wrote:
> > For motorola modem case, we may have a GNSS device on channel 4.
> > Let's add that to the binding and example.
> > 
> > Signed-off-by: Tony Lindgren <tony@atomide.com>
> > ---
> >  .../devicetree/bindings/serdev/serdev-ngsm.yaml          | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/serdev/serdev-ngsm.yaml b/Documentation/devicetree/bindings/serdev/serdev-ngsm.yaml
> > --- a/Documentation/devicetree/bindings/serdev/serdev-ngsm.yaml
> > +++ b/Documentation/devicetree/bindings/serdev/serdev-ngsm.yaml
> > @@ -42,6 +42,10 @@ allOf:
> >            description: Name of the USB PHY
> >            const: usb
> >  
> > +        compatible:
> > +          description: GNSS receiver
> > +          const: motorola,mapphone-mdm6600-gnss
> 
> I'm not sure how this isn't failing on the example because it is wrong.
> 
> You're saying this compatible belongs at the same level as 
> phys/phy-names, but that would be the parent which already has a 
> compatible. You have to define a child node property (gnss@4) and have 
> 'compatible' under it. At that point, this schema becomes very much 
> Motorola specific.
> 
> > +
> >        required:
> >          - phys
> >          - phy-names
> > @@ -61,4 +65,9 @@ examples:
> >        phy-names = "usb";
> >        #address-cells = <1>;
> >        #size-cells = <0>;
> > +
> > +      gnss@4 {
> > +         compatible = "motorola,mapphone-mdm6600-gnss";
> > +         reg = <4>;
> > +      };
> >      };
> > -- 
> > 2.26.2

And since we're describing a mux, I think you need nodes for the virtual
ports rather than a reg property in what should be a serial client. That
is something like

	serial@nnn {
		modem {
			compatible = "etsi,ts27001-mux";

			serial@4 {
				compatible = "etsi,ts27001-serial";
				reg = <4>;

				gnss {
					compatible = "motorola,motmdm-gnss";
				};
			};
		};
	};

This way you can actually use serdev for the client drivers (e.g. for
gnss), and those drivers also be used for non-muxed ports if needed
(e.g. over USB).

Johan
