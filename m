Return-Path: <linux-omap-owner@vger.kernel.org>
X-Original-To: lists+linux-omap@lfdr.de
Delivered-To: lists+linux-omap@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA0171C1F69
	for <lists+linux-omap@lfdr.de>; Fri,  1 May 2020 23:14:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbgEAVOW (ORCPT <rfc822;lists+linux-omap@lfdr.de>);
        Fri, 1 May 2020 17:14:22 -0400
Received: from mail-oi1-f194.google.com ([209.85.167.194]:40473 "EHLO
        mail-oi1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726045AbgEAVOW (ORCPT
        <rfc822;linux-omap@vger.kernel.org>); Fri, 1 May 2020 17:14:22 -0400
Received: by mail-oi1-f194.google.com with SMTP id t199so892767oif.7;
        Fri, 01 May 2020 14:14:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ik05HoeIPqSlNhrPs/BOvnuIKtmqZ0C22ZMqbywZOpU=;
        b=qtzpzXUITZAxz0/sS5glxKHhojaBmAHfY3HUVR62nM4f/mMomcsaIp+8Bj8YBlI/hW
         OvRxbc4wYmkUUmlEy6NOenttx06Imaq6E4WS7z0XIqEawVRHHq/58gxqSASIkdrizgDu
         Yzq+7joDZil3fexYs2gGqwNBR7FLoLc9wFXulOa9Q7u3H6BTbsKSUcT0Kk8iYJXjGoB0
         ThGy6izG5gCLVpOZZSSieodcKQl8Xk9TH6ljjSOvKd3iEPW7Bn1pOH7WTQxkMh25R8Ku
         TT/bUXoWYwf8HFv/fDW3sKaKwVYu9ChMEK3y+JpbQsx8FDsqh+HehyebT+I84iVdDVbO
         corg==
X-Gm-Message-State: AGi0PubmfHE2br+P7OMNTbx7iOGgM5aThEUlgfb3rvo3y1y9N4IGz5un
        xOvKmLBy5Sb/4ErZYbGDcA==
X-Google-Smtp-Source: APiQypI0G2h3BKOiqHQMvBjUKar5R03mo3gV6ScSjUqGTQn8Z8zBm2V5G25JUPByqh/xwTOKjVbEog==
X-Received: by 2002:aca:f182:: with SMTP id p124mr1204914oih.170.1588367661422;
        Fri, 01 May 2020 14:14:21 -0700 (PDT)
Received: from rob-hp-laptop (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x82sm247465oig.55.2020.05.01.14.14.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2020 14:14:20 -0700 (PDT)
Received: (nullmailer pid 6858 invoked by uid 1000);
        Fri, 01 May 2020 21:14:20 -0000
Date:   Fri, 1 May 2020 16:14:20 -0500
From:   Rob Herring <robh@kernel.org>
To:     Tony Lindgren <tony@atomide.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>,
        Alan Cox <gnomes@lxorguk.ukuu.org.uk>,
        Lee Jones <lee.jones@linaro.org>, Jiri Slaby <jslaby@suse.cz>,
        Merlijn Wajer <merlijn@wizzup.org>,
        Pavel Machek <pavel@ucw.cz>,
        Peter Hurley <peter@hurleysoftware.com>,
        Sebastian Reichel <sre@kernel.org>,
        linux-serial@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH 4/6] dt-bindings: gnss: Add binding for Motorola Mapphone
 MDM6600 GNSS
Message-ID: <20200501211420.GA6222@bogus>
References: <20200430174615.41185-1-tony@atomide.com>
 <20200430174615.41185-5-tony@atomide.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200430174615.41185-5-tony@atomide.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-omap-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-omap.vger.kernel.org>
X-Mailing-List: linux-omap@vger.kernel.org

On Thu, 30 Apr 2020 10:46:13 -0700, Tony Lindgren wrote:
> Add a binding document for Motorola Mapphone MDM6600 GNSS driver that
> can be used with phones such as droid4.
> 
> Signed-off-by: Tony Lindgren <tony@atomide.com>
> ---
>  .../devicetree/bindings/gnss/motmdm.yaml      | 29 +++++++++++++++++++
>  1 file changed, 29 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gnss/motmdm.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/gnss/motmdm.example.dts:19.11-21: Warning (reg_format): /example-0/gnss@4:reg: property has invalid length (4 bytes) (#address-cells == 1, #size-cells == 1)
Documentation/devicetree/bindings/gnss/motmdm.example.dt.yaml: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/gnss/motmdm.example.dt.yaml: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/gnss/motmdm.example.dt.yaml: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/gnss/motmdm.example.dt.yaml: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/gnss/motmdm.example.dt.yaml: Warning (spi_bus_reg): Failed prerequisite 'reg_format'

See https://patchwork.ozlabs.org/patch/1280739

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.
